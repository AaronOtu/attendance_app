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
            backgroundColor: const Color(0xFFF9F9F9),
            foregroundColor: const Color(0xFF475467),
            elevation: 10,
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
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF2384C5),
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

