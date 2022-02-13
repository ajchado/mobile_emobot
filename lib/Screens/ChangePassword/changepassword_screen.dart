import 'package:emobot_mobile_v2/Screens/Accounts/accounts_screen.dart';
import 'package:emobot_mobile_v2/Screens/ChangePassword/components/body.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  static TextEditingController username = TextEditingController();
  static TextEditingController firstname = TextEditingController();
  static TextEditingController lastname = TextEditingController();
  final List data;
  const ChangePasswordScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        /*title: const Text(
          "Settings",
          style: TextStyle(fontSize: 22),
        ),*/
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AccountScreen(data: data)));*/
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),*/
      resizeToAvoidBottomInset: false,
      body: Body(data: data),
    );
  }
}
