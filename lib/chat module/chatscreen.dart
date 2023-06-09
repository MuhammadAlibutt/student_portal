import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/Call/video_call.dart';
import 'package:student_portal/Teacher/Call/voice_call.dart';

class StudentChatPage extends StatefulWidget {
  const StudentChatPage({Key? key}) : super(key: key);

  @override
  _StudentChatPageState createState() => _StudentChatPageState();
}

class _StudentChatPageState extends State<StudentChatPage> {
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
        title: const Text('Teacher'),
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
