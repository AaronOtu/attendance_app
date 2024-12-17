import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomElevatedButton extends StatelessWidget {
  //final IconData icon;
  final String mainText;
  final String subText; 
  final VoidCallback onPressed; 
  final Color? buttonColor; 

  const CustomElevatedButton({
    super.key,
   // required this.icon,
    required this.mainText,
    required this.subText,
    required this.onPressed,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  const Color.fromARGB(154, 35, 34, 34),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                                  maximumSize: const Size(200, 200)
                        ), 
                        child:  Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right:5.0),
                              child: Row(children: [Icon(FontAwesomeIcons.rotate)],),
                            ),
                           const SizedBox(height: 60),
                            Text(mainText, style: const TextStyle(fontSize: 17)),
                            Text(subText),
                       
                          ],
                        )
                        ),
                     ),
                   );
  }
}


