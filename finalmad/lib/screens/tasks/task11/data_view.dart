
import 'package:finalmad/widgets/button_field.dart';
import 'package:flutter/material.dart';

class MyDataView extends StatelessWidget {
  final int id;
  final String todo;
  final bool complete;
  final int userId;
  const MyDataView({
    super.key,
    required this.id,
    required this.todo,
    required this.complete,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userId.toString()),
              (complete == true)
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 25,
                    )
                  : const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 25,
                    ),
            ],
          ),
          const SizedBox(height: 5),
          Text(todo),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
