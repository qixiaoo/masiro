import 'package:flutter/material.dart';
import 'package:masiro/data/model/reading_mode.dart';
import 'package:masiro/misc/context.dart';

class PointerAreaIndicator extends StatelessWidget {
  final ReadingMode readingMode;

  const PointerAreaIndicator({super.key, required this.readingMode});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    final previous = Expanded(
      child: ColoredBox(
        color: Colors.greenAccent.withOpacity(0.5),
        child: Center(
          child: Text(localizations.previousPage),
        ),
      ),
    );

    final next = Expanded(
      child: ColoredBox(
        color: Colors.orangeAccent.withOpacity(0.5),
        child: Center(
          child: Text(localizations.nextPage),
        ),
      ),
    );

    return IgnorePointer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (readingMode.isPage()) previous,
          Expanded(
            child: ColoredBox(
              color: Colors.blueAccent.withOpacity(0.5),
              child: Center(
                child: Text(localizations.menu),
              ),
            ),
          ),
          if (readingMode.isPage()) next,
        ],
      ),
    );
  }
}
