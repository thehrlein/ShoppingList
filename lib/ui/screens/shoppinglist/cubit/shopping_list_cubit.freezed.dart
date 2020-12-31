// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shopping_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoppingListStateTearOff {
  const _$ShoppingListStateTearOff();

// ignore: unused_element
  ShoppingListLoading loading() {
    return const ShoppingListLoading();
  }

// ignore: unused_element
  ShoppingListLoaded loaded({@required ShoppingList shoppingList}) {
    return ShoppingListLoaded(
      shoppingList: shoppingList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ShoppingListState = _$ShoppingListStateTearOff();

/// @nodoc
mixin _$ShoppingListState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(ShoppingList shoppingList),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(ShoppingList shoppingList),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(ShoppingListLoading value),
    @required TResult loaded(ShoppingListLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(ShoppingListLoading value),
    TResult loaded(ShoppingListLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ShoppingListStateCopyWith<$Res> {
  factory $ShoppingListStateCopyWith(
          ShoppingListState value, $Res Function(ShoppingListState) then) =
      _$ShoppingListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingListStateCopyWithImpl<$Res>
    implements $ShoppingListStateCopyWith<$Res> {
  _$ShoppingListStateCopyWithImpl(this._value, this._then);

  final ShoppingListState _value;
  // ignore: unused_field
  final $Res Function(ShoppingListState) _then;
}

/// @nodoc
abstract class $ShoppingListLoadingCopyWith<$Res> {
  factory $ShoppingListLoadingCopyWith(
          ShoppingListLoading value, $Res Function(ShoppingListLoading) then) =
      _$ShoppingListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingListLoadingCopyWithImpl<$Res>
    extends _$ShoppingListStateCopyWithImpl<$Res>
    implements $ShoppingListLoadingCopyWith<$Res> {
  _$ShoppingListLoadingCopyWithImpl(
      ShoppingListLoading _value, $Res Function(ShoppingListLoading) _then)
      : super(_value, (v) => _then(v as ShoppingListLoading));

  @override
  ShoppingListLoading get _value => super._value as ShoppingListLoading;
}

/// @nodoc
class _$ShoppingListLoading implements ShoppingListLoading {
  const _$ShoppingListLoading();

  @override
  String toString() {
    return 'ShoppingListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShoppingListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(ShoppingList shoppingList),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(ShoppingList shoppingList),
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
    @required TResult loading(ShoppingListLoading value),
    @required TResult loaded(ShoppingListLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(ShoppingListLoading value),
    TResult loaded(ShoppingListLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoppingListLoading implements ShoppingListState {
  const factory ShoppingListLoading() = _$ShoppingListLoading;
}

/// @nodoc
abstract class $ShoppingListLoadedCopyWith<$Res> {
  factory $ShoppingListLoadedCopyWith(
          ShoppingListLoaded value, $Res Function(ShoppingListLoaded) then) =
      _$ShoppingListLoadedCopyWithImpl<$Res>;
  $Res call({ShoppingList shoppingList});
}

/// @nodoc
class _$ShoppingListLoadedCopyWithImpl<$Res>
    extends _$ShoppingListStateCopyWithImpl<$Res>
    implements $ShoppingListLoadedCopyWith<$Res> {
  _$ShoppingListLoadedCopyWithImpl(
      ShoppingListLoaded _value, $Res Function(ShoppingListLoaded) _then)
      : super(_value, (v) => _then(v as ShoppingListLoaded));

  @override
  ShoppingListLoaded get _value => super._value as ShoppingListLoaded;

  @override
  $Res call({
    Object shoppingList = freezed,
  }) {
    return _then(ShoppingListLoaded(
      shoppingList: shoppingList == freezed
          ? _value.shoppingList
          : shoppingList as ShoppingList,
    ));
  }
}

/// @nodoc
class _$ShoppingListLoaded implements ShoppingListLoaded {
  const _$ShoppingListLoaded({@required this.shoppingList})
      : assert(shoppingList != null);

  @override
  final ShoppingList shoppingList;

  @override
  String toString() {
    return 'ShoppingListState.loaded(shoppingList: $shoppingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoppingListLoaded &&
            (identical(other.shoppingList, shoppingList) ||
                const DeepCollectionEquality()
                    .equals(other.shoppingList, shoppingList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(shoppingList);

  @override
  $ShoppingListLoadedCopyWith<ShoppingListLoaded> get copyWith =>
      _$ShoppingListLoadedCopyWithImpl<ShoppingListLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(ShoppingList shoppingList),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(shoppingList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(ShoppingList shoppingList),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(shoppingList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(ShoppingListLoading value),
    @required TResult loaded(ShoppingListLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(ShoppingListLoading value),
    TResult loaded(ShoppingListLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShoppingListLoaded implements ShoppingListState {
  const factory ShoppingListLoaded({@required ShoppingList shoppingList}) =
      _$ShoppingListLoaded;

  ShoppingList get shoppingList;
  $ShoppingListLoadedCopyWith<ShoppingListLoaded> get copyWith;
}
