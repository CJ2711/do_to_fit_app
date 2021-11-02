import 'package:do_to_fit_app/Views/Welcome/welcome.screen.dart';
import 'package:do_to_fit_app/constants.dart';
import 'package:flutter/material.dart';
//import 'Views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}


