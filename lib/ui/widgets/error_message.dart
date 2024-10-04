import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';

class ErrorMessage extends StatelessWidget {
  final String? message;

  const ErrorMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SelectionArea(
            child: Text(
              message ?? localizations.errorTip,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
