import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelHint;
  const InputField(
      {super.key, required this.controller, required this.labelHint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: labelHint,
            hintStyle: TextStyle(color: Colors.grey.shade500)),
      ),
    );
  }
}
