import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback? press;
  const AccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿Aún no tiene una cuenta? " : "¿Ya tiene una cuenta?",
          style: TextStyle(color: Colors.lightBlue),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrese" : "Inicia Sesión",
            style:
                TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
