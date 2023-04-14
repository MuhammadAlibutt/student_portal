import 'package:flutter/material.dart';
import '../colorscheme.dart';
import 'coursedetail.dart';

class EnrolledCourses extends StatefulWidget {
  const EnrolledCourses({super.key});

  @override
  State<EnrolledCourses> createState() => _EnrolledCoursesState();
}

class _EnrolledCoursesState extends State<EnrolledCourses> {
  myProject(pic, title, des, star) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        color: ColorTheme.secondarycolor,
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 50, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(pic),
                  radius: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      des,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  star,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const TimeTabel())),
                    );
                  },
                  icon: const Icon(
                    Icons.forward,
                    color: ColorTheme.accentcolor,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text(
        'Enrolled Courses',
        style: TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    return Scaffold(
      backgroundColor: ColorTheme.primarycolor,
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myProject(
                'assets/images/pic.jpg',
                'Muhammad Ali',
                'Android Application Tutor',
                'Time Table',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
