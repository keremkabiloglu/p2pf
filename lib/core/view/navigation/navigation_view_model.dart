import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../messages/messages.dart';
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
  final IconData homeIconData = Icons.chat_bubble;
  final IconData settingsIconData = Icons.settings;

  //Labels
  String messagesLabel = tr('messages');
  final String settingsLabel = tr('settings');

  //View List
  List<Widget> views = [
    const Messages(),
    const Settings(),
  ];
}
