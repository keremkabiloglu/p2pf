import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/data/local/shared_pref.dart';
import 'core/view/login/login.dart';
import 'core/view/navigation/navigation.dart';
import 'core/view/theme/themeData/dartk_theme_data.dart';
import 'core/view/theme/themeData/light_theme_data.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  bool logged = false;
  if (await SharedPref().getUserToken != null) logged = true;
  FlutterNativeSplash.removeAfter(initialization);
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('tr'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: MyApp(
      logged: logged,
    ),
  ));
}

void initialization(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  final bool logged;
  const MyApp({Key? key, required this.logged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      themeMode: ThemeMode.system,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: logged ? const Navigation() : const Login(),
    );
  }
}
