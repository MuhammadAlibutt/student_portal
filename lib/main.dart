import 'package:flutter/material.dart';
import 'home.dart';
import 'Student/studenthome.dart';

void main() {
  runApp(const Portal());
}

class Portal extends StatelessWidget {
  const Portal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              FlutterLogo(size: MediaQuery.of(context).size.height * 0.6),
              SizedBox(
                height: 0,
              ),
              Text(
                'Find a Tutor',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              )
            ],
          )),
    );
  }
}
