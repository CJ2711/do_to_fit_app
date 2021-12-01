import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';
import 'componentsSignUp/bodySignUp.dart';

class SignupScreen extends StatefulWidget {
  final Usuario user;
  SignupScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignUp(user: widget.user),
    );
  }
}
