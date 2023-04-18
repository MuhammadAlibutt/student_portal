import 'package:flutter/material.dart';
import 'studentsignup.dart';
import 'studenthome.dart';
import '../colorscheme.dart';

class StudentSignin extends StatefulWidget {
  const StudentSignin({super.key});

  @override
  State<StudentSignin> createState() => _StudentSigninState();
}

class _StudentSigninState extends State<StudentSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back!'),
        centerTitle: true,
        backgroundColor: ColorTheme.secondarycolor,
      ),
      body: SizedBox(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.left -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const Text(
            'Sign In',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
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
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                labelText: "Password",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentHome(),
                  ),
                );
              },
              child: const Text('Sign IN')),
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
    );
  }
}
