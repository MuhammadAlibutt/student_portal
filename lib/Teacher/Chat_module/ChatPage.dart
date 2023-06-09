import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/Call/video_call.dart';
import 'package:student_portal/Teacher/Call/voice_call.dart';

class TeacherChatPage extends StatefulWidget {
  const TeacherChatPage({Key? key}) : super(key: key);

  @override
  _TeacherChatPageState createState() => _TeacherChatPageState();
}

class _TeacherChatPageState extends State<TeacherChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    final String messageText = _textEditingController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add(messageText);
        _textEditingController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student'),
        // leading: IconButton(icon: Icons.video_call_outlined),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                final isMyMessage =
                    index % 1 == 0; // Alternate alignment for demonstration

                return Align(
                  alignment: isMyMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isMyMessage ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: isMyMessage ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Type your message...',
                      suffixIcon: const Icon(Icons.photo),
                      // prefixIcon: const Icon(Icons.camera_alt_rounded),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.blue[400],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class ChatMessage {
//   final String text;
//   final bool isSender;
//   final String profilePic;

//   ChatMessage(
//       {required this.text, required this.isSender, required this.profilePic});
// }

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = [];

//   void _sendMessage(
//     String message,
//     String senderProfilePic,
//     // String receiverProfilePic,
//   ) {
//     setState(() {
//       _messages.add(ChatMessage(
//           text: message,
//           isSender: true,
//           profilePic:
//               'https://media.licdn.com/dms/image/D4D35AQEArhrGfCk6nA/profile-framedphoto-shrink_200_200/0/1679736790621?e=1686412800&v=beta&t=w174NxO74u-DnegB4Ngiu6_CUgcZvfb1kOWOWqehg2k'));
//       // _messages.add(ChatMessage(
//       //     text: message,
//       //     isSender: false,
//       //     profilePic:
//       //         'https://media.licdn.com/dms/image/D4D35AQEArhrGfCk6nA/profile-framedphoto-shrink_200_200/0/1679736790621?e=1686412800&v=beta&t=w174NxO74u-DnegB4Ngiu6_CUgcZvfb1kOWOWqehg2k'));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat App'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final message = _messages[index];
//                 return ChatBubble(
//                   text: message.text,
//                   isSender: message.isSender,
//                   profilePic: message.profilePic,
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     onSubmitted: (message) => _sendMessage(
//                       message,
//                       'sender_profile_pic_url',
//                       // 'receiver_profile_pic_url',
//                     ),
//                     decoration: const InputDecoration(
//                       hintText: 'Type a message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () => _sendMessage(
//                     'message',
//                     'sender_profile_pic_url',
//                     // 'receiver_profile_pic_url',
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

// class ChatBubble extends StatelessWidget {
//   const ChatBubble(
//       {required this.text, required this.isSender, required this.profilePic});

//   final String text;
//   final bool isSender;
//   final String profilePic;

//   @override
//   Widget build(BuildContext context) {
//     final align = isSender ? MainAxisAlignment.end : MainAxisAlignment.start;
//     final borderRadius = isSender
//         ? BorderRadius.only(
//             topLeft: Radius.circular(8.0),
//             bottomLeft: Radius.circular(8.0),
//             bottomRight: Radius.circular(8.0),
//           )
//         : BorderRadius.only(
//             topRight: Radius.circular(8.0),
//             bottomLeft: Radius.circular(8.0),
//             bottomRight: Radius.circular(8.0),
//           );

//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: align,
//         children: <Widget>[
//           if (!isSender)
//             CircleAvatar(
//               backgroundImage: NetworkImage(profilePic),
//             ),
//           Container(
//             margin: const EdgeInsets.only(left: 16.0),
//             child: Padding(
//               padding: EdgeInsets.only(right: isSender ? 0.0 : 40.0),
//               child: Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   color: isSender ? Colors.blue : Colors.grey[300],
//                   borderRadius: borderRadius,
//                 ),
//                 child: Text(
//                   text,
//                   style: TextStyle(
//                     color: isSender ? Colors.white : Colors.black,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           if (isSender)
//             CircleAvatar(
//               backgroundImage: NetworkImage(profilePic),
//             ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ChatScreen(),
//   ));
// }