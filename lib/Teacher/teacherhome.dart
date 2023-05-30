import 'package:flutter/material.dart';
import '../colorscheme.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  MyProject(pic, title, des, star) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Colors.black26,
        // color: const Color.fromARGB(255, 16, 66, 215),
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 50, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(pic),
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 20,
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
                      const SizedBox(
                        height: 5,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    star,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    'Price:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$100',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Course Detail",
          style: TextStyle(color: ColorTheme.primarycolor),
        ),
        backgroundColor: Colors.black26,
        //leading: PopupMenu(),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyProject(
                'assets/images/pic.jpg',
                'Muhammad Ali',
                'Course Selected',
                'A mobile developer is a skilled professional \nwho designs, develops, tests, and deploys\nmobile applications for platforms such as iOS,\nAndroid, and cross-platform frameworks.',
              ),
              MyProject(
                'assets/images/pic.jpg',
                'Asher Ali',
                'Course Selected',
                'A mobile developer is a skilled professional \nwho designs, develops, tests, and deploys\nmobile applications for platforms such as iOS,\nAndroid, and cross-platform frameworks.',
              ),
              MyProject(
                'assets/images/pic.jpg',
                'Usman Sajid',
                'Course Selected',
                'A mobile developer is a skilled professional \nwho designs, develops, tests, and deploys\nmobile applications for platforms such as iOS,\nAndroid, and cross-platform frameworks',
              ),
              MyProject(
                'assets/images/pic.jpg',
                'Sheraz Hassan',
                'Course Selected',
                'A mobile developer is a skilled professional \nwho designs, develops, tests, and deploys\nmobile applications for platforms such as iOS,\nAndroid, and cross-platform frameworks',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
