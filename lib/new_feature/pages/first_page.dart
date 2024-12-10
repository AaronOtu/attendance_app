import 'package:attendance_app/new_feature/pages/employee_page.dart';
import 'package:attendance_app/new_feature/pages/visitor_page.dart';
import 'package:attendance_app/new_feature/widgets/etzbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EtzFirstPage extends ConsumerStatefulWidget {
  const EtzFirstPage({super.key});

  @override
  ConsumerState<EtzFirstPage> createState() => _EtzFirstPageState();
}

class _EtzFirstPageState extends ConsumerState<EtzFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(

        children: [
          EtzElevatedButton(mainText: 'Visitor', onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const EtzVisitorHomePage();
                      }),
                    );
          }),
          EtzElevatedButton(mainText: 'Employee', onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const EtzEmployeeHomePage();
                      }),
                    );
           }),
        ],
      )),
    );
  }
}
