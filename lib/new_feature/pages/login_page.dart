import 'package:attendance_app/new_feature/widgets/submit_button.dart';
import 'package:attendance_app/new_feature/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyLogingPage extends ConsumerStatefulWidget {
  const MyLogingPage({super.key});

  @override
  ConsumerState<MyLogingPage> createState() => _MyLogingPageState();
}

class _MyLogingPageState extends ConsumerState<MyLogingPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Email', style:TextStyle(fontSize:20, color:Color(0xFF858585))),
                  const SizedBox(height: 15),
                  etzTextField('aaronotu99@gmail.com',Icons.email_outlined,false,_emailTextController),
                  const SizedBox(height:20),
                  const Text('Password', style:TextStyle(fontSize:20, color:Color(0xFF858585))),
                  const SizedBox(height: 15),
                  etzTextField('Password',Icons.email_outlined,false,_passwordTextController),
                  const SizedBox(height: 50),
                  etzSubmitButton('Login',(){})
            ])),
          ),
        ),
      ),
    );
  }
}
