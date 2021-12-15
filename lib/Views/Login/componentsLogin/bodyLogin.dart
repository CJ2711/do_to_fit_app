import 'dart:convert';

import 'package:do_to_fit_app/Views/Home/dashboard.dart';
import 'package:do_to_fit_app/Views/Login/componentsLogin/loginBC.dart';
import 'package:do_to_fit_app/Views/Signup/accCreation.dart';
import 'package:do_to_fit_app/api/dotofit_api.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:do_to_fit_app/components/rounded_input_field.dart';
import 'package:do_to_fit_app/components/rounded_password_field.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  late TextEditingController mailTextController;
  late TextEditingController psswrdTextController;
  bool psswrdVisibility = false;

  @override
  void initState() {
    super.initState();
    mailTextController = TextEditingController();
    psswrdTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // Usuario usuario = Usuario();

    // Future singInGoogle() async {
    //   final user = await GoogleSignInApi.login();
    //   if (user == null) {
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text('Inicio de sesión fallido, Usuario no encontrado'),
    //     ));
    //     return;
    //   } else {
    //     /* AQUI SE DEBE VER SI EXISTE EL E.MAIL,
    //     comprobar en la BD
    //     y en caso de que sea correto
    //     cargar al usuario con los datos guardados en el servidor.
    //     */
    //     // usuario.setEmail(user.email);
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (context) => Home(
    //           usuario:
    //               usuario), //ESTA ES LA VENTANA QUE SE ABRIRÍA INICIAR SESIÓN
    //     ));
    //   }
    // }

    Size size = MediaQuery.of(context).size;
    return LoginBC(
      child: SafeArea(
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
              // RoundedInputField(
              //   icon: Icons.person,
              //   hintText: "Correo Electrónico",
              //   onChanged: (value) {},
              // ),
              // RoundedPasswordField(
              //   hintText: "Contraseña",
              //   onChanged: (value) {},
              // ),
              TextFormField(
                controller: mailTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    prefixIcon: new Icon(Icons.person),
                    hintText: "Correo Electrónico"),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextFormField(
                controller: psswrdTextController,
                obscureText: !psswrdVisibility,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      )),
                  hintText: 'Contraseña',
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => psswrdVisibility = !psswrdVisibility,
                    ),
                    child: Icon(
                      psswrdVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.blue[300],
                      size: 20,
                    ),
                  ),
                ),
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
                press: () {
                  logeo();
                },
              ),

              //--- Divisor entre "INICIAR SESIÓN" y los Social Login ---/
              // OrDivider(),
              //---------------------------------------------------------/

              //--- Fila de botones de inicio de sesión de Google y Facebook  ---/

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     SocialIcon(
              //       iconSrc: "assets/icons/google.svg",
              //       press: singInGoogle,
              //     ),
              //   ],
              // ),

              SizedBox(height: size.height * 0.03),
              AccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AccCreation();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logeo() async {
    var data = {
      'email': mailTextController.text.trim(),
      'password': psswrdTextController.text.trim()
    };
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == false) {
      // _showMessage(body['message'])
      _showMessage('Correo o contraseña invalida');
    } else {
      // Usuario user = new Usuario.fromJson(body);
      Usuario user = new Usuario();
      user.setEmail(mailTextController.text.trim());
      user.setPssword(psswrdTextController.text.trim());
      // print(user);
      user.setName(body['user']['name']);
      user.setHeight((body['user']['height']).toString());
      user.setWeight((body['user']['weight']).toString());
      user.setPlanType(EnumToString.fromString(
          PlanType.values, (body['user']['planType']))!);
      user.setGoal(
          EnumToString.fromString(Goal.values, (body['user']['goal']))!);
      // print(EnumToString.fromString(Goal.values, (body['Goal']).toString()));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Home(usuario: user);
          },
        ),
      );
    }
  }

  _showMessage(msg) {
    //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
