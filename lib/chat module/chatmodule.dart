import 'package:flutter/material.dart';

import '../colorscheme.dart';
import 'chatscreen.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  design(String name, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        // width: MediaQuery.of(context).size.width*,
        decoration: BoxDecoration(
          color: ColorTheme.secondarycolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/pic.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(description),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ChatScreen())));
                  },
                  icon: const Icon(Icons.forward_rounded)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.secondarycolor,
          title: const Text('Text your Tutor',
              style: TextStyle(fontStyle: FontStyle.italic)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            design('Ali ', "Flutter Developer"),
            design('Ashar', 'Flutter Developer'),
            design('Sheraz', 'Wela Insan'),
            design('Usman Sajid', 'Senior React Js Developer'),
          ],
        ));
  }
}
