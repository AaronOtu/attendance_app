import 'package:attendance_app/new_feature/pages/camera_screen.dart';
import 'package:attendance_app/new_feature/widgets/etzbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EtzEmployeeHomePage extends ConsumerStatefulWidget {
  const EtzEmployeeHomePage({super.key});

  @override
  ConsumerState<EtzEmployeeHomePage> createState() =>
      _EtzEmployeeHomePageState();
}

class _EtzEmployeeHomePageState extends ConsumerState<EtzEmployeeHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLandscape = constraints.maxWidth > constraints.maxHeight;

        return Scaffold(
          backgroundColor: const Color(0xFFf1f3f8),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 250,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color(0xFF015289),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Let's Clock-In!",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Don't miss your clock in schedule",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'images/clock.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFfefefe),
                  ),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: isLandscape
                          ? _buildLandscapeLayout()
                          : _buildPortraitLayout(),
                    ),
                  ),
                ),
              ),
              /*
              Positioned(
                   top: 700,
                left: 20,
                right: 20,
                  bottom:0,
                child: Center(
                  child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                'images/ng-etranz-logo.webp',
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                ),
              )
              */
            ],
          ),
        );
      },
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(
              mainText: 'Reporting to work',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset(
                'images/report-work.png',
              ),
            ),
            EtzElevatedButton(
              mainText: 'End Of Day',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/end-of-day.png'),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(
              mainText: 'Office Break',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/office-break.png'),
            ),
            EtzElevatedButton(
                mainText: 'Return from break',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraPage()),
                  );
                },
                buttonIcon: Image.asset('images/return-from-break.png')),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(
              mainText: 'Night Shift',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/night.png'),
            ),
            EtzElevatedButton(
                mainText: 'Off-duty Return',
                buttonIcon: Image.asset('images/off-duty-return.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraPage()),
                  );
                }),
          ],
        ),
        const SizedBox(height: 10),
        Center(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraPage()),
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('images/out-of-office-duty.png'),
                        ),
                      ),
                    ),
                  ),
                  // const Icon(
                  //   Icons.check_circle_rounded,
                  //   color: Color(0xFF2384C5),
                  // ),
                  const SizedBox(height: 10.0),
                  FittedBox(
                    child: Text(
                      "Out of Office Duty",
                      style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          // Standard font size
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
        )
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(
              mainText: 'Reporting to work',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/report-work.png'),
            ),
            EtzElevatedButton(
              mainText: 'End Of Day',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/end-of-day.png'),
            ),
            EtzElevatedButton(
              mainText: 'Night Shift',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/night.png'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(
              mainText: 'Office Break',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraPage()),
                );
              },
              buttonIcon: Image.asset('images/office-break.png'),
            ),
            EtzElevatedButton(
                mainText: 'Return from break',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraPage()),
                  );
                },
                buttonIcon: Image.asset('images/return-from-break.png')),
            EtzElevatedButton(
                mainText: 'Off-duty Return',
                buttonIcon: Image.asset('images/off-duty-return.png'),
                onPressed: () {   Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CameraPage()),
        );}),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(240, 105),
              backgroundColor: const Color(0xFFF9F9F9),
              foregroundColor: const Color(0xFF475467),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraPage()),
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('images/out-of-office-duty.png'),
                        ),
                      ),
                    ),
                  ),
                  // const Icon(
                  //   Icons.check_circle_rounded,
                  //   color: Color(0xFF2384C5),
                  // ),
                  const SizedBox(height: 10.0),
                  FittedBox(
                    child: Text(
                      "Out of Office Duty",
                      style: GoogleFonts.outfit(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          // Standard font size
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
        )
      ],
    );
  }
}
