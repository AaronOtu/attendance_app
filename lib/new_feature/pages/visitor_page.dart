import 'package:attendance_app/new_feature/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EtzVisitorHomePage extends ConsumerStatefulWidget {
  const EtzVisitorHomePage({super.key});

  @override
  ConsumerState<EtzVisitorHomePage> createState() => _EtzVisitorHomePageState();
}

class _EtzVisitorHomePageState extends ConsumerState<EtzVisitorHomePage> {
  TextEditingController fullnameTextController = TextEditingController();
  TextEditingController organisationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  bool light = false;
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
                children: [
           const SizedBox(height: 20),
          etzTextField('Fullname', Icons.person, false, fullnameTextController),
          const SizedBox(height: 20),
          etzTextField(
              'Orrganisation', Icons.person, false, organisationController),
          const SizedBox(height: 20),
          etzTextField(
              'Phone number', Icons.person, false, phoneNumberController),
          const SizedBox(height: 20),
          etzTextField('Host', Icons.person, false, hostController),
          const SizedBox(height: 20),
          etzTextField('Car number', Icons.person, false, carNumberController),
                ],
              ),
        ));
  }
}
