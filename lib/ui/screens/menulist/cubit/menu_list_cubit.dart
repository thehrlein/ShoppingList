import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/services/respository/menu_repository.dart';

part 'menu_list_cubit.freezed.dart';

part 'menu_list_state.dart';

@Injectable()
class MenuListCubit extends Cubit<MenuListState> {
  final MenuRepository _menuRepository;

  MenuListCubit(this._menuRepository) : super(MenuLoading()) {
    refreshMenuList();
    _menuRepository.getAndListenToMenuPlan().listen((event) {
      emit(MenuListState.loaded(menuPlan: event));
    });
  }

  Future<void> refreshMenuList() {
    return _menuRepository
        .getMenuPlan()
        .then((value) => emit(MenuLoaded(menuPlan: value)));
  }
}
