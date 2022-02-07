import 'package:flutter/material.dart';

import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;

  onNameChanged(String? text) => enableButton();

  onEmailChanged(String? text) => enableButton();

  onPasswordChanged(String? text) => enableButton();

  enableButton() {
    if (formKey.currentState!.validate()) {
      setState(() => validate = true);
    } else {
      setState(() => validate = false);
    }
  }

  void onPressedRegister() {}

  void onPressedSignIn(){
    
  }
}
