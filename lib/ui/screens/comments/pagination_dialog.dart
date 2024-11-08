import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';

class PaginationDialog extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final void Function(int page) onPageChanged;

  const PaginationDialog({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final pageList = List.generate(totalPages, (i) => i + 1);

    return AlertDialog(
      title: Text(localizations.jumpTo),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...pageList.map(
              (page) => ListTile(
                title: Text(page.toString()),
                leading: Radio<int>(
                  value: currentPage,
                  groupValue: page,
                  onChanged: (_) => onPageChanged(page),
                ),
                onTap: () => onPageChanged(page),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
