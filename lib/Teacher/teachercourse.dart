import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/colorscheme.dart';
import 'teacherdetail.dart';
import 'popmenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TechHome extends StatefulWidget {
  const TechHome({Key? key}) : super(key: key);

  @override
  State<TechHome> createState() => _TechHomeState();
}

class _TechHomeState extends State<TechHome> {
  String? selectedCourse;
  List<DropdownMenuItem<String>> get course {
    return [
      const DropdownMenuItem(
        value: '1',
        child: Text('Math'),
      ),
      const DropdownMenuItem(
        value: '2',
        child: Text('English'),
      ),
      const DropdownMenuItem(
        value: '3',
        child: Text('Computer Science'),
      ),
      const DropdownMenuItem(
        value: '4',
        child: Text('Email Marketing'),
      ),
      const DropdownMenuItem(
        value: '5',
        child: Text('Art/Designing'),
      ),
      const DropdownMenuItem(
        value: '6',
        child: Text('Web Development'),
      ),
      const DropdownMenuItem(
        value: '7',
        child: Text('Business Administration'),
      ),
    ];
  }

  void _saveCourseData(String? course) {
    final courseNames = {
      '1': 'Math',
      '2': 'English',
      '3': 'Computer Science',
      '4': 'Email Marketing',
      '5': 'Art/Designing',
      '6': 'Web Development',
      '7': 'Business Administration',
    };
    // Get the currently logged-in user
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print('No user logged in');
      return;
    }

    // Create a new document reference in the 'TeachersDetails' collection
    final teacherDetailsDocRef = FirebaseFirestore.instance
        .collection('TeachersDetails')
        .doc(currentUser.uid);

    // Set the data for the teacher details document
    teacherDetailsDocRef.set({'course': courseNames[course]}).then((_) {
      print('Selected course saved to Firestore successfully');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeacherDetail(
            courseName: courseNames[course],
          ),
        ),
      );
      // setState(() {
      //   selectedCourse = course;
      // });
    }).catchError((error) {
      print('Error saving selected course: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.appcolor,
        title: const Text(
          'Welcome',
          style: TextStyle(color: ColorTheme.accentcolor),
        ),
        centerTitle: true,
        leading: PopupMenu(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: SafeArea(
              child: Column(
                children: [
                  const Text(
                    'Choose your Course!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DropdownButtonFormField(
                    value: selectedCourse,
                    items: course,
                    onChanged: (String? value) {
                      if (value != null) {
                        _saveCourseData(value);
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.school_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'Select your Course',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: selectedCourse != null
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TeacherDetail(courseName: selectedCourse),
                                ),
                              );
                            }
                          : null,
                      child: const Text(
                        'Get Started!',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
