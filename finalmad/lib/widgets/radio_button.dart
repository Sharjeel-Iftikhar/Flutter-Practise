import 'package:flutter/material.dart';

class MyRadioButton extends StatelessWidget {
  final Function(String) radioHandler;
  final String radioValue;
  final String radioTitle;
  final String radioGroupValue;
  const MyRadioButton(
      {super.key,
        required this.radioValue,
        required this.radioTitle,
        required this.radioGroupValue,
        required this.radioHandler});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(radioTitle),
      value: radioValue,
      groupValue: radioGroupValue,
      onChanged: (value) {
        radioHandler(value.toString());
      },
    );
  }
}
