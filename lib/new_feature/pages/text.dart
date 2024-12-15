// import 'package:attendance_app/new_feature/constants/colors.dart';
// import 'package:attendance_app/new_feature/pages/first_page.dart';
// import 'package:attendance_app/new_feature/widgets/submit_button.dart';
// import 'package:attendance_app/new_feature/widgets/textformfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MyLogingPage extends ConsumerStatefulWidget {
//   const MyLogingPage({super.key});

//   @override
//   ConsumerState<MyLogingPage> createState() => _MyLogingPageState();
// }

// class _MyLogingPageState extends ConsumerState<MyLogingPage> {
//   final TextEditingController _emailTextController = TextEditingController();
//   final TextEditingController _passwordTextController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFfefefe),
//       appBar: AppBar(
//         backgroundColor: blue,
//         toolbarHeight: 200,
//         flexibleSpace: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Sign in to your',
//                   style: TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold, color: white)),
                     
//               Text('Account',
//                   style: TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold, color: white)),
//               const Text('Sign in to your Account'),
//               //Text.rich(TextSpan())
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//                 key: _formKey,
//                 child: Column(
//                     //mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //           const Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: [
//                       //     Center(
//                       //       child: Image(
//                       //         image: AssetImage('images/ng-etranz-logo.webp'),
//                       //         width: 200,
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       const Text('Welcome Back! 👋🏾'),
//                       etzTextField('aaronotu99@gmail.com', Icons.email_outlined,
//                           false, _emailTextController),
//                       const SizedBox(height: 20),
//                       const SizedBox(height: 15),
//                       etzTextField('Password', Icons.person_2, false,
//                           _passwordTextController),
//                       const SizedBox(height: 50),
//                       Expanded(
//                         child: etzSubmitButton('Login', () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) {
//                               return const EtzFirstPage();
//                             }),
//                           );
//                         }),
//                       )
//                     ])),
//           ),
//         ),
//       ),
//     );
//   }
// }
