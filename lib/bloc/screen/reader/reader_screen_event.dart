import 'package:equatable/equatable.dart';

sealed class ReaderScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ReaderScreenChapterDetailRequested extends ReaderScreenEvent {}

final class ReaderScreenTopBarToggled extends ReaderScreenEvent {}

final class ReaderScreenProgressChanged extends ReaderScreenEvent {
  final int progress;

  ReaderScreenProgressChanged({required this.progress});

  @override
  List<Object> get props => [progress];
}
