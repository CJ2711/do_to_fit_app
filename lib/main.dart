import 'package:do_to_fit_app/Views/Welcome/welcome.screen.dart';
import 'package:do_to_fit_app/constants.dart';
import 'package:flutter/material.dart';
import 'Views/Home/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Do to Fit',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
