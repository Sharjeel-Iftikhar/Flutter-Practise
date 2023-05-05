import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  final String message;
  final bool success;
  const MyMessage({super.key, required this.message, required this.success});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.red[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
