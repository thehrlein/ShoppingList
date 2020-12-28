import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/services/respository/menu_repository.dart';

part 'menu_details_cubit.freezed.dart';

part 'menu_details_state.dart';

@Injectable()
class MenuDetailsCubit extends Cubit<MenuDetailsState> {
  final MenuRepository _menuRepository;

  MenuDetailsCubit(this._menuRepository) : super(MenuDetailsLoaded());

  Future<void> saveDish(MenuPlanItem menuPlanItem){
    _menuRepository.saveDish(menuPlanItem);
  }

  Future<void> deleteDish(MenuPlanDay day) {
    return _menuRepository.deleteDish(day);
  }

}
