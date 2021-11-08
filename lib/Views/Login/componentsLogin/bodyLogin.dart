import 'package:do_to_fit_app/Views/BorrarWhenCJ7TermineHome/Borrar.dart';
import 'package:do_to_fit_app/Views/Login/componentsLogin/loginBC.dart';
import 'package:do_to_fit_app/Views/Signup/signup.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/or_divider.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/components/rounded_input_field.dart';
import 'package:do_to_fit_app/components/rounded_password_field.dart';
import 'package:do_to_fit_app/components/social_icons.dart';
import 'package:do_to_fit_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future singInGoogle() async {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Inicio de sesión fallado'),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BorrarCJ7(
              user: user), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
        ));
      }
    }

    Size size = MediaQuery.of(context).size;
    return LoginBC(
      child: SingleChildScrollView(
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
              icon: Icons.person,
              hintText: "Correo Electrónico",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Contraseña",
              onChanged: (value) {},
            ),
            Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationThickness: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
            //---------------------------------//
            SizedBox(height: size.height * 0.02),
            //---------------------------------//

            /* Botón cuasi-universal. 
           * En este caso se usará para el Inicio de sesión. */
            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {},
            ),

            //--- Divisor entre "INICIAR SESIÓN" y los Social Login ---/
            OrDivider(),
            //---------------------------------------------------------/

            //--- Fila de botones de inicio de sesión de Google y Facebook  ---/

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: singInGoogle,
                ),
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
              ],
            ),

            SizedBox(height: size.height * 0.03),
            AccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
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
