
import 'package:flutter/cupertino.dart';

class tileText extends StatelessWidget {
  final String text;
  const tileText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 22, 18, 22),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
    );
  }
}
