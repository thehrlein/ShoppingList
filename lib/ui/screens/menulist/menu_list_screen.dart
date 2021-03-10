import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/ui/screens/menulist/cubit/menu_list_cubit.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/ui/widgets/loading.dart';
import 'package:shopping_list/ui/widgets/small_divider.dart';

class MenuListScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menuListTitle),
      ),
      body: AutoBlocProvider<MenuListCubit>(
        child: BlocBuilder<MenuListCubit, MenuListState>(
          builder: (context, state) {
            return state.when(loading: () => SimpleLoadingIndicator(), loaded: (menuPlan) {
              return _showMenuList(menuPlan.plan, context);
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.openMenuDetails(context),
        tooltip: S.of(context).menuListFabTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _showMenuList(List<MenuPlanItem> items, BuildContext context) {
    List<MenuPlanItem> nonNullList = items
        .where((element) => element.day != null)
        .toList();
    return ReorderableListView(
          children: nonNullList
              .map(
                (e) => ListTile(
                  key: Key(e.day.toString()),
                  title: Text(e.day.getLocalizedDay(context)),
                  subtitle: Text(e.dish),
                  trailing: Icon(Icons.menu),
                  onTap: () => Routes.openMenuDetails(context, menuPlanItem: e),
                ),
              )
              .toList(),
          onReorder: (oldIndex, newIndex) => _onReorder(oldIndex, newIndex, context, nonNullList)
    );
  }

  void _onReorder(int oldIndex, int newIndex, BuildContext context, List<MenuPlanItem> items) {
    if (newIndex > oldIndex) newIndex -= 1;
    final MenuPlanItem item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
      _saveNewOrder(context, items);
  }

  void _saveNewOrder(BuildContext context, List<MenuPlanItem> items) {
    context.read<MenuListCubit>().saveNewOrderedList(items);
  }
}
