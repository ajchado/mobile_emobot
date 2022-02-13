import 'package:emobot_mobile_v2/Screens/Login/components/body.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
