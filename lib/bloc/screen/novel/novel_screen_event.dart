import 'package:equatable/equatable.dart';

sealed class NovelScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class NovelScreenRefreshed extends NovelScreenEvent {}
