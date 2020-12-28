import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'inject.config.dart';

@InjectableInit()
Future inject(Environment environment) async {
  final GetIt getter = GetIt.instance;
  final StreamingSharedPreferences sharedPreferences =
      await StreamingSharedPreferences.instance;
  getter.registerSingleton<StreamingSharedPreferences>(sharedPreferences);
  await initHive();
  Intl.defaultLocale = "de";
  $initGetIt(getter, environment: environment.name);
}

Future initHive() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(DbReceiptAdapter());
  // Hive.registerAdapter(DbBookAdapter());
  // await Hive.openBox(ReceiptStorageImpl.savedReceiptsBox);
  // await Hive.openBox(ReceiptStorageImpl.cookedReceiptsBox);
  // await Hive.openBox(ReceiptStorageImpl.newReceiptsBox);
  // await Hive.openBox(BookStorageImpl.myBooksBox);
  // await Hive.openBox(BookStorageImpl.allBooksBox);
  // await Hive.openBox(BookStorageImpl.savedBooksBox);
}
