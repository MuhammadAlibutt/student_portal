import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:student_portal/Student/Payment/payment_controller.dart';
// import 'package:student_portal/Student/Payment/payment_controller.dart';
import '../colorscheme.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Cart() {
    // final paymentController = Get.put(PaymentController());
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      //width: double.infinity,
      child: Column(
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/pic.jpg'),
              radius: 70,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: const [
                Text(
                  'Sir Name',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                Text(
                  'Mobile Application Developer',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            // onPressed: () => paymentController.makePayment(),
            child: const Text(
              "Pay Now",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.accentcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'One Step Away!',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Cart(),
        ],
      ),
    );
  }
}
