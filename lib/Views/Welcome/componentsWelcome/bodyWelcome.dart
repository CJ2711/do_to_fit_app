import 'package:do_to_fit_app/Views/Login/login.dart';
import 'package:do_to_fit_app/Views/Welcome/componentsWelcome/background.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
// import 'package:do_to_fit_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //Nos brinda el total del alto y ancho de la pantalla.
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "BIENVENIDO A DoToFit",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/fitness-apps.svg",
            height: size.height * 0.5,
          ),
          RoundedButton(
            text: "INICIAR SESIÓN",
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
          RoundedButton(
            text: "REGISTRARSE",
            color: Colors.lightBlue.shade50,
            textColor: Colors.black,
            press: () {},
          ),
        ],
      ),
    ));
  }
}
