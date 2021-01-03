// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'edit_shopping_items_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EditShoppingItemsStateTearOff {
  const _$EditShoppingItemsStateTearOff();

// ignore: unused_element
  EditShoppingItemsLoading loading() {
    return const EditShoppingItemsLoading();
  }

// ignore: unused_element
  EditShoppingItemsLoaded loaded({@required ShoppingList shoppingList}) {
    return EditShoppingItemsLoaded(
      shoppingList: shoppingList,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $EditShoppingItemsState = _$EditShoppingItemsStateTearOff();

/// @nodoc
mixin _$EditShoppingItemsState {
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
    @required TResult loading(EditShoppingItemsLoading value),
    @required TResult loaded(EditShoppingItemsLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(EditShoppingItemsLoading value),
    TResult loaded(EditShoppingItemsLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $EditShoppingItemsStateCopyWith<$Res> {
  factory $EditShoppingItemsStateCopyWith(EditShoppingItemsState value,
          $Res Function(EditShoppingItemsState) then) =
      _$EditShoppingItemsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditShoppingItemsStateCopyWithImpl<$Res>
    implements $EditShoppingItemsStateCopyWith<$Res> {
  _$EditShoppingItemsStateCopyWithImpl(this._value, this._then);

  final EditShoppingItemsState _value;
  // ignore: unused_field
  final $Res Function(EditShoppingItemsState) _then;
}

/// @nodoc
abstract class $EditShoppingItemsLoadingCopyWith<$Res> {
  factory $EditShoppingItemsLoadingCopyWith(EditShoppingItemsLoading value,
          $Res Function(EditShoppingItemsLoading) then) =
      _$EditShoppingItemsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditShoppingItemsLoadingCopyWithImpl<$Res>
    extends _$EditShoppingItemsStateCopyWithImpl<$Res>
    implements $EditShoppingItemsLoadingCopyWith<$Res> {
  _$EditShoppingItemsLoadingCopyWithImpl(EditShoppingItemsLoading _value,
      $Res Function(EditShoppingItemsLoading) _then)
      : super(_value, (v) => _then(v as EditShoppingItemsLoading));

  @override
  EditShoppingItemsLoading get _value =>
      super._value as EditShoppingItemsLoading;
}

/// @nodoc
class _$EditShoppingItemsLoading implements EditShoppingItemsLoading {
  const _$EditShoppingItemsLoading();

  @override
  String toString() {
    return 'EditShoppingItemsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditShoppingItemsLoading);
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
    @required TResult loading(EditShoppingItemsLoading value),
    @required TResult loaded(EditShoppingItemsLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(EditShoppingItemsLoading value),
    TResult loaded(EditShoppingItemsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditShoppingItemsLoading implements EditShoppingItemsState {
  const factory EditShoppingItemsLoading() = _$EditShoppingItemsLoading;
}

/// @nodoc
abstract class $EditShoppingItemsLoadedCopyWith<$Res> {
  factory $EditShoppingItemsLoadedCopyWith(EditShoppingItemsLoaded value,
          $Res Function(EditShoppingItemsLoaded) then) =
      _$EditShoppingItemsLoadedCopyWithImpl<$Res>;
  $Res call({ShoppingList shoppingList});
}

/// @nodoc
class _$EditShoppingItemsLoadedCopyWithImpl<$Res>
    extends _$EditShoppingItemsStateCopyWithImpl<$Res>
    implements $EditShoppingItemsLoadedCopyWith<$Res> {
  _$EditShoppingItemsLoadedCopyWithImpl(EditShoppingItemsLoaded _value,
      $Res Function(EditShoppingItemsLoaded) _then)
      : super(_value, (v) => _then(v as EditShoppingItemsLoaded));

  @override
  EditShoppingItemsLoaded get _value => super._value as EditShoppingItemsLoaded;

  @override
  $Res call({
    Object shoppingList = freezed,
  }) {
    return _then(EditShoppingItemsLoaded(
      shoppingList: shoppingList == freezed
          ? _value.shoppingList
          : shoppingList as ShoppingList,
    ));
  }
}

/// @nodoc
class _$EditShoppingItemsLoaded implements EditShoppingItemsLoaded {
  const _$EditShoppingItemsLoaded({@required this.shoppingList})
      : assert(shoppingList != null);

  @override
  final ShoppingList shoppingList;

  @override
  String toString() {
    return 'EditShoppingItemsState.loaded(shoppingList: $shoppingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditShoppingItemsLoaded &&
            (identical(other.shoppingList, shoppingList) ||
                const DeepCollectionEquality()
                    .equals(other.shoppingList, shoppingList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(shoppingList);

  @override
  $EditShoppingItemsLoadedCopyWith<EditShoppingItemsLoaded> get copyWith =>
      _$EditShoppingItemsLoadedCopyWithImpl<EditShoppingItemsLoaded>(
          this, _$identity);

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
    @required TResult loading(EditShoppingItemsLoading value),
    @required TResult loaded(EditShoppingItemsLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(EditShoppingItemsLoading value),
    TResult loaded(EditShoppingItemsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EditShoppingItemsLoaded implements EditShoppingItemsState {
  const factory EditShoppingItemsLoaded({@required ShoppingList shoppingList}) =
      _$EditShoppingItemsLoaded;

  ShoppingList get shoppingList;
  $EditShoppingItemsLoadedCopyWith<EditShoppingItemsLoaded> get copyWith;
}
