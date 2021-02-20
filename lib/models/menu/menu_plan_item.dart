import 'package:shopping_list/models/menu/menu_plan_day.dart';

class MenuPlanItem {
  int index;
  final MenuPlanDay day;
  final String dish;

  MenuPlanItem({this.index, this.day, this.dish});

  @override
  String toString() {
    return 'MenuPlanItem{index: $index, day: $day, dish: $dish}';
  }
}