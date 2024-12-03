import 'package:attendance_app/screens/firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:attendance_app/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required String verificationId});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  String? verificationId;
  String? errorMessage;

  bool isOtpSent = false;
  bool isLoading = false;

  void sendOtp() async {
    if (_phoneController.text.trim().isEmpty || !_isValidPhoneNumber(_phoneController.text.trim())) {
      setState(() {
        errorMessage = "Please enter a valid phone number.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await Auth().phoneAuthentication(
        phoneNumber: _phoneController.text.trim(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification succeeded, sign in the user
          await Auth().signInWithCredential(credential);
          // Navigate to the first page
          _navigateToFirstPage();
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            errorMessage = e.message;
            isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            isOtpSent = true;
            this.verificationId = verificationId;
            isLoading = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            this.verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void verifyOtp(String otp) async {
    if (otp.length != 6) {
      setState(() {
        errorMessage = "OTP must be 6 digits.";
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );

      await Auth().signInWithCredential(credential);
      _navigateToFirstPage();
    } catch (e) {
      setState(() {
        errorMessage = "Invalid OTP. Please try again.";
        isLoading = false;
      });
    }
  }

  void _navigateToFirstPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyFirstPage()),
    );
  }

  bool _isValidPhoneNumber(String phone) {
    // Basic validation for phone number format
    final regex = RegExp(r'^\+?\d{10,13}$');
    return regex.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/ng-etranz-logo.webp'),
              width: 200,
            ),
            if (!isOtpSent) ...[
              const Text(
                'Enter your phone number to receive an OTP',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: isLoading ? null : sendOtp,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Send OTP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
            ] else ...[
              const Text(
                'Please enter the OTP sent to your phone',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: verifyOtp,
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const CircularProgressIndicator()
              else if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
