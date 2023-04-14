import 'package:flutter/material.dart';

class TechHome extends StatefulWidget {
  const TechHome({Key? key}) : super(key: key);

  @override
  State<TechHome> createState() => _TechHomeState();
}

class _TechHomeState extends State<TechHome> {
  List<DropdownMenuItem<String>> get course {
    return [
      const DropdownMenuItem(
        value: '1',
        child: Text('Math'),
      ),
      const DropdownMenuItem(
        value: '2',
        child: Text('English'),
      ),
      const DropdownMenuItem(
        value: '3',
        child: Text('Computer Science'),
      ),
      const DropdownMenuItem(
        value: '4',
        child: Text('Email Marketing'),
      ),
      const DropdownMenuItem(
        value: '5',
        child: Text('Art/Designing'),
      ),
      const DropdownMenuItem(
        value: '6',
        child: Text('Web Development'),
      ),
      const DropdownMenuItem(
        value: '7',
        child: Text('Business Administration'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: SafeArea(
          child: Column(
            children: [
              const Text(
                'Select your Course!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              DropdownButtonFormField(
                items: course,
                onChanged: (String? value) {
                  print(course);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.school_outlined,
                    color: Colors.black,
                  ),
                  hintText: 'Select your Course',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
