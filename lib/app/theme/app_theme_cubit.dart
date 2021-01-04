import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_list/services/settings/settings_manager.dart';

import 'app_theme_dark.dart';
import 'app_theme_light.dart';
import 'app_theme_state.dart';

@Singleton()
class AppThemeCubit extends Cubit<AppThemeState> {
  SettingsManager _settingsManager;

  AppThemeCubit(this._settingsManager) : super(const LoadingThemeState()) {
    _settingsManager.getTheme().then((dark) {
      _emitTheme(dark);
    });
  }

  Future<void> onThemeSelected({@required bool value}) async {
    _settingsManager.setTheme(value).then((_) {
      _emitTheme(value);
    });
  }

  void _emitTheme(bool dark) {
    emit(LoadedThemeState(dark ? darkTheme : lightTheme));
  }
}
