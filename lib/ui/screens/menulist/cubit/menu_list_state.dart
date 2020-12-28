part of 'menu_list_cubit.dart';

@freezed
abstract class MenuListState with _$MenuListState {

  const factory MenuListState.loading() = MenuLoading;
  const factory MenuListState.loaded({@required MenuPlan menuPlan}) = MenuLoaded;

}
