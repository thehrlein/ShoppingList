part of 'splash_cubit.dart';

@freezed
abstract class SplashState with _$SplashState {

  const factory SplashState.loading() = SplashLoading;
  const factory SplashState.loaded() = SplashLoaded;
}