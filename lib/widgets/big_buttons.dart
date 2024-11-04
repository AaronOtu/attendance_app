import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomElevatedButton extends StatelessWidget {
  //final IconData icon; // Icon at the top left corner
  final String mainText; // Main text to display
  final String subText; // Sub text to display
  final VoidCallback onPressed; // Function to call when the button is pressed
  final Color? buttonColor; // Optional button color

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
                        onPressed: (){},
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




































/*import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Define what happens when the button is pressed
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Adjust the border radius if needed
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 10, // Adjust this value to position the icon
            top: 10, // Adjust this value to position the icon
            child: const Icon(
              Icons.star, // Replace with your desired icon
              color: Colors.white, // Change the color if needed
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Main Text', // First text
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 16, // Adjust font size as needed
                ),
              ),
              Text(
                'Sub Text', // Second text
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 14, // Adjust font size as needed
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 */


/* import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData icon; // Icon at the top left corner
  final String mainText; // Main text to display
  final String subText; // Sub text to display
  final VoidCallback onPressed; // Function to call when the button is pressed
  final Color? buttonColor; // Optional button color

  const CustomElevatedButton({
    Key? key,
    required this.icon,
    required this.mainText,
    required this.subText,
    required this.onPressed,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? Colors.blue, // Default to blue if no color is provided
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon at the top left
          Padding(
            padding: const EdgeInsets.only(right: 10), // Space between icon and text
            child: Icon(icon, color: Colors.white),
          ),
          // Text in the center
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/