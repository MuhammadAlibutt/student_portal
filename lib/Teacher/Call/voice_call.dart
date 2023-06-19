import 'package:flutter/material.dart';
import 'package:student_portal/Teacher/Call/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class VoiceCall extends StatelessWidget {
  final callIdTextctrl = TextEditingController();
  VoiceCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Voice Call'),
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
                            VoiceCallPage(CallId: callIdTextctrl.text),
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

void setState(Function() param0) {}

final String localUserId = math.Random().nextInt(10000).toString();

class VoiceCallPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const VoiceCallPage({super.key, required this.CallId});
  final String CallId;

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Utils.appId,
        appSign: Utils.appSignIn,
        userID: localUserId,
        userName: "user_$localUserId",
        callID: widget.CallId,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}
