import 'package:flutter/material.dart';

class LoginInputEmail extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final String labelText = 'E-Mail';
  final String hintText = 'example@domain.com';
  final int maxLenght = 64;

  const LoginInputEmail({Key? key, this.textEditingController, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      maxLength: maxLenght,
      maxLines: 1,
      autocorrect: false,
      validator: emailValidation,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: const Icon(Icons.email),
          hintText: hintText,
          counterText: ''),
    );
  }

  String? emailValidation(input) {
    if (input == null || input == '') {
      return 'This area can not be empty.';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input)) {
      return 'You should give a valid email address.';
    } else {
      return null;
    }
  }
}
