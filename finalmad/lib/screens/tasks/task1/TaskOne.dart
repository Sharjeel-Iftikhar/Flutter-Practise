import 'package:flutter/material.dart';

import '../../../widgets/button_field.dart';
import '../../../widgets/tileText.dart';

class TaskOne extends StatefulWidget {
  const TaskOne({super.key});

  @override
  State<TaskOne> createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> {
  String status = 'Active';

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Container(
      // decoration: BoxDecoration(
      //     color: Colors.deepPurple[100],
      //     borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      height: hei*0.2,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      color: Color.fromARGB(255, 221, 240, 243),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const tileText("Give Title"),
              (status == "Active")
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
          const Text("What are you doing"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              button_field(
                  buttontext: 'Delete',
                  OnTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Are you sure want to delete"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("cancel")),
                              TextButton(
                                  onPressed: () {
                                    // deleteId(id);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Yes")),
                            ],
                          );
                        });
                  }),
              button_field(
                  buttontext: "Edit",
                  OnTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Are you sure want to Edit"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("cancel")),
                              TextButton(
                                  onPressed: () {
                                    // deleteId(id);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Yes")),
                            ],
                          );
                        });
                  }),
            ],
          )
        ],
      ),
    );
  }
}
