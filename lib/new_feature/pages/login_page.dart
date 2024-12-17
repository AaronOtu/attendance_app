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
  
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginUser(BuildContext context) async {
   
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final notifier = ref.read(userDataProvider.notifier);
        
        await notifier.loginUser(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      } catch (e) {
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
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    // ignore: unused_local_variable
    final isSmallDevice = screenWidth < 360;
    final isTablet = screenWidth >= 600;

   
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
                            color:Colors.black87
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
                      
                      SizedBox(height: screenHeight * 0.17),
                      
                     
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