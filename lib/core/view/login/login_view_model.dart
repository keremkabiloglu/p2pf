import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/local/shared_pref.dart';
import 'package:flutter_application_1/core/view/login/service/login_service.dart';
import 'package:flutter_application_1/core/view/theme/scale_route.dart';

import '../navigation/navigation.dart';
import 'login.dart';

abstract class LoginViewModel extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginService _service = LoginService();

  bool validate = false;
  bool waiting = false;
  bool register = false;

  @override
  void initState() {
    _service.listenRegister(_responseRegister);
    _service.listenLogin(_responseLogin);
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
  void onPressedButton() async {
    _changeWaiting();
    if (register) {
      await _service.emitRegister(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text)
          ? null
          : showErrorSnack(message: tr('connectionError'));
    } else {
      await _service.emitLogin(
              email: emailController.text, password: passwordController.text)
          ? null
          : showErrorSnack(message: tr('connectionError'));
    }
  }

  //Error SnackBar
  void showErrorSnack({required String message}) {
    SnackBar _errorSnack = SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        content: const Text('error').tr(args: [message]));
    ScaffoldMessenger.of(context).showSnackBar(_errorSnack);
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
  void _responseRegister(data) async {
    if (data['response'] == true) {
      await SharedPref().saveUserToken(data['token']);
      Navigator.pushReplacement(context, ScaleRoute(page: const Navigation()));
    } else {
      showErrorSnack(message: tr('takenEmail'));
    }
  }

  void _responseLogin(data) async {
    if (data['response'] == true) {
      await SharedPref().saveUserToken(data['token']);
      Navigator.pushReplacement(context, ScaleRoute(page: const Navigation()));
    } else {
      showErrorSnack(message: tr('informationError'));
    }
  }
}
