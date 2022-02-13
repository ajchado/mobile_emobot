import 'package:emobot_mobile_v2/components/text_field_container.dart';
import 'package:emobot_mobile_v2/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedPasswordField extends StatefulWidget {
  TextEditingController password = TextEditingController();
  ValueChanged<String> onChanged;

  RoundedPasswordField({
    Key? key,
    required this.password,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.password,
        obscureText: isObscure,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            hintText: "Enter your password",
            icon: const Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                }),
            border: InputBorder.none),
      ),
    );
  }
}
