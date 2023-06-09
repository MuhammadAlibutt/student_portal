import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => __CategoryListState();
}

class __CategoryListState extends State<CategoryList> {
  String selectedCourse = '';
  String? _selectCategory;
  List<DropdownMenuItem<String>> get categories {
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
        value: 'Desktop Application',
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
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      child: DropdownButtonFormField(
        items: categories,
        onChanged: (String? value) {
          setState(() {
            selectedCourse = value.toString();
          });
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
    );
  }
}
