import 'package:attendance_app/screens/camera_screen.dart';
import 'package:attendance_app/widgets/big_buttons.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class MyFirstHomePage extends StatelessWidget {
  const MyFirstHomePage({super.key});

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
        title: const Text('Events',
            style: TextStyle(color: Colors.red, fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(height: 10),
            Row(children: [
              CustomElevatedButton(
                  mainText: 'Reporting to Work',
                  subText: 'Regular Duty',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const CameraPage()));
                  }),
              CustomElevatedButton(
                  mainText: 'Out of office Duty',
                  subText: 'Regular Duty',
                  onPressed: () {}),
            ]),
            Row(
              children: [
                CustomElevatedButton(
                    mainText: 'Off-duty Return',
                    subText: 'Regular Duty',
                    onPressed: () {}),
                CustomElevatedButton(
                    mainText: 'Office Break',
                    subText: 'Regular Duty',
                    onPressed: () {}),
              ],
            ),
            Row(
              children: [
                CustomElevatedButton(
                    mainText: 'Return from break',
                    subText: 'Regular Duty',
                    onPressed: () {}),
                CustomElevatedButton(
                    mainText: 'End of Day',
                    subText: 'Regular Duty',
                    onPressed: () {}),
              ],
            ),
            Row(
              children: [
                CustomElevatedButton(
                    mainText: 'Night Shift',
                    subText: 'Regular Duty',
                    onPressed: () {}),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
