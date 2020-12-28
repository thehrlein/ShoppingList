// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'menu_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MenuListStateTearOff {
  const _$MenuListStateTearOff();

// ignore: unused_element
  MenuLoading loading() {
    return const MenuLoading();
  }

// ignore: unused_element
  MenuLoaded loaded({@required MenuPlan menuPlan}) {
    return MenuLoaded(
      menuPlan: menuPlan,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MenuListState = _$MenuListStateTearOff();

/// @nodoc
mixin _$MenuListState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(MenuPlan menuPlan),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(MenuPlan menuPlan),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(MenuLoading value),
    @required TResult loaded(MenuLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(MenuLoading value),
    TResult loaded(MenuLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $MenuListStateCopyWith<$Res> {
  factory $MenuListStateCopyWith(
          MenuListState value, $Res Function(MenuListState) then) =
      _$MenuListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuListStateCopyWithImpl<$Res>
    implements $MenuListStateCopyWith<$Res> {
  _$MenuListStateCopyWithImpl(this._value, this._then);

  final MenuListState _value;
  // ignore: unused_field
  final $Res Function(MenuListState) _then;
}

/// @nodoc
abstract class $MenuLoadingCopyWith<$Res> {
  factory $MenuLoadingCopyWith(
          MenuLoading value, $Res Function(MenuLoading) then) =
      _$MenuLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuLoadingCopyWithImpl<$Res> extends _$MenuListStateCopyWithImpl<$Res>
    implements $MenuLoadingCopyWith<$Res> {
  _$MenuLoadingCopyWithImpl(
      MenuLoading _value, $Res Function(MenuLoading) _then)
      : super(_value, (v) => _then(v as MenuLoading));

  @override
  MenuLoading get _value => super._value as MenuLoading;
}

/// @nodoc
class _$MenuLoading implements MenuLoading {
  const _$MenuLoading();

  @override
  String toString() {
    return 'MenuListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MenuLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(MenuPlan menuPlan),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(MenuPlan menuPlan),
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
    @required TResult loading(MenuLoading value),
    @required TResult loaded(MenuLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(MenuLoading value),
    TResult loaded(MenuLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MenuLoading implements MenuListState {
  const factory MenuLoading() = _$MenuLoading;
}

/// @nodoc
abstract class $MenuLoadedCopyWith<$Res> {
  factory $MenuLoadedCopyWith(
          MenuLoaded value, $Res Function(MenuLoaded) then) =
      _$MenuLoadedCopyWithImpl<$Res>;
  $Res call({MenuPlan menuPlan});
}

/// @nodoc
class _$MenuLoadedCopyWithImpl<$Res> extends _$MenuListStateCopyWithImpl<$Res>
    implements $MenuLoadedCopyWith<$Res> {
  _$MenuLoadedCopyWithImpl(MenuLoaded _value, $Res Function(MenuLoaded) _then)
      : super(_value, (v) => _then(v as MenuLoaded));

  @override
  MenuLoaded get _value => super._value as MenuLoaded;

  @override
  $Res call({
    Object menuPlan = freezed,
  }) {
    return _then(MenuLoaded(
      menuPlan: menuPlan == freezed ? _value.menuPlan : menuPlan as MenuPlan,
    ));
  }
}

/// @nodoc
class _$MenuLoaded implements MenuLoaded {
  const _$MenuLoaded({@required this.menuPlan}) : assert(menuPlan != null);

  @override
  final MenuPlan menuPlan;

  @override
  String toString() {
    return 'MenuListState.loaded(menuPlan: $menuPlan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MenuLoaded &&
            (identical(other.menuPlan, menuPlan) ||
                const DeepCollectionEquality()
                    .equals(other.menuPlan, menuPlan)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(menuPlan);

  @override
  $MenuLoadedCopyWith<MenuLoaded> get copyWith =>
      _$MenuLoadedCopyWithImpl<MenuLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(MenuPlan menuPlan),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(menuPlan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(MenuPlan menuPlan),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(menuPlan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(MenuLoading value),
    @required TResult loaded(MenuLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(MenuLoading value),
    TResult loaded(MenuLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MenuLoaded implements MenuListState {
  const factory MenuLoaded({@required MenuPlan menuPlan}) = _$MenuLoaded;

  MenuPlan get menuPlan;
  $MenuLoadedCopyWith<MenuLoaded> get copyWith;
}
