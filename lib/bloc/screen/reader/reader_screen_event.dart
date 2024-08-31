import 'package:equatable/equatable.dart';

sealed class ReaderScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ReaderScreenChapterDetailRequested extends ReaderScreenEvent {}

final class ReaderScreenTopBarToggled extends ReaderScreenEvent {}
