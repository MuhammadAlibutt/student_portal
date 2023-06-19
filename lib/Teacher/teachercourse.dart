import 'package:flutter/material.dart';
import 'package:student_portal/colorscheme.dart';
import 'teacherdetail.dart';
import 'popmenu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TechHome extends StatefulWidget {
  const TechHome({Key? key}) : super(key: key);

  @override
  State<TechHome> createState() => _TechHomeState();
}

class _TechHomeState extends State<TechHome> {
  String selectedCourse = '';

  final courseSelectedStorage = FlutterSecureStorage();
  List<DropdownMenuItem<String>> get course {
    return [
      const DropdownMenuItem(
        value: 'Mobile Application Development',
        child: Text('Mobile Application Development'),
      ),
      const DropdownMenuItem(
        value: 'Website Development',
        child: Text('Website Development'),
      ),
      const DropdownMenuItem(
        value: 'Desktop Application Development',
        child: Text('Desktop Application'),
      ),
      const DropdownMenuItem(
        value: 'Artifical Intelligence',
        child: Text('Artifical Intelligence'),
      ),
      const DropdownMenuItem(
        value: 'SEO',
        child: Text('SEO'),
      ),
      const DropdownMenuItem(
        value: 'Digital Marketing',
        child: Text('Digital Marketing'),
      ),
      const DropdownMenuItem(
        value: 'Networking',
        child: Text('Networking'),
      ),
      const DropdownMenuItem(
        value: 'Other',
        child: Text('Other'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.appcolor,
        title: const Text(
          'Welcome',
          style: TextStyle(color: ColorTheme.accentcolor),
        ),
        centerTitle: true,
        leading: PopupMenu(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: SafeArea(
              child: Column(
                children: [
                  const Text(
                    'Choose your Course!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DropdownButtonFormField(
                    items: course,
                    onChanged: (String? value) {
                      setState(() {
                        selectedCourse = value.toString();
                      });
                      print('course: $selectedCourse');
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
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () async {
                        await courseSelectedStorage.write(
                            key: 'course_name', value: selectedCourse);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherDetail(),
                          ),
                        );
                      },
                      child: const Text(
                        'Get Started!',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
