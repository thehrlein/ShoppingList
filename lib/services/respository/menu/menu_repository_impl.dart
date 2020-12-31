import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';
import 'package:shopping_list/services/respository/menu/menu_repository.dart';

@Singleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final FirestoreDatasource _firestoreDatasource;

  MenuRepositoryImpl(this._firestoreDatasource);

  @override
  Future<MenuPlan> getMenuPlan() async {
    return _firestoreDatasource.getMenuPlan();
  }

  @override
  Stream<MenuPlan> getAndListenToMenuPlan() {
    return _firestoreDatasource.getAndListenToMenuPlan();
  }

  @override
  Future<void> saveDish(MenuPlanItem menuPlanItem) {
    return _firestoreDatasource.saveDish(menuPlanItem);
  }

  @override
  Future<void> deleteDish(MenuPlanDay day) {
    return _firestoreDatasource.deleteDish(day);
  }
}
