import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({super.key});

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController organisationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  bool light = false;
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.angleLeft,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
        title: const Text('Visitor Actions',
            style: TextStyle(color: Colors.red, fontSize: 15)),
        centerTitle: true,
      ),
      body: ListView(padding: const EdgeInsets.all(30), children: [
        TextField(
            decoration: const InputDecoration(hintText: 'Fullname'),
            controller: fullnameController),
        const SizedBox(height: 40),
        TextField(
            decoration: const InputDecoration(hintText: 'Organisation'),
            controller: organisationController),
        const SizedBox(height: 40),
        TextField(
            decoration: const InputDecoration(hintText: 'Phone number'),
            controller: phoneNumberController),
        const SizedBox(height: 40),
        TextField(
            decoration: const InputDecoration(hintText: 'Host'),
            controller: hostController),
        const SizedBox(height: 40),
        TextField(
          decoration: const InputDecoration(hintText: 'Car Number (GR-789-20)'),
          controller: carNumberController,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Text('Purpose of Visit:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Switch(
              value: light,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(
                  () {
                    light = value;
                  },
                );
              },
            ),
            const Text('Official'),
            Switch(
              value: dark,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(
                  () {
                    dark = value;
                  },
                );
              },
            ),
            const Text('Personal')
          ]),
        ),
        const SizedBox(height: 50),
        const Spacer(),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text('SUBMIT'))
      ]),
    );
  }
}
