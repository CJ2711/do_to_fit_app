import 'package:do_to_fit_app/Views/Home/dashboard.dart';
import 'package:do_to_fit_app/Views/Signup/componentsSignUp/bodySignUp.dart';
import 'package:do_to_fit_app/Views/Signup/componentsSignUp/signupBC.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodySignUpCont extends StatefulWidget {
  final Usuario usuario;
  BodySignUpCont({
    Key? key,
    required this.usuario,
  }) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  State<BodySignUpCont> createState() => _BodySignUpContState();
}

class _BodySignUpContState extends State<BodySignUpCont> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SignUpBC(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "OBJETIVOS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SvgPicture.asset(
                "assets/icons/SignUp2.svg",
                height: size.height * 0.3,
              ),
              Text(
                "Ahora dinos cuál es tu objetivo al usar DoToFit.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              RoundedButton(
                  color: Colors.grey,
                  press: () {
                    widget.usuario.setGoal(Goal.BAJAR_PESO);
                    print(widget.usuario);
                  },
                  text: 'Bajar Peso'),
              RoundedButton(
                  color: Colors.grey,
                  press: () {
                    widget.usuario.setGoal(Goal.MANTENERSE);
                    print(widget.usuario);
                  },
                  text: 'Mantenerme'),
              RoundedButton(
                  color: Colors.grey,
                  press: () {
                    widget.usuario.setGoal(Goal.AUMENTAR_MASA);
                    print(widget.usuario);
                  },
                  text: 'Aumentar Masa'),
              SizedBox(
                height: size.height * 0.04,
              ),
              RoundedButton(
                text: "SIGUIENTE",
                press: () {
                  showDialog(
                    context: context,
                    builder: (scaffoldKey) {
                      return AlertDialog(
                        title: Text('Bienvenido a DoToFit'),
                        content: Text(
                            'Ahora tienes un plan gratuito, en cualquier momento podrás actualizar tu plan para tener dietas y/o rutinas personalizadas.'),
                        actions: [
                          RoundedButton(
                            text: '¡Genial!',
                            press: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Home(usuario: widget.usuario);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
