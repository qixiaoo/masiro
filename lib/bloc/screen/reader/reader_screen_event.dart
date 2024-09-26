import 'package:equatable/equatable.dart';

sealed class ReaderScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ReaderScreenChapterDetailRequested extends ReaderScreenEvent {
  final int chapterId;

  ReaderScreenChapterDetailRequested({required this.chapterId});

  @override
  List<Object> get props => [chapterId];
}

final class ReaderScreenHudToggled extends ReaderScreenEvent {}

final class ReaderScreenProgressChanged extends ReaderScreenEvent {
  final int progress;

  ReaderScreenProgressChanged({required this.progress});

  @override
  List<Object> get props => [progress];
}

final class ReaderScreenChapterNavigated extends ReaderScreenEvent {
  final int chapterId;

  ReaderScreenChapterNavigated({required this.chapterId});

  @override
  List<Object> get props => [chapterId];
}
