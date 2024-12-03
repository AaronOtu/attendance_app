import "package:attendance_app/screens/firstpage.dart";
import "package:attendance_app/widgets/textfield.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(children: [
        const Row(
          children: [
            Image(
              image: AssetImage('images/ng-etranz-logo.webp'),
              width: 200,
            ),
          ],
        ),
        reusableTextField(
            "Email", Icons.email_outlined, false, _emailTextController,
            validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        }),
        const SizedBox(height: 20),
        reusableTextField(
            "Password", Icons.lock_outline, true, _passwordTextController,
            validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        }),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(400, 50),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text,
                )
                    .then((value) {
                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyFirstPage();
                      },
                    ),
                  );
                });
              } on FirebaseAuthException catch (e) {
                setState(() {
                  if (e.code == 'user-not-found') {
                    _errorMessage = 'No user found for that email.';
                  } else if (e.code == 'wrong-password') {
                    _errorMessage = 'Incorrect password.';
                  } else {
                    _errorMessage = 'An error occurred. Please try again.';
                  }
                });
              }
            }
          },
          child: const Text(
            'SIGN UP',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        )
      ]),
    )));
  }
}
