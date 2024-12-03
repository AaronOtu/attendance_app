import 'package:attendance_app/screens/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());} 


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'My flutter App',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: SignUpPage()
        
    );
  }
}




