import 'package:flutter/material.dart';
import '../colorscheme.dart';
import 'studenthome.dart';

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
            'Notification',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorTheme.appcolor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ColorTheme.accentcolor,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const StudentHome()),
                  ));
            },
          ),
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
