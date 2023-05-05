import 'package:finalmad/screens/tasks/task1/TaskOne.dart';
import 'package:finalmad/screens/tasks/task2/task2.dart';
import 'package:finalmad/screens/tasks/task3/task3.dart';
import 'package:finalmad/screens/tasks/task4/task4.dart';
import 'package:finalmad/screens/tasks/task5/task5.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'tasks/task11/eleven.dart';
import 'tasks/task13/task13.dart';
import 'tasks/task6/task6.dart';
import 'tasks/task7/task7.dart';
import 'tasks/task8/view/view_all.dart';
import 'tasks/task9/task9.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int recentScreen = 4;

  final List<Widget> screens =[
    const TaskOne(),
    const Task_two(),
    const TaskThree(),
    const task4(),
    const taskFive(),
    const taskSix(),
    const imageupload(),
    const view_all(),
    const VideoPlayerScreen(videoUrl: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'),
    const TaskEleven(),
    const TaskThirteen(),
  ];

  openScreen(int id) {
    setState(() {
      recentScreen = id;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Integration of All tasks"),
        backgroundColor: Color.fromARGB(226, 232, 148, 241),
      ),
      drawer: drawer(tileClicked:  openScreen),
        body :screens[recentScreen],
    );
  }
}
