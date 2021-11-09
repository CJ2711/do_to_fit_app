import 'dart:ui';
import 'package:do_to_fit_app/Views/Login/login.dart';
import 'package:do_to_fit_app/Views/Signup/componentsSignUp/signupBC.dart';
import 'package:do_to_fit_app/Views/Signup/signup_cont.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/components/rounded_input_field.dart';
import 'package:do_to_fit_app/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBC(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "REGISTRO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SvgPicture.asset(
              "assets/icons/SignUp.svg",
              height: size.height * 0.2,
            ),
            RoundedInputField(
              icon: Icons.person,
              hintText: "Correo Electrónico",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Contraseña",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Repita su contraseña",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Nombre(s) y Apellido(s)",
              icon: Icons.person_pin_rounded,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Peso",
              icon: Icons.monitor_weight_outlined,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Altura",
              icon: Icons.height,
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "SIGUIENTE",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreenCont();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
