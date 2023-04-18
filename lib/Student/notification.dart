import 'package:flutter/material.dart';
import '../colorscheme.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification Center',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: ColorTheme.secondarycolor,
          centerTitle: true,
        ),
        body: Column(
          children: const [
            SizedBox(
              child: Image(
                image: AssetImage("assets/images/notification.jpg"),
              ),
            ),
            Text(
              'No Notification right now!!!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}
