import 'package:flutter/material.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/ui/screens/categories/categories_screen.dart';
import 'package:shopping_list/ui/screens/menudetails/menu_details_screen.dart';
import 'package:shopping_list/ui/screens/navigation/navigation_screen.dart';
import 'package:shopping_list/ui/screens/shoppingitemdetails/shopping_item_details_screen.dart';
import 'package:shopping_list/ui/screens/splash/splash_screen.dart';

mixin Routes {
  // '/' is the default entry if no home inside material app given
  static const _splash = '/';
  static const _navigation = "/navigation";
  static const _menudetails = "/menudetails";
  static const _shoppingitemdetails = "/shoppingitemdetails";
  static const _categories = "/categories";

  static Map<String, WidgetBuilder> routes = {
    _splash: (context) => SplashScreen(),
    _navigation: (context) => NavigationScreen(),
    _menudetails: (context) => MenuDetailsScreen(),
    _shoppingitemdetails: (context) => ShoppingItemDetailsScreen(),
    _categories: (context) => CategoriesScreen(),
  };

  static void openNavigation({NavigatorState state, bool replace = false}) {
    if (replace) {
      state.pushReplacementNamed(_navigation);
    } else {
      state.pushNamed(_navigation);
    }
  }

  static void openShoppingItemDetails(BuildContext context, ShoppingListValueItem shoppingListValueItem) {
    Navigator.of(context).pushNamed(_shoppingitemdetails, arguments: shoppingListValueItem);
  }

  static void openMenuDetails(BuildContext context, {MenuPlanItem menuPlanItem}) {
    Navigator.of(context).pushNamed(_menudetails, arguments: menuPlanItem);
  }

  static void openCategories(BuildContext context) {
    Navigator.of(context).pushNamed(_categories);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
