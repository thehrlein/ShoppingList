import 'package:injectable/injectable.dart';
import 'package:shopping_list/services/settings/settings_manager.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

@LazySingleton(as: SettingsManager)
class SettingsManagerImpl implements SettingsManager {

  StreamingSharedPreferences preferences;

  SettingsManagerImpl({this.preferences});

  @override
  Future<bool> getTheme() async {
   return preferences.getBool(SettingsManager.themeSettingsKey, defaultValue: false).getValue();
  }

  @override
  Future<void> setTheme(bool dark) async {
    return await preferences.setBool(SettingsManager.themeSettingsKey, dark);
  }

}