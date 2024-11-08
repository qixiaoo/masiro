class PagedCommentResponse {
  int code;
  String msg;
  List<CommentResponse> comments;
  List<CommentResponse> replies;
  int total;
  int hasAuth;
  List<dynamic> rating;

  PagedCommentResponse({
    required this.code,
    required this.msg,
    required this.comments,
    required this.replies,
    required this.total,
    required this.hasAuth,
    required this.rating,
  });

  factory PagedCommentResponse.fromJson(Map<String, dynamic> json) {
    final rawTotal = json['total'];
    final total = rawTotal is String ? int.parse(rawTotal) : rawTotal;
    return PagedCommentResponse(
      code: json['code'],
      msg: json['msg'],
      comments: List<CommentResponse>.from(
        json['comments'].map((x) => CommentResponse.fromJson(x)),
      ),
      replies: List<CommentResponse>.from(
        json['replys'].map((x) => CommentResponse.fromJson(x)),
      ),
      total: total,
      hasAuth: json['has_auth'],
      rating: List<dynamic>.from(json['rating'].map((x) => x)),
    );
  }
}

class CommentResponse {
  int id;
  int novelId;
  int userId;
  int parentId;
  String content;
  int ban;
  DateTime createdAt;
  int topId;
  int replyUser;
  int chapterId;
  dynamic type;
  int floor;
  int thumbUp;
  int hotComment;
  String name;
  String avatar;
  String? badges;

  CommentResponse({
    required this.id,
    required this.novelId,
    required this.userId,
    required this.parentId,
    required this.content,
    required this.ban,
    required this.createdAt,
    required this.topId,
    required this.replyUser,
    required this.chapterId,
    required this.type,
    required this.floor,
    required this.thumbUp,
    required this.hotComment,
    required this.name,
    required this.avatar,
    required this.badges,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      CommentResponse(
        id: json['id'],
        novelId: json['novel_id'],
        userId: json['user_id'],
        parentId: json['parent_id'],
        content: json['content'],
        ban: json['ban'],
        createdAt: DateTime.parse(json['created_at']),
        topId: json['top_id'],
        replyUser: json['reply_user'],
        chapterId: json['chapter_id'],
        type: json['type'],
        floor: json['floor'],
        thumbUp: json['thumb_up'],
        hotComment: json['hot_comment'],
        name: json['name'],
        avatar: json['avatar'],
        badges: json['badges'],
      );
}
