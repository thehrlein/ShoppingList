import 'package:flutter/material.dart';
import 'package:shopping_list/app/utils/dimens.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.black12,
  fontFamily: "JetBrainsMono",
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    brightness: Brightness.dark,
    centerTitle: false,
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: FontSizes.font_size_headline_6,
        color: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  tabBarTheme: TabBarTheme(
    labelPadding: EdgeInsets.symmetric(horizontal: Spaces.space_2),
    labelStyle: TextStyle(
        fontFamily: "JetBrainsMono", fontSize: FontSizes.font_size_body_2),
    unselectedLabelStyle: TextStyle(
        fontFamily: "JetBrainsMono", fontSize: FontSizes.font_size_body_2),
    labelColor: Colors.white,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.5,
        style: BorderStyle.solid,
      ),
      insets: EdgeInsets.symmetric(horizontal: Spaces.space_4),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900],
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);
