import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/view/login/service/login_service.dart';

import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginService _service = LoginService();

  bool validate = false;
  bool waiting = false;
  bool register = true;

  @override
  void initState() {
    _service.listenRegister(_response);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    _service.clear();
    super.dispose();
  }

  //Validation
  void onNameChanged(String? text) => enableButton();
  void onEmailChanged(String? text) => enableButton();
  void onPasswordChanged(String? text) => enableButton();

  void enableButton() {
    formKey.currentState!.validate()
        ? setState(() => validate = true)
        : setState(() => validate = false);
  }
  //End Validation

  //Register Button
  void onPressedButton() {
    _service.emitRegister(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    _changeWaiting();
  }

  //Sign In Button
  void onPressedSignIn() {
    setState(() {
      register = !register;
    });
  }

  //Change Waiting Progress
  void _changeWaiting() {
    setState(() {
      waiting = !waiting;
    });
  }

  //Register Response
  void _response(data) {
    if (data['response'] == true) {
      _changeWaiting();
    } else {
      _changeWaiting();
    }
  }
}
