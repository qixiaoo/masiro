import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_event.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_state.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/di/get_it.dart';

class ReaderScreenBloc extends Bloc<ReaderScreenEvent, ReaderScreenState> {
  final masiroRepository = getIt<MasiroRepository>();

  final int novelId;
  final int chapterId;

  ReaderScreenBloc({
    required this.novelId,
    required this.chapterId,
  }) : super(ReaderScreenInitialState()) {
    on<ReaderScreenChapterDetailRequested>(_onRequestReaderScreenChapterDetail);
    on<ReaderScreenTopBarToggled>(_onToggleReaderScreenTopBar);
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
      emit(ReaderScreenLoadedState(chapterDetail: chapterDetail));
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
}
