import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;

  const Message({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(message),
      ),
    );
  }
}
