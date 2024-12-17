import 'package:attendance_app/new_feature/constants/colors.dart';
import 'package:attendance_app/new_feature/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: blue,
          title: Text("Visitor Sections", style: GoogleFonts.outfit()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                etzTextField(
                    'Fullname', FontAwesomeIcons.user, false, fullnameTextController),
                const SizedBox(height: 20),
                etzTextField('Organisation', FontAwesomeIcons.building, false,
                    organisationController),
                const SizedBox(height: 20),
                etzTextField(
                    'Phone number', FontAwesomeIcons.phone, false, phoneNumberController),
                const SizedBox(height: 20),
                etzTextField('Host', FontAwesomeIcons.user, false, hostController),
                const SizedBox(height: 20),
                etzTextField('Car number', FontAwesomeIcons.car, false,
                    carNumberController),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Purpose of Visit',
                    style: GoogleFonts.outfit(textStyle:const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title:  Text('Official',style:GoogleFonts.outfit(textStyle:const TextStyle(
                      // fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ))),
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
                        title: Text('Personal',style:GoogleFonts.outfit(textStyle:const TextStyle(
                      //fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ))),
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
