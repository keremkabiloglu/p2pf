import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/view/splash/splash.dart';
import 'package:flutter_application_1/core/view/theme/themeData/dartk_theme_data.dart';
import 'package:flutter_application_1/core/view/theme/themeData/light_theme_data.dart';

Future<void> main() async {
  runApp(const MyApp());
}

void splashScreen(BuildContext context) async {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      themeMode: ThemeMode.light,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: Splash(),
    );
  }
}
