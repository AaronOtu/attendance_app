import 'package:attendance_app/widgets/big_buttons.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        title: const Text('Events',
            style: TextStyle(color: Colors.red, fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView(
        children:[ Column(
          children: [
            const SizedBox(height:10),
            Row(
              children: [
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  const Color.fromARGB(154, 35, 34, 34),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                    maximumSize: const Size(200, 200)
                          ), 
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right:5.0),
                                child: Row(children: [Icon(FontAwesomeIcons.rotate)],),
                              ),
                              SizedBox(height: 60),
                              Center(child: Text('Out of Office Duty', style: TextStyle(fontSize: 15))),
                              Text('Regular Duty'),
                         
                            ],
                          )
                          ),
                       ),
                     ),
        
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:  const Color.fromARGB(154, 35, 34, 34),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                    maximumSize: const Size(200, 200)
                          ), 
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right:5.0),
                                child: Row(children: [Icon(FontAwesomeIcons.rotate)],),
                              ),
                              SizedBox(height: 60),
                              Text('Off-duty Return', style: TextStyle(fontSize: 15)),
                              Text('Regular Duty'),
                         
                            ],
                          )
                          ),
                       ),
                     )
                      
              ]         
            ),
        
        
            Row(
              children: [
                CustomElevatedButton( mainText: 'Office Break', subText: 'Regular Duty', onPressed: (){}),
                CustomElevatedButton( mainText: 'Return from Break', subText: 'Regular Duty', onPressed: (){}),
        
              ],
            ),
             Row(
              children: [
                CustomElevatedButton( mainText: 'End of Day', subText: 'Regular Duty', onPressed: (){}),
                CustomElevatedButton( mainText: 'Night Shift', subText: 'Regular Duty', onPressed: (){}),
        
        
              ],
            ),
          ],
        ),
        ]
      ),
    );
  }
}
