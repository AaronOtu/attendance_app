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

  String _visitType = 'Official';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf1f3f8),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2384C5),
          title: const Text("Visitor Sections"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                etzTextField(
                    'Fullname', Icons.person, false, fullnameTextController),
                const SizedBox(height: 20),
                etzTextField('Organisation', Icons.business, false,
                    organisationController),
                const SizedBox(height: 20),
                etzTextField(
                    'Phone number', Icons.phone, false, phoneNumberController),
                const SizedBox(height: 20),
                etzTextField('Host', Icons.person, false, hostController),
                const SizedBox(height: 20),
                etzTextField('Car number', Icons.directions_car, false,
                    carNumberController),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Purpose of Visit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Official'),
                        value: 'Official',
                        groupValue: _visitType,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              _visitType = value;
                            });
                          }
                        },
                        activeColor: const Color(0xFF2384C5),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Personal'),
                        value: 'Personal',
                        groupValue: _visitType,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              _visitType = value;
                            });
                          }
                        },
                        activeColor: const Color(0xFF2384C5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
