import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/chat_Screen.dart';
import 'package:student_portal/Teacher/teachercourse.dart';
import 'package:student_portal/home.dart';
import 'tecnotification.dart';
import 'teacherhome.dart';
import 'teacheraccount.dart';

// ignore: non_constant_identifier_names
final String user = 'Student';
Widget PopupMenu() {
  return PopupMenuButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TechHome()),
                  );
                },
                child: const Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const techNotification()));
                },
                child: const Text(
                  'Notification',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            PopupMenuItem(
              value: 3,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TutorChatScreen(
                          // name: user,
                          ),
                    ),
                  );
                },
                child: const Text(
                  'Chat',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            PopupMenuItem(
              value: 4,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TeacherHome()),
                  );
                },
                child: const Text(
                  'Course Details',
                  style: TextStyle(color: Color.fromARGB(255, 32, 7, 7)),
                ),
              ),
            ),
            PopupMenuItem(
              value: 5,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TeacherAccount()),
                  );
                },
                child: const Text(
                  'Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            PopupMenuItem(
              value: 6,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'About App',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            PopupMenuItem(
              value: 7,
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  });
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ]);
}
