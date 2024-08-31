import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_event.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_state.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/di/get_it.dart';

class FavoritesScreenBloc
    extends Bloc<FavoritesScreenEvent, FavoritesScreenState> {
  final masiroRepository = getIt<MasiroRepository>();

  FavoritesScreenBloc() : super(FavoritesScreenInitialState()) {
    on<FavoritesScreenRefreshed>(_onRefreshFavoritesScreen);
  }

  Future<void> _onRefreshFavoritesScreen(
    FavoritesScreenRefreshed event,
    Emitter<FavoritesScreenState> emit,
  ) async {
    try {
      final favorites = await masiroRepository.getFavorites();
      emit(FavoritesScreenLoadedState(novels: favorites));
    } catch (e) {
      emit(FavoritesScreenErrorState(message: e.toString()));
    }
  }
}
