import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int id;
  final int novelId;
  final int userId;
  final int parentId;
  final String content;
  final DateTime createdAt;
  final int topId;
  final int replyUser;
  final int chapterId;
  final int floor;
  final int thumbUp;
  final String name;
  final String avatar;
  final String? badges;

  final List<Comment> replies;

  const Comment({
    required this.id,
    required this.novelId,
    required this.userId,
    required this.parentId,
    required this.content,
    required this.createdAt,
    required this.topId,
    required this.replyUser,
    required this.chapterId,
    required this.floor,
    required this.thumbUp,
    required this.name,
    required this.avatar,
    required this.badges,
    required this.replies,
  });

  @override
  List<Object?> get props => [
        id,
        novelId,
        userId,
        parentId,
        content,
        createdAt,
        topId,
        replyUser,
        chapterId,
        floor,
        thumbUp,
        name,
        avatar,
        badges,
        replies,
      ];
}
