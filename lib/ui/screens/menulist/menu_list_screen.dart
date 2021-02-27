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
  final menuListCubit = GetIt.instance.get<MenuListCubit>();

  @override
  State<StatefulWidget> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  List<MenuPlanItem> _localItems;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadMenuListItems();
  }

  Future<void> _loadMenuListItems() {
    return Future.delayed(Duration.zero)
        .then((value) => widget.menuListCubit.getMenuListItems().then((value) {
              setState(() {
                _loading = false;
                _localItems = value.plan;
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menuListTitle),
      ),
      body: _loading ? SimpleLoadingIndicator() : _showMenuList(_localItems),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Routes.openMenuDetails(context),
        tooltip: S.of(context).menuListFabTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _showMenuList(List<MenuPlanItem> items) {
    List<MenuPlanItem> nonNullList = items
        .where((element) => element.day != null && element.dish != null)
        .toList();
    return RefreshIndicator(
      onRefresh: () => _loadMenuListItems(),
      child: ReorderableListView(
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
          onReorder: _onReorder),
    );
  }

  void _onReorder(int start, int current) {
    setState(() {
      if (start < current) {
        int end = current - 1;
        MenuPlanItem startItem = _localItems[start];
        int i = 0;
        int local = start;
        do {
          _localItems[local] = _localItems[++local];
          i++;
        } while (i < end - start);
        _localItems[end] = startItem;
      }
      // dragging from bottom to top
      else if (start > current) {
        MenuPlanItem startItem = _localItems[start];
        for (int i = start; i > current; i--) {
          _localItems[i] = _localItems[i - 1];
        }
        _localItems[current] = startItem;
      }

      _localItems.forEach((element) {
        element.index = _localItems.indexOf(element);
      });
      _saveNewOrder();
    });
  }

  void _saveNewOrder() {
    widget.menuListCubit.saveNewOrderedList(_localItems);
  }
}
