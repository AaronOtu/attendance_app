
import 'package:attendance_app/new_feature/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   
    return const MaterialApp(
      title: 'My Flutter App',
       themeMode: ThemeMode.system,
      //theme:ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyLoginPage(),
    );
  }
}
