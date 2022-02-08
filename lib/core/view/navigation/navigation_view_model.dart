import 'package:flutter/material.dart';

import '../home/home.dart';
import '../settings/settings.dart';
import 'navigation.dart';

abstract class NavigationViewModel extends State<Navigation> {
  //Navigation Index
  int navIndex = 0;

  //Update Navigation Index
  void setNavIndex(int navIndex) {
    setState(() {
      this.navIndex = navIndex;
    });
  }

  //Icons
  final IconData homeIconData = Icons.home;
  final IconData settingsIconData = Icons.settings;

  //Labels
  String homeLabel = 'Home';
  final String settingsLabel = 'Settings';

  //View List
  List<Widget> views = [
    const Home(),
    const Settings(),
  ];
}
