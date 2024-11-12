/*import 'package:attendance_app/screens/visitor_homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisitorSection extends StatefulWidget {
  const VisitorSection({super.key});

  @override
  State<VisitorSection> createState() => _VisitorSectionState();
}

class _VisitorSectionState extends State<VisitorSection> {
  @override
  Widget build(BuildContext context) {
    // Get the screen's width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.red,
            ),
          ),
        ),
        title: const Text(
          'Visitor Actions',
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05), // 5% of screen height
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.4), // 40% of screen height
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const VisitorPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1, // 10% of screen width
                    vertical: screenHeight * 0.02, // 2% of screen height
                  ),
                ),
                child: const Text('TAP TO SIGN IN'),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // 5% of screen width
                vertical: screenHeight * 0.02, // 2% of screen height
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(154, 35, 34, 34),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015, // 1.5% of screen height
                        ),
                      ),
                      child: const Text('TAP TO SIGN OUT'),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05), // Add spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(154, 35, 34, 34),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015, // 1.5% of screen height
                        ),
                      ),
                      child: const Text('BEEN HERE BEFORE?'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // 3% of screen height
          ],
        ),
      ),
    );
  }
}
*/
import 'package:attendance_app/screens/visitor_homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisitorSection extends StatefulWidget {
  const VisitorSection({super.key});

  @override
  State<VisitorSection> createState() => _VisitorSectionState();
}

class _VisitorSectionState extends State<VisitorSection> {
  @override
  Widget build(BuildContext context) {
    // Get the screen's width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.red,
            ),
          ),
        ),
        title: const Text(
          'Visitor Actions',
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: isLandscape
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First column with buttons
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.05),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const VisitorPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1, // 10% of screen width
                          vertical: screenHeight * 0.02, // 2% of screen height
                        ),
                      ),
                      child: const Text('TAP TO SIGN IN'),
                    ),
                  ),
                  // Second column with buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(154, 35, 34, 34),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  screenHeight * 0.015, // 1.5% of screen height
                            ),
                          ),
                          child: const Text('TAP TO SIGN OUT'),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(154, 35, 34, 34),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  screenHeight * 0.015, // 1.5% of screen height
                            ),
                          ),
                          child: const Text('BEEN HERE BEFORE?'),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(height: screenHeight * 0.05), // 5% of screen height
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.4), // 40% of screen height
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const VisitorPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1, // 10% of screen width
                          vertical: screenHeight * 0.02, // 2% of screen height
                        ),
                      ),
                      child: const Text('TAP TO SIGN IN'),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05, // 5% of screen width
                      vertical: screenHeight * 0.02, // 2% of screen height
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(154, 35, 34, 34),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight *
                                    0.015, // 1.5% of screen height
                              ),
                            ),
                            child: const Text('TAP TO SIGN OUT'),
                          ),
                        ),
                        SizedBox(
                            width: screenWidth *
                                0.05), // Add spacing between buttons
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(154, 35, 34, 34),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight *
                                    0.015, // 1.5% of screen height
                              ),
                            ),
                            child: const Text('BEEN HERE BEFORE?'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // 3% of screen height
                ],
              ),
      ),
    );
  }
}
