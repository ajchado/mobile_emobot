import 'package:emobot_mobile_v2/Screens/Accounts/components/body.dart';
import 'package:emobot_mobile_v2/Screens/Login/login_screen.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class AccountScreen extends StatelessWidget {
  final List data;
  const AccountScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Body(data: data),
    );
  }
}
