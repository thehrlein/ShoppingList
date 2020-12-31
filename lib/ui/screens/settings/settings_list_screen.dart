import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/dimens.dart';

class SettingsListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsListScreenState();
}

class _SettingsListScreenState extends State<SettingsListScreen> {
  void _onEditCategoriesClicked(BuildContext context) {
    Routes.openCategories(context);
  }

  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spaces.space_4),
        child: SettingsList(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          sections: [
            SettingsSection(
              title: S.of(context).settingsSectionGeneralTitle,
              tiles: [
                SettingsTile(
                  title: S.of(context).settingsSectionGeneralCategoryTitle,
                  titleMaxLines: 1,
                  subtitle: S.of(context).settingsSectionGeneralCategorySubtitle,
                  subtitleMaxLines: 2,
                  leading: Icon(Icons.category),
                  onPressed: _onEditCategoriesClicked,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
