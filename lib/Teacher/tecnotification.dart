import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../colorscheme.dart';
import 'teachercourse.dart';

class techNotification extends StatefulWidget {
  const techNotification({super.key});

  @override
  State<techNotification> createState() => _techNotificationState();
}

class _techNotificationState extends State<techNotification> {
  late String uid;
  final tutorName = const FlutterSecureStorage();
  final student = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    viewValue();
  }

  Future<List<Map<String, dynamic>>> viewValue() async {
    var Tutor_Name = await tutorName.read(key: 'Tutor_Name');
    print(Tutor_Name);

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Course_Enrolled_By_Student')
          .doc(Tutor_Name)
          .collection('Enrolled_Courses')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> courseData = [];
        querySnapshot.docs.forEach((data) {
          String? StudentName = data['Student_Name'];
          String? courseName = data['Course_Name'];
          Map<String, dynamic> course = {
            'StudentName': StudentName ?? '',
            'courseName': courseName ?? '',
          };

          courseData.add(course);
          student.write(key: 'StudentName', value: StudentName);
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

  myProject(name, title) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Card(
        color: ColorTheme.appcolor,
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 30, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '"$name" enrolled your Course "$title"',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
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
        future: viewValue(),
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
                      // course['Image'],
                      course['StudentName'],
                      course['courseName']
                      // course['price'],
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
