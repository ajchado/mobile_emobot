import 'package:emobot_mobile_v2/Screens/Accounts/accounts_screen.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';
import 'package:emobot_mobile_v2/Screens/Session_Intro/components/body.dart';
import 'package:page_transition/page_transition.dart';

class SessionIntroScreen extends StatelessWidget {
  final List data;
  const SessionIntroScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: kPrimaryColor),
      resizeToAvoidBottomInset: false,
      body: Body(data: data),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Stack(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundColor: kPrimaryLightColor,
                        radius: 45.0,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center + Alignment(0, 0.8),
                        child: Text(
                          data[0]['firstName'] + " " + data[0]['lastName'],
                          style: const TextStyle(
                              fontSize: 19, color: Colors.white),
                        )),
                  ],
                )),
            ListTile(
              title: const Text('Account Settings',
                  style: TextStyle(fontSize: 18, color: kPrimaryColor)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageTransition(
                        child: AccountScreen(data: data),
                        type: PageTransitionType.leftToRightWithFade));
              },
            ),
            ListTile(
              title: const Text('FAQs',
                  style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                  )),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
