import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_portal/colorscheme.dart';
import 'teachercourse.dart';

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

  void firebasecourse() async {
    String course = _course.text;
    String dec = _dec.text;
    String price = _price.text;
    FirebaseFirestore.instance.collection('Course').add({
      'course': course,
      'Description': dec,
      'price': price,
    }).then((value) {
      _showSnackBar("Course Added Thank you :)");
      _course.clear();
      _dec.clear();
      _price.clear();
    });
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
        title: null,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorTheme.primarycolor,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TechHome()));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
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
              height: 20,
            ),
            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: Colors.black,
              // ),
              onPressed: () {
                chooseimage();
              },
              child: const Text('Select Profile'),
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
                  labelText: "Enter Your Course",
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                controller: _price,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Price",
                  prefixIcon: const Icon(
                    Icons.payment,
                    color: Colors.black,
                  ),
                  fillColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                firebasecourse();
              },
              child: const Text(
                'Save Profile',
                // style: TextStyle(
                //   fontSize: 18,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
