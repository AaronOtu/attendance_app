import 'package:attendance_app/screens/email_login.dart';
import 'package:attendance_app/screens/login_page.dart';
import 'package:attendance_app/services/auth.dart';
import 'package:attendance_app/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  String? errorMessage = "";
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId; 


  void _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        
        await Auth().createUserWithEmailAndPassword(
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
        );

        
        await _auth.verifyPhoneNumber(
          phoneNumber: _phoneTextController.text.trim(),
          verificationCompleted: (PhoneAuthCredential credential) async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Phone number verified automatically'),
              ),
            );
          },
          verificationFailed: (FirebaseAuthException e) {
            setState(() {
              errorMessage = e.message;
            });
          },
          codeSent: (String verificationId, int? resendToken) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent successfully'),
              ),
            );

            // Store verificationId locally
            this.verificationId = verificationId;

            // Pass the verificationId to LoginPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/ng-etranz-logo.webp'),
                        width: 200,
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "Get On Board",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "Create your profile to start your application",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Full Name",
                    Icons.person_2_outlined,
                    false,
                    _userTextController,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Email",
                    Icons.email_outlined,
                    false,
                    _emailTextController,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Phone Number",
                    Icons.phone_outlined,
                    false,
                    _phoneTextController,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                  ),
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
                    onPressed: _signUp,
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (errorMessage != null && errorMessage!.isNotEmpty)
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Color.fromARGB(179, 17, 16, 16)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EmailLoginPage(), //const LoginPage(verificationId: ''),   
                            ),
                          );
                        },
                        child: const Text(
                          " LOGIN",
                          style: TextStyle(
                            color: Color.fromARGB(255, 14, 13, 13),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
