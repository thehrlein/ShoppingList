import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';

abstract class MenuRepository {
  Future<MenuPlan> getMenuPlan();
  Stream<MenuPlan> getAndListenToMenuPlan();
  Future<void> saveDish(MenuPlanItem menuPlanItem);
  Future<void> deleteDish(MenuPlanDay day);
  void pauseStreamSubscription();
}
