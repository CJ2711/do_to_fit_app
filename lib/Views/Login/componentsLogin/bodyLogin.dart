// import 'dart:js';

import 'dart:js';

import 'package:do_to_fit_app/Views/BorrarWhenCJ7TermineHome/Borrar.dart';
import 'package:do_to_fit_app/Views/Login/componentsLogin/loginBC.dart';
import 'package:do_to_fit_app/Views/Welcome/welcome.screen.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/components/rounded_input_field.dart';
import 'package:do_to_fit_app/components/rounded_password_field.dart';
import 'package:do_to_fit_app/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future signIn() async {
      final user = await GoogleSignInApi.login();

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Inicio de sesión fallido'),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BorrarCJ7(user: user), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
        ));
      }
    }

    Size size = MediaQuery.of(context).size;
    return LoginBC(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "INICIO DE SESIÓN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/icons/login_img.svg",
            height: size.height * 0.3,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Correo Electrónico",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "INICIAR SESIÓN",
            press: () {},
          ),
          // RoundedButton(
          //   text: "GOOGLE",
          //   press: () {},
          // ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            label: Text('Inicio de sesión con Google'),
            onPressed: signIn,
          ),
          SizedBox(height: size.height * 0.03),
          AccountCheck(press: () {}),
        ],
      ),
    );
  }

}
