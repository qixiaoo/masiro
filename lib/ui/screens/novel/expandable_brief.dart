import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/ui/widgets/after_layout.dart';

const _maskHeight = 40.0;
const _defaultMaxHeight = 200.0;

class ExpandableBrief extends StatefulWidget {
  final String brief;

  const ExpandableBrief({super.key, required this.brief});

  @override
  State<ExpandableBrief> createState() => _ExpandableBriefState();
}

class _ExpandableBriefState extends State<ExpandableBrief> {
  bool isExpanded = false;
  bool isExpandable = false;
  late double intrinsicHeight;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme();
    final localizations = context.localizations();
    final surfaceColor = context.colorScheme().surface;

    final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [surfaceColor.withOpacity(0.5), surfaceColor.withOpacity(1.0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );

    return Stack(
      children: [
        AnimatedContainer(
          constraints: BoxConstraints(
            maxHeight: isExpanded
                ? intrinsicHeight + _maskHeight
                : _defaultMaxHeight + _maskHeight,
          ),
          height: isExpanded ? intrinsicHeight + _maskHeight : null,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          child: AfterLayout(
            callback: (value) {
              final maxHeight = value.getMaxIntrinsicHeight(value.size.width);
              setState(() {
                intrinsicHeight = maxHeight;
                isExpandable = maxHeight > _defaultMaxHeight;
              });
            },
            child: SelectionArea(
              child: Text(
                widget.brief,
                softWrap: true,
                style: textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        if (isExpandable)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: _maskHeight,
              decoration: boxDecoration,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => setState(() => isExpanded = !isExpanded),
                child: Text(
                  isExpanded ? localizations.collapse : localizations.expand,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
