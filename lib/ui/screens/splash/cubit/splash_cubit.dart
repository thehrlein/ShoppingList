import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(SplashLoading()) {
    Future.delayed(Duration(seconds: 1))
        .then((value) => emit(SplashLoaded()));
  }
}
