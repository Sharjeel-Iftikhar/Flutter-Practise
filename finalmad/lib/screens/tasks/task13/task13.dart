import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class TaskThirteen extends StatefulWidget {
  const TaskThirteen({super.key});

  @override
  State<TaskThirteen> createState() => _TaskThirteenState();
}

class _TaskThirteenState extends State<TaskThirteen> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'MAD Notification',
        body: 'Simple Button',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: triggerNotification,
        child: const Text('Push Notification'),
      ),
    );
  }
}
