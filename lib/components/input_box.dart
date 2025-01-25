import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String hintText;
  final controller;
  final bool obscuredText;
  const InputBox({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscuredText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscuredText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
