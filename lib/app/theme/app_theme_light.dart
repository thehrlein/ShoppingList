import 'package:flutter/material.dart';
import 'package:shopping_list/app/utils/dimens.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.light,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: "JetBrainsMono",
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.black,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    brightness: Brightness.light,
    centerTitle: false,
    elevation: 1,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: FontSizes.font_size_headline_6,
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  tabBarTheme: TabBarTheme(
    labelPadding: EdgeInsets.symmetric(horizontal: Spaces.space_2),
    labelStyle: TextStyle(
        fontFamily: "JetBrainsMono", fontSize: FontSizes.font_size_body_2),
    unselectedLabelStyle: TextStyle(
        fontFamily: "JetBrainsMono", fontSize: FontSizes.font_size_body_2),
    labelColor: Colors.black,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.5,
        style: BorderStyle.solid,
      ),
      insets: EdgeInsets.symmetric(horizontal: Spaces.space_4),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[100],
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
);
