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
    on<NovelScreenNovelFavorited>(_onNovelScreenNovelFavorited);
    on<NovelScreenNovelUnfavorited>(_onNovelScreenNovelUnfavorited);
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

  Future<void> _onNovelScreenNovelFavorited(
    NovelScreenNovelFavorited event,
    Emitter<NovelScreenState> emit,
  ) async {
    if (state is! NovelScreenLoadedState) {
      return;
    }
    final loadedState = state as NovelScreenLoadedState;
    final csrfToken = loadedState.novelDetail.header.csrfToken;
    await masiroRepository.addNovelToFavorites(novelId, csrfToken);
    final novelHeader = loadedState.novelDetail.header.copyWith(
      isFavorite: true,
    );
    final novelDetail = loadedState.novelDetail.copyWith(header: novelHeader);
    emit(loadedState.copyWith(novelDetail: novelDetail));
  }

  Future<void> _onNovelScreenNovelUnfavorited(
    NovelScreenNovelUnfavorited event,
    Emitter<NovelScreenState> emit,
  ) async {
    if (state is! NovelScreenLoadedState) {
      return;
    }
    final loadedState = state as NovelScreenLoadedState;
    final csrfToken = loadedState.novelDetail.header.csrfToken;
    await masiroRepository.removeNovelFromFavorites(novelId, csrfToken);
    final novelHeader = loadedState.novelDetail.header.copyWith(
      isFavorite: false,
    );
    final novelDetail = loadedState.novelDetail.copyWith(header: novelHeader);
    emit(loadedState.copyWith(novelDetail: novelDetail));
  }
}
