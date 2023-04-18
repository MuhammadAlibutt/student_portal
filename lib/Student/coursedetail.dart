import 'package:flutter/material.dart';
import '../colorscheme.dart';

class TimeTabel extends StatefulWidget {
  const TimeTabel({super.key});

  @override
  State<TimeTabel> createState() => _TimeTabelState();
}

class _TimeTabelState extends State<TimeTabel> {
  course(date, day, time) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              date,
              style: const TextStyle(
                  color: ColorTheme.primarycolor,
                  fontFamily: "hinid",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              width: 4,
              height: 66,
              color: ColorTheme.secondarycolor,
            ),
            const SizedBox(
              width: 4,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                          color: ColorTheme.primarycolor,
                          fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "(" + time + ")",
                      style: const TextStyle(color: ColorTheme.primarycolor),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Zoom Meeting Link',
                    style: TextStyle(
                      color: ColorTheme.primarycolor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme.accentcolor,
        appBar: AppBar(
          backgroundColor: ColorTheme.secondarycolor,
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your Classes Schedule',
              style: TextStyle(
                  color: ColorTheme.primarycolor,
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            SingleChildScrollView(
              child: Column(
                children: [
                  course(' 1st May', 'Monday', '2:00 PM - 4:00PM'),
                  const SizedBox(
                    height: 20,
                  ),
                  course(' 3rd May', 'Wednesday', '2:00 PM - 4:00PM'),
                ],
              ),
            ),
          ],
        ));
  }
}
