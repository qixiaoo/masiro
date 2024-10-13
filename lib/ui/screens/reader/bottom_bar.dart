import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';

const Duration _duration = Duration(milliseconds: 500);
const Curve _curve = Curves.fastOutSlowIn;

const bottomBarHeight = kToolbarHeight;

class BottomBar extends StatelessWidget {
  final bool isVisible;
  final int? prevChapterId;
  final int? nextChapterId;

  final void Function(int chapterId) onNavigateTo;
  final void Function() onSettingsClicked;

  const BottomBar({
    super.key,
    required this.isVisible,
    this.prevChapterId,
    this.nextChapterId,
    required this.onNavigateTo,
    required this.onSettingsClicked,
  });

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 8.0;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final theme = context.theme();
    final appBarThemeColor = theme.appBarTheme.backgroundColor;
    final surfaceContainerColor = theme.colorScheme.surfaceContainer;
    final backgroundColor = appBarThemeColor ?? surfaceContainerColor;

    return AnimatedPositioned(
      left: 0,
      right: 0,
      bottom: isVisible ? 0.0 : -(bottomBarHeight + bottomPadding),
      duration: _duration,
      curve: _curve,
      child: Container(
        color: backgroundColor,
        height: bottomBarHeight,
        padding: EdgeInsets.only(
          bottom: bottomPadding,
          left: horizontalPadding,
          right: horizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prevChapterId == null
                  ? null
                  : () => onNavigateTo(prevChapterId!),
              icon: const Icon(Icons.skip_previous_rounded),
            ),
            IconButton(
              onPressed: onSettingsClicked,
              icon: const Icon(Icons.settings_rounded),
            ),
            IconButton(
              onPressed: nextChapterId == null
                  ? null
                  : () => onNavigateTo(nextChapterId!),
              icon: const Icon(Icons.skip_next_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
