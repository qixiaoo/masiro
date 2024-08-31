import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/ui/widgets/error_message.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;

  const ErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ErrorMessage(
        message: message,
      ),
    );
  }
}
