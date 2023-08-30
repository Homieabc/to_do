import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final IconData icon;
  final String text;
  const TextFieldLogin({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      hintText: text,
      prefixIcon: Icon(icon),
    );
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: TextField(
        decoration: inputDecoration,
      ),
    );
  }
}
