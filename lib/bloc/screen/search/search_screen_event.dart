import 'package:equatable/equatable.dart';

sealed class SearchScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SearchScreenSearched extends SearchScreenEvent {
  final String keyword;

  SearchScreenSearched({required this.keyword});

  @override
  List<Object> get props => [keyword];
}

final class SearchScreenBottomReached extends SearchScreenEvent {}
