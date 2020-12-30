import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/app/utils/constants.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';

@Singleton(as: FirestoreDatasource)
class FirestoreDatasourceImpl implements FirestoreDatasource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference menuRef;
  final StreamController<MenuPlan> _menuPlanController =
      StreamController.broadcast();
  Stream get stream => _menuPlanController.stream;

  FirestoreDatasourceImpl() {
    menuRef = firestore.collection(Constants.COLLECTION_MENU);
  }

  @override
  Future<MenuPlan> getMenuPlan() async {
    List<MenuPlanItem> planItems = List();
    QuerySnapshot querySnapshot = await menuRef.get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String dish = map[Constants.FIELD_DISH];
      planItems.add(MenuPlanItem(day: element.id.getMenuPlanDay(), dish: dish));
    });

    return Future.value(MenuPlan(plan: planItems));
  }

  @override
  Stream<MenuPlan> getAndListenToMenuPlan() {
    menuRef.snapshots().listen((event) {
      List<MenuPlanItem> planItems = List();
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String dish = map[Constants.FIELD_DISH];
        planItems
            .add(MenuPlanItem(day: element.id.getMenuPlanDay(), dish: dish));
      });
      _menuPlanController.add(MenuPlan(plan: planItems));
    });
    return stream;
  }

  @override
  Future<void> saveDish(MenuPlanItem menuPlanItem) {
    return menuRef.doc(menuPlanItem.day.toString()).set(
        {Constants.FIELD_DISH: menuPlanItem.dish}, SetOptions(merge: true));
  }

  @override
  Future<void> deleteDish(MenuPlanDay day) {
    return menuRef
        .doc(day.toString())
        .update({Constants.FIELD_DISH: FieldValue.delete()});
  }
}
