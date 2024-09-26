import 'package:flutter/material.dart';

const Duration _duration = Duration(milliseconds: 500);
const Curve _curve = Curves.fastOutSlowIn;

class TopBar extends StatelessWidget {
  final String title;
  final bool isVisible;

  final void Function() onNavigateBack;

  const TopBar({
    super.key,
    required this.title,
    required this.isVisible,
    required this.onNavigateBack,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return AnimatedPositioned(
      left: 0,
      right: 0,
      top: isVisible ? 0.0 : -(kToolbarHeight + statusBarHeight),
      duration: _duration,
      curve: _curve,
      child: AppBar(
        leading: IconButton(
          onPressed: onNavigateBack,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(title),
      ),
    );
  }
}
