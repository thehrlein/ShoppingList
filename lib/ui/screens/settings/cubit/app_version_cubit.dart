import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shopping_list/models/settings/app_info.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../models/settings/app_info.dart';
import 'app_version_state.dart';

@Injectable()
class AppVersionCubit extends Cubit<AppVersionState> {
  AppVersionCubit() : super(AppVersionLoading()) {
    _loadPackageInfo();
  }

  void _loadPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    emit(AppVersionLoaded(AppInfo(appVersion, buildNumber)));
  }
}
