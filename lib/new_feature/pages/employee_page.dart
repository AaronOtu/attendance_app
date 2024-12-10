import 'package:attendance_app/new_feature/widgets/etzbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                        bottomRight: Radius.circular(10)
                        ),
                    color: Color(0xFF2384C5),
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

              // Scrollable Container
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
            ],
          ),
        );
      },
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        // First row: 2 buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(mainText: 'Reporting to work', onPressed: () {}),
            EtzElevatedButton(mainText: 'End Of Day', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        // Second row: 2 buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(mainText: 'Office Break', onPressed: () {}),
            EtzElevatedButton(mainText: 'Return from break', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        // Third row: 2 buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(mainText: 'Night Shift', onPressed: () {}),
            EtzElevatedButton(mainText: 'Off-duty Return', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        // Last row: 1 button
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
            onPressed: () {},
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF2384C5),
                  ),
                  SizedBox(height: 10.0),
                  Text("Night"),
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
        // First row: 3 buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(mainText: 'Reporting to work', onPressed: () {}),
            EtzElevatedButton(mainText: 'End Of Day', onPressed: () {}),
            EtzElevatedButton(mainText: 'Night Shift', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        // Second row: 3 buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EtzElevatedButton(mainText: 'Office Break', onPressed: () {}),
            EtzElevatedButton(mainText: 'Return from break', onPressed: () {}),
            EtzElevatedButton(mainText: 'Off-duty Return', onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        // Last row: 1 button
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
            onPressed: () {},
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF2384C5),
                  ),
                  SizedBox(height: 10.0),
                  Text("Night"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
