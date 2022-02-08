import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/view/splash/splash.dart';
import 'package:flutter_application_1/core/view/theme/themeData/dartk_theme_data.dart';
import 'package:flutter_application_1/core/view/theme/themeData/light_theme_data.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('tr'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const MyApp(),
  ));
}

void initialization(BuildContext context) async {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      themeMode: ThemeMode.light,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Splash(),
    );
  }
}
