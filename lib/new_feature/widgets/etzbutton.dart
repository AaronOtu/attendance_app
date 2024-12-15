// import 'package:flutter/material.dart';

// class EtzElevatedButton extends StatelessWidget {
//   final String mainText;
//   final Image? buttonIcon;
//   final IconData mainIcon;
//   final VoidCallback onPressed;

//   const EtzElevatedButton({
//     super.key,
//     required this.mainText,
//     required this.onPressed,
//     this.buttonIcon,
//     this.mainIcon = Icons.check_circle_rounded,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             fixedSize: const Size(150, 100),
//             backgroundColor: const Color(0xFFF9F9F9),
//             foregroundColor: const Color(0xFF475467),
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           onPressed: onPressed,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [

//                 buttonIcon != null
//                   ? FittedBox(
//                       child: SizedBox(
//                         width: 50,
//                         height: 50,
//                         child: Center(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: buttonIcon!,
//                           ),
//                         ),
//                       ),
//                     )
//                   : Icon(
//                       mainIcon,
//                       color: const Color(0xFF2384C5),
//                       //size: 50,
//                     ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Center(child: Text(mainText)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // Use MediaQuery to get device information
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallDevice = screenWidth < 360; // Define small device threshold
    final isLargeDevice = screenWidth > 600;

    // Adaptive sizing
    double buttonWidth = isSmallDevice
        ? screenWidth * 0.35 // Smaller width for small devices
        : isLargeDevice
            ? screenWidth * 0.25 // Larger width for tablets
            : screenWidth * 0.4; // Medium-sized width for most phones

    double buttonHeight = isSmallDevice
        ? 80 // Reduced height for small devices
        : isLargeDevice
            ? 120 // Taller for larger screens
            : 100; // Standard height

    double iconSize = isSmallDevice
        ? 35 // Smaller icon for compact devices
        : isLargeDevice
            ? 60 // Larger icon for tablets
            : 50; // Standard icon size

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mediaQuery.size.width * 0.02,
          vertical: mediaQuery.size.width * 0.02,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(buttonWidth, buttonHeight),
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
                buttonIcon != null
                    ? FittedBox(
                        child: SizedBox(
                          width: iconSize,
                          height: iconSize,
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
                        size: iconSize,
                      ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                FittedBox(
                  child: Text(
                    mainText,
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: isSmallDevice
                            ? 12 // Smaller font for compact devices
                            : isLargeDevice
                                ? 16 // Larger font for tablets
                                : 14, // Standard font size
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
