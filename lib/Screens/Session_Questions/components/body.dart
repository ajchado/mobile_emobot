// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:emobot_mobile_v2/components/question_card.dart';

class Body extends StatefulWidget {
  final List data;
  const Body({Key? key, required this.data}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _BodyScreenState createState() => _BodyScreenState(data);
}

class _BodyScreenState extends State<Body> {
  List data;
  _BodyScreenState(this.data);
  bool valTheme = true;
  onChangeFunction(bool newValue) {
    setState(() {
      valTheme = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topLeft,
              image: AssetImage('assets/images/main_top.png')),
        ),
        /*foregroundDecoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.bottomRight,
              image: AssetImage('assets/images/login_bottom.png')),
        ),*/
        padding: EdgeInsets.all(30),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            QuestionCard(
                title: 'Tell me about yourself',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'Tell me about yourself'),
            QuestionCard(
                title: 'Why do you want this job?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'Why do you want this job?'),
            QuestionCard(
                title: 'What can you bring to the company?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What can you bring to the company?'),
            QuestionCard(
                title: 'What makes you unique?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What makes you unique?'),
            QuestionCard(
                title: 'What is your dream job?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What is your dream job?'),
            QuestionCard(
                title: 'What motivates you?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What motivates you?'),
            QuestionCard(
                title: 'What is your work style?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What is your work style?'),
            QuestionCard(
                title: 'What are you looking for in a new position?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What are you looking for in a new position?'),
            QuestionCard(
                title: 'What are your greatest strengths',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'What are your greatest strengths'),
            QuestionCard(
                title: 'Why should we hire you?',
                icon: Icons.question_answer_rounded,
                color: kPrimaryColor,
                data: data,
                questionPicked: 'Why should we hire you?'),
          ],
        ),
      ),
    );
  }
}
