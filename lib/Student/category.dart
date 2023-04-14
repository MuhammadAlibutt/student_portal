import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => __CategoryListState();
}

class __CategoryListState extends State<CategoryList> {
  String? _selectCategory;
  List<DropdownMenuItem<String>> get categories {
    return [
      const DropdownMenuItem(
        value: '1',
        child: Text('Computer Science'),
      ),
      const DropdownMenuItem(
        value: '2',
        child: Text('Business'),
      ),
      const DropdownMenuItem(
        value: '3',
        child: Text('English'),
      ),
      const DropdownMenuItem(
        value: '4',
        child: Text('Maths'),
      ),
      const DropdownMenuItem(
        value: '5',
        child: Text('Arts'),
      ),
      const DropdownMenuItem(
        value: '6',
        child: Text('Engineering'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.1,
      child: InputDecorator(
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.subject,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            filled: true,
            fillColor: Colors.white),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectCategory,
            isExpanded: true,
            items: categories,
            hint: const Text(
              "select your course",
              style: TextStyle(color: Colors.black),
            ),
            onChanged: (String? value) {
              setState(() {
                _selectCategory = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
