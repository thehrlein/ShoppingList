import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class NavigationManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}