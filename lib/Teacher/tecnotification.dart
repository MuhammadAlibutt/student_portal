import 'package:flutter/material.dart';
import '../colorscheme.dart';
import 'teachercourse.dart';

class techNotification extends StatefulWidget {
  const techNotification({super.key});

  @override
  State<techNotification> createState() => _techNotificationState();
}

class _techNotificationState extends State<techNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notification Center',
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
                    builder: ((context) => const TechHome()),
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
