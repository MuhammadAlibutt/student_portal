import 'package:flutter/material.dart';
import 'login/login.dart';

void main() {
  runApp(const Portal());
}

class Portal extends StatefulWidget {
  const Portal({super.key});

  @override
  State<Portal> createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
    );
  }
}
