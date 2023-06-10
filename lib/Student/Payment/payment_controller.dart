// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Map<String, dynamic>? paymentIntentData;
//   String money = 10.toString();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: const Text('PAYMENT METHOD (STRIPE)'),
//         centerTitle: true,
//         toolbarHeight: 70,
//       ),
//       body: Center(
//           child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.deepPurple,
//           minimumSize: const Size(250, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: const Text(
//           'STRIPE PAYMENT',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         onPressed: () {
//           makePayment();
//         },
//       )),
//     );
//   }

//   payFee() {
//     try {
//       //if you want to upload data to any database do it here
//     } catch (e) {
//       // exception while uploading data
//     }
//   }

//   Future<void> makePayment() async {
//     try {
//       paymentIntentData = await createPaymentIntent(money, 'USD');
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   paymentIntentClientSecret:
//                       paymentIntentData!['client_secret'],
//                   style: ThemeMode.light,
//                   merchantDisplayName: 'ANNIE'))
//           .then((value) {});
//       displayPaymentSheet();
//     } catch (e, s) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((newValue) {
//         payFee();

//         paymentIntentData = null;
//       }).onError((error, stackTrace) {
//         if (kDebugMode) {
//           print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//         }
//       });
//     } on StripeException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       // showDialog(
//       //     context: context,
//       //     builder: (_) => const AlertDialog(
//       //       content: Text("Cancelled "),
//       //     ));
//     } catch (e) {
//       if (kDebugMode) {
//         print('$e');
//       }
//     }
//   }

//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization':
//                 'Bearer sk_test_51NFytCCJVZzgjMoPtufg0t706YnjGkGkaE5IW7RDSIaAWw0PcNYr71ekAkH8YoaVtWEo4V4wh2oCRP0qZXQiosQl00Ktve93pe',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//       return jsonDecode(response.body);
//     } catch (err) {
//       if (kDebugMode) {
//         print('err charging user: ${err.toString()}');
//       }
//     }
//   }

//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }
// }
// //   Future<void> makePayment(
// //       {required String amount, required String currency}) async {
// //     try {
// //       paymentIntentData = await createPaymentIntent(amount, currency);
// //       if (paymentIntentData != null) {
// //         print('successs');
// //         await Stripe.instance.initPaymentSheet(
// //             paymentSheetParameters: SetupPaymentSheetParameters(
// //           // applePay: const PaymentSheetApplePay(merchantCountryCode: 'US'),
// //           googlePay: const PaymentSheetGooglePay(
// //               merchantCountryCode: 'US', testEnv: true),
// //           merchantDisplayName: 'Prospects',
// //           customerId: paymentIntentData!['customer'],
// //           paymentIntentClientSecret: paymentIntentData!['client_secret'],
// //           customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
// //         ));
// //         displayPaymentSheet();
// //       }
// //     } catch (e, s) {
// //       print('exception:$e$s');
// //     }
// //   }

// //   displayPaymentSheet() async {
// //     try {
// //       await Stripe.instance.presentPaymentSheet();
// //       Get.snackbar('Payment', 'Payment Successful',
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.green,
// //           colorText: Colors.white,
// //           margin: const EdgeInsets.all(10),
// //           duration: const Duration(seconds: 2));
// //     } on Exception catch (e) {
// //       if (e is StripeException) {
// //         print("Error from Stripe: ${e.error.localizedMessage}");
// //       } else {
// //         print("Unforeseen error: ${e}");
// //       }
// //     } catch (e) {
// //       print("exception:$e");
// //     }
// //   }

// //   //  Future<Map<String, dynamic>>
// //   createPaymentIntent(String amount, String currency) async {
// //     try {
// //       Map<String, dynamic> body = {
// //         'amount': calculateAmount(amount),
// //         'currency': currency,
// //         'payment_method_types[]': 'card'
// //       };
// //       var response = await http.post(
// //           Uri.parse('https://api.stripe.com/v1/payment_intents'),
// //           body: body,
// //           headers: {
// //             'Authorization':
// //                 'Bearer sk_test_51NFytCCJVZzgjMoPtufg0t706YnjGkGkaE5IW7RDSIaAWw0PcNYr71ekAkH8YoaVtWEo4V4wh2oCRP0qZXQiosQl00Ktve93pe',
// //             'Content-Type': 'application/x-www-form-urlencoded'
// //           });
// //       return jsonDecode(response.body);
// //     } catch (err) {
// //       print('err charging user: ${err.toString()}');
// //     }
// //   }

// //   calculateAmount(String amount) {
// //     final a = (int.parse(amount)) * 100;
// //     return a.toString();
// //   }
// // }
