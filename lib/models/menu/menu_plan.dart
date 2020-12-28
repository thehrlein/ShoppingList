import 'package:shopping_list/models/menu/menu_plan_item.dart';

class MenuPlan {
  final List<MenuPlanItem> plan;

  MenuPlan({this.plan});

  @override
  String toString() {
    return 'MenuPlan{plan: $plan}';
  }
}