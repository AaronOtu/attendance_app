// import 'package:attendance_app/new_feature/api/providers/users/notifier.dart';
// import 'package:attendance_app/new_feature/constants/colors.dart';
// import 'package:attendance_app/new_feature/pages/first_page.dart';
// import 'package:attendance_app/new_feature/widgets/submit_button.dart';
// import 'package:attendance_app/new_feature/widgets/textformfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MyLogingPage extends ConsumerStatefulWidget {
//   const MyLogingPage({super.key});

//   @override
//   ConsumerState<MyLogingPage> createState() => _MyLogingPageState();
// }

// class _MyLogingPageState extends ConsumerState<MyLogingPage> {
//   final TextEditingController _emailTextController = TextEditingController();
//   final TextEditingController _passwordTextController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _emailTextController.dispose();
//     _passwordTextController.dispose();
//     super.dispose();
//   }

//   Future<void> _loginUser(BuildContext context) async {
  
//     if (_formKey.currentState!.validate()) {
//       final notifier = ref.read(userDataProvider.notifier);
      
      
//       await notifier.loginUser(
//         _emailTextController.text.trim(),
//         _passwordTextController.text.trim(),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//      final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

    
//     final loginState = ref.watch(userDataProvider);

    
//     ref.listen(userDataProvider, (previous, next) {
//       if (next.status == LoginStatus.success) {
        
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const EtzFirstPage()),
//         );
//       } else if (next.status == LoginStatus.error) {
       
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(loginState.errorMessage ?? 'Login failed'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     });

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
//               Padding(
//                 padding:  EdgeInsets.only(top: screenHeight*0.10,bottom: 10),
//                 child: Text('Sign in to your \nAccount',
//                     style: GoogleFonts.outfit(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: white))),
//               ),
             
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
        
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Center(
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
                  
//                     Center(child: Text('Welcome Back! 👋🏾', style:GoogleFonts.outfit(textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
//                     etzTextField(
//                       'Email', 
//                       Icons.email_outlined, 
//                       false, 
//                       _emailTextController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         return null;
//                       }
//                     ),
//                     const SizedBox(height: 20),
//                     etzTextField(
//                       'Password', 
//                       Icons.lock_outline, 
//                       true, 
//                       _passwordTextController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       }
//                     ),
//                     const SizedBox(height: 20),
                    
//                     if (loginState.status == LoginStatus.loading)
//                       const Center(child: CircularProgressIndicator()),
//                     if (loginState.status != LoginStatus.loading)
//                       etzSubmitButton('Login', () => _loginUser(context)),
//                       SizedBox(height: screenHeight*0.05),
//                        Center(
//                          child: Image(
//                                        image: const AssetImage('images/ng-etranz-logo.webp'),
//                                        width: screenWidth*0.50,
//                                      ),
//                        )

//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //👋🏾





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/providers/users/notifier.dart';
import '../constants/colors.dart';
import '../pages/first_page.dart';
import '../widgets/submit_button.dart';
import '../widgets/textformfield.dart';

class MyLoginPage extends ConsumerStatefulWidget {
  const MyLoginPage({super.key});

  @override
  ConsumerState<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends ConsumerState<MyLoginPage> {
  // Use late initialization to improve memory management
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    // Initialize controllers and form key in initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginUser(BuildContext context) async {
    // Unfocus any open keyboards
    FocusScope.of(context).unfocus();

    // Validate form before proceeding
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final notifier = ref.read(userDataProvider.notifier);
        
        await notifier.loginUser(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      } catch (e) {
        // Additional error handling
        _showErrorSnackBar(context, 'An unexpected error occurred');
      }
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery for responsive design
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    // ignore: unused_local_variable
    final isSmallDevice = screenWidth < 360;
    final isTablet = screenWidth >= 600;

    // Watch login state changes
    final loginState = ref.watch(userDataProvider);

    // Listen for login state changes
    ref.listen(userDataProvider, (previous, next) {
      if (next.status == LoginStatus.success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EtzFirstPage()),
        );
      } else if (next.status == LoginStatus.error) {
        _showErrorSnackBar(
          context, 
          loginState.errorMessage ?? 'Login failed'
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFfefefe),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isTablet ? 250 : 200),
        child: AppBar(
          backgroundColor: blue,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in to your \nAccount',
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        fontSize: isTablet ? 30 : 25,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isTablet ? 500 : screenWidth,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back! 👋🏾',
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            fontSize: isTablet ? 24 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      etzTextField(
                        'Email',
                        Icons.email_outlined,
                        false,
                        _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Basic email validation
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      etzTextField(
                        'Password',
                        Icons.lock_outline,
                        true,
                        _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      
                      // Loading indicator or login button
                      loginState.status == LoginStatus.loading
                          ? const CircularProgressIndicator()
                          : etzSubmitButton(
                              'Login', 
                              () => _loginUser(context)
                            ),
                      
                      SizedBox(height: screenHeight * 0.05),
                      
                      // Responsive logo sizing
                      Image(
                        image: const AssetImage('images/ng-etranz-logo.webp'),
                        width: isTablet 
                            ? screenWidth * 0.4 
                            : screenWidth * 0.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}