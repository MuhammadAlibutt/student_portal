import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/teacher_schedule.dart';
import 'package:student_portal/Teacher/teacherhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TeacherPrice extends StatefulWidget {
  final String time;
  final String sift;
  final String day;
  TeacherPrice({required this.time, required this.sift, required this.day});

  @override
  State<TeacherPrice> createState() => _TeacherPriceState();
}

class _TeacherPriceState extends State<TeacherPrice> {
  final TextEditingController _controller = TextEditingController();
  final courseName = const FlutterSecureStorage();
  final courseDescription = const FlutterSecureStorage();
  final courses = const FlutterSecureStorage();
  final tutorName = const FlutterSecureStorage();
  final imageUrl = const FlutterSecureStorage();

  Future<void> fireBaseData() async {
    try {
      //title name course
      var course = await courseName.read(key: 'course_title');
      //description of course
      var description = await courseDescription.read(key: 'course_dec');
      //course name
      // var course_Name = await courses.read(key: 'course_name');
      //image
      var image = await imageUrl.read(key: 'image');

      var Tutor_Name = await tutorName.read(key: 'tutor_name');
      String time = widget.time.toString();
      String day = widget.day.toString();
      String sift = widget.sift.toString();
      String price = _controller.text;
      if (course != null && description != null && price.isNotEmpty) {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('Course_added')
            .doc(uid)
            .collection('course')
            .add({
          'Tutor_Name': Tutor_Name,
          'course': course,
          'Course_dec': description,
          'price': price,
          'Class_Day': day,
          'Class_time': time,
          'Class_Sift': sift,
          'Image': image,
        });

        _showSnackBar("Course Added. Thank you!");
      } else {
        _showSnackBar("Invalid input. Please check your budget.");
      }
    } catch (e) {
      _showSnackBar(
          "An error occurred while adding the course. Please try again.");
    }
  }

  Future<void> storeAllCourse() async {
    try {
      //title name course
      var course = await courseName.read(key: 'course_title');
      //description of course
      var description = await courseDescription.read(key: 'course_dec');
      //course name
      var course_Name = await courses.read(key: 'course_name');
      var Tutor_Name = await tutorName.read(key: 'tutor_name');
      var image = await imageUrl.read(key: 'image');
      String time = widget.time.toString();
      String day = widget.day.toString();
      String sift = widget.sift.toString();
      String price = _controller.text;
      if (course != null && description != null && price.isNotEmpty) {
        // String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection('all_courses').add({
          'Tutor_Name': Tutor_Name,
          'course': course,
          'Course_dec': description,
          'price': price,
          'Class_Day': day,
          'Class_time': time,
          'Class_Sift': sift,
          'Image': image,
        });

        _showSnackBar("Course Added. Thank you!");
      } else {
        _showSnackBar("Invalid input. Please check your budget.");
      }
    } catch (e) {
      _showSnackBar(
          "An error occurred while adding the course. Please try again.");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherSchedule(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'What is your budget?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                prefixText: 'Rs',
                labelText: "Budget",
                prefixIcon: const Icon(
                  Icons.price_change,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  storeAllCourse();
                  fireBaseData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherHome(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
