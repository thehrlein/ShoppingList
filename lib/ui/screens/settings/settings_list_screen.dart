import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, state) {
        return state.when(
            loading: () => Container(),
            loaded: (theme) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: Spaces.space_4),
                  child: SettingsList(
                    backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    sections: [
                      SettingsSection(
                        title: S.of(context).settingsSectionGeneralTitle,
                        tiles: [
                          SettingsTile(
                            title: S
                                .of(context)
                                .settingsSectionGeneralCategoryTitle,
                            titleMaxLines: 1,
                            subtitle: S
                                .of(context)
                                .settingsSectionGeneralCategorySubtitle,
                            subtitleMaxLines: 2,
                            leading: Icon(Icons.category),
                            onPressed: (context) =>
                                Routes.openCategories(context),
                          ),
                          SettingsTile(
                            title: S
                                .of(context)
                                .settingsSectionGeneralAllItemsTitle,
                            titleMaxLines: 1,
                            subtitle: S
                                .of(context)
                                .settingsSectionGeneralAllItemsSubtitle,
                            subtitleMaxLines: 2,
                            leading: Icon(Icons.save),
                            onPressed: (context) =>
                                Routes.openAllShoppingItems(context),
                          ),
                        ],
                      ),
                      SettingsSection(
                        title: S.of(context).settingsSectionAppearanceTitle,
                        tiles: [
                          SettingsTile.switchTile(
                            title: S.of(context).settingsSectionAppearanceDarkTheme,
                            onToggle: (value) {
                              context.read<AppThemeCubit>().onThemeSelected(value: value);
                            },
                            switchValue: theme == darkTheme,
                          ),
                        ],
                      )
                    ],
                  ),
                ));
      }),
    );
  }
}
