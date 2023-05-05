import 'package:flutter/material.dart';

class button_field extends StatelessWidget {
  // we adding a function and a text in its constructor
  final Function()? OnTap;
  final String buttontext;
  const button_field({Key? key, this.OnTap, required this.buttontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: OnTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              buttontext,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ));
  }
}
