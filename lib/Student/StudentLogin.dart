import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'studentsignup.dart';
import 'studenthome.dart';
import '../colorscheme.dart';

import 'package:student_portal/home.dart';

class StudentSignin extends StatefulWidget {
  const StudentSignin({super.key});

  @override
  State<StudentSignin> createState() => _StudentSigninState();
}

class _StudentSigninState extends State<StudentSignin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Back!',
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => Home())));
          },
        ),
      ),
      body: SizedBox(
        child: Form(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  labelText: "Email",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.green,
                  width: 1,
                ),
              ),
              child: TextFormField(
                controller: _password,
                obscureText: passToggle,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  labelText: "Password",
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.secondarycolor),
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentHome(),
                      ),
                    );
                  });
                },
                child: const Text(
                  'Sign IN',
                  style: TextStyle(color: ColorTheme.primarycolor),
                )),
            Row(
              children: [
                const Text('First Time!'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
