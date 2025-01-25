import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final String? hintMessage;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.textFieldController,
    this.hintMessage,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: textFieldController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(color: Colors.green, width: 10),
          ),
          hintText: hintMessage,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
