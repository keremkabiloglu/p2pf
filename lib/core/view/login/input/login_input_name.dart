import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginInputName extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final String labelText = tr('name');
  final String hintText = tr('sampleName');
  final int maxLenght = 32;
  final int minLenght = 3;

  LoginInputName({Key? key, this.textEditingController, this.onChanged})
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
      return tr('emptyError');
    } else if (input.length < minLenght) {
      return tr('lenghtError', args: [minLenght.toString()]);
    } else {
      return null;
    }
  }
}
