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
  List<int> selected = [];
  List<int> selectedDay = [];
  String timeselected = '';
  String sift = '';
  String day = '';

  bool? selector;

  bool? daySelector;
  timeAndDay(String time, String day, int index) {
    bool isSelected = selected.contains(index);

    return GestureDetector(
      onTap: () {
        print('selecter: $isSelected');
        setState(() {
          timeselected = time;
          sift = day;
          selector = isSelected;
          if (isSelected) {
            selected.clear();
          } else {
            selected.clear();
            selected.add(index);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.16,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            border: Border.all(
              width: 1,
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  WeatherIcons.sunrise,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  weekday(String weeday, int index) {
    bool isSelected = selectedDay.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          day = weeday;
          daySelector = isSelected;
          if (isSelected) {
            selectedDay.clear();
          } else {
            selectedDay.clear();
            selectedDay.add(index);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 20),
        child: Container(
          height: 60,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.circular(20),
              color: isSelected ? Colors.blue : Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              weeday,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Row(
              children: [
                Text(
                  'Please Choose Time',
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
          Wrap(
            children: [
              timeAndDay('8-9', 'Morning', 0),
              timeAndDay('9-12', 'Late Morning', 1),
              timeAndDay('12-15', 'Afternoon', 2),
              timeAndDay('15-18', 'late Afternoon', 3),
              timeAndDay('18-21', 'Evening', 4),
              timeAndDay('21-24', 'late Evening', 5),
              timeAndDay('0-3', 'Night', 6),
              timeAndDay('3-6', 'Late Night', 7),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Select A Day',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                weekday('Sun', 0),
                weekday('Mon', 1),
                weekday('Tue', 2),
                weekday('Wed', 3),
                weekday('Thu', 4),
                weekday('Fri', 5),
                weekday('Sat', 6),
              ],
            ),
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
                  if (selectedDay.isEmpty) {
                    _showSnackBar('Please Select Time for the class');
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherPrice(
                          time: timeselected,
                          day: day,
                          sift: sift,
                        ),
                      ),
                    );
                  }
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
