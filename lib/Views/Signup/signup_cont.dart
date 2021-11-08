import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'componentsSignUp/signupBC.dart';

class SignUpScreenCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySignUpCont(),
    );
  }
}

class BodySignUpCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBC(
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
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedButton(
            text: "SIGUIENTE",
            press: () {},
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
