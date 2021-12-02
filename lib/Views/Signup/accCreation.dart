import 'package:do_to_fit_app/Views/Signup/signup.dart';
import 'package:do_to_fit_app/api/google_signin_api.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Usuario usuario = new Usuario();
    Future singInGoogle() async {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Inicio de sesión fallido, Usuario no encontrado'),
        ));
        return;
      } else {
        usuario.setEmail(user.email);
        usuario.setName(user.displayName!);
        print(usuario.getEmail);
        print(usuario.getName);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => SignupScreen(
            user: usuario,
          ), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
        ));
      }
    }

    Size size = MediaQuery.of(context)
        .size; //Nos brinda el total del alto y ancho de la pantalla.
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: size.height * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Elige manera de iniciar en DoToFit",
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/fitness-apps.svg",
                height: size.height * 0.5,
              ),
              RoundedButton(
                text: "Con correo electrónico",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupScreen(
                          user: usuario,
                        );
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "Con Google",
                color: Colors.lightBlue.shade50,
                textColor: Colors.black,
                press: () {
                  singInGoogle();
                },
              ),
            ],
          ),
          // ),
        ],
      ),
    );
  }
}
