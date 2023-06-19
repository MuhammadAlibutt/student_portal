import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_portal/Teacher/Chat_module/ChatPage.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late String uid = '';
  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    // print('teacher name 2: $tutornamefromsecurestorage');
    fecthingTData();
  }

  final tutorName = const FlutterSecureStorage();

  Future<List<Map<String, dynamic>>> fecthingTData() async {
    var Tutor_Name = await tutorName.read(key: 'Tutor_Name');

    // String? tutornamefromsecurestorage =
    //     await Tutor_Name.read(key: 'tutor_name');
    List<Map<String, dynamic>> fetchStudentname = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Course_Enrolled_By_Student')
        .doc(Tutor_Name)
        .collection('Enrolled_Courses')
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((data) {
        String? studentName = data['Student_Name'];
        String? image = data['Course_Image'];

        Map<String, dynamic> course = {
          'StudentName': studentName ?? '',
          'Studentimage': image ?? '',
        };

        fetchStudentname.add(course);
      });
    }
    return fetchStudentname;
  }

  // final studentName = const FlutterSecureStorage();
  // final TutorName = const FlutterSecureStorage();

  design(name, pic) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () async {
          // ignore: non_constant_identifier_names
          // String? StdName = await StudentName.read(key: 'Student_Name');
          // print('teacher name $StdName');
          // String? name = await studentName.read(key: 'StudentName');
          // print('$studentName');

          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => chatpage(email: name),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: pic != null ? NetworkImage(pic) : null,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Text your Student',
            style: TextStyle(fontStyle: FontStyle.italic)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fecthingTData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text(
              'error found',
              style: TextStyle(fontSize: 20),
            );
          } else {
            print('yes');
            List<Map<String, dynamic>> fetchStudentname = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Center(
                child: Column(
                    children: fetchStudentname.map<Widget>((course) {
                  return design(
                    course['StudentName'],
                    course['Studentimage'],
                  );
                }).toList()),
              ),
            );
          }
        },
      ),
    );
  }
}
