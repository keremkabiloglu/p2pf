import 'package:easy_localization/easy_localization.dart';
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
  final String labelText = tr('password');
  final String hintText = tr('minMaxCharacter', args: ['8', '32']);
  final int maxLenght = 32;
  final int minLenght = 8;
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
      return tr('emptyError');
    } else if (input.length < minLenght) {
      return tr('lenghtError', args: [minLenght.toString()]);
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
