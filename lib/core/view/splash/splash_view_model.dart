import 'package:flutter/material.dart';

import '../../data/local/shared_pref.dart';
import '../login/login.dart';
import '../navigation/navigation.dart';
import '../theme/scale_route.dart';
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
    Navigator.pushReplacement(context, ScaleRoute(page: const Login()));
  } else {
    Navigator.of(context).push(ScaleRoute(page: const Navigation()));
  }
}
