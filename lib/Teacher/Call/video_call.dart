import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:student_portal/Teacher/Call/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCall extends StatelessWidget {
  final callIdTextctrl = TextEditingController();
  VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Video Call'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIdTextctrl,
                  decoration: InputDecoration(
                    labelText: "Join a Call By Id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoCallPage(CallId: callIdTextctrl.text),
                      ),
                    );
                  },
                  child: const Text('Join Now')),
            ],
          ),
        ),
      ),
    );
  }
}

final String localUserId = math.Random().nextInt(10000).toString();

class VideoCallPage extends StatefulWidget {
  VideoCallPage({super.key, required this.CallId});
  final String CallId;

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Utils.appId,
        appSign: Utils.appSignIn,
        userID: localUserId,
        userName: "user_$localUserId",
        callID: widget.CallId,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}
