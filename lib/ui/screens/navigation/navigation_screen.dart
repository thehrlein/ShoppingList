import 'package:flutter/material.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/ui/screens/menulist/menu_list_screen.dart';
import 'package:shopping_list/ui/screens/settings/settings_list_screen.dart';
import 'package:shopping_list/ui/screens/shoppinglist/shopping_list_screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [ShoppingListScreen(), MenuListScreen(), SettingsListScreen()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[12],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: S.of(context).navigationTabShoppingListTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: S.of(context).navigationTabMenuListTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: S.of(context).navigationTabSettingsTitle,
            ),
          ],
          onTap: (index) => onTabTapped(index),
        ),
      ),
    );
  }
}
