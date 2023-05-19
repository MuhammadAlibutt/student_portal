import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../colorscheme.dart';
import 'package:image_picker/image_picker.dart';
import 'teachercourse.dart';

class TeacherAccount extends StatefulWidget {
  const TeacherAccount({Key? key}) : super(key: key);

  @override
  State<TeacherAccount> createState() => _TeacherAccountState();
}

class _TeacherAccountState extends State<TeacherAccount> {
  File? _imageFile;
  String _email = 'ali@gmail.com';
  String _username = 'alibutt5344';
  String _password = 'ali123';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
  }

  void _dialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('confirm!'),
        content: const Text("are you Sure!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Update'),
          ),
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
      appBar: AppBar(
        title: const Text(
          "Account Settings",
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
                  builder: ((context) => const TechHome()),
                ));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.09,
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorTheme.secondarycolor,
            ),
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
                        _imageFile != null ? FileImage(_imageFile!) : null,
                    radius: 60,
                    child: _imageFile == null
                        ? CircleAvatar(
                            radius: 80,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/pic.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ))
                        : null,
                  ),
                ),
                Positioned(
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
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _email = _emailController.text;
                          _dialog();
                        });
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.red),
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
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _email = _emailController.text;
                          _dialog();
                        });
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.red),
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
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _email = _emailController.text;
                          _dialog();
                        });
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.red),
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
                      backgroundColor: ColorTheme.appcolor),
                  onPressed: () {
                    setState(() {
                      _selectImage();
                      _email = _emailController.text;
                      _username = _usernameController.text;
                      _password = _passwordController.text;
                    });
                    _showSnackBar('credntial have been updated');
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
