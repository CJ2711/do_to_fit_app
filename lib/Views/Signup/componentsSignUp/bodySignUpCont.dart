import 'package:do_to_fit_app/Views/Signup/componentsSignUp/signupBC.dart';
import 'package:do_to_fit_app/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodySignUpCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBC(
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
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "Ahora dinos cuál es tu objetivo al usar DoToFit.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ToggleButtonsGoals(),
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

class ToggleButtonsGoals extends StatefulWidget {
  const ToggleButtonsGoals({Key? key}) : super(key: key);

  @override
  _ToggleButtonsGoalsState createState() => _ToggleButtonsGoalsState();
}

class _ToggleButtonsGoalsState extends State<ToggleButtonsGoals> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) => ToggleButtons(
        isSelected: isSelected,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("Bajar de Peso", style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("Mantenerme", style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text("Subir de Peso", style: TextStyle(fontSize: 18)),
          ),
        ],
        onPressed: (int newIndex) {},
      );
}
