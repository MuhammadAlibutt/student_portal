// import 'package:flutter/material.dart';
// import 'package:student_portal/Teacher/Call/video_call.dart';
// import 'package:student_portal/Teacher/Call/voice_call.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TeacherChatPage extends StatefulWidget {
//   const TeacherChatPage({Key? key}) : super(key: key);

//   @override
//   _TeacherChatPageState createState() => _TeacherChatPageState();
// }

// class _TeacherChatPageState extends State<TeacherChatPage> {
//   final TextEditingController _textEditingController = TextEditingController();
//   final List<Map<String, dynamic>> _messages = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchMessages();
//   }

//   void _fetchMessages() {
//     FirebaseFirestore.instance
//         .collection('studet_message')
//         .orderBy('time', descending: false)
//         .snapshots()
//         .listen((QuerySnapshot snapshot) {
//       setState(() {
//         _messages.clear();
//         for (final message in snapshot.docs) {
//           final data = message.data() as Map<String, dynamic>;
//           final messageText = data['message'] as String?;
//           final sender = data['sender'] as String?;
//           if (messageText != null && sender != null) {
//             _messages.add({
//               'message': messageText,
//               'sender': sender,
//             });
//           }
//         }
//       });
//     });
//   }

//   void _sendMessage() {
//     final String messageText = _textEditingController.text.trim();
//     if (messageText.isNotEmpty) {
//       setState(() {
//         _messages.add({
//           'message': messageText,
//           'sender': 'teacher',
//         });
//         _textEditingController.clear();
//       });
//       FirebaseFirestore.instance.collection('teacher_message').add({
//         'sender': 'teacher',
//         'message': messageText,
//         'time': DateTime.now(),
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Student'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VoiceCall(),
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.call,
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VideoCall(),
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.videocam,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               reverse: true,
//               itemBuilder: (BuildContext context, int index) {
//                 final message = _messages[index];
//                 final isMyMessage = message['sender'] == 'teacher';

//                 return Align(
//                   alignment: isMyMessage
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Container(
//                     margin: const EdgeInsets.all(8.0),
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: isMyMessage ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Text(
//                       message['message'] as String,
//                       style: TextStyle(
//                         color: isMyMessage ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     textInputAction: TextInputAction.newline,
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       hintText: 'Type your message...',
//                       suffixIcon: const Icon(Icons.photo),
//                       // prefixIcon: const Icon(Icons.camera_alt_rounded),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: Colors.blue[400],
//                   ),
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.send,
//                       color: Colors.white,
//                     ),
//                     onPressed: _sendMessage,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/Call/video_call.dart';
import 'package:student_portal/Teacher/Call/voice_call.dart';

class chatpage extends StatefulWidget {
  String email;
  chatpage({required this.email});
  @override
  _chatpageState createState() => _chatpageState(email: email);
}

class _chatpageState extends State<chatpage> {
  String email;
  _chatpageState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          email,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VoiceCall(),
                ),
              );
            },
            icon: const Icon(
              Icons.call,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoCall(),
                ),
              );
            },
            icon: const Icon(
              Icons.videocam,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(
                email: email,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[400],
                      hintText: 'Type your message....',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages').doc().set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'email': email,
                      });
                      message.clear();
                    }
                  },
                  icon: Icon(
                    Icons.send_sharp,
                    color: Colors.green[900],
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class messages extends StatefulWidget {
  String email;
  messages({super.key, required this.email});
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _messagesState createState() => _messagesState(email: email);
}

// ignore: camel_case_types
class _messagesState extends State<messages> {
  String email;
  _messagesState({required this.email});

  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('Messages')
      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];
            Timestamp t = qs['time'];
            DateTime d = t.toDate();
            print(d.toString());
            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: email == qs['email']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        qs['email'],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              qs['message'],
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            d.hour.toString() + ":" + d.minute.toString(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
