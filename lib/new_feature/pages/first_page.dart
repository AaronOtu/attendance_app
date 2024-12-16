import 'package:attendance_app/new_feature/constants/colors.dart';
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
      backgroundColor: const Color(0xFFf1f3f8),
      appBar: AppBar(
        backgroundColor: blue,
        actions: const [

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Image.asset('images/firstpage.png'),
           
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0, top: 100),
              child: Center(
                  child: Row(
              
                children: [
                  EtzElevatedButton(mainText: 'Visitor',    buttonIcon: Image.asset('images/visitor.png'),onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const EtzVisitorHomePage();
                              }),
                            );
                  }),
                  EtzElevatedButton(mainText: 'Employee',   buttonIcon: Image.asset('images/employee.png'), onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const EtzEmployeeHomePage();
                              }),
                            );
                   }),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
