import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:student_portal/colorscheme.dart';

class HomeScreen extends StatefulWidget {
  final String courseName;
  final String tutorName;
  final String price;
  final String imageUrl;
  const HomeScreen(
      {Key? key,
      required this.price,
      required this.courseName,
      required this.tutorName,
      required this.imageUrl})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? paymentIntent;
  final student_Name = const FlutterSecureStorage();
  final tutorName = const FlutterSecureStorage();
  Future<void> saveDataInFireStore() async {
    String courseTitle = widget.courseName;
    String courseTutorName = widget.tutorName;
    String coursePrice = widget.price;
    String courseImage = widget.imageUrl;

    tutorName.write(key: 'Tutor_Name', value: courseTutorName);

    print('teacher name1 : $courseTutorName');

    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Student_Enrolled_Courses')
        .doc(uid)
        .collection('Enrolled_Courses')
        .add({
      "Tutor_Name": courseTutorName,
      "Course_Name": courseTitle,
      "Course_Price": coursePrice,
      "Course_Image": courseImage,
    });
    // _showSnackBar('Transaction Successful2');
  }

  Future<void> newCollectionOfEnrolledCourses() async {
    String courseTitle = widget.courseName;
    String courseTutorName = widget.tutorName;
    String coursePrice = widget.price;
    String courseImage = widget.imageUrl;

    tutorName.write(key: 'Tutor_Name', value: courseTutorName);
    String? studentName = await student_Name.read(key: 'studentName');
    print('teacher name1 : $courseTutorName');

    // String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('Course_Enrolled_By_Student')
        .doc(courseTutorName)
        .collection('Enrolled_Courses')
        .add({
      "Student_Name": studentName,
      "Course_Name": courseTitle,
      "Course_Price": coursePrice,
      "Course_Image": courseImage,
    });
    // _showSnackBar('Transaction Successful');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: 'PKR',
        currencyCode: "PKR",
        testEnv: true,
      );
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!["client_secret"],
        style: ThemeMode.light,
        merchantDisplayName: "Test",
        googlePay: gpay,
      ));
      dislayPaymentSheet();
    } catch (e) {}
  }

  void dislayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print("Done");
    } catch (e) {
      print("Failed");
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {"amount": widget.price, "currency": "PKR"};
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51NFytCCJVZzgjMoPtufg0t706YnjGkGkaE5IW7RDSIaAWw0PcNYr71ekAkH8YoaVtWEo4V4wh2oCRP0qZXQiosQl00Ktve93pe',
            'Content-Type': 'application/x-www-form-urlencoded',
          });
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.appcolor,
        title: const Text('Amount to Pay'),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorTheme.appcolor,
          minimumSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Pay Here !',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          makePayment();
          newCollectionOfEnrolledCourses();
          saveDataInFireStore();
        },
      )),
    );
  }
}
