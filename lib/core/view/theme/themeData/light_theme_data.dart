import 'package:flutter/material.dart';

ThemeData get lightThemeData => ThemeData.light().copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        suffixIconColor: Colors.black,
      ),
    );
