import 'package:flutter/material.dart';

class EtzElevatedButton extends StatelessWidget {
  final String mainText;
  final Image? buttonIcon;
  final IconData mainIcon;
  final VoidCallback onPressed;

  const EtzElevatedButton({
    super.key,
    required this.mainText,
    required this.onPressed,
    this.buttonIcon,
    this.mainIcon = Icons.check_circle_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 100),
            backgroundColor: const Color(0xFFF9F9F9),
            foregroundColor: const Color(0xFF475467),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Fitted box to ensure image scales perfectly
                buttonIcon != null
                  ? FittedBox(
                      child: SizedBox(
                        width: 50,  // Fixed width
                        height: 50, // Fixed height
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: buttonIcon!,
                          ),
                        ),
                      ),
                    )
                  : Icon(
                      mainIcon,
                      color: const Color(0xFF2384C5),
                      //size: 50, // Match the image size
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(child: Text(mainText)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}