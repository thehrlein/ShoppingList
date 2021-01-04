import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_state.freezed.dart';

@freezed
abstract class AppThemeState with _$AppThemeState{
  const factory AppThemeState.loading() = LoadingThemeState;
  const factory AppThemeState.loaded(ThemeData theme) = LoadedThemeState;
}
