import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/local/shared_pref.dart';
import 'package:flutter_application_1/core/view/login/login.dart';
import 'package:flutter_application_1/core/view/navigation/navigation.dart';
import 'package:flutter_application_1/core/view/theme/scale_route.dart';

import 'splash.dart';

abstract class SplashViewModel extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkLogged(context);
  }
}

Future<void> checkLogged(BuildContext context) async {
  String? token = await SharedPref().getUserToken;
  if (token == null) {
    Navigator.pushReplacement(
        context, ScaleRoute(page: const Login()));
  } else {
    Navigator.of(context)
        .push(ScaleRoute(page: const Navigation()));
  }
}
