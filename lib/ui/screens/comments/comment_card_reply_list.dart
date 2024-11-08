import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/list.dart';
import 'package:masiro/ui/screens/comments/comment_card.dart';

const _defaultSize = 3;

class CommentCardReplyList extends StatefulWidget {
  final Comment comment;
  final List<Comment> replies;

  const CommentCardReplyList({
    super.key,
    required this.comment,
    required this.replies,
  });

  @override
  State<CommentCardReplyList> createState() => _CommentCardReplyListState();
}

class _CommentCardReplyListState extends State<CommentCardReplyList> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.replies.length <= _defaultSize;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme();
    final localizations = context.localizations();

    final comment = widget.comment;
    final replies = widget.replies;
    final size = replies.length <= _defaultSize ? replies.length : _defaultSize;
    final truncatedList = isExpanded ? replies : replies.sublist(0, size);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: colorScheme.surfaceContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...indexedMap(truncatedList, (index, reply) {
              return CommentCard(
                comment: reply,
                parentComment: comment,
                replyIndex: index,
              );
            }),
            if (!isExpanded)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => setState(() => isExpanded = !isExpanded),
                  child: Text(
                    localizations.viewMoreReplies(replies.length - size),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
