import 'package:flutter/material.dart';

class MyTextfields extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscure;

  const MyTextfields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 215, 215, 215))),
      ),
    );
  }
}
