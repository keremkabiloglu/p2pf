import 'package:flutter/material.dart';

class LoginInputPassword extends StatefulWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  const LoginInputPassword(
      {Key? key, this.textEditingController, this.onChanged})
      : super(key: key);

  @override
  State<LoginInputPassword> createState() => _LoginInputPasswordState();
}

class _LoginInputPasswordState extends State<LoginInputPassword> {
  final String labelText = 'Password';
  final String hintText = 'Min 8, max 32 characters.';
  final int maxLenght = 32;
  bool obSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        maxLength: maxLenght,
        maxLines: 1,
        obscureText: obSecure,
        autocorrect: false,
        validator: validation,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: const Icon(Icons.lock),
          hintText: hintText,
          counterText: '',
          suffixIcon: buildSuffixIcon(obSecure),
        ));
  }

  String? validation(String? input) {
    if (input == null || input == '') {
      return 'This area can not be empty.';
    } else if (input.length < 8) {
      return 'Password should be minimum 8 characters.';
    } else {
      return null;
    }
  }

  Widget buildSuffixIcon(bool secure) {
    return IconButton(
      onPressed: () {
        setState(() {
          obSecure = !obSecure;
        });
      },
      icon: Icon(secure == true ? Icons.visibility_off : Icons.visibility),
      color: Colors.black,
    );
  }
}
