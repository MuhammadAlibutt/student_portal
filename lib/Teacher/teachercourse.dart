import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/colorscheme.dart';
import 'teacherdetail.dart';
import 'popmenu.dart';
import 'package:firebase_core/firebase_core.dart';

class TechHome extends StatefulWidget {
  const TechHome({Key? key}) : super(key: key);

  @override
  State<TechHome> createState() => _TechHomeState();
}

class _TechHomeState extends State<TechHome> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.secondarycolor,
        title: const Text(
          'Welcome',
          style: TextStyle(color: ColorTheme.primarycolor),
        ),
        centerTitle: true,
        leading: PopupMenu(),
      ),
      body: Container(
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
                    items: course,
                    onChanged: (String? value) {
                      //print(course);
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
                        backgroundColor: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherDetail(),
                          ),
                        );
                      },
                      child: const Text(
                        'Get Started!',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
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
