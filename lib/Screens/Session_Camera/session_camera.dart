// ignore_for_file: unused_local_variable

import 'package:emobot_mobile_v2/Screens/Session_Camera/components/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionCameraScreen extends StatelessWidget {
  final List data;
  final int sessionID;
  const SessionCameraScreen(
      {Key? key, required this.data, required this.sessionID})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: HomePage(data: data, sessionID: sessionID),
    );
  }
}
