import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/read_position.dart';

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

final class ReaderScreenPositionChanged extends ReaderScreenEvent {
  final ReadPosition position;

  ReaderScreenPositionChanged({required this.position});

  @override
  List<Object> get props => [position];
}

final class ReaderScreenChapterNavigated extends ReaderScreenEvent {
  final int chapterId;

  ReaderScreenChapterNavigated({required this.chapterId});

  @override
  List<Object> get props => [chapterId];
}

final class ReaderScreenFontSizeChanged extends ReaderScreenEvent {
  final int fontSize;

  ReaderScreenFontSizeChanged({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}
