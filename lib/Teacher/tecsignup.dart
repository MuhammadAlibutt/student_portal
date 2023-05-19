import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './teclogin.dart';
import '../colorscheme.dart';
import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TeacherSignUp extends StatefulWidget {
  const TeacherSignUp({super.key});

  @override
  State<TeacherSignUp> createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _saveUserData() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phoneNumber = _phoneController.text;

    CollectionReference teachersCollection =
        FirebaseFirestore.instance.collection('TeachersData');
    DocumentReference newTeacherDoc = teachersCollection.doc();

    newTeacherDoc.set({
      "name": name,
      "email": email,
      "password": password,
      "phonenumber": phoneNumber
    }).then((_) {
      print("User data saved to Firestore");
    }).catchError((error) {
      print("Error saving user data: $error");
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
    final appbar = AppBar(
      title: const Text(
        'Welcome Teacher',
        style: TextStyle(color: ColorTheme.accentcolor),
      ),
      centerTitle: true,
      backgroundColor: ColorTheme.appcolor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: ColorTheme.accentcolor,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const TecherSignin()),
              ));
        },
      ),
    );
    return Scaffold(
      appBar: appbar,
      body: SizedBox(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.left -
                MediaQuery.of(context).padding.top) *
            0.8,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Enter Name",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Email",
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Mobile Number",
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () async {
                          // final result = await FilePicker.platform.pickFiles();
                          // if (result == null) return;

                          // final filePath = result.files.single.path;
                          // final file = File(filePath!);

                          // try {
                          //   // Upload the file to Firebase Cloud Storage
                          //   final storageRef = FirebaseStorage.instance
                          //       .ref()
                          //       .child('files')
                          //       .child(result.files.single.name);
                          //   final uploadTask = storageRef.putFile(file);
                          //   final storageSnapshot = await uploadTask;
                          //   final downloadURL =
                          //       await storageSnapshot.ref.getDownloadURL();

                          // Get the currently logged-in user
                          final currentUser = FirebaseAuth.instance.currentUser;
                          if (currentUser == null) {
                            print('No user logged in');
                            return;
                          }

                          // Create a new document reference in the 'TeachersData' collection
                          final teacherDocRef = FirebaseFirestore.instance
                              .collection('TeachersData')
                              .doc(currentUser.uid);

                          // Set the data for the teacher document
                          await teacherDocRef.set({
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'password': _passwordController.text,
                            'phonenumber': _phoneController.text,
                            // 'fileURL': downloadURL,
                          });

                          //   print(
                          //       'File uploaded to Firebase Cloud Storage and URL saved to Firestore successfully');
                          // } catch (error) {
                          //   print('Error uploading file or saving URL: $error');
                          // }
                        },
                        child: const Text(
                          'Select a file',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorTheme.appcolor),
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) {
                          _saveUserData();
                          // FirebaseFirestore.instance
                          //     .collection('TeachersData')
                          //     .doc(value.user!.uid)
                          //     .set(
                          //   {
                          //     "email": value.user!.email,
                          //     "password": value.user!.password,
                          //     "name": value.user!.displayName,
                          //     "phoneNumber": value.user!.phoneNumber
                          //   },
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TecherSignin()),
                          );
                        }).onError((error, stackTrace) {
                          _showSnackBar("Sign Up Faild");
                        });
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
