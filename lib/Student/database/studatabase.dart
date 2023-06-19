import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DatabaseService {
  String uid;
  DatabaseService({required this.uid});
  final CollectionReference studentcollection =
      FirebaseFirestore.instance.collection('student_collection');

  Future createValue(String name, String email, String username,
      String password, String image) async {
    return await studentcollection.doc(uid).set({
      'name': name,
      'email': email,
      'user_name': username,
      'password': password,
      "image": image,
    });
  }
}


// final studentname = const FlutterSecureStorage();

//     String? studentName = studentname.read(key: 'studentName');

// final CollectionReference stdcollection =
//     FirebaseFirestore.instance.collection('all_student');

// Future createnew(String name, String email, String username, String password,
//     String image) async {
//   return await stdcollection.doc().set({
//     'name': name,
//     'email': email,
//     'user_name': username,
//     'password': password,
//     'image': image,
//   });
// }
