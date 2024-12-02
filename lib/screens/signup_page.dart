import 'package:attendance_app/widgets/textfield.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Row(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              Icons.person_2_outlined,
              false,
              _emailTextController,
            ),
            const SizedBox(height: 20),
            reusableTextField(
              "Password",
              Icons.person_2_outlined,
              false,
              _passwordTextController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: Colors.black,//Colors.blueAccent, 
                foregroundColor: Colors.white, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  color:Colors.white,// Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(color: Color.fromARGB(179, 17, 16, 16)),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const SignUp();
              //     },
              //   ),
              // );
            },
            child: const Text(
              " LOGIN",
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 13, 13),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
            )
          ],
        ),
      ),
    );
  }
}
