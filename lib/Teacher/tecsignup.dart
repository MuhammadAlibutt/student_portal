import 'package:flutter/material.dart';
import './teclogin.dart';

class TeacherSignUp extends StatefulWidget {
  const TeacherSignUp({super.key});

  @override
  State<TeacherSignUp> createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text('Welcome Teacher'),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appbar,
      body: Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.left -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "First Name",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Last Name",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "UserName",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Mobile Number",
            ),
          ),
          SizedBox(
            height: 9,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TecherSignin()),
                );
              },
              child: Text('Sign Up')),
          Row(
            children: [
              Text('already have account!'),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ))
            ],
          ),
        ]),
      ),
      // bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //   height: MediaQuery.of(context).size.height * 0.1,
      //   color: Colors.blue,
      //   child:
      // )),
    );
  }
}
