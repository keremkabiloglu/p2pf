import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/view/login/service/login_service.dart';

import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate = false;
  bool waiting = false;
  final LoginService _service = LoginService();

  @override
  void initState() {
    super.initState();
    _service.listenRegister(_response);
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
  void onPressedRegister() {
    _service.emitRegister(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    _changeWaiting();
  }

  //Sign In Button
  void onPressedSignIn() {}

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
      print('success');
    } else {
      _changeWaiting();
      print('wrong');
    }
  }
}
