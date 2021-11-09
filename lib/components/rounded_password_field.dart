import 'package:do_to_fit_app/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    //Variable local para que el cambio de estado de la visibilidad de la password cambie.
    var pass = true;
    return TFUser(
      child: TextField(
        obscureText: pass ? _isObscure : false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.lightBlue,
            ),
            hintText: widget.hintText,
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.lightBlue,
                    ),
                  )
                : null,
            border: InputBorder.none),
      ),
    );
  }
}
