import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/reading_mode.dart';

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
  final int progress;

  ReaderScreenLoadedState({
    required this.chapterDetail,
    this.isTopBarVisible = false,
    this.readingMode = ReadingMode.scroll,
    required this.progress,
  });

  ReaderScreenLoadedState copyWith({
    ChapterDetail? chapterDetail,
    bool? isTopBarVisible,
    ReadingMode? readingMode,
    int? progress,
  }) {
    return ReaderScreenLoadedState(
      chapterDetail: chapterDetail ?? this.chapterDetail,
      isTopBarVisible: isTopBarVisible ?? this.isTopBarVisible,
      readingMode: readingMode ?? this.readingMode,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [
        chapterDetail,
        isTopBarVisible,
        readingMode,
        progress,
      ];
}
