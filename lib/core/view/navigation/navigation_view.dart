import 'package:flutter/material.dart';

import 'navigation_view_model.dart';

class NavigationView extends NavigationViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: views[navIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  BottomNavigationBar buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: navIndex,
      onTap: (value) => setNavIndex(value),
      items: [
        BottomNavigationBarItem(icon: Icon(homeIconData), label: messagesLabel),
        BottomNavigationBarItem(
            icon: Icon(settingsIconData), label: settingsLabel),
      ],
    );
  }
}
