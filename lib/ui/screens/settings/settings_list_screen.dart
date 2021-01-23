import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/theme/app_theme_cubit.dart';
import 'package:shopping_list/app/theme/app_theme_dark.dart';
import 'package:shopping_list/app/theme/app_theme_state.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';

class SettingsListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsListScreenState();
}

class _SettingsListScreenState extends State<SettingsListScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsTitle),
      ),
      body:
          BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
        return state.when(
          loading: () => Container(),
          loaded: (theme) => Padding(
            padding: const EdgeInsets.symmetric(vertical: Spaces.space_4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SettingsGroup(
                  title: S.of(context).settingsGeneralTitle,
                  children: [
                    SimpleSettingsTile(
                      title: S.of(context).settingsGeneralCategoryTitle,
                      subtitle: S.of(context).settingsGeneralCategorySubtitle,
                      enabled: true,
                      leading: Icon(Icons.category),
                      onTap: () => Routes.openCategories(context),
                    ),
                    SimpleSettingsTile(
                      title: S.of(context).settingsGeneralAllItemsTitle,
                      subtitle: S.of(context).settingsGeneralAllItemsSubtitle,
                      enabled: true,
                      leading: Icon(Icons.save),
                      onTap: () => Routes.openAllShoppingItems(context),
                    ),
                  ],
                ),
                SettingsGroup(
                  title: S.of(context).settingsAppearanceTitle,
                  children: [
                    SwitchSettingsTile(
                      title:
                          S.of(context).settingsAppearanceSwitchTitleDarkTheme,
                      settingKey: "key2",
                      enabledLabel: S.of(context).settingsAppearanceThemeDark,
                      disabledLabel: S.of(context).settingsAppearanceThemeLight,
                      defaultValue: theme == darkTheme,
                      onChange: (enabled) {
                        context
                            .read<AppThemeCubit>()
                            .onThemeSelected(value: enabled);
                      },
                    ),
                  ],
                ),
                SettingsGroup(
                  title: S.of(context).settingsInfoTitle,
                  children: [
                    SimpleSettingsTile(
                      title: S.of(context).settingsInfoAppVersion,
                      subtitle: "0.0.1",
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
