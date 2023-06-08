import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key,required this.callID}) : super(key: key);
  final String callID;
  String userID=Random().nextInt(10000).toString();

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 2060782974,
        appSign: "yourAppSign",
        callID: callID,
        userID: userID,
        userName: 'user_$userID',
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
