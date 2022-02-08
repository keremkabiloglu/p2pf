import 'package:easy_localization/easy_localization.dart';
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

  Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          flex: 4,
          child: FlutterLogo(
            size: 120,
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildNameInput(),
                    const SizedBox(height: 10),
                    buildEmailInput(),
                    const SizedBox(height: 10),
                    buildPasswordInput(),
                    const SizedBox(height: 10),
                    buildFormButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: buildSignIn(),
        )
      ],
    );
  }

  Widget buildNameInput() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: register
          ? LoginInputName(
              textEditingController: nameController,
              onChanged: onNameChanged,
            )
          : const SizedBox(
              height: 0,
            ),
    );
  }

  LoginInputEmail buildEmailInput() {
    return LoginInputEmail(
      textEditingController: emailController,
      onChanged: onEmailChanged,
    );
  }

  LoginInputPassword buildPasswordInput() {
    return LoginInputPassword(
      textEditingController: passwordController,
      onChanged: onPasswordChanged,
    );
  }

  Widget buildFormButton() {
    return waiting == true
        ? const CircularProgressIndicator()
        : FormButton(
            text: register ? tr('register') : tr('login'),
            onPressed: validate == true ? onPressedButton : null);
  }

  Row buildSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(register ? 'haveAccount' : 'dontHaveAccount').tr(),
        TextButton(
          onPressed: onPressedSignIn,
          child: Text(register ? 'signIn' : 'register').tr(),
        )
      ],
    );
  }
}
