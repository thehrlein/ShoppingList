import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
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
  int _index;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        MenuPlanItem clickedItem =
            ModalRoute.of(context).settings.arguments as MenuPlanItem;
        if (clickedItem != null) {
          _dishController.text = clickedItem.dish;
          _selectedDay = clickedItem.day;
          _index = clickedItem.index;
        }
      });
    });
    super.initState();
  }

  void _onSave() {
    String dish = _dishController.text;
    if (dish.isEmpty) return;
    MenuPlanItem item = MenuPlanItem(index: _index, day: _selectedDay, dish: dish);
    widget.menuDetailsCubit.saveDish(item);
  }

  void _onDelete() {
    widget.menuDetailsCubit
        .deleteDish(_selectedDay)
        .then((value) => _dishController.text = "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menuDetailsTitle),
      ),
      body: BlocBuilder<MenuDetailsCubit, MenuDetailsState>(
        cubit: widget.menuDetailsCubit,
        builder: (context, state) {
          return state.when(
              loading: () => Stack(
                    children: [
                      Center(child: CircularProgressIndicator()),
                      _buildDetailsContent(false),
                    ],
                  ),
              loaded: () => _buildDetailsContent(true));
        },
      ),
    );
  }

  Widget _buildDetailsContent(bool modifiable) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spaces.space_4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).menuDetailsHeadline,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: Spaces.space_6,
            ),
            Padding(
              padding: const EdgeInsets.all(Spaces.space_2),
              child: _DayDropdown(
                onValueChange: (MenuPlanDay day) {
                  _selectedDay = day;
                },
                modifiable: modifiable,
                selectedDay: _selectedDay,
              ),
            ),
            TextField(
              enabled: modifiable,
              controller: _dishController,
              decoration: InputDecoration(
                labelText: S.of(context).menuDetailsInputHint,
              ),
            ),
            SizedBox(
              height: Spaces.space_6,
            ),
            RaisedButton(
              onPressed: () => modifiable ? _onSave() : null,
              child: Text(S.of(context).menuDetailsButtonSave),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: () => modifiable ? _onDelete() : null,
              child: Text(S.of(context).menuDetailsButtonDelete),
            )
          ],
        ),
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
  final Function(MenuPlanDay) onValueChange;
  final bool modifiable;
  final selectedDay;

  _DayDropdown(
      {@required this.onValueChange,
      @required this.modifiable,
      this.selectedDay});

  @override
  State createState() => _DayDropdownState();
}

class _DayDropdownState extends State<_DayDropdown> {
  MenuPlanDay _selectedDay;

  @override
  void initState() {
    super.initState();
    _setSelectedDay(widget.selectedDay ?? MenuPlanDay.monday);
  }

  @override
  void didUpdateWidget(_DayDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDay != widget.selectedDay) {
      _setSelectedDay(widget.selectedDay ?? MenuPlanDay.monday);
    }
  }

  void _setSelectedDay(MenuPlanDay day) {
    widget.onValueChange(day);
    _selectedDay = day;
  }

  void _updateSelectedDay(MenuPlanDay day) {
    setState(() {
      _setSelectedDay(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _selectedDay,
        disabledHint: Text(_selectedDay.getLocalizedDay(context)),
        items: [
          for (var day in MenuPlanDay.values)
            DropdownMenuItem(
              child: Text(day.getLocalizedDay(context)),
              value: day,
            )
        ],
        onChanged: widget.modifiable ? _updateSelectedDay : null);
  }
}
