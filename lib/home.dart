import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome on Board'),
      ),
      body: Container(
        child: Column(children: [
          Center(
            child: Text('Kindly Select who you are'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.admin_panel_settings),
            tooltip: 'Admin',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            tooltip: 'Student',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            tooltip: 'Teacher',
          )
        ]),
      ),
    );
  }
}
