import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/novel_detail.dart';
import 'package:masiro/misc/constant.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/url.dart';
import 'package:masiro/ui/widgets/cached_image.dart';

class NovelHeader extends StatelessWidget {
  final NovelDetailHeader header;

  const NovelHeader({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final textTheme = context.textTheme();
    const coverWidth = 160.0;

    return Row(
      children: [
        CachedImage(
          url: header.coverImg.toUrl(),
          width: coverWidth,
          height: coverWidth / coverRatio,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    header.title,
                    style: textTheme.titleLarge,
                  ),
                ),
                Text(
                  '${localizations.author}: ${header.author}',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  '${localizations.translator}: ${header.translators.join(', ')}',
                  style: textTheme.bodyLarge,
                ),
                Text(
                  '${localizations.status}: ${header.status}',
                  style: textTheme.bodyLarge,
                ),
                if (isDesktop)
                  Text(
                    '${localizations.originalBook}: ${header.originalBook}',
                    style: textTheme.bodyLarge,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
