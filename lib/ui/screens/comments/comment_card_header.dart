import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/misc/context.dart';

class CommentCardHeader extends StatelessWidget {
  final Comment comment;
  final Comment? parentComment;
  final int? replyIndex;

  const CommentCardHeader({
    super.key,
    required this.comment,
    this.parentComment,
    this.replyIndex,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    final floor = comment.floor;
    final parentFloor = parentComment?.floor;
    final isReply = parentComment != null;

    final floorIndicator =
        !isReply ? Text('#$floor') : Text('#$parentFloor-${replyIndex! + 1}');

    Text? replyTarget;
    if (isReply) {
      final replies = parentComment!.replies;
      final targetIndex = replies.indexWhere((r) => r.id == comment.parentId);
      if (targetIndex != -1) {
        replyTarget = Text(
          '${localizations.reply} #$parentFloor-${targetIndex + 1}'
          ' @${replies[targetIndex].name}',
        );
      }
    }

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(DateFormat.yMd().format(comment.createdAt)),
              if (replyTarget != null) replyTarget,
            ],
          ),
        ),
        floorIndicator,
      ],
    );
  }
}
