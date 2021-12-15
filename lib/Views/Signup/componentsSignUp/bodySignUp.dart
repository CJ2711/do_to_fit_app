import 'dart:ui';
import 'package:do_to_fit_app/Views/Login/login.dart';
import 'package:do_to_fit_app/Views/Signup/componentsSignUp/signupBC.dart';
import 'package:do_to_fit_app/Views/Signup/signup_cont.dart';
import 'package:do_to_fit_app/components/account_check.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:do_to_fit_app/model/Classes/usuario.dart';

class BodySignUp extends StatefulWidget {
  final Usuario user;
  BodySignUp({Key? key, required this.user}) : super(key: key);

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  late TextEditingController mailTextController;
  late TextEditingController psswrdTextController;
  late TextEditingController psswrd2TextController;
  late TextEditingController nameSurnameTextController;
  late TextEditingController weightTextController;
  late TextEditingController heightTextController;
  bool psswrdVisibility = true;
  bool goodForm = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    mailTextController = TextEditingController();
    psswrdTextController = TextEditingController();
    psswrd2TextController = TextEditingController();
    nameSurnameTextController = TextEditingController();
    weightTextController = TextEditingController();
    heightTextController = TextEditingController();
    psswrdVisibility = false;
    if (widget.user.getEmail == 'null') {
      mailTextController.clear();
    } else {
      mailTextController.text = widget.user.getEmail;
    }
    if (widget.user.getName == 'null') {
      mailTextController.clear();
    } else {
      nameSurnameTextController.text = widget.user.getName;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SignUpBC(
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
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
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: psswrd2TextController,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  )),
                              hintText: 'Repita su contraseña',
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
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: nameSurnameTextController,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                prefixIcon: new Icon(Icons.person_pin_rounded),
                                hintText: 'Nombre(s) y Apellido(s)'),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: weightTextController,
                            keyboardType: TextInputType.number,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                prefixIcon:
                                    new Icon(Icons.monitor_weight_outlined),
                                hintText: 'Peso (Kg)'),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextFormField(
                            controller: heightTextController,
                            keyboardType: TextInputType.number,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                prefixIcon: new Icon(Icons.height),
                                hintText: 'Altura (cm)'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedButton(
                  text: "SIGUIENTE",
                  press: () {
                    validateForm();
                    if (goodForm == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreenCont(usuario: widget.user);
                          },
                        ),
                      );
                    }
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
        ),
      ),
    );
  }

  void validateForm() {
    String mail = mailTextController.text.trim();
    bool mailFlag = false;
    String psswrd = psswrdTextController.text.trim();
    String psswrd2 = psswrd2TextController.text.trim();
    bool psswrdFlag = false;
    String nameSurname = nameSurnameTextController.text.trim();
    bool nameSurnameFlag = false;
    double weight = double.parse(weightTextController.text.trim());
    bool weightFlag = false;
    double height = double.parse(heightTextController.text.trim());
    bool heightFlag = false;

    if (mail == '' ||
        psswrd == '' ||
        psswrd2 == '' ||
        nameSurname == '' ||
        weightTextController.text.trim() == '' ||
        heightTextController.text.trim() == '') {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text('Debes llenar todos los campos'),
            );
          });
      return;
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mail);
    bool onlyLetters = RegExp('[a-zA-Z]+').hasMatch(nameSurname);

    if (emailValid == false) {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text(
                  'Tienes algo mal con tu correo electronico, veirificalo'),
            );
          });
      mailFlag = false;
      return;
    } else {
      widget.user.setEmail(mail);
      mailFlag = true;
    }

    if (!(psswrd == psswrd2)) {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content:
                  Text('Los campos de contraseña no coinciden, arreglalos'),
            );
          });
      psswrdFlag = false;
      return;
    } else {
      widget.user.setPssword(psswrd);
      psswrdFlag = true;
    }

    if (nameSurname == '' || nameSurname.isEmpty) {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text('No hay datos en el campo de nombre, llenalos'),
            );
          });
      nameSurnameFlag = false;
      return;
    }

    if (onlyLetters == false) {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text('Tu nombre debe tener solo letras, veirificalo'),
            );
          });
      nameSurnameFlag = false;
      return;
    } else {
      widget.user.setName(nameSurname);
      nameSurnameFlag = true;
    }

    if (weight.isNegative || weight.isNaN) {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text('Debes ingresar un peso, veirificalo'),
            );
          });
      weightFlag = false;
      return;
    } else {
      widget.user.setWeight(weight.toString());
      weightFlag = true;
    }

    if (height.isNegative || height.isNaN) {
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text('Debes ingresar una altura, veirificala'),
            );
          });
      heightFlag = false;
      return;
    } else {
      widget.user.setHeight(height.toString());
      heightFlag = true;
    }

    if (mailFlag == true &&
        psswrdFlag == true &&
        nameSurnameFlag == true &&
        weightFlag == true &&
        heightFlag == true) {
      goodForm = true;
    } else {
      goodForm = false;
      showDialog(
          context: context,
          builder: (scaffoldKey) {
            return AlertDialog(
              title: Text('¡Ups!'),
              content: Text('Algo anda mal con el formulario...'),
            );
          });
      return;
    }
  }
}
