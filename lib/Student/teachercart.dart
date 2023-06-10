import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_portal/Student/studenthome.dart';
import '../colorscheme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Cart extends StatefulWidget {
  final String courseName;
  final String tutorName;
  final String price;
  final String imageUrl;

  const Cart(
      {super.key,
      required this.courseName,
      required this.tutorName,
      required this.price,
      required this.imageUrl});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final student_Name = const FlutterSecureStorage();
  final tutorName = const FlutterSecureStorage();
  Future<void> saveDataInFireStore() async {
    String courseTitle = widget.courseName;
    String courseTutorName = widget.tutorName;
    String coursePrice = widget.price;
    String courseImage = widget.imageUrl;

    tutorName.write(key: 'Tutor_Name', value: courseTutorName);

    print('teacher name1 : $courseTutorName');

    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Student_Enrolled_Courses')
        .doc(uid)
        .collection('Enrolled_Courses')
        .add({
      "Tutor_Name": courseTutorName,
      "Course_Name": courseTitle,
      "Course_Price": coursePrice,
      "Course_Image": courseImage,
    });
    _showSnackBar('Transaction Successful');
  }

  Future<void> newCollectionOfEnrolledCourses() async {
    String courseTitle = widget.courseName;
    String courseTutorName = widget.tutorName;
    String coursePrice = widget.price;
    String courseImage = widget.imageUrl;

    tutorName.write(key: 'Tutor_Name', value: courseTutorName);
    String? studentName = await student_Name.read(key: 'studentName');
    print('teacher name1 : $courseTutorName');

    // String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Course_Enrolled_By_Student')
        .doc(courseTutorName)
        .collection('Enrolled_Courses')
        .add({
      "Student_Name": studentName,
      "Course_Name": courseTitle,
      "Course_Price": coursePrice,
      "Course_Image": courseImage,
    });
    _showSnackBar('Transaction Successful');
  }

  cartData() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Tutor Name:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.tutorName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Course Name:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.courseName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  'Amount to Pay:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  widget.price,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.card_membership,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Enter Card",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                newCollectionOfEnrolledCourses();
                saveDataInFireStore();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentHome()));
                const SnackBar(
                  content: Text('Course Enrolled Successful'),
                  duration: Duration(seconds: 4),
                );
              },
              child: const Text(
                "Pay Now",
                style: TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
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
      backgroundColor: ColorTheme.accentcolor,
      appBar: AppBar(
        backgroundColor: ColorTheme.appcolor,
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'One Step Away!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(widget.imageUrl),
            radius: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          cartData(),
        ],
      ),
    );
  }
}
