import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_event.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_state.dart';
import 'package:masiro/data/repository/favorites_repository.dart';
import 'package:masiro/di/get_it.dart';

typedef _FavoritesScreenBloc = Bloc<FavoritesScreenEvent, FavoritesScreenState>;

class FavoritesScreenBloc extends _FavoritesScreenBloc {
  final _favoritesRepository = getIt<FavoritesRepository>();

  FavoritesScreenBloc() : super(FavoritesScreenInitialState()) {
    on<FavoritesScreenRequested>(_onRequestFavoritesScreen);
    on<FavoritesScreenRefreshed>(_onRefreshFavoritesScreen);
  }

  Future<void> _onRequestFavoritesScreen(
    FavoritesScreenRequested event,
    Emitter<FavoritesScreenState> emit,
  ) async {
    try {
      final favorites = await _favoritesRepository.getFavorites();
      emit(FavoritesScreenLoadedState(novels: favorites));
    } catch (e) {
      emit(FavoritesScreenErrorState(message: e.toString()));
    }
  }

  Future<void> _onRefreshFavoritesScreen(
    FavoritesScreenRefreshed event,
    Emitter<FavoritesScreenState> emit,
  ) async {
    try {
      final favorites = await _favoritesRepository.refreshFavorites();
      emit(FavoritesScreenLoadedState(novels: favorites));
    } catch (e) {
      emit(FavoritesScreenErrorState(message: e.toString()));
    }
  }
}
