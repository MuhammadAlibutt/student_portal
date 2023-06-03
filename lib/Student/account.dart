import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'studenthome.dart';
import 'package:flutter/material.dart';
import '../colorscheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentAccount extends StatefulWidget {
  const StudentAccount({Key? key}) : super(key: key);

  @override
  State<StudentAccount> createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  File? _imageFile;
  String _image = '';
  String _email = '';
  String _username = '';
  String _password = '';
  String uid = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //for image picking
  Future _selectImage() async {
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        _imageFile = File(PickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = _email;
    _usernameController.text = _username;
    _passwordController.text = _password;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    viewValue(uid);
  }

  // void _dialog() {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: const Text('confirm!'),
  //       content: const Text("are you Sure!"),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             updateValue();
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('Update'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> viewValue(String uid) async {
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('student_collection')
        .doc(uid)
        .get();
    if (documentSnapshot.exists) {
      final Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      final String email = data['email'];
      final String username = data['user_name'];
      final String password = data['password'];
      final String image = data['image'];
      setState(() {
        _email = email;
        _username = username;
        _password = password;
        _image = image;
      });
    }
  }

  Future<void> updateValue() async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final userDocRef =
        FirebaseFirestore.instance.collection('student_collection').doc(uid);

    final String email = _email;
    final String username = _username;
    final String password = _password;

    await userDocRef
        .update({'email': email, 'user_name': username, 'password': password});

    setState(() {
      _email = email;
      _username = username;
      _password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account Settings",
          style: TextStyle(color: ColorTheme.primarycolor),
        ),
        centerTitle: true,
        backgroundColor: ColorTheme.secondarycolor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorTheme.primarycolor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const StudentHome()),
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.09,
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorTheme.secondarycolor),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(children: [
                  GestureDetector(
                    onTap: () {
                      _selectImage();
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          _image.isNotEmpty ? NetworkImage(_image) : null,
                      radius: 60,
                      child: _image.isEmpty
                          ? CircleAvatar(
                              radius: 80,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/pic.jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ))
                          : null,
                    ),
                  ),
                  const Positioned(
                      right: 8,
                      bottom: 3,
                      child: Icon(
                        Icons.camera_enhance,
                        color: ColorTheme.accentcolor,
                      ))
                ]),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Email: \t',
                        style: TextStyle(
                            color: ColorTheme.primarycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: _email,
                          ),
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
                        'Username: \t',
                        style: TextStyle(
                            color: ColorTheme.primarycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: _username,
                          ),
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
                        'Password: \t',
                        style: TextStyle(
                            color: ColorTheme.primarycolor,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: _password,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.secondarycolor),
                    onPressed: () {
                      // setState(() {
                      //   _email = _emailController.text;
                      //   _username = _usernameController.text;
                      //   _password = _passwordController.text;
                      // });
                      updateValue();
                      _showSnackBar('credntial have been updated');
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: ColorTheme.primarycolor),
                    )),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
