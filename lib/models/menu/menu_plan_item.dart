import 'package:shopping_list/models/menu/menu_plan_day.dart';

class MenuPlanItem {
  final MenuPlanDay day;
  final String dish;

  MenuPlanItem({this.day, this.dish});

  @override
  String toString() {
    return 'MenuPlanItem{day: $day, dish: $dish}';
  }
}