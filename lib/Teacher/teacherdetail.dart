import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_portal/Teacher/teacher_schedule.dart';
import 'package:student_portal/colorscheme.dart';
import 'teachercourse.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class TeacherDetail extends StatefulWidget {
  final String? courseName;

  TeacherDetail({Key? key, this.courseName});

  @override
  State<TeacherDetail> createState() => _TeacherDetailState();
}

class _TeacherDetailState extends State<TeacherDetail> {
  final firebase_storage.Reference storageRef =
      firebase_storage.FirebaseStorage.instance.ref();

  File? selectedImage;
  String? description;

  Future<void> chooseImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> uploadData() async {
    if (selectedImage != null && description != null) {
      // Upload the image to Firebase Storage
      final fileName = path.basename(selectedImage!.path);
      final destination = 'images/$fileName';
      final uploadTask = storageRef.child(destination).putFile(selectedImage!);
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();

      // Store the image URL and description in Firestore
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final teacherDetailsDocRef = FirebaseFirestore.instance
            .collection('TeachersDetails')
            .doc(currentUser.uid);

        teacherDetailsDocRef.set({
          'course': widget.courseName,
          'imageURL': imageUrl,
          'description': description,
        }).then((_) {
          _showSnackBar('Data saved to Firestore successfully');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeacherSchedule(),
            ),
          );
        }).catchError((error) {
          _showSnackBar('Error saving data to Firestore: $error');
        });
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // duration: const Duration(seconds: 2),
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TechHome()));
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
              child: CircleAvatar(
                radius: 80,
                child: ClipOval(
                    child: selectedImage != null
                        ? Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_5M5cCY-BchEKiQE11PBdNjsbkUaX8Rw3Jg&usqp=CAU')),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                chooseImage();
              },
              child: const Text('Select Profile'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                initialValue: widget.courseName,
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
                initialValue: description,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
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
              height: 20,
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    uploadData();
                    // final currentUser = FirebaseAuth.instance.currentUser;
                    // if (currentUser != null) {
                    //   // Create a new document reference in the 'TeachersDetails' collection
                    //   final teacherDetailsDocRef = FirebaseFirestore.instance
                    //       .collection('TeachersDetails')
                    //       .doc(currentUser.uid);
                    //   //Set the data for the teacher details document
                    //   teacherDetailsDocRef.set({
                    //     'course': widget.courseName,
                    //     'imageURL': imageUrl,
                    //     'description': description,
                    //   }).then((_) {
                    //     _showSnackBar('Data saved to Firestore successflly');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherSchedule(),
                      ),
                    );
                    //   }).catchError((error) {
                    //     _showSnackBar('Error saving data to FireStore: $error');
                    //   });
                    //   print('$imageUrl');
                    // }
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
      ),
    );
  }
}
