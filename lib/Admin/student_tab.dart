import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_portal/colorscheme.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  // late String uid = '';
  // // final Tutor_Name = const FlutterSecureStorage();
  // // String tutornamefromsecurestorage = '';
  // @override
  // void initState() {
  //   super.initState();
  //   uid = FirebaseAuth.instance.currentUser!.uid;
  //   // print('teacher name 2: $tutornamefromsecurestorage');
  //   viewStudent(uid);
  // }

  final student = const FlutterSecureStorage();

  Future<List<Map<String, dynamic>>> viewStudent() async {
    // ignore: non_constant_identifier_names
    List<Map<String, dynamic>> StudentList = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('student_collection')
          .get();
      // print(querySnapshot.toString());
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((data) {
          String studentName = data['name'];
          // String imageUrl = data['image'];
          Map<String, dynamic> student = {
            'StudentName': studentName,
            // 'image': imageUrl,
          };
          StudentList.add(student);
        });
      }
      return StudentList;
    } catch (e) {
      rethrow;
    }
  }

  design(name) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        // width: MediaQuery.of(context).size.width*,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // CircleAvatar(
              //   radius: 35,
              //   backgroundImage: pic != null ? NetworkImage(pic) : null,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        try {
                          FirebaseFirestore.instance
                              .collection('student_collection')
                              .doc()
                              .delete();
                        } catch (e) {
                          print('Error deleting student: $e');
                        }
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: ColorTheme.accentcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: viewStudent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('error found');
          } else {
            List<Map<String, dynamic>> studentData = snapshot.data ?? [];
            if (studentData != null && studentData.isNotEmpty) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: studentData.map<Widget>((student) {
                      return design(
                        student['StudentName'],
                        // student['image'],
                      );
                    }).toList(),
                  ),
                ),
              );
            } else {
              return const Text('No students found');
            }
          }
        },
      ),
    );
  }
}
