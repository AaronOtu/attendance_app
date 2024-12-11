import 'package:flutter/material.dart';

TextFormField etzTextField(
  String text,
  IconData? icon,
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
      labelStyle: const TextStyle(color: Color(0xFF858585)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
            width: 0, style: BorderStyle.solid, color: Color(0xFFDFDFDF)),
      ),
      errorStyle: const TextStyle(color: Colors.red),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
