import 'package:attendance_app/new_feature/pages/first_page.dart';
import 'package:attendance_app/new_feature/pages/login_page.dart';
import 'package:attendance_app/screens/email_login.dart';
import 'package:attendance_app/screens/firstpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child:MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Flutter App',
      themeMode: ThemeMode.system,
      //theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: EtzFirstPage(),
    );
  }
}

