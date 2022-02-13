import 'dart:async';

import 'package:camera/camera.dart';
import 'package:emobot_mobile_v2/Screens/Session_Camera/components/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../Results/results_screen.dart';
import '../../../Session_Questions/session_questions.dart';
import '../../session_camera.dart';

class HomePage extends StatefulWidget {
  final List data;
  final int sessionID;
  const HomePage({Key? key, required this.data, required this.sessionID})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(data, sessionID);
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();
  List data;
  int sessionID;
  List emotions = <String>[];
  List<List> recordedEmotions = <List>[];
  _HomePageState(this.data, this.sessionID);

  //timer
  int _start = 10;
  late Timer _timer;

  /*Future recordEmotion(
      BuildContext context, String emotion, int sessionID, int userID) async {
    //create a new session entry in the database.
    DateTime now = DateTime.now();
    String date = "${now.hour}:${now.minute}:${now.second}";

    var url = "http://192.168.101.5/emobotDb/registeremotion.php";
    var response = await http.post(Uri.parse(url), body: {
      "Emotion": emotion,
      "Time_Recorded": date,
      "SessionID_id": sessionID.toString(),
      "userID_id": userID.toString(),
    });

    try {
      var recordEmotion = json.decode(response.body);
      if (recordEmotion != "Error") {
        // AJ labad sa ulo
      } else {
        Fluttertoast.showToast(
          msg: "Emotion saving failed",
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
  }*/

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            //dispose();
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(
                      data: data,
                      emotions: emotions,
                      sessionID: sessionID,
                      recordedEmotions: recordedEmotions)));
        } else {
          setState(() {
            _start--;
            String currentEmotion = _homeController.label;
            if (currentEmotion != "Loading...") {
              emotions.add(_homeController.label);
              DateTime now = DateTime.now();
              String date = "${now.hour}:${now.minute}:${now.second}";
              recordedEmotions.add([date, currentEmotion]);
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Emotion'),
      ),
      body: GetBuilder<HomeController>(
        init: _homeController,
        initState: (_) async {
          await _homeController.loadCamera();
          _homeController.startImageStream();
          startTimer();
        },
        builder: (_) {
          return Column(
            children: [
              const SizedBox(height: 20),
              _.cameraController != null &&
                      _.cameraController!.value.isInitialized
                  ? Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: CameraPreview(_.cameraController!))
                  : const Center(child: Text('loading')),
              const SizedBox(height: 15),
              Text(
                '$_start',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _homeController.label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
