import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_list/models/settings/app_info.dart';

part 'app_version_state.freezed.dart';

@freezed
abstract class AppVersionState with _$AppVersionState {
  const factory AppVersionState.loading() = AppVersionLoading;
  const factory AppVersionState.state(AppInfo appInfo) = AppVersionLoaded;
}