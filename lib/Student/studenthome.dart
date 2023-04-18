import 'package:flutter/material.dart';
import 'package:student_portal/colorscheme.dart';
import 'package:student_portal/home.dart';
import 'teacherlist.dart';
import 'enrolledCourse.dart';
import 'category.dart';
import 'notification.dart';
import 'account.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: PopupMenuButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentHome()),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const Notificationscreen()),
                        ),
                      );
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
                              builder: ((context) => const StudentAccount())));
                    },
                    child: const Text(
                      'Account',
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
                            builder: (context) => const EnrolledCourses()),
                      );
                    },
                    child: const Text(
                      'enrolled Course',
                      style: TextStyle(color: Color.fromARGB(255, 32, 7, 7)),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 5,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Chat',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 6,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text(
                      'logout',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ]),
    );
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image(
              image: AssetImage('assets/images/home.png'),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: ColorTheme.secondarycolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'Let Start your New Jounary',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorTheme.primarycolor,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 20),
                  const CategoryList(),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const TeacherList()),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Find Tutor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
