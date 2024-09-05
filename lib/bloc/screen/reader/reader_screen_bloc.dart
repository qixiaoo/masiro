import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_event.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_state.dart';
import 'package:masiro/bloc/util/event_transformer.dart';
import 'package:masiro/data/model/chapter_record.dart';
import 'package:masiro/data/model/reading_mode.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/data/repository/novel_record_repository.dart';
import 'package:masiro/di/get_it.dart';

class ReaderScreenBloc extends Bloc<ReaderScreenEvent, ReaderScreenState> {
  final masiroRepository = getIt<MasiroRepository>();
  final novelRecordRepository = getIt<NovelRecordRepository>();

  final int novelId;
  final int chapterId;

  ReaderScreenBloc({
    required this.novelId,
    required this.chapterId,
  }) : super(ReaderScreenInitialState()) {
    on<ReaderScreenChapterDetailRequested>(_onRequestReaderScreenChapterDetail);
    on<ReaderScreenTopBarToggled>(_onToggleReaderScreenTopBar);
    on<ReaderScreenProgressChanged>(
      _onChangeReaderScreenProgress,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  Future<void> _onRequestReaderScreenChapterDetail(
    ReaderScreenChapterDetailRequested event,
    Emitter<ReaderScreenState> emit,
  ) async {
    try {
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
          progress: chapterRecord?.progress ?? 0,
        ),
      );
    } catch (e) {
      emit(ReaderScreenErrorState(message: e.toString()));
    }
  }

  void _onToggleReaderScreenTopBar(
    ReaderScreenTopBarToggled event,
    Emitter<ReaderScreenState> emit,
  ) {
    if (state is! ReaderScreenLoadedState) {
      return;
    }
    final loadedState = state as ReaderScreenLoadedState;
    final isTopBarVisible = loadedState.isTopBarVisible;
    emit(loadedState.copyWith(isTopBarVisible: !isTopBarVisible));
  }

  Future<void> _onChangeReaderScreenProgress(
    ReaderScreenProgressChanged event,
    Emitter<ReaderScreenState> emit,
  ) async {
    if (state is! ReaderScreenLoadedState) {
      return;
    }
    final loadedState = state as ReaderScreenLoadedState;
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
        progress: event.progress,
        readingMode: readingMode,
      ),
    );
  }
}
