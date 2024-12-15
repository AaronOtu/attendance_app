import 'package:flutter/material.dart';

ElevatedButton etzSubmitButton(
  String text, void Function() submit) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(400, 50),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: submit,
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
