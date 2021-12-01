import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';
import 'componentsSignUp/bodySignUpCont.dart';

class SignUpScreenCont extends StatelessWidget {
  Usuario usuario;
  SignUpScreenCont({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignUpCont(usuario: usuario),
    );
  }
}
