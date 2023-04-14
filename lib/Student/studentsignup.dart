import 'package:flutter/material.dart';
import 'StudentLogin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text('Welcome Students'),
      centerTitle: true,
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
            height: 5,
          ),
          const Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "First Name",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Last Name",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "UserName",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentSignin(),
                  ),
                );
              },
              child: const Text('Sign Up')),
        ]),
      ),
    );
  }
}
