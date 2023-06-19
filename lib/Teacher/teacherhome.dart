import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_portal/Teacher/teachercourse.dart';
import '../colorscheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final coureTitle = const FlutterSecureStorage();
  late String uid;

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    viewValue(uid);
  }

  Future<List<Map<String, dynamic>>> viewValue(String uid) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Course_added')
          .doc(uid)
          .collection('course')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> courseData = [];
        querySnapshot.docs.forEach((data) {
          String? TutorName = data['Tutor_Name'];
          String? courseName = data['course'];
          String? dec = data['Course_dec'];
          String? price = data['price'];
          String? classDay = data['Class_Day'];
          String? classTime = data['Class_time'];
          String? imageUrl = data['Image'];

          Map<String, dynamic> course = {
            'TutorName': TutorName ?? '',
            'courseName': courseName ?? '',
            'description': dec ?? '',
            'price': price ?? '',
            'timeTable': classDay ?? '' + (',') + classTime!,
            'Image': imageUrl ?? '',
          };

          courseData.add(course);
        });

        return courseData;
      } else {
        _showSnackBar('No data found in Firebase.');
        return [];
      }
    } catch (e) {
      _showSnackBar('Error fetching data from Firebase: $e');
      rethrow;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  myProject(pic, name, title, des, price, time) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: ColorTheme.appcolor,
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(pic),
                    radius: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // const Text(
                      //   'Course ',
                      //   style: TextStyle(
                      //     fontSize: 10,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )
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
                    color: Colors.white, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Price:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        const Text(
                          'Time',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
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
        title: const Text(
          "Course Detail",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TechHome()));
          },
        ),
        backgroundColor: ColorTheme.appcolor,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: viewValue(uid),
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
                    course['TutorName'],
                    course['courseName'],
                    course['description'],
                    course['price'],
                    course['timeTable'],
                  );
                }).toList()),
              ),
            );
          }
        },
      ),
    );
  }
}
