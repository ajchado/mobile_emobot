// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:emobot_mobile_v2/Screens/Results/components/background.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../components/rounded_button.dart';
import '../../Session_Intro/session_start.dart';

class Body extends StatefulWidget {
  final List data;
  final List emotions;
  final int sessionID;
  List<List> recordedEmotions;
  Body(
      {Key? key,
      required this.title,
      required this.data,
      required this.emotions,
      required this.sessionID,
      required this.recordedEmotions})
      : super(key: key);

  final String title;

  @override
  // ignore: no_logic_in_create_state
  _ResultScreenState createState() =>
      // ignore: no_logic_in_create_state
      _ResultScreenState(data, emotions, sessionID, recordedEmotions);
}

class _ResultScreenState extends State<Body> {
  List data;
  List emotions;
  List<List> recordedEmotions;
  int sessionID;
  late List<EmotionData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  _ResultScreenState(
      this.data, this.emotions, this.sessionID, this.recordedEmotions);

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  //---------------------- TIMER + EMOTION RECORDING -----------------------//
  Future insertEmotions(
      BuildContext context, String date, String emotion) async {
    var url = "http://192.168.1.13/emobotDb/registeremotion.php";
    var response = await http.post(Uri.parse(url), body: {
      "SessionID_id": sessionID.toString(),
      "Time_Recorded": date,
      "Emotion": emotion,
      "userID_id": data[0]['personID'].toString(),
    });
    try {
      var isInserted = json.decode(response.body);
      if (isInserted != "Error") {
        Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_LONG,
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
    for (var element in recordedEmotions) {
      insertEmotions(context, element[0], element[1]);
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SfCircularChart(
            title: ChartTitle(text: 'RESULTS'),
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              PieSeries<EmotionData, String>(
                dataSource: _chartData,
                xValueMapper: (EmotionData data, _) => data.emotion,
                yValueMapper: (EmotionData data, _) => data.count,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: false,
                //maximumValue: 35000
              ),
            ],
          ),
          RoundedButton(
            text: "FINISH",
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SessionIntroScreen(
                            data: data,
                          )));
            },
            color: kPrimaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  List<EmotionData> getChartData() {
    int happycount = 0;
    int sadcount = 0;
    int neutralcount = 0;

    for (var element in emotions) {
      String emotion = element;
      if (emotion == "Happy") {
        happycount++;
      } else if (emotion == "Neutral") {
        neutralcount++;
      } else if (emotion == "Sad") {
        sadcount++;
      }
    }

    final List<EmotionData> chartData = [
      EmotionData('Happy', happycount),
      EmotionData('Sad', sadcount),
      EmotionData('Neutral', neutralcount),
    ];

    return chartData;
  }
}

class EmotionData {
  EmotionData(this.emotion, this.count);
  final String emotion;
  final int count;
}
