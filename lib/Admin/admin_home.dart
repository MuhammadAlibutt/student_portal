import 'package:flutter/material.dart';
import 'package:student_portal/Admin/student_tab.dart';
import 'package:student_portal/Admin/teacher_tab.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Teachers'),
            Tab(text: 'Students'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TeachersTab(),
          StudentsTab(),
        ],
      ),
    );
  }
}
