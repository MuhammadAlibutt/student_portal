import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/teacher_price.dart';
import 'package:student_portal/Teacher/teacherdetail.dart';
import 'package:weather_icons/weather_icons.dart';

class TeacherSchedule extends StatefulWidget {
  const TeacherSchedule({super.key});

  @override
  State<TeacherSchedule> createState() => _TeacherScheduleState();
}

class _TeacherScheduleState extends State<TeacherSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeacherDetail(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 20),
            child: Text(
              'When would you like to take lessons?',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 15),
            child: Row(
              children: const [
                Text(
                  'Time of the day',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '(in your time zone)',
                  style: TextStyle(fontSize: 17, color: Colors.black38),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              //1st
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.sunrise,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '6-9',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Morning',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              //2nd
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.day_sunny,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '9-12',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Late morning',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              //3rd
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.day_sunny,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '12-15',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Afternoon',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              //4th
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.day_sunny,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '15-18',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Late afternoon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //2nd Row
          Row(
            children: [
              //1st
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.sunset,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '18-21',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Evening',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              //2nd
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.night_clear,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '21-24',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Late evening',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              //3rd
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.night_clear,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '0-3',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Night',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              //4th
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(
                          WeatherIcons.night_cloudy,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '3-6',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Late night',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Days of the week',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 20),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Sun',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              //Monday
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 20,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Mon',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              //Tuesday
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 20,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Tue',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              //Wednesday
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 20,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Wed',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              //Thursday
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 20,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Thu',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              //Friday
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 20,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Fri',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              //Saturday
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  top: 20,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Thu',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherPrice(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
