import 'package:equatable/equatable.dart';
import 'package:masiro/data/model/chapter_detail.dart';
import 'package:masiro/data/model/reading_mode.dart';

sealed class ReaderScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReaderScreenInitialState extends ReaderScreenState {}

class ReaderScreenErrorState extends ReaderScreenState {
  final String? message;

  ReaderScreenErrorState({this.message});

  @override
  List<Object?> get props => [message];
}

class ReaderScreenLoadedState extends ReaderScreenState {
  final ChapterDetail chapterDetail;
  final bool isTopBarVisible;
  final ReadingMode readingMode;

  ReaderScreenLoadedState({
    required this.chapterDetail,
    this.isTopBarVisible = false,
    this.readingMode = ReadingMode.scroll,
  });

  ReaderScreenLoadedState copyWith({
    ChapterDetail? chapterDetail,
    bool? isTopBarVisible,
    ReadingMode? readingMode,
  }) {
    return ReaderScreenLoadedState(
      chapterDetail: chapterDetail ?? this.chapterDetail,
      isTopBarVisible: isTopBarVisible ?? this.isTopBarVisible,
      readingMode: readingMode ?? this.readingMode,
    );
  }

  @override
  List<Object?> get props => [chapterDetail, isTopBarVisible, readingMode];
}
