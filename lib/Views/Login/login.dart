import 'package:do_to_fit_app/Views/Welcome/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'componentsLogin/bodyLogin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WelcomeScreen();
              },
            ),
          ),
        ),
        title: Text("Inicio de Sesión"),
        centerTitle: true,
      ),
      body: BodyLogin(),
    );
  }
}
