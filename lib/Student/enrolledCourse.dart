import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../chat module/chatscreen.dart';
import '../colorscheme.dart';
import 'coursedetail.dart';
import 'studenthome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EnrolledCourses extends StatefulWidget {
  const EnrolledCourses({super.key});

  @override
  State<EnrolledCourses> createState() => _EnrolledCoursesState();
}

class _EnrolledCoursesState extends State<EnrolledCourses> {
  late String uid = '';
  // final Tutor_Name = const FlutterSecureStorage();
  // String tutornamefromsecurestorage = '';
  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    // print('teacher name 2: $tutornamefromsecurestorage');
    fecthingData(uid);
  }

  Future<List<Map<String, dynamic>>> fecthingData(String uid) async {
    // String? tutornamefromsecurestorage =
    //     await Tutor_Name.read(key: 'tutor_name');
    List<Map<String, dynamic>> fetchedcourses = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Student_Enrolled_Courses')
        .doc(uid)
        .collection('Enrolled_Courses')
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((data) {
        String TutorName = data['Tutor_Name'];
        String courseName = data['Course_Name'];
        String price = data['Course_Price'];
        String image = data['Course_Image'];

        Map<String, dynamic> course = {
          'TutorName': TutorName,
          'courseName': courseName,
          'image': image,
          'price': price,
        };

        fetchedcourses.add(course);
      });
    }
    return fetchedcourses;
  }

  myProject(pic, name, title, price) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: ColorTheme.appcolor,
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 50, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(pic),
                  radius: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: $price ',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => chatpage(
                          email: name,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.chat,
                    color: ColorTheme.accentcolor,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text(
        'Enrolled Courses',
        style: TextStyle(
            fontStyle: FontStyle.italic, color: ColorTheme.accentcolor),
      ),
      centerTitle: true,
      backgroundColor: ColorTheme.appcolor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: ColorTheme.accentcolor,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const StudentHome()),
              ));
        },
      ),
    );
    return Scaffold(
      backgroundColor: ColorTheme.accentcolor,
      appBar: appbar,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fecthingData(uid),
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
            List<Map<String, dynamic>> fetchedcourses = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Center(
                child: Column(
                    children: fetchedcourses.map<Widget>((course) {
                  return myProject(
                    course['image'],
                    course['TutorName'],
                    course['courseName'],
                    course['price'],
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
