import 'package:equatable/equatable.dart';

sealed class FavoritesScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FavoritesScreenRefreshed extends FavoritesScreenEvent {}
