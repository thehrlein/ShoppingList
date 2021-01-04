
abstract class SettingsManager {
  static const String themeSettingsKey = "themeSettingsKey";

  Future<void> setTheme(bool dark);
  Future<bool> getTheme();
}