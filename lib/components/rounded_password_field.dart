import 'package:do_to_fit_app/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TFUser(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: Colors.lightBlue,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.lightBlue,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
