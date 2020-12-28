// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'menu_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MenuDetailsStateTearOff {
  const _$MenuDetailsStateTearOff();

// ignore: unused_element
  MenuDetailsLoading loading() {
    return const MenuDetailsLoading();
  }

// ignore: unused_element
  MenuDetailsLoaded loaded() {
    return const MenuDetailsLoaded();
  }
}

/// @nodoc
// ignore: unused_element
const $MenuDetailsState = _$MenuDetailsStateTearOff();

/// @nodoc
mixin _$MenuDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(MenuDetailsLoading value),
    @required TResult loaded(MenuDetailsLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(MenuDetailsLoading value),
    TResult loaded(MenuDetailsLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MenuDetailsStateCopyWith<$Res> {
  factory $MenuDetailsStateCopyWith(
          MenuDetailsState value, $Res Function(MenuDetailsState) then) =
      _$MenuDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuDetailsStateCopyWithImpl<$Res>
    implements $MenuDetailsStateCopyWith<$Res> {
  _$MenuDetailsStateCopyWithImpl(this._value, this._then);

  final MenuDetailsState _value;
  // ignore: unused_field
  final $Res Function(MenuDetailsState) _then;
}

/// @nodoc
abstract class $MenuDetailsLoadingCopyWith<$Res> {
  factory $MenuDetailsLoadingCopyWith(
          MenuDetailsLoading value, $Res Function(MenuDetailsLoading) then) =
      _$MenuDetailsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuDetailsLoadingCopyWithImpl<$Res>
    extends _$MenuDetailsStateCopyWithImpl<$Res>
    implements $MenuDetailsLoadingCopyWith<$Res> {
  _$MenuDetailsLoadingCopyWithImpl(
      MenuDetailsLoading _value, $Res Function(MenuDetailsLoading) _then)
      : super(_value, (v) => _then(v as MenuDetailsLoading));

  @override
  MenuDetailsLoading get _value => super._value as MenuDetailsLoading;
}

/// @nodoc
class _$MenuDetailsLoading implements MenuDetailsLoading {
  const _$MenuDetailsLoading();

  @override
  String toString() {
    return 'MenuDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MenuDetailsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(),
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
    @required TResult loading(MenuDetailsLoading value),
    @required TResult loaded(MenuDetailsLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(MenuDetailsLoading value),
    TResult loaded(MenuDetailsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MenuDetailsLoading implements MenuDetailsState {
  const factory MenuDetailsLoading() = _$MenuDetailsLoading;
}

/// @nodoc
abstract class $MenuDetailsLoadedCopyWith<$Res> {
  factory $MenuDetailsLoadedCopyWith(
          MenuDetailsLoaded value, $Res Function(MenuDetailsLoaded) then) =
      _$MenuDetailsLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuDetailsLoadedCopyWithImpl<$Res>
    extends _$MenuDetailsStateCopyWithImpl<$Res>
    implements $MenuDetailsLoadedCopyWith<$Res> {
  _$MenuDetailsLoadedCopyWithImpl(
      MenuDetailsLoaded _value, $Res Function(MenuDetailsLoaded) _then)
      : super(_value, (v) => _then(v as MenuDetailsLoaded));

  @override
  MenuDetailsLoaded get _value => super._value as MenuDetailsLoaded;
}

/// @nodoc
class _$MenuDetailsLoaded implements MenuDetailsLoaded {
  const _$MenuDetailsLoaded();

  @override
  String toString() {
    return 'MenuDetailsState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MenuDetailsLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(MenuDetailsLoading value),
    @required TResult loaded(MenuDetailsLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(MenuDetailsLoading value),
    TResult loaded(MenuDetailsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MenuDetailsLoaded implements MenuDetailsState {
  const factory MenuDetailsLoaded() = _$MenuDetailsLoaded;
}
