import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginInputEmail extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final String labelText = tr('email');
  final String hintText = tr('hintEmail');
  final int maxLenght = 64;

  LoginInputEmail({Key? key, this.textEditingController, this.onChanged})
      : super(key: key);

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
          border: Theme.of(context).inputDecorationTheme.border,
          labelText: labelText,
          prefixIcon: const Icon(Icons.email),
          hintText: hintText,
          counterText: ''),
    );
  }

  String? emailValidation(input) {
    if (input == null || input == '') {
      return tr('emptyError');
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input)) {
      return tr('valid', args: [tr('emailLC')]);
    } else {
      return null;
    }
  }
}
