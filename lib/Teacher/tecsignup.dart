import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './teclogin.dart';
import '../colorscheme.dart';

class TeacherSignUp extends StatefulWidget {
  const TeacherSignUp({super.key});

  @override
  State<TeacherSignUp> createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
      title: const Text(
        'Welcome Teacher',
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
              context,
              MaterialPageRoute(
                builder: ((context) => const TecherSignin()),
              ));
        },
      ),
    );
    return Scaffold(
      appBar: appbar,
      body: SizedBox(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.left -
                MediaQuery.of(context).padding.top) *
            0.8,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
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
                      keyboardType: TextInputType.emailAddress,
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Mobile Number",
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _password,
                      autofocus: false,
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorTheme.secondarycolor),
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email.text, password: _password.text)
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TecherSignin()),
                          );
                        }).onError((error, stackTrace) {
                          _showSnackBar("Sign Up Faild");
                        });
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
