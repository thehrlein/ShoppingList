// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_version_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppVersionStateTearOff {
  const _$AppVersionStateTearOff();

// ignore: unused_element
  AppVersionLoading loading() {
    return const AppVersionLoading();
  }

// ignore: unused_element
  AppVersionLoaded state(AppInfo appInfo) {
    return AppVersionLoaded(
      appInfo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AppVersionState = _$AppVersionStateTearOff();

/// @nodoc
mixin _$AppVersionState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult state(AppInfo appInfo),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult state(AppInfo appInfo),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(AppVersionLoading value),
    @required TResult state(AppVersionLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(AppVersionLoading value),
    TResult state(AppVersionLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AppVersionStateCopyWith<$Res> {
  factory $AppVersionStateCopyWith(
          AppVersionState value, $Res Function(AppVersionState) then) =
      _$AppVersionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppVersionStateCopyWithImpl<$Res>
    implements $AppVersionStateCopyWith<$Res> {
  _$AppVersionStateCopyWithImpl(this._value, this._then);

  final AppVersionState _value;
  // ignore: unused_field
  final $Res Function(AppVersionState) _then;
}

/// @nodoc
abstract class $AppVersionLoadingCopyWith<$Res> {
  factory $AppVersionLoadingCopyWith(
          AppVersionLoading value, $Res Function(AppVersionLoading) then) =
      _$AppVersionLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppVersionLoadingCopyWithImpl<$Res>
    extends _$AppVersionStateCopyWithImpl<$Res>
    implements $AppVersionLoadingCopyWith<$Res> {
  _$AppVersionLoadingCopyWithImpl(
      AppVersionLoading _value, $Res Function(AppVersionLoading) _then)
      : super(_value, (v) => _then(v as AppVersionLoading));

  @override
  AppVersionLoading get _value => super._value as AppVersionLoading;
}

/// @nodoc
class _$AppVersionLoading implements AppVersionLoading {
  const _$AppVersionLoading();

  @override
  String toString() {
    return 'AppVersionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AppVersionLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult state(AppInfo appInfo),
  }) {
    assert(loading != null);
    assert(state != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult state(AppInfo appInfo),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(AppVersionLoading value),
    @required TResult state(AppVersionLoaded value),
  }) {
    assert(loading != null);
    assert(state != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(AppVersionLoading value),
    TResult state(AppVersionLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AppVersionLoading implements AppVersionState {
  const factory AppVersionLoading() = _$AppVersionLoading;
}

/// @nodoc
abstract class $AppVersionLoadedCopyWith<$Res> {
  factory $AppVersionLoadedCopyWith(
          AppVersionLoaded value, $Res Function(AppVersionLoaded) then) =
      _$AppVersionLoadedCopyWithImpl<$Res>;
  $Res call({AppInfo appInfo});
}

/// @nodoc
class _$AppVersionLoadedCopyWithImpl<$Res>
    extends _$AppVersionStateCopyWithImpl<$Res>
    implements $AppVersionLoadedCopyWith<$Res> {
  _$AppVersionLoadedCopyWithImpl(
      AppVersionLoaded _value, $Res Function(AppVersionLoaded) _then)
      : super(_value, (v) => _then(v as AppVersionLoaded));

  @override
  AppVersionLoaded get _value => super._value as AppVersionLoaded;

  @override
  $Res call({
    Object appInfo = freezed,
  }) {
    return _then(AppVersionLoaded(
      appInfo == freezed ? _value.appInfo : appInfo as AppInfo,
    ));
  }
}

/// @nodoc
class _$AppVersionLoaded implements AppVersionLoaded {
  const _$AppVersionLoaded(this.appInfo) : assert(appInfo != null);

  @override
  final AppInfo appInfo;

  @override
  String toString() {
    return 'AppVersionState.state(appInfo: $appInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppVersionLoaded &&
            (identical(other.appInfo, appInfo) ||
                const DeepCollectionEquality().equals(other.appInfo, appInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(appInfo);

  @override
  $AppVersionLoadedCopyWith<AppVersionLoaded> get copyWith =>
      _$AppVersionLoadedCopyWithImpl<AppVersionLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult state(AppInfo appInfo),
  }) {
    assert(loading != null);
    assert(state != null);
    return state(appInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult state(AppInfo appInfo),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (state != null) {
      return state(appInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(AppVersionLoading value),
    @required TResult state(AppVersionLoaded value),
  }) {
    assert(loading != null);
    assert(state != null);
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(AppVersionLoading value),
    TResult state(AppVersionLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class AppVersionLoaded implements AppVersionState {
  const factory AppVersionLoaded(AppInfo appInfo) = _$AppVersionLoaded;

  AppInfo get appInfo;
  $AppVersionLoadedCopyWith<AppVersionLoaded> get copyWith;
}
