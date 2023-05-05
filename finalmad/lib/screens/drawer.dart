import 'package:finalmad/screens/tasks/task4/task4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class drawer extends StatelessWidget {
  final Function(int) tileClicked;
  drawer({Key? key, required this.tileClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
              accountName: Text("Sharjeel Iftikhar"),
              accountEmail: Text("2020-CS-139"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                child: Text("abc"),
              ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Task One"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(0);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.face),
            title: const Text("Tab Expansion Caresoul"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(1);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.offline_bolt_outlined),
            title: const Text("Form Validation"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(2);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit_rounded),
            title: const Text("Firebase Crud"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(3);
              Get.to(task4());
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety),
            title: const Text("Widgets"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(4);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Shared Preference"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(5);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.yard_sharp),
            title: const Text("Upload Image"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(6);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.sailing),
            title: const Text("SQFLite"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(7);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.video_call_rounded),
            title: const Text("Video"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(8);
            },
            enabled: true,
          ),
          // ListTile(
          //   leading: const Icon(Icons.tag_sharp),
          //   title: const Text("Authentication"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     tileClicked(9);
          //   },
          //   enabled: true,
          // ),
          ListTile(
            leading: const Icon(Icons.restart_alt),
            title: const Text("Rest Api"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(9);
            },
            enabled: true,
          ),
          ListTile(
            leading: const Icon(Icons.join_right_rounded),
            title: const Text("Push Notification"),
            onTap: () {
              Navigator.of(context).pop();
              tileClicked(10);
            },
            enabled: true,
          ),

        ],
      ),
    );
  }
}
