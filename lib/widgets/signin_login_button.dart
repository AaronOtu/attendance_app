import 'package:flutter/material.dart';

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Button background color
        foregroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? "LOG IN" : 'SIGN UP',
        style: const TextStyle(
          color: Colors.black87, 
          fontWeight: FontWeight.bold, 
          fontSize: 16,
        ),
      ),
    ),
  );
}
