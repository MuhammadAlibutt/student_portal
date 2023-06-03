import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_portal/Teacher/teacher_schedule.dart';
import 'package:student_portal/colorscheme.dart';
import 'teachercourse.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TeacherDetail extends StatefulWidget {
  const TeacherDetail({super.key});

  @override
  State<TeacherDetail> createState() => _TeacherDetailState();
}

class _TeacherDetailState extends State<TeacherDetail> {
  File? selectedImage;

  final TextEditingController _course = TextEditingController();
  final TextEditingController _dec = TextEditingController();
  final TextEditingController _price = TextEditingController();
  String cousre = '';
  String description = '';
  String price = '';
  final courseName = FlutterSecureStorage();
  final courseTitle = FlutterSecureStorage();
  final courseDescription = FlutterSecureStorage();
  final courseImage = FlutterSecureStorage();
  String _selectCourse = '';
  Future<void> chooseimage() async {
    var image;
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void storedata() async {
    String course = _course.text;
    String dec = _dec.text;
    await courseTitle.write(key: 'course_title', value: course);
    await courseDescription.write(key: 'course_dec', value: dec);
    //String? imageUrl = await uploadImage(selectedImage!);
    // if (imageUrl != null) {
    //   await FirebaseFirestore.instance.collection('Course').add({
    //     'course': course,
    //     'Description': dec,
    //     'price': price,
    //     'image': imageUrl,
    //   }).then((value) {
    //     _showSnackBar("Course Added Thank you :)");
    //     _course.clear();
    //     _dec.clear();
    //     _price.clear();
    //     setState(() {
    //       selectedImage = null;
    //     });
    //   });
    // } else {
    //   print('false');
    // }
  }

  // Future<String?> uploadImage(File image) async {
  //   TaskSnapshot taskSnapshot = await FirebaseStorage.instance
  //       .ref()
  //       .child('Course_logo')
  //       .child(image.path.split('/').last)
  //       .putFile(image);

  //   String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //    await courseImage.write(key: 'image', value: downloadUrl);
  //   return downloadUrl;
  // }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String? selectedCourse;

  @override
  void initState() {
    super.initState();
    fetchSelectedCourse();
  }

  void fetchSelectedCourse() async {
    selectedCourse = await courseName.read(key: 'course_name');
    setState(() {
      _selectCourse = selectedCourse.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter Your Course Details',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TechHome()));
          },
        ),
        elevation: 0,
        backgroundColor: ColorTheme.appcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  image: selectedImage == null
                      ? const DecorationImage(
                          image: AssetImage("assets/images/pic.jpg"),
                          fit: BoxFit.fill)
                      : DecorationImage(
                          image: FileImage(selectedImage!), fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorTheme.secondarycolor,
              ),
              onPressed: () {
                chooseimage();
              },
              child: const Text(
                'Select Profile',
                style: TextStyle(color: ColorTheme.primarycolor),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.072,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.school_outlined,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(_selectCourse)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: _course,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Enter Course Title",
                  prefixIcon: const Icon(
                    Icons.school_outlined,
                    color: Colors.black,
                  ),
                  fillColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: _dec,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Description...',
                  fillColor: Colors.black,
                ),
                maxLength: 250,
                maxLines: 5,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorTheme.secondarycolor,
              ),
              onPressed: () {
                if (selectedImage == null &&
                    _course.text.isEmpty &&
                    _dec.text.isEmpty) {
                  _showSnackBar('Please Complete the Form');
                } else {
                  storedata();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherSchedule(),
                    ),
                  );
                }
              },
              child: const Text(
                'Continue to the next',
                style: TextStyle(color: ColorTheme.primarycolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
