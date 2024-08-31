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
}
