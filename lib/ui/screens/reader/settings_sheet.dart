import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';

class SettingsSheet extends StatefulWidget {
  final int fontSize;
  final void Function(int fontSize) onFontSizeChanged;

  const SettingsSheet({
    super.key,
    required this.fontSize,
    required this.onFontSizeChanged,
  });

  @override
  State<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  late int fontSize;

  @override
  void initState() {
    super.initState();
    fontSize = widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(localizations.fontSize),
              Expanded(
                child: Slider(
                  value: fontSize.toDouble(),
                  min: 12,
                  max: 32,
                  divisions: 20,
                  label: fontSize.toString(),
                  onChanged: (value) {
                    setState(() => fontSize = value.toInt());
                    widget.onFontSizeChanged(value.toInt());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
