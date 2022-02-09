import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/local/shared_pref.dart';
import '../login/login.dart';
import '../theme/scale_route.dart';
import 'settings_view_model.dart';

class SettingsView extends SettingsViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('settings').tr(),
          automaticallyImplyLeading: false,
        ),
        body: ElevatedButton(
          child: const Text('X'),
          onPressed: () {
            SharedPref().logOutUser();
            Navigator.pushReplacement(context, ScaleRoute(page: const Login()));
          },
        ),
      ),
    );
  }
}
