import 'package:flutter/material.dart';

TextFormField reusableTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller, {
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    validator: validator,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black54,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.grey.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      errorStyle: const TextStyle(color: Colors.red), 
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}
