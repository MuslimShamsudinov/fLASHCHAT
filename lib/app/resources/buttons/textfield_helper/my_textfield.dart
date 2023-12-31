import 'package:flutter/material.dart';
import 'package:muslim/app/constants/constants.dart';


class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.labelText,
      required this.obscureText,
      required this.hintText,
      this.keyboardType,
      this.controller});
  final TextInputType? keyboardType;
  final String labelText;
  final bool obscureText;
  final String hintText;
final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorColor: cWhiteColor,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(28))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: cWhiteColor),
              borderRadius: BorderRadius.all(Radius.circular(28))),
          fillColor: Colors.white24,
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(color: cWhiteColor, fontSize: 20),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
