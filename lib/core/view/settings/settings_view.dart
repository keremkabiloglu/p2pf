import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/local/shared_pref.dart';
import 'package:flutter_application_1/core/view/theme/scale_route.dart';
import '../login/login.dart';
import 'settings_view_model.dart';

class SettingsView extends SettingsViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: const Text('X'),
        onPressed: () {
          SharedPref().logOutUser();
          Navigator.pushReplacement(context, ScaleRoute(page: const Login()));
        },
      ),
    );
  }
}
