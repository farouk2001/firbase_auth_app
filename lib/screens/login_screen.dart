import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emilController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {

    await FirebaseAuth.instance.signInWithEmailAndPassword
      (email: _emilController.text.trim(), password: _passwordController.text.trim());
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emilController.dispose();
    _passwordController.dispose();
  }

  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                Image.asset(
                    'images/EMIT.png',
                  height: 150,
                ),
                SizedBox(height: 20,),
                // Title
                Text(
                  'SIGN IN',
                  style: GoogleFonts.robotoCondensed(
                    fontSize :40, fontWeight: FontWeight.bold
                  ),
                ),

                // subtitle
                Text(
                  'Welcome back! Nice to see you again :-)',
                  style: GoogleFonts.robotoCondensed(
                      fontSize :18,
                  ),
                ),
                SizedBox(height: 50,),


                // Emil Textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _emilController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // Password Textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration:  BoxDecoration(
                        color: Colors.amber[900],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                          child: Text(
                              'Sign in',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Text: sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not yet a member? ',
                      style: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.bold,
                     ),
                    ),
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: Text('Sign up Now',
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
