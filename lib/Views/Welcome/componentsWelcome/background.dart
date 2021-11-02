import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
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
            top: -50,
            left: -25,
            child: Image.asset("assets/images/screen-top.png"),
            width: size.width * 0.9,
          ),
          Positioned(
            bottom: -80,
            right: -30,
            child: Image.asset("assets/images/screen-bottom.png"),
            width: size.width,
          ),
          child,
        ],
      ),
    );
  }
}
