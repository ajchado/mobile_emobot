// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, duplicate_ignore

import 'package:emobot_mobile_v2/Screens/Accounts/components/background.dart';
import 'package:emobot_mobile_v2/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:emobot_mobile_v2/components/rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emobot_mobile_v2/Screens/Session_Questions/session_questions.dart';

class Body extends StatelessWidget {
  final List data;
  const Body({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Session Page",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "START SESSION",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                              data: data,
                            )));
              },
              color: kPrimaryColor,
              textColor: Colors.white,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
