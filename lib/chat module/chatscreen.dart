import 'package:flutter/material.dart';
import 'package:student_portal/colorscheme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.secondarycolor,
        title: const Text('Teacher Name'),
        centerTitle: true,
      ),
    );
  }
}
