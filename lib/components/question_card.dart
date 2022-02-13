// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

//import 'package:emobot_mobile_v2/Screens/Accounts/accounts_screen.dart';
import 'dart:convert';

import 'package:emobot_mobile_v2/Screens/Session_Camera/session_camera.dart';
import 'package:flutter/material.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class QuestionCard extends StatelessWidget {
  final List data;
  final String questionPicked;
  QuestionCard(
      {required this.title,
      required this.icon,
      required this.color,
      required this.data,
      required this.questionPicked});

  final String title;
  final IconData icon;
  final Color color;

  Future createSession(BuildContext context) async {
    //create a new session entry in the database.
    DateTime now = DateTime.now();
    String date = "${now.month}/${now.day}/${now.year}";

    var url = "http://192.168.1.13/emobotDb/createsession.php";
    var response = await http.post(Uri.parse(url), body: {
      "personID": data[0]['personID'].toString(),
      "dateConducted": date,
      "questionAnswered": questionPicked,
    });

    try {
      var sessionID = json.decode(response.body);
      if (sessionID != "Error") {
        Fluttertoast.showToast(
          msg: "Session Starting...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: kPrimaryColor,
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SessionCameraScreen(data: data, sessionID: sessionID)));
      } else {
        Fluttertoast.showToast(
          msg: "Session wasn't created",
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          createSession(context);
        },
        splashColor: kPrimaryColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70,
                color: color,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
      ),
    );
  }
}
