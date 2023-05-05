import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class personCard extends StatelessWidget {
  const personCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(12)),
      child: const Icon(Icons.person),
    );
  }
}
