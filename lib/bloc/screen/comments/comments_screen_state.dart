import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/data/repository/model/paged_data.dart';

class CommentsScreenState extends Equatable {
  final List<PagedData<Comment>> pagedComments;

  final int page;

  final int totalCount;

  final int totalPages;

  const CommentsScreenState({
    this.pagedComments = const [],
    this.page = 1,
    this.totalCount = 0,
    this.totalPages = 0,
  });

  CommentsScreenState copyWith({
    List<PagedData<Comment>>? pagedComments,
    int? page,
    int? totalCount,
    int? totalPages,
  }) {
    return CommentsScreenState(
      pagedComments: pagedComments ?? this.pagedComments,
      page: page ?? this.page,
      totalCount: totalCount ?? this.totalCount,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  List<Comment> get comments {
    final list = <Comment>[];
    for (final pagedComment in pagedComments) {
      list.addAll(pagedComment.data);
    }
    return list;
  }

  @override
  List<Object?> get props => [
        pagedComments,
        page,
        totalCount,
        totalPages,
      ];
}
