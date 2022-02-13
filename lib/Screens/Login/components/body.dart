import 'dart:convert';
import 'package:emobot_mobile_v2/Screens/Session_Intro/session_start.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:emobot_mobile_v2/Screens/Login/components/background.dart';
import 'package:emobot_mobile_v2/components/existing_account_check.dart';
import 'package:emobot_mobile_v2/components/rounded_button.dart';
import 'package:emobot_mobile_v2/components/rounded_input_field.dart';
import 'package:emobot_mobile_v2/components/rounded_password_field.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crypto/crypto.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();
  const Body({Key? key}) : super(key: key);

  Future login(BuildContext context) async {
    //to verify if username/password field is empty.
    if (username.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Both fields cannot be blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: kPrimaryColor,
      );
    } else {
      var url = "http://192.168.1.13/emobotDb/login.php";
      var encryptedPassword =
          sha256.convert(utf8.encode(password.text)).toString();
      var response = await http.post(Uri.parse(url), body: {
        "username": username.text,
        "password": encryptedPassword,
      });
      // ignore: prefer_typing_uninitialized_variables
      //var data;
      try {
        var data = json.decode(response.body);

        if (data != "Error") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SessionIntroScreen(
                        data: data,
                      )));
        } else {
          Fluttertoast.showToast(
            msg: "The username or password doesn't exist.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: kPrimaryColor,
          );
        }
      } on FormatException {
        Fluttertoast.showToast(
          msg: "Uh oh! There seems to be an error.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: kPrimaryColor,
        );
      } on Exception {
        Fluttertoast.showToast(
            msg: "Error",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: kPrimaryColor);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.35,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            //controller: username,
            text: username,
            hintText: "Enter your username",
            onChanged: (value) {
              // ignore: unused_label
              text:
              value;
            },
          ),
          RoundedPasswordField(
            //controller: password,
            password: password,
            onChanged: (value) {
              // ignore: unused_label
              password:
              value;
            },
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {
              login(context);
            },
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          ExistingAccountCheck(
            press: () {},
          ),
        ],
      ),
    );
  }
}
