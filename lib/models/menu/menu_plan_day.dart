import 'package:flutter/material.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';

enum MenuPlanDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
  ideas
}

extension MenuPlanDayExtension on MenuPlanDay {
  String getLocalizedDay(BuildContext context) {
    switch (this) {
      case MenuPlanDay.tuesday:
        return S.of(context).dayNameTuesday;
      case MenuPlanDay.wednesday:
        return S.of(context).dayNameWednesday;
      case MenuPlanDay.thursday:
        return S.of(context).dayNameThursday;
      case MenuPlanDay.friday:
        return S.of(context).dayNameFriday;
      case MenuPlanDay.saturday:
        return S.of(context).dayNameSaturday;
      case MenuPlanDay.sunday:
        return S.of(context).dayNameSunday;
      case MenuPlanDay.monday:
        return S.of(context).dayNameMonday;
      case MenuPlanDay.ideas:
      default:
        return S.of(context).dayNameIdeas;
    }
  }
}

extension MenuPlanDayStringExtension on String {
  MenuPlanDay getMenuPlanDay() {
    return MenuPlanDay.values
        .firstWhere((element) => element.toString() == this);
  }
}
