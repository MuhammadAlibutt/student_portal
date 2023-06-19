import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_portal/chat%20module/chatscreen.dart';

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
    fecthingTData(uid);
  }

  Future<List<Map<String, dynamic>>> fecthingTData(String uid) async {
    // String? tutornamefromsecurestorage =
    //     await Tutor_Name.read(key: 'tutor_name');
    List<Map<String, dynamic>> fetchTutorname = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Student_Enrolled_Courses')
        .doc(uid)
        .collection('Enrolled_Courses')
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((data) {
        String TutorName = data['Tutor_Name'];
        String image = data['Course_Image'];

        Map<String, dynamic> course = {
          'TutorName': TutorName,
          'Tutorimage': image,
        };

        fetchTutorname.add(course);
      });
    }
    return fetchTutorname;
  }

  final studentName = const FlutterSecureStorage();
  final TutorName = const FlutterSecureStorage();

  design(name, pic) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: () async {
          // ignore: non_constant_identifier_names
          // var TutName = await TutorName.read(key: 'TutorName');
          // String? sname = await studentName.read(key: 'studentName');
          // print('teacher name $TutName');
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => chatpage(
                email: name,
              ),
            ),
          );
          ;
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
        title: const Text('Text your Tutor',
            style: TextStyle(fontStyle: FontStyle.italic)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fecthingTData(uid),
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
            List<Map<String, dynamic>> fetchTutorname = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Center(
                child: Column(
                    children: fetchTutorname.map<Widget>((course) {
                  return design(
                    course['TutorName'],
                    course['Tutorimage'],
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
