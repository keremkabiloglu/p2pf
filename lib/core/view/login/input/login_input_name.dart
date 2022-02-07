import 'package:flutter/material.dart';

class LoginInputName extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final String labelText = 'Name';
  final String hintText = 'John Doe';
  final int maxLenght = 32;

  const LoginInputName({Key? key, this.textEditingController, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textEditingController,
      keyboardType: TextInputType.name,
      maxLength: maxLenght,
      maxLines: 1,
      autocorrect: false,
      validator: emailValidation,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: const Icon(Icons.person),
          hintText: hintText,
          counterText: ''),
    );
  }

  String? emailValidation(String? input) {
    if (input == null || input == '') {
      return 'This area can not be empty.';
    } else if (input.length < 3) {
      return 'Name lenght should be minimum three letters.';
    } else {
      return null;
    }
  }
}
