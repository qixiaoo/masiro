import 'package:flutter/material.dart';
import 'package:masiro/l10n/app_localizations.dart';

extension ContextUtils on BuildContext {
  AppLocalizations localizations() {
    return AppLocalizations.of(this)!;
  }

  ThemeData theme() {
    return Theme.of(this);
  }

  ColorScheme colorScheme() {
    return Theme.of(this).colorScheme;
  }

  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
