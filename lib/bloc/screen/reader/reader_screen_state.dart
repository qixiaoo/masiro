import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/loading_status.dart';
import 'package:masiro/data/repository/model/read_position.dart';
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
  final ReadPosition position;
  final LoadingStatus loadingStatus;
  final int fontSize;

  ReaderScreenLoadedState({
    required this.chapterDetail,
    this.isHudVisible = false,
    this.readingMode = ReadingMode.scroll,
    required this.position,
    this.loadingStatus = LoadingStatus.success,
    required this.fontSize,
  });

  ReaderScreenLoadedState copyWith({
    ChapterDetail? chapterDetail,
    bool? isHudVisible,
    ReadingMode? readingMode,
    ReadPosition? position,
    LoadingStatus? loadingStatus,
    int? fontSize,
  }) {
    return ReaderScreenLoadedState(
      chapterDetail: chapterDetail ?? this.chapterDetail,
      isHudVisible: isHudVisible ?? this.isHudVisible,
      readingMode: readingMode ?? this.readingMode,
      position: position ?? this.position,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  @override
  List<Object?> get props => [
        chapterDetail,
        isHudVisible,
        readingMode,
        position,
        loadingStatus,
        fontSize,
      ];
}
