import 'package:flutter/material.dart';
import 'package:masiro/misc/platform.dart';

class ManualTooltip extends StatelessWidget {
  final Widget icon;
  final String tooltip;

  const ManualTooltip({
    super.key,
    required this.icon,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final tooltipKey = GlobalKey<TooltipState>();

    return Tooltip(
      key: tooltipKey,
      triggerMode: TooltipTriggerMode.manual,
      message: tooltip,
      child: IconButton(
        onPressed: () {
          if (!isMobilePhone) {
            return;
          }
          tooltipKey.currentState?.ensureTooltipVisible();
        },
        icon: icon,
      ),
    );
  }
}
