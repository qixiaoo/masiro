import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptiveStatusBarStyle extends StatelessWidget {
  const AdaptiveStatusBarStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final iconBrightness = Theme.of(context).brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: iconBrightness,
      ),
    );
    return Container();
  }
}
