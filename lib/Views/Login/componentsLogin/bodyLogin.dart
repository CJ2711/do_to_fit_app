import 'package:do_to_fit_app/Views/BorrarWhenCJ7TermineHome/Borrar.dart';
import 'package:do_to_fit_app/Views/Login/componentsLogin/loginBC.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/components/rounded_input_field.dart';
import 'package:do_to_fit_app/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              hintText: "Correo Electrónico",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
          
            //
            SizedBox(
              height: size.height * 0.02
            ),
            Text(
              '¿Olvidaste tu contraseña?', 
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationThickness: 1,
              ),
            ),
            //

            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {},
            ),
            // RoundedButton(
            //   text: "GOOGLE",
            //   press: () {},
            // ),

            //
            SizedBox(
              height: 20,
            ),
            Text(
              'O inicia sesión con',
              style: subTitle.copyWith(color.Colors.black),
            ),
          
            /**
            * Fila de botones de inicio de sesión de Google y Facebook 
            */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginOption(
                  iconImage: Image(
                    height: 20,
                    width: 20,
                    iconSRC: "assets\images\Logo-Google.png",
                  ),
                  textButton: "Google",
                  onPressed: signIn, //
                ),
                LoginOption(
                  iconImage: Image(
                    height: 20,
                    width: 20,
                    iconSRC: "assets\images\Logo-Facebook.png",
                  ),
                  textButton: "Facebook",
                  onPressed: signIn, //
                ),
              ],
            ),
            //

            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.white,
            //     onPrimary: Colors.black,
            //     minimumSize: Size(double.infinity, 50),
            //   ),
            //   icon: FaIcon(
            //     FontAwesomeIcons.google,
            //     color: Colors.red,
            //   ),
            //   label: Text('Inicio de sesión con Google'),
            //   onPressed: signIn,
            // ),
            SizedBox(height: size.height * 0.03),
            AccountCheck(press: () {}),
          ],
        ),
      )
    );
  }
}

/**
 * Botones de inicio de sesión de Google y Facebook 
 */
class LoginOption extends StatelessWidget {
  final Image iconImage;
  final String textButton;
  final VoidCallback? press; //
  LoginOption({
    @required this.iconImage,
    @required this.textButton
  });
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.03, //PENDIENTE ACOMODAR ESTO CUANDO SE EJECUTE
      width: mediaQuery.width * 0.36, //PENDIENTE ACOMODAR ESTO CUANDO SE EJECUTE
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), 
        border: Border.all(color: Colors.grey[300])
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconImage,
          SizedBox(
            width: 5, 
          ),
          Text(textButton),
        ],
      ),
      onPressed: press, //
    );
  }
}

