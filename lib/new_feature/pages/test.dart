import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

//This a test file for designing a UI
class TestPage extends ConsumerStatefulWidget {
  const TestPage({super.key});

  @override
  ConsumerState<TestPage> createState() => _TestPageState();
}

class _TestPageState extends ConsumerState<TestPage> {
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outlined)),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.upload)),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ContainerText(
              height: 200,
              mainText: 'Sleep',
              fontSize: 40,
              hasSubText: true,
              subText: 'by Alison S',
              isbuttonContained: true,
              buttonLabels: const ['Very relaxing', 'Please', 'deep'],
              buttonCallbacks: [
                () => (){},
                () => (){},
                () => (){}
              ],
              onPressed: () {},
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Container(
            //     height: 150,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(15),
            //         color: const Color(0xFF202020)),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(10.0),
            //                 child: Text(
            //                   'Sleep',
            //                   style: GoogleFonts.outfit(
            //                       textStyle: const TextStyle(fontSize: 40)),
            //                 ),
            //               ),
            //               const Padding(
            //                 padding: EdgeInsets.only(top: 15.0, right: 20),
            //                 child: FaIcon(FontAwesomeIcons.angleRight),
            //               ),
            //             ]),
            //         const Row(
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.only(left: 10),
            //               child: TextTest(text: 'by Alison S'),
            //             )
            //           ],
            //         ),
            //         Row(children: [
            //           ElevatedButton(
            //               onPressed: () {},
            //               child: const TextTest(
            //                 text: 'Very relaxing',
            //                 color: Colors.white,
            //               )),
            //           ElevatedButton(
            //               onPressed: () {},
            //               child: const TextTest(
            //                 text: 'Pleasant',
            //                 color: Colors.white,
            //               )),
            //           ElevatedButton(
            //               onPressed: () {},
            //               child: const TextTest(
            //                   text: 'deep', color: Colors.white)),
            //         ])
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: grey,
                ),
                child: const Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 30.0, left: 10),
                            child: TextTest(text: 'Timer', fontSize: 20),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(FontAwesomeIcons.angleRight),
                          )
                        ]),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, left: 10.0),
                          child: TextTest(
                            text: '40 min',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            ContainerText(
              height: 130,
              mainText: 'Foundation',
              fontSize: 20,
              isbuttonContained: true,
              buttonLabels: const ['Relaxation', 'Trance'],
              buttonCallbacks: [
                () => (){},
                () => (){}
              ],
              onPressed: () {},
            ),
            ContainerText(
              height: 150,
              mainText: 'Motive',
              fontSize: 25,
              isbuttonContained: false,
              onPressed: () {},
            )
          ],
        ),
      )),
    );
  }
}
























Color grey = const Color(0xFF202020);

//Custom Widget for the Text
class TextTest extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const TextTest({super.key, required this.text, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.outfit(
          textStyle: TextStyle(color: color, fontSize: fontSize)),
    );
  }
}


//Custom widget for the container
class ContainerText extends StatelessWidget {
  final double height;
  final Color? color;
  final String mainText;
  final String? subText;
  final Row? myRow;
  final double? fontSize;
  final bool? isbuttonContained;
  final bool? hasSubText;
  final VoidCallback onPressed;
  final List<String>? buttonLabels;
  final List<VoidCallback>? buttonCallbacks;

  const ContainerText(
      {super.key,
      required this.height,
      this.color,
      required this.mainText,
      this.subText,
      this.fontSize,
      this.isbuttonContained,
      this.hasSubText,
      required this.onPressed,
      this.buttonLabels,
      this.buttonCallbacks,
      this.myRow});

  @override
  Widget build(BuildContext context) {
    final hasButtons = isbuttonContained ?? false;
    final showSubText = hasSubText ?? false;

    return Padding(
      padding: //const EdgeInsets.all(8.0),
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: TextTest(text: mainText, fontSize: fontSize),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, right: 20.0),
                  child: FaIcon(FontAwesomeIcons.angleRight),
                )
              ],
            ),
            if (showSubText && subText != null)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 17.0),
                    child: TextTest(
                      text: subText!,
                    ),
                  ),
                ],
              ),

            // to show
            if (hasButtons && buttonLabels != null && buttonLabels!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    buttonLabels!.length,
                    (index) => ElevatedButton(
                      onPressed: index < buttonCallbacks!.length
                          ? buttonCallbacks![index]
                          : () {},
                      child: TextTest(
                        text: buttonLabels![index],
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      FittedBox(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:
                                  Image.asset('images/out-of-office-duty.png'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextTest(text: 'POP-EPIC'),
                            TextTest(
                              text: 'Northen Sky',
                              fontSize: 20,
                            )
                          ])
                    ]),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, right: 20.0),
                      child: FaIcon(FontAwesomeIcons.download),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//const SizedBox.shrink()
