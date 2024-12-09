import 'package:flutter/material.dart';

class EtzElevatedButton extends StatelessWidget {
  //final IconData icon;
  final String mainText;

  final VoidCallback onPressed;

  const EtzElevatedButton({
    super.key,
    required this.mainText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 100),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(mainText),
              ],
            ),
          ),
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