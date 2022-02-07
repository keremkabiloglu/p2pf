import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const FormButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
