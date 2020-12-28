
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AutoBlocProvider<BlocType extends Cubit<Object>> extends StatelessWidget {

  final Widget child;
  
  const AutoBlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocType>(
      create: (context) {
        return GetIt.instance.get<BlocType>();
      },
      child: child,
    );
  }
}