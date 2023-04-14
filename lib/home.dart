import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/techer_signin.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome on Board'),
      ),
      body: Center(
        child: Column(children: [
          const Center(
            child: Text('Kindly Select who you are'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Admin',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            tooltip: 'Student',
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TecherSignin(),
                ),
              );
            },
            icon: const Icon(Icons.person),
            tooltip: 'Teacher',
          )
        ]),
      ),
    );
  }
}
