import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_portal/colorscheme.dart';

class TeachersTab extends StatefulWidget {
  const TeachersTab({super.key});

  @override
  State<TeachersTab> createState() => _TeachersTabState();
}

class _TeachersTabState extends State<TeachersTab> {
  Future<List<Map<String, dynamic>>> viewCourse() async {
    List<Map<String, dynamic>> courseList = [];
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('all_courses').get();
      // print(querySnapshot.toString());
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((data) {
          String? tutorName = data['Tutor_Name'];
          String? courseName = data['course'];
          String? dec = data['Course_dec'];
          String? price = data['price'];
          String? classDay = data['Class_Day'];
          String? classTime = data['Class_time'];
          String? imageUrl = data['Image'];
          Map<String, dynamic> course = {
            'tutorName': tutorName ?? '',
            'courseName': courseName ?? '',
            'description': dec ?? '',
            'price': price ?? '',
            'timeTable': classDay ?? '' + (',') + classTime!,
            'Image': imageUrl ?? '',
          };
          courseList.add(course);
        });
      }
      return courseList;
    } catch (e) {
      rethrow;
    }
  }

  myProject(pic, Name, title, des, timeTable, price) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: Colors.blue,
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(pic),
                  radius: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
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
            Text(
              des,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Class Time: $timeTable",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs: $price',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                IconButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('all_courses')
                        .doc()
                        .delete();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: ColorTheme.accentcolor,
                  ),
                ),
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
                      course['Image'],
                      course['tutorName'],
                      course['courseName'],
                      course['description'],
                      course['timeTable'],
                      course['price'],
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
