import "package:flutter/material.dart";
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import "package:flutter/services.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         child:Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                 image: AssetImage('images/ng-etranz-logo.webp'),
                width: 200,
               ),
               const Text('Please enter the verification code sent to you ', style:TextStyle(fontSize:15)),
               const SizedBox(height: 20,),
              OtpTextField(numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled:true,
              )
            ],
           
           ),
         ))
    );
      
  }
}
