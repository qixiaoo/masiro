import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LicenseScreen extends StatelessWidget {
  final String name;
  final String? license;

  const LicenseScreen({
    super.key,
    required this.name,
    required this.license,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(license ?? ''),
        ],
      ),
    );
  }
}
