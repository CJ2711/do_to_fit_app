import 'dart:convert';

import 'package:do_to_fit_app/Views/Home/dashboard.dart';
import 'package:do_to_fit_app/Views/Login/login.dart';
import 'package:do_to_fit_app/Views/Signup/componentsSignUp/signupBC.dart';
import 'package:do_to_fit_app/api/dotofit_api.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

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
                  agregarUsuario(widget.usuario);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void agregarUsuario(Usuario usuario) async {
    var data = {
      'name': usuario.getName,
      'email': usuario.getEmail,
      'password': usuario.getPassword,
      'weight': usuario.getWeight.toString(),
      'height': usuario.getHeight.toString(),
      'planType': EnumToString.convertToString(PlanType.GRATUITO),
      'goal': EnumToString.convertToString(usuario.getGoal),
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);
    if (body['success'] == false) {
      // _showMessage('Error al cargar los datos. Vuelve a intentarlo.');
      _showMessage(body['message']);
    } else {
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
                        // return Home(usuario: widget.usuario);
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  _showMessage(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
