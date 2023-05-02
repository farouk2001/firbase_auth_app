import 'package:firbase_auth_app/screens/home_screen.dart';
import 'package:firbase_auth_app/screens/login_screen.dart';
import 'package:firbase_auth_app/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
// home:  Auth(),
      routes: {
        '/':(context) => Auth(),
        'homeScreen':(context) =>   HomeScreen(),
        'signupScreen':(context) =>  SignupScreen(),
        'loginScreen':(context) => LoginScreen(),
      },
    );
  }
}