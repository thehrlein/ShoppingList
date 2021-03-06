import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/services/respository/menu/menu_repository.dart';

part 'menu_details_cubit.freezed.dart';

part 'menu_details_state.dart';

@Injectable()
class MenuDetailsCubit extends Cubit<MenuDetailsState> {
  final MenuRepository _menuRepository;

  MenuDetailsCubit(this._menuRepository) : super(MenuDetailsLoaded());

  Future<void> saveDish(MenuPlanItem menuPlanItem) {
    emit(MenuDetailsLoading());
    return _menuRepository
        .saveDish(menuPlanItem)
        .then((value) => Future.delayed(Duration(seconds: 2)))
        .then((value) => emit(MenuDetailsLoaded()));
  }

  Future<void> deleteDish(MenuPlanDay day) {
    emit(MenuDetailsLoading());
    return _menuRepository
        .deleteDish(day)
        .then((value) => Future.delayed(Duration(seconds: 2)))
        .then((value) => emit(MenuDetailsLoaded()));
  }
}
