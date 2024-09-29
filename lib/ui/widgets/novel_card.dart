import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/url.dart';
import 'package:masiro/ui/widgets/cached_image.dart';

class NovelCard extends StatelessWidget {
  final String title;
  final String coverImg;
  final String? author;
  final String? lastUpdated;
  final String brief;
  final int lvLimit;

  final void Function()? onTap;

  const NovelCard({
    super.key,
    required this.title,
    required this.coverImg,
    required this.author,
    required this.lastUpdated,
    required this.brief,
    required this.lvLimit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    const cardMargin = 4.0;

    return Stack(
      children: [
        buildCard(context),
        if (lvLimit > 0)
          Positioned(
            top: cardMargin,
            right: cardMargin,
            child: IconButton(
              tooltip: localizations.levelLimitMessage(lvLimit),
              onPressed: () {},
              icon: const Icon(Icons.info_outline_rounded),
            ),
          ),
      ],
    );
  }

  Widget buildCard(BuildContext context) {
    final textTheme = context.textTheme();
    final localizations = context.localizations();

    const horizontalPadding = 10.0;
    const levelLimitButtonWidth = 40.0;
    final titlePaddingRight =
        lvLimit > 0 ? levelLimitButtonWidth - horizontalPadding : 0.0;

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 150),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CachedImage(
                width: 99.8,
                height: 142.0,
                url: coverImg.toUrl(),
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 6,
                          right: titlePaddingRight,
                        ),
                        child: Text(
                          title,
                          style: textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${localizations.author}: ${author ?? '-'}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${localizations.brief}: $brief',
                              maxLines: isDesktop ? 3 : 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
