import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/toast.dart';
import 'package:masiro/misc/url.dart';
import 'package:masiro/ui/screens/comments/comment_card_header.dart';
import 'package:masiro/ui/screens/comments/comment_card_reply_list.dart';
import 'package:masiro/ui/widgets/cached_image.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;
  final Comment? parentComment;
  final int? replyIndex;

  const CommentCard({
    super.key,
    required this.comment,
    this.parentComment,
    this.replyIndex,
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme();

    final comment = widget.comment;
    final replies = comment.replies;
    final parentComment = widget.parentComment;
    final isReply = parentComment != null;

    const spacing = SizedBox(height: 10);

    final avatar = ClipOval(
      child: CachedImage(
        url: comment.avatar.toUrl(),
        width: 40,
        height: 40,
      ),
    );

    return Card(
      elevation: isReply ? 0 : null,
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: isReply ? colorScheme.surfaceContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatar,
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommentCardHeader(
                    comment: comment,
                    parentComment: parentComment,
                    replyIndex: widget.replyIndex,
                  ),
                  spacing,
                  SelectionArea(
                    child: HtmlWidget(
                      comment.content,
                      onTapUrl: (url) async {
                        await _copy(context, url);
                        return true;
                      },
                      customStylesBuilder: (element) {
                        if (element.localName == 'blockquote') {
                          final primary = colorScheme.primary;
                          final color = '#${primary.value.toRadixString(16)}';
                          return {
                            'border-left': '5px solid $color',
                            'margin': '0px',
                            'padding-left': '20px',
                          };
                        }
                        return null;
                      },
                    ),
                  ),
                  spacing,
                  if (replies.isNotEmpty)
                    CommentCardReplyList(comment: comment, replies: replies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _copy(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) {
      return;
    }
    context.localizations().copied.toast();
  }
}
