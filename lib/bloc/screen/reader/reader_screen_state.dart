import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/loading_status.dart';
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
  final bool isHudVisible;
  final ReadingMode readingMode;
  final int progress;
  final LoadingStatus loadingStatus;

  ReaderScreenLoadedState({
    required this.chapterDetail,
    this.isHudVisible = false,
    this.readingMode = ReadingMode.scroll,
    required this.progress,
    this.loadingStatus = LoadingStatus.success,
  });

  ReaderScreenLoadedState copyWith({
    ChapterDetail? chapterDetail,
    bool? isHudVisible,
    ReadingMode? readingMode,
    int? progress,
    LoadingStatus? loadingStatus,
  }) {
    return ReaderScreenLoadedState(
      chapterDetail: chapterDetail ?? this.chapterDetail,
      isHudVisible: isHudVisible ?? this.isHudVisible,
      readingMode: readingMode ?? this.readingMode,
      progress: progress ?? this.progress,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  @override
  List<Object?> get props => [
        chapterDetail,
        isHudVisible,
        readingMode,
        progress,
        loadingStatus,
      ];
}
