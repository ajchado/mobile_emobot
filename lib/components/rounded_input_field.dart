// ignore: unused_import
import 'package:emobot_mobile_v2/Screens/Login/components/body.dart';
import 'package:emobot_mobile_v2/components/text_field_container.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedInputField extends StatefulWidget {
  TextEditingController text = TextEditingController();
  String hintText;
  IconData icon;
  ValueChanged<String> onChanged;

  RoundedInputField({
    Key? key,
    required this.text,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        focusNode: myFocusNode,
        controller: widget.text,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
