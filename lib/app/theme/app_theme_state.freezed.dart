// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AppThemeStateTearOff {
  const _$AppThemeStateTearOff();

// ignore: unused_element
  LoadingThemeState loading() {
    return const LoadingThemeState();
  }

// ignore: unused_element
  LoadedThemeState loaded(ThemeData theme) {
    return LoadedThemeState(
      theme,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AppThemeState = _$AppThemeStateTearOff();

/// @nodoc
mixin _$AppThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(ThemeData theme),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(ThemeData theme),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(LoadingThemeState value),
    @required TResult loaded(LoadedThemeState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(LoadingThemeState value),
    TResult loaded(LoadedThemeState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AppThemeStateCopyWith<$Res> {
  factory $AppThemeStateCopyWith(
          AppThemeState value, $Res Function(AppThemeState) then) =
      _$AppThemeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppThemeStateCopyWithImpl<$Res>
    implements $AppThemeStateCopyWith<$Res> {
  _$AppThemeStateCopyWithImpl(this._value, this._then);

  final AppThemeState _value;
  // ignore: unused_field
  final $Res Function(AppThemeState) _then;
}

/// @nodoc
abstract class $LoadingThemeStateCopyWith<$Res> {
  factory $LoadingThemeStateCopyWith(
          LoadingThemeState value, $Res Function(LoadingThemeState) then) =
      _$LoadingThemeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingThemeStateCopyWithImpl<$Res>
    extends _$AppThemeStateCopyWithImpl<$Res>
    implements $LoadingThemeStateCopyWith<$Res> {
  _$LoadingThemeStateCopyWithImpl(
      LoadingThemeState _value, $Res Function(LoadingThemeState) _then)
      : super(_value, (v) => _then(v as LoadingThemeState));

  @override
  LoadingThemeState get _value => super._value as LoadingThemeState;
}

/// @nodoc
class _$LoadingThemeState implements LoadingThemeState {
  const _$LoadingThemeState();

  @override
  String toString() {
    return 'AppThemeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingThemeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(ThemeData theme),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(ThemeData theme),
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
    @required TResult loading(LoadingThemeState value),
    @required TResult loaded(LoadedThemeState value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(LoadingThemeState value),
    TResult loaded(LoadedThemeState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingThemeState implements AppThemeState {
  const factory LoadingThemeState() = _$LoadingThemeState;
}

/// @nodoc
abstract class $LoadedThemeStateCopyWith<$Res> {
  factory $LoadedThemeStateCopyWith(
          LoadedThemeState value, $Res Function(LoadedThemeState) then) =
      _$LoadedThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeData theme});
}

/// @nodoc
class _$LoadedThemeStateCopyWithImpl<$Res>
    extends _$AppThemeStateCopyWithImpl<$Res>
    implements $LoadedThemeStateCopyWith<$Res> {
  _$LoadedThemeStateCopyWithImpl(
      LoadedThemeState _value, $Res Function(LoadedThemeState) _then)
      : super(_value, (v) => _then(v as LoadedThemeState));

  @override
  LoadedThemeState get _value => super._value as LoadedThemeState;

  @override
  $Res call({
    Object theme = freezed,
  }) {
    return _then(LoadedThemeState(
      theme == freezed ? _value.theme : theme as ThemeData,
    ));
  }
}

/// @nodoc
class _$LoadedThemeState implements LoadedThemeState {
  const _$LoadedThemeState(this.theme) : assert(theme != null);

  @override
  final ThemeData theme;

  @override
  String toString() {
    return 'AppThemeState.loaded(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedThemeState &&
            (identical(other.theme, theme) ||
                const DeepCollectionEquality().equals(other.theme, theme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(theme);

  @override
  $LoadedThemeStateCopyWith<LoadedThemeState> get copyWith =>
      _$LoadedThemeStateCopyWithImpl<LoadedThemeState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(ThemeData theme),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(theme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(ThemeData theme),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(theme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(LoadingThemeState value),
    @required TResult loaded(LoadedThemeState value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(LoadingThemeState value),
    TResult loaded(LoadedThemeState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedThemeState implements AppThemeState {
  const factory LoadedThemeState(ThemeData theme) = _$LoadedThemeState;

  ThemeData get theme;
  $LoadedThemeStateCopyWith<LoadedThemeState> get copyWith;
}
