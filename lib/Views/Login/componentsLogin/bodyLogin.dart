import 'package:do_to_fit_app/Views/Login/componentsLogin/loginBC.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/components/rounded_input_field.dart';
import 'package:do_to_fit_app/components/rounded_password_field.dart';
import 'package:do_to_fit_app/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: size.height * 0.03),
          AccountCheck(press: () {}),
        ],
      ),
    );
  }
}
