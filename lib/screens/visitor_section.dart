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
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.angleLeft,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
        title: const Text('Visitor Actions',
            style: TextStyle(color: Colors.red, fontSize: 15)),
        centerTitle: true,
    
        ),
  
        body: 
         Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child:  ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                            return const VisitorPage();
                          }));

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('TAP TO SIGN IN'))
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
                      child: const Text('TAP TO SIGN OUT'),
                    ),
                    ElevatedButton(
                        onPressed: () {
      
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(154, 35, 34, 34),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('BEEN HERE BEFORE?'))
                  ],
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        )
     
    );
  }
}