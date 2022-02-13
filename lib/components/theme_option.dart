import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeOption extends StatelessWidget {
  const ThemeOption({
    Key? key,
    required this.title,
    required this.value,
    required this.onChangeMethod,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function onChangeMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600])),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: kPrimaryColor,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
