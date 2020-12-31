// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../ui/screens/categories/cubit/categories_cubit.dart';
import '../../services/respository/categories/categories_repository.dart';
import '../../services/respository/categories/categories_repository_impl.dart';
import '../../services/datasource/firebase/firestore_datasource.dart';
import '../../services/datasource/firebase/firestore_datasource_impl.dart';
import '../../ui/screens/menudetails/cubit/menu_details_cubit.dart';
import '../../ui/screens/menulist/cubit/menu_list_cubit.dart';
import '../../services/respository/menu/menu_repository.dart';
import '../../services/respository/menu/menu_repository_impl.dart';
import '../navigation/navigation_manager.dart';
import '../../ui/screens/shoppinglist/cubit/shopping_list_cubit.dart';
import '../../services/respository/shoppinglist/shopping_list_repository.dart';
import '../../services/respository/shoppinglist/shopping_list_repository_impl.dart';
import '../../ui/screens/splash/cubit/splash_cubit.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<SplashCubit>(() => SplashCubit());
  gh.factory<MenuDetailsCubit>(() => MenuDetailsCubit(get<MenuRepository>()));
  gh.factory<MenuListCubit>(() => MenuListCubit(get<MenuRepository>()));
  gh.factory<ShoppingListCubit>(
      () => ShoppingListCubit(get<ShoppingListRepository>()));
  gh.factory<CategoriesCubit>(
      () => CategoriesCubit(get<CategoriesRepository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<FirestoreDatasource>(FirestoreDatasourceImpl());
  gh.singleton<MenuRepository>(MenuRepositoryImpl(get<FirestoreDatasource>()));
  gh.singleton<NavigationManager>(NavigationManager());
  gh.singleton<ShoppingListRepository>(
      ShoppingListRepositoryImpl(get<FirestoreDatasource>()));
  gh.singleton<CategoriesRepository>(
      CategoriesRepositoryImpl(get<FirestoreDatasource>()));
  return get;
}
