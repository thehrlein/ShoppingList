import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/ui/screens/menulist/cubit/menu_list_cubit.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';

class MenuListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {

  void _onFabClicked() {
    Routes.openMenuDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    return AutoBlocProvider<MenuListCubit>(
      child: BlocBuilder<MenuListCubit, MenuListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).menuListTitle),
            ),
            body: RefreshIndicator(
              child: state.when(
                loading: () => _showLoading(),
                loaded: (plan) => _showMenuList(plan),
              ),
              onRefresh: () => context.read<MenuListCubit>().refreshMenuList(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _onFabClicked,
              tooltip: S.of(context).menuListFabTooltip,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget _showMenuList(MenuPlan menuPlan) {
    List<MenuPlanItem> nonNullList = menuPlan.plan.where((element) => element.day != null && element.dish != null).toList();
    List<MenuPlanItem> filteredItems = List();
    for (var day in MenuPlanDay.values) {
      MenuPlanItem item = nonNullList.firstWhere((element) => element.day == day, orElse: () => null);
      if (item != null) {
        filteredItems.add(item);
      }
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        MenuPlanItem item = filteredItems[index];
        return _createMenuPlanItem(item);
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: filteredItems.length,
    );
  }

  Widget _createMenuPlanItem(MenuPlanItem item) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[1],
          borderRadius: BorderRadius.circular(Sizes.border_radius_medium),
        ),
        child: Padding(
          padding: EdgeInsets.all(Spaces.space_2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.day.getLocalizedDay(context),
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                item.dish,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
      onTap: () => Routes.openMenuDetails(context, menuPlanItem: item),
    );
  }

  Widget _showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
