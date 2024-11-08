import 'package:masiro/data/network/response/paged_comment_response.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/data/repository/model/paged_data.dart';

PagedData<Comment> pagedCommentResponseToModel(
  PagedCommentResponse response,
  int page,
  int pageSize,
) {
  final comments = response.comments
      .where((c) => c.ban == 0)
      .map(commentResponseToComment)
      .toList();

  for (final c in comments) {
    final replies = response.replies
        .where((r) => r.ban == 0 && r.topId == c.id)
        .map(commentResponseToComment);
    c.replies.addAll(replies);
  }

  return PagedData<Comment>(
    data: comments,
    page: page,
    totalCount: response.total,
    totalPages: (response.total / pageSize).ceil(),
  );
}

Comment commentResponseToComment(CommentResponse c) {
  return Comment(
    id: c.id,
    novelId: c.novelId,
    userId: c.userId,
    parentId: c.parentId,
    content: c.content,
    createdAt: c.createdAt,
    topId: c.topId,
    replyUser: c.replyUser,
    chapterId: c.chapterId,
    floor: c.floor,
    thumbUp: c.thumbUp,
    name: c.name,
    avatar: c.avatar,
    badges: c.badges,
    replies: List.empty(growable: true),
  );
}
