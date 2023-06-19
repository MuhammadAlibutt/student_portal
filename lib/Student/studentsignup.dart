import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_portal/colorscheme.dart';
import 'StudentLogin.dart';
import 'package:image_picker/image_picker.dart';
import 'database/studatabase.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final studentName = const FlutterSecureStorage();

  void handlesignUp() async {
    String name = _name.text;
    String email = _email.text;
    String password = _password.text;
    String userName = _username.text;
    studentName.write(key: 'studentName', value: userName);

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        userName.isEmpty ||
        _imgFile == null) {
      _showSnackBar('Please provide all details');
      return;
    }
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('profile_images/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = storageReference.putFile(_imgFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});

    String image = await taskSnapshot.ref.getDownloadURL();
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _email.text, password: _password.text)
        .then((userCredential) {
      String uid = userCredential.user!.uid;
      DatabaseService collection = DatabaseService(uid: uid);
      collection.createValue(name, email, userName, password, image);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StudentSignin(),
        ),
      );
    }).onError((error, stackTrace) {
      _showSnackBar('SignUp Failed');
    });
  }

  File? _imgFile;
  final imgpicker = ImagePicker();
  Future getImage() async {
    final pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imgFile = File(pickedFile.path);
      }
    });
  }

  bool _ispasswordvisible = false;

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
      title: const Text('Welcome Students'),
      centerTitle: true,
      backgroundColor: ColorTheme.appcolor,
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: getImage,
            child: CircleAvatar(
              radius: 50,
              // ignore: prefer_const_constructors
              backgroundImage: _imgFile == null
                  ? const AssetImage('assets/images/pic.jpg') as ImageProvider
                  : FileImage(_imgFile!),
              child: Stack(
                children: const [
                  Positioned(
                      bottom: 5,
                      right: 1,
                      child: Icon(
                        Icons.camera_alt_sharp,
                        color: Color.fromARGB(255, 182, 178, 178),
                        size: 30,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _name,
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
            controller: _email,
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
            controller: _username,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "User Name",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _password,
            obscureText: !_ispasswordvisible,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: "Password",
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black87,
                ),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      _ispasswordvisible = !_ispasswordvisible;
                    });
                  },
                  icon: Icon(_ispasswordvisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorTheme.appcolor),
            onPressed: () {
              handlesignUp();
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(color: ColorTheme.accentcolor),
            ),
          ),
        ]),
      ),
      //  ),
    );
  }
}
