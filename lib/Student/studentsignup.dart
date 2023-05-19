import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/colorscheme.dart';
import 'StudentLogin.dart';

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

  bool _isLoading = false;

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
      body: SizedBox(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.left -
                MediaQuery.of(context).padding.top) *
            0.7,
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
            controller: _password,
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
            height: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.appcolor),
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentSignin(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    _showSnackBar('SignUp Failed');
                  });
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: ColorTheme.accentcolor, fontSize: 16),
                )),
          ),
        ]),
      ),
    );
  }
}
