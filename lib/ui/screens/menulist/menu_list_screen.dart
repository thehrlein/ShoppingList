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
        .where((element) => element.day != null && element.dish != null)
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
          onReorder: (start, current) => _onReorder(start, current, context, nonNullList)
    );
  }

  void _onReorder(int start, int current, BuildContext context, List<MenuPlanItem> items) {
      if (start < current) {
        int end = current - 1;
        MenuPlanItem startItem = items[start];
        int i = 0;
        int local = start;
        do {
          items[local] = items[++local];
          i++;
        } while (i < end - start);
        items[end] = startItem;
      }
      // dragging from bottom to top
      else if (start > current) {
        MenuPlanItem startItem = items[start];
        for (int i = start; i > current; i--) {
          items[i] = items[i - 1];
        }
        items[current] = startItem;
      }

      items.forEach((element) {
        element.index = items.indexOf(element);
      });
      _saveNewOrder(context, items);
  }

  void _saveNewOrder(BuildContext context, List<MenuPlanItem> items) {
    context.read<MenuListCubit>().saveNewOrderedList(items);
  }
}
