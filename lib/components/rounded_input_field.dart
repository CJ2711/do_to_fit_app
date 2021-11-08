import 'package:do_to_fit_app/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    // this.icon = Icons.person,
    /*Está comentado para que la clase sea más general y que el icon 
    se coloque en los campos que se vayan a utilizar*/
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TFUser(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.lightBlue),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
