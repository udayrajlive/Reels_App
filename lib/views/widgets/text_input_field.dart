import 'package:flutter/material.dart';
import 'package:cloneapp/constants.dart';


class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;

  const TextInputField({Key? key,
    required this.controller,
    required this.labelText,
    this.isObscure =false,
    required this.icon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        controller:controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontSize: 18,fontFamily: 'Worksans'
          ),
          prefixIcon: Icon(icon) ,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: borderColor,
              )),
        ),
        obscureText: isObscure,
      ),
    ]);
  }
}
