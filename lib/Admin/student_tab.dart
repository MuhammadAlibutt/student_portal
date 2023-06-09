import 'package:flutter/material.dart';


class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  design(String name, String description) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        // width: MediaQuery.of(context).size.width*,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/pic.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(right: 15),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: const [
              //       Text(
              //         "12:15",
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Colors.white,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
        backgroundColor: Colors.blue,
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
      ),
    );
  }
}