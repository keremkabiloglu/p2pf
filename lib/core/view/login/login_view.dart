import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/view/login/button/form_button.dart';
import 'package:flutter_application_1/core/view/login/input/login_input_email.dart';
import 'package:flutter_application_1/core/view/login/input/login_input_name.dart';
import 'package:flutter_application_1/core/view/login/input/login_input_password.dart';
import 'login_view_model.dart';

class LoginView extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: buildForm(),
    );
  }

  Form buildForm() {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 5),
            const FlutterLogo(size: 120),
            const Spacer(flex: 5),
            buildNameInput(),
            const Spacer(flex: 1),
            buildEmailInput(),
            const Spacer(flex: 1),
            buildPasswordInput(),
            const Spacer(flex: 1),
            buildFormButton(),
            const Spacer(flex: 1),
            buildSignIn(),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormButton() {
    return waiting == true
        ? const CircularProgressIndicator()
        : FormButton(
            text: 'Register',
            onPressed: validate == true ? onPressedRegister : null);
  }

  LoginInputPassword buildPasswordInput() {
    return LoginInputPassword(
      textEditingController: passwordController,
      onChanged: onPasswordChanged,
    );
  }

  LoginInputEmail buildEmailInput() {
    return LoginInputEmail(
      textEditingController: emailController,
      onChanged: onEmailChanged,
    );
  }

  LoginInputName buildNameInput() {
    return LoginInputName(
      textEditingController: nameController,
      onChanged: onNameChanged,
    );
  }

  Row buildSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Do you have an account?'),
        TextButton(
          onPressed: onPressedSignIn,
          child: const Text('Sign In'),
        )
      ],
    );
  }
}
