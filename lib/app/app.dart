import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/theme/app_theme_dark.dart';
import 'package:shopping_list/app/utils/locales.dart';
import 'package:shopping_list/ui/screens/splash/splash_screen.dart';
import 'navigation/navigation_manager.dart';
import 'navigation/routes.dart';
import 'translations/output/l10n.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final key = GetIt.instance.get<NavigationManager>().navigatorKey;
    return MaterialApp(
      locale: Locale("de"),
      supportedLocales: Locales.languages,
      localizationsDelegates: const [
        S.delegate,
        DefaultWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      theme: darkTheme,
      navigatorKey: key,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      },
    );
  }
}