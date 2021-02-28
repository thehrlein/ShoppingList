import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/services/respository/menu/menu_repository.dart';

part 'menu_list_cubit.freezed.dart';

part 'menu_list_state.dart';

@Injectable()
class MenuListCubit extends Cubit<MenuListState> {
  final MenuRepository _menuRepository;
  StreamSubscription _menuSubscription;

  MenuListCubit(this._menuRepository) : super(MenuLoading()) {
    _menuSubscription =
        _menuRepository.getAndListenToMenuPlan().listen((event) {
          emit(MenuLoaded(menuPlan: event));
        });
  }

  Future<MenuPlan> getMenuListItems() async {
    return _menuRepository
        .getMenuPlan();
  }

  Future<void> refreshMenuList() {
    return _menuRepository
        .getMenuPlan()
        .then((value) => emit(MenuLoaded(menuPlan: value)));
  }

  void saveNewOrderedList(List<MenuPlanItem> items) {
    emit(MenuLoaded(menuPlan: MenuPlan(plan: items)));
    _menuRepository.saveNewOrderedList(items);
  }

  @override
  Future<void> close() {
    _menuRepository.pauseStreamSubscription();
    if (_menuSubscription != null) {
      _menuSubscription.cancel();
      _menuSubscription = null;
    }
    return super.close();
  }
}
