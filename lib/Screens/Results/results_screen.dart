// ignore_for_file: prefer_const_constructors

//import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';
import 'package:emobot_mobile_v2/Screens/Results/components/body.dart';

class ResultScreen extends StatelessWidget {
  final List data;
  final List emotions;
  final int sessionID;
  List<List> recordedEmotions;
  ResultScreen(
      {Key? key,
      required this.data,
      required this.emotions,
      required this.sessionID,
      required this.recordedEmotions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Results Page',
      debugShowCheckedModeBanner: false,
      home: Body(
          title: 'Results Screen',
          data: data,
          emotions: emotions,
          sessionID: sessionID,
          recordedEmotions: recordedEmotions),
    );
  }
}
