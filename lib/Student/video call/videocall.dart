import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:uuid/uuid.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final String _userId;
  late final String _userName;

  _VideoCallState() {
    final random = Random();
    _userId = const Uuid().v4();
    _userName = 'User_${random.nextInt(1000).toString()}';
  }

  @override
  Widget build(BuildContext context) {
    const _AppId = 1091511452;
    const _Appsign = '123456789';
    const _CallId = 'my_call_id';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call Screen'),
      ),
      body: ZegoUIKitPrebuiltCall(
        appID: _AppId,
        appSign: _Appsign,
        userID: _userId,
        callID: _CallId,
        userName: _userName,
        config: ZegoUIKitPrebuiltCallConfig(),
      ),
    );
  }
}
