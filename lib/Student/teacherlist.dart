import 'package:flutter/material.dart';
import 'teachercart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({super.key});

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  Future<List<Map<String, dynamic>>> viewCourse() async {
    List<Map<String, dynamic>> courseList = [];
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('all_courses').get();
      // print(querySnapshot.toString());
      if (querySnapshot.docs.isNotEmpty) {
        print("course detail access");
        for (var courses in querySnapshot.docs) {
          print('step 2');
          print('course accessed');
          querySnapshot.docs.forEach((data) {
            String courseName = data['course'];
            String dec = data['Course_dec'];
            String price = data['price'];
            // String classDay = data['Class_Day'];
            // String classTime = data['Class_time'];
            Map<String, dynamic> course = {
              'courseName': courseName,
              'description': dec,
              'price': price,
              // 'timeTable': classDay + (',') + classTime,
            };
            courseList.add(course);
          });
        }
        print('courseList: $courseList');
        return courseList;
      } else {
        print('failed in loading data');
      }
      print('try is working');
      return [];
    } catch (e) {
      print('error $e');
      rethrow;
    }
  }

  myProject(pic, Name, title, des, price) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: Colors.blue,
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      Name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              des,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Cart()),
                        ),
                      );
                    },
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find me a Tutor'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: viewCourse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('error found');
          } else {
            List<Map<String, dynamic>> courseData = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: courseData.map<Widget>((course) {
                    return myProject(
                      'assets/images/pic.jpg',
                      "Muhammad Ali",
                      course['courseName'],
                      course['description'],
                      course['price'],
                      // course['timeTable'],
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
