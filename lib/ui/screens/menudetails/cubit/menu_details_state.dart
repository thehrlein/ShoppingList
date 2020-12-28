part of 'menu_details_cubit.dart';

@freezed
abstract class MenuDetailsState with _$MenuDetailsState {

  const factory MenuDetailsState.loading() = MenuDetailsLoading;
  const factory MenuDetailsState.loaded() = MenuDetailsLoaded;

}