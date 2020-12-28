import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/app/navigation/navigation_manager.dart';
import 'package:shopping_list/app/navigation/routes.dart';
import 'package:shopping_list/app/translations/output/l10n.dart';
import 'package:shopping_list/app/utils/auto_bloc_provider.dart';
import 'package:shopping_list/app/utils/dimens.dart';

import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = GetIt.instance.get<NavigationManager>().navigatorKey;
    return AutoBlocProvider<SplashCubit>(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Routes.openNavigation(state: key.currentState, replace: true);
            }
          },
          child: Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.all(Spaces.space_8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 100.0,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.all(Spaces.space_2),
                  child: Text(
                    S.of(context).appName,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
