import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MytextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white70),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 194, 4, 4)),
        ),
        fillColor: Color.fromARGB(255, 55, 54, 54),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(179, 249, 249, 249)),
      ),
    );
  }
}
