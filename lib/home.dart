import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_portal/Admin/admin_login.dart';
import 'package:student_portal/colorscheme.dart';
import 'Student/StudentLogin.dart';
import 'Teacher/teclogin.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Tutor!',
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
            SystemNavigator.pop();
          },
        ),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(children: [
            const Text(
              'Choose your Role',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.secondarycolor),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminSignin()));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminSignin(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.admin_panel_settings),
                    Text('Admin'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.secondarycolor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const TecherSignin())),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person),
                    Text('Teacher'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.secondarycolor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentSignin(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person),
                    Text('Student'),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
