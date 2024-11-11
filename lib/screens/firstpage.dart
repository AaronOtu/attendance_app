//import 'package:attendance_app/screens/employee_page.dart';
import 'package:attendance_app/screens/scanner_page.dart';
import 'package:attendance_app/screens/visitor_section.dart';
import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key});

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Text("VISEM"),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Image(image: AssetImage('images/ng-etranz-logo.webp'),width: 200,)
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context){
                          return const VisitorSection();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(154, 35, 34, 34),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('VISITOR'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const QRScannerPage();
                         }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(154, 35, 34, 34),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('EMPLOYEE'))
                  ],
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ));
  }
}
