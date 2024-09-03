import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_event.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_state.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/di/get_it.dart';

class NovelScreenBloc extends Bloc<NovelScreenEvent, NovelScreenState> {
  final masiroRepository = getIt<MasiroRepository>();

  int novelId;

  NovelScreenBloc({required this.novelId}) : super(NovelScreenInitialState()) {
    on<NovelScreenRefreshed>(_onNovelScreenRefreshed);
    on<NovelScreenChapterRead>(_onNovelScreenChapterRead);
  }

  Future<void> _onNovelScreenRefreshed(
    NovelScreenEvent event,
    Emitter<NovelScreenState> emit,
  ) async {
    try {
      final novelDetail = await masiroRepository.getNovelDetail(novelId);
      emit(NovelScreenLoadedState(novelDetail: novelDetail));
    } catch (e) {
      emit(NovelScreenErrorState(message: e.toString()));
    }
  }

  void _onNovelScreenChapterRead(
    NovelScreenChapterRead event,
    Emitter<NovelScreenState> emit,
  ) {
    if (state is! NovelScreenLoadedState) {
      return;
    }
    final novelDetail = (state as NovelScreenLoadedState)
        .novelDetail
        .copyWith(lastReadChapterId: event.chapterId);
    emit(NovelScreenLoadedState(novelDetail: novelDetail));
  }
}
