import 'package:flutter/material.dart';

ThemeData get darkThemeData => ThemeData.dark().copyWith(
      errorColor: Colors.redAccent,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        suffixIconColor: Colors.white,
      ),
    );
