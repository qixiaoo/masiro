import 'package:equatable/equatable.dart';

sealed class NovelScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class NovelScreenRefreshed extends NovelScreenEvent {}

final class NovelScreenChapterRead extends NovelScreenEvent {
  final int chapterId;

  NovelScreenChapterRead({required this.chapterId});

  @override
  List<Object> get props => [chapterId];
}

final class NovelScreenNovelFavorited extends NovelScreenEvent {}

final class NovelScreenNovelUnfavorited extends NovelScreenEvent {}
