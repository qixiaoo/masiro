import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/novel.dart';

sealed class FavoritesScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoritesScreenInitialState extends FavoritesScreenState {}

class FavoritesScreenErrorState extends FavoritesScreenState {
  final String? message;

  FavoritesScreenErrorState({this.message});

  @override
  List<Object?> get props => [message];
}

class FavoritesScreenLoadedState extends FavoritesScreenState {
  final List<Novel> novels;

  FavoritesScreenLoadedState({this.novels = const []});

  FavoritesScreenLoadedState copyWith({List<Novel>? novels}) {
    return FavoritesScreenLoadedState(novels: novels ?? this.novels);
  }

  @override
  List<Object?> get props => [novels];
}
