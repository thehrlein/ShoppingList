import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/utils/dimens.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/ui/screens/menudetails/cubit/menu_details_cubit.dart';

class MenuDetailsScreen extends StatefulWidget {
  final MenuDetailsCubit menuDetailsCubit =
      GetIt.instance.get<MenuDetailsCubit>();

  @override
  State createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetailsScreen> {
  final _dishController = TextEditingController();
  MenuPlanDay _selectedDay;
  MenuPlanItem _clickedItem;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _clickedItem =
            ModalRoute.of(context).settings.arguments as MenuPlanItem;
        if (_clickedItem != null) {
          _dishController.text = _clickedItem.dish;
          _selectedDay = _clickedItem.day;
        }
      });
    });
  }

  void _onSave() {
    MenuPlanItem item =
        MenuPlanItem(day: _selectedDay, dish: _dishController.text);
    widget.menuDetailsCubit.saveDish(item);
  }

  void _onDelete() {
    widget.menuDetailsCubit.deleteDish(_selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: BlocBuilder<MenuDetailsCubit, MenuDetailsState>(
        cubit: widget.menuDetailsCubit,
        builder: (context, state) {
          return state.when(
            loading: () => Container(),
            loaded: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select day and dish"),
                  Divider(
                    color: Theme.of(context).accentColor,
                  ),
                  _DayDropdown(
                    onValueChange: (MenuPlanDay day) {
                      _selectedDay = day;
                    },
                    menuPlanItem: _clickedItem,
                  ),
                  TextField(
                    controller: _dishController,
                  ),
                  SizedBox(height: Spaces.space_4),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () => _onSave(),
                    child: Text("save"),
                  ),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () => _onDelete(),
                    child: Text("delete"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _dishController.dispose();
    super.dispose();
  }
}

class _DayDropdown extends StatefulWidget {
  final MenuPlanItem menuPlanItem;
  final Function(MenuPlanDay) onValueChange;

  _DayDropdown({@required this.onValueChange, this.menuPlanItem});

  @override
  State createState() => _DayDropdownState();
}

class _DayDropdownState extends State<_DayDropdown> {
  MenuPlanDay _selectedDay;

  @override
  void initState() {
    super.initState();
    _setSelectedDay(widget.menuPlanItem != null
        ? widget.menuPlanItem.day
        : MenuPlanDay.monday);
  }


  @override
  void didUpdateWidget(_DayDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.menuPlanItem != widget.menuPlanItem) {
      _setSelectedDay(widget.menuPlanItem != null
          ? widget.menuPlanItem.day
          : MenuPlanDay.monday);
    }
  }

  void _setSelectedDay(MenuPlanDay day) {
    widget.onValueChange(day);
    _selectedDay = day;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedDay,
      items: [
        for (var day in MenuPlanDay.values)
          DropdownMenuItem(
            child: Text(day.getLocalizedDay(context)),
            value: day,
          )
      ],
      onChanged: (day) {
        setState(() {
          _setSelectedDay(day);
        });
      },
    );
  }
}
