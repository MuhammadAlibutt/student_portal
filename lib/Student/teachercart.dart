import 'package:flutter/material.dart';
import '../colorscheme.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Cart() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      //width: double.infinity,
      child: Column(
        children: [
          Row(children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/pic.jpg'),
              radius: 70,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  'Sir Name',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Mobile Application Developer',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Pay Now")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primarycolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'One Step Away!',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
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
