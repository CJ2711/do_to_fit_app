import 'package:flutter/material.dart';

class SignUpBC extends StatelessWidget {
  final Widget child;
  const SignUpBC({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/login-top-ph.png",
              width: size.width * 0.45,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login-bottom-ph.png",
              width: size.width * 0.45,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
