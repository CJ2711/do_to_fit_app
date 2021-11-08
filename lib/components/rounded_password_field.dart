import 'package:do_to_fit_app/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TFUser(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.lightBlue,
          ),
          hintText: hintText,
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.lightBlue, //PENDIENTE PONER ESTO ABAJO
          ),

          // suffixIcon: IconButton(
          //   onPressed: () {
          //     setState(() {
          //       _isObscure = !_isObscure;
          //     });
          //   },
          //   icon: Icon(
          //     _isObscure ? Icons.visibility_off : Icons.visibility,
          //     color: Colors.lightBlue,
          //   ),
          // ),

          border: InputBorder.none,
        ),
      ),
    );
  }
}