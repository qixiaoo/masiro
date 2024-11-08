import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/data/repository/model/paged_data.dart';

sealed class CommentsScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class CommentsScreenRefreshed extends CommentsScreenEvent {
  final PagedData<Comment> pagedData;

  CommentsScreenRefreshed({required this.pagedData});

  @override
  List<Object> get props => [pagedData];
}

final class CommentsScreenPrevPageRequested extends CommentsScreenEvent {
  final PagedData<Comment> pagedData;

  CommentsScreenPrevPageRequested({required this.pagedData});

  @override
  List<Object> get props => [pagedData];
}

final class CommentsScreenNextPageRequested extends CommentsScreenEvent {
  final PagedData<Comment> pagedData;

  CommentsScreenNextPageRequested({required this.pagedData});

  @override
  List<Object> get props => [pagedData];
}
