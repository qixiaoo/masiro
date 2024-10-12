import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_event.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_state.dart';
import 'package:masiro/bloc/util/event_transformer.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/chapter_record.dart';
import 'package:masiro/data/repository/model/loading_status.dart';
import 'package:masiro/data/repository/model/read_position.dart';
import 'package:masiro/data/repository/model/reading_mode.dart';
import 'package:masiro/data/repository/novel_record_repository.dart';
import 'package:masiro/di/get_it.dart';

class ReaderScreenBloc extends Bloc<ReaderScreenEvent, ReaderScreenState> {
  final masiroRepository = getIt<MasiroRepository>();
  final novelRecordRepository = getIt<NovelRecordRepository>();

  final int novelId;

  ReaderScreenBloc({
    required this.novelId,
  }) : super(ReaderScreenInitialState()) {
    on<ReaderScreenChapterDetailRequested>(_onRequestReaderScreenChapterDetail);
    on<ReaderScreenHudToggled>(_onToggleReaderScreenHud);
    on<ReaderScreenPositionChanged>(
      _onChangeReaderScreenPosition,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    on<ReaderScreenChapterNavigated>(_onReaderScreenChapterNavigated);
  }

  Future<void> _onRequestReaderScreenChapterDetail(
    ReaderScreenChapterDetailRequested event,
    Emitter<ReaderScreenState> emit,
  ) async {
    try {
      final chapterId = event.chapterId;
      final chapterDetail = await masiroRepository.getChapterDetail(
        novelId,
        chapterId,
      );
      final chapterRecord = await novelRecordRepository.findChapterRecord(
        chapterId,
        ReadingMode.scroll,
      );
      emit(
        ReaderScreenLoadedState(
          chapterDetail: chapterDetail,
          position: chapterRecord?.position ?? startPosition,
        ),
      );
    } catch (e) {
      emit(ReaderScreenErrorState(message: e.toString()));
    }
  }

  void _onToggleReaderScreenHud(
    ReaderScreenHudToggled event,
    Emitter<ReaderScreenState> emit,
  ) {
    if (state is! ReaderScreenLoadedState) {
      return;
    }
    final loadedState = state as ReaderScreenLoadedState;
    final isHudVisible = loadedState.isHudVisible;
    emit(loadedState.copyWith(isHudVisible: !isHudVisible));
  }

  Future<void> _onChangeReaderScreenPosition(
    ReaderScreenPositionChanged event,
    Emitter<ReaderScreenState> emit,
  ) async {
    if (state is! ReaderScreenLoadedState) {
      return;
    }
    final loadedState = state as ReaderScreenLoadedState;
    final chapterId = loadedState.chapterDetail.chapterId;
    final readingMode = loadedState.readingMode;
    final chapterRecord = await novelRecordRepository.findChapterRecord(
      chapterId,
      readingMode,
    );
    await novelRecordRepository.putChapterRecord(
      ChapterRecord(
        id: chapterRecord?.id ?? Isar.autoIncrement,
        chapterId: chapterId,
        novelId: novelId,
        position: event.position,
        readingMode: readingMode,
      ),
    );
  }

  Future<void> _onReaderScreenChapterNavigated(
    ReaderScreenChapterNavigated event,
    Emitter<ReaderScreenState> emit,
  ) async {
    if (state is! ReaderScreenLoadedState) {
      return;
    }
    final loadedState = state as ReaderScreenLoadedState;
    emit(loadedState.copyWith(loadingStatus: LoadingStatus.loading));
    add(ReaderScreenChapterDetailRequested(chapterId: event.chapterId));
  }

  Future<String> purchasePaidChapter(PaymentInfo paymentInfo) async {
    if (state is! ReaderScreenLoadedState) {
      throw Exception(
        '''Current state isn't an instance of the `ReaderScreenLoadedState`.''',
      );
    }
    final loadedState = state as ReaderScreenLoadedState;
    final csrfToken = loadedState.chapterDetail.csrfToken;
    final msg = await masiroRepository.purchasePaidChapter(
      chapterId: paymentInfo.chapterId,
      cost: paymentInfo.cost,
      type: paymentInfo.type,
      csrfToken: csrfToken,
    );
    add(ReaderScreenChapterNavigated(chapterId: paymentInfo.chapterId));
    return msg;
  }
}
