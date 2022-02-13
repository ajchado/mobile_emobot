import 'dart:convert';
import 'package:emobot_mobile_v2/Screens/Accounts/accounts_screen.dart';
import 'package:emobot_mobile_v2/Screens/EditProfile/components/background.dart';
import 'package:emobot_mobile_v2/components/rounded_button.dart';
import 'package:emobot_mobile_v2/components/rounded_input_field.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Body extends StatelessWidget {
  final List data;
  static TextEditingController username = TextEditingController();
  static TextEditingController firstname = TextEditingController();
  static TextEditingController lastname = TextEditingController();
  const Body({
    Key? key,
    required this.data,
  }) : super(key: key);

  Future updateUser(BuildContext context) async {
    //to verify if username/password field is empty.
    if (firstname.text == "" || lastname.text == "") {
      Fluttertoast.showToast(
        msg: "All fields cannot be blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: kPrimaryColor,
      );
    } else {
      var url = "http://192.168.1.13/emobotDb/updateuser.php";
      var response = await http.post(Uri.parse(url), body: {
        "username": data[0]['username'].toString(),
        "firstName": firstname.text,
        "lastName": lastname.text,
      });

      try {
        var updatedData = json.decode(response.body);
        if (updatedData != "Error") {
          Fluttertoast.showToast(
            msg: "Profile Information Updated Successfully!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: kPrimaryColor,
          );

          data[0]['firstName'] = firstname.text;
          data[0]['lastName'] = lastname.text;

          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountScreen(data: data)));
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

  void cancel(context) {
    Navigator.pop(context);
  }

  //login UI
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ignore: unnecessary_const
          const Text(
            "EDIT PROFILE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          // RoundedInputField(
          //   //controller: username,
          //   text: username,
          //   hintText: "Enter new username",
          //   onChanged: (value) {
          //     // ignore: unused_label
          //     text:
          //     value;
          //   },
          // ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedInputField(
            //controller: username,
            text: firstname,
            hintText: "Enter new firstname",
            onChanged: (value) {
              // ignore: unused_label
              text:
              value;
            },
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedInputField(
            //controller: username,
            text: lastname,
            hintText: "Enter new lastname",
            onChanged: (value) {
              // ignore: unused_label
              text:
              value;
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            text: "SAVE CHANGES",
            press: () {
              updateUser(context);
            },
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
          RoundedButton(
            text: "CANCEL",
            press: () {
              cancel(context);
            },
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    ));
  }
}
