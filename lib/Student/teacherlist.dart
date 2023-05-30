import 'package:flutter/material.dart';
import 'teachercart.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({super.key});

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  MyProject(pic, title, des, star) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        color: Colors.blue,
        child: Container(
          margin: EdgeInsets.only(left: 20, top: 50, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(pic),
                  radius: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      des,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  star,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Cart()),
                        ),
                      );
                    },
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find me a Tutor'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyProject(
                'assets/images/pic.jpg',
                'Muhammad Ali',
                'Android Application Tutor',
                '\$100',
              ),
              MyProject(
                'assets/images/pic.jpg',
                'Asher Ali',
                'Database Tutor',
                '\$120',
              ),
              MyProject(
                'assets/images/pic.jpg',
                'Usman Sajid',
                'React Native Tutor',
                '\$150',
              ),
              MyProject(
                'assets/images/pic.jpg',
                'Sheraz Hassan',
                'Artifical Inteligence tutor',
                '\$200',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
