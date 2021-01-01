// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shopping_item_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoppingItemDetailsStateTearOff {
  const _$ShoppingItemDetailsStateTearOff();

// ignore: unused_element
  ShoppingItemDetailsLoading loading() {
    return const ShoppingItemDetailsLoading();
  }

// ignore: unused_element
  ShoppingItemDetailsLoaded loaded({@required List<Category> categories}) {
    return ShoppingItemDetailsLoaded(
      categories: categories,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ShoppingItemDetailsState = _$ShoppingItemDetailsStateTearOff();

/// @nodoc
mixin _$ShoppingItemDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(List<Category> categories),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(List<Category> categories),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(ShoppingItemDetailsLoading value),
    @required TResult loaded(ShoppingItemDetailsLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(ShoppingItemDetailsLoading value),
    TResult loaded(ShoppingItemDetailsLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ShoppingItemDetailsStateCopyWith<$Res> {
  factory $ShoppingItemDetailsStateCopyWith(ShoppingItemDetailsState value,
          $Res Function(ShoppingItemDetailsState) then) =
      _$ShoppingItemDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingItemDetailsStateCopyWithImpl<$Res>
    implements $ShoppingItemDetailsStateCopyWith<$Res> {
  _$ShoppingItemDetailsStateCopyWithImpl(this._value, this._then);

  final ShoppingItemDetailsState _value;
  // ignore: unused_field
  final $Res Function(ShoppingItemDetailsState) _then;
}

/// @nodoc
abstract class $ShoppingItemDetailsLoadingCopyWith<$Res> {
  factory $ShoppingItemDetailsLoadingCopyWith(ShoppingItemDetailsLoading value,
          $Res Function(ShoppingItemDetailsLoading) then) =
      _$ShoppingItemDetailsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingItemDetailsLoadingCopyWithImpl<$Res>
    extends _$ShoppingItemDetailsStateCopyWithImpl<$Res>
    implements $ShoppingItemDetailsLoadingCopyWith<$Res> {
  _$ShoppingItemDetailsLoadingCopyWithImpl(ShoppingItemDetailsLoading _value,
      $Res Function(ShoppingItemDetailsLoading) _then)
      : super(_value, (v) => _then(v as ShoppingItemDetailsLoading));

  @override
  ShoppingItemDetailsLoading get _value =>
      super._value as ShoppingItemDetailsLoading;
}

/// @nodoc
class _$ShoppingItemDetailsLoading implements ShoppingItemDetailsLoading {
  const _$ShoppingItemDetailsLoading();

  @override
  String toString() {
    return 'ShoppingItemDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShoppingItemDetailsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(List<Category> categories),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(List<Category> categories),
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
    @required TResult loading(ShoppingItemDetailsLoading value),
    @required TResult loaded(ShoppingItemDetailsLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(ShoppingItemDetailsLoading value),
    TResult loaded(ShoppingItemDetailsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoppingItemDetailsLoading implements ShoppingItemDetailsState {
  const factory ShoppingItemDetailsLoading() = _$ShoppingItemDetailsLoading;
}

/// @nodoc
abstract class $ShoppingItemDetailsLoadedCopyWith<$Res> {
  factory $ShoppingItemDetailsLoadedCopyWith(ShoppingItemDetailsLoaded value,
          $Res Function(ShoppingItemDetailsLoaded) then) =
      _$ShoppingItemDetailsLoadedCopyWithImpl<$Res>;
  $Res call({List<Category> categories});
}

/// @nodoc
class _$ShoppingItemDetailsLoadedCopyWithImpl<$Res>
    extends _$ShoppingItemDetailsStateCopyWithImpl<$Res>
    implements $ShoppingItemDetailsLoadedCopyWith<$Res> {
  _$ShoppingItemDetailsLoadedCopyWithImpl(ShoppingItemDetailsLoaded _value,
      $Res Function(ShoppingItemDetailsLoaded) _then)
      : super(_value, (v) => _then(v as ShoppingItemDetailsLoaded));

  @override
  ShoppingItemDetailsLoaded get _value =>
      super._value as ShoppingItemDetailsLoaded;

  @override
  $Res call({
    Object categories = freezed,
  }) {
    return _then(ShoppingItemDetailsLoaded(
      categories: categories == freezed
          ? _value.categories
          : categories as List<Category>,
    ));
  }
}

/// @nodoc
class _$ShoppingItemDetailsLoaded implements ShoppingItemDetailsLoaded {
  const _$ShoppingItemDetailsLoaded({@required this.categories})
      : assert(categories != null);

  @override
  final List<Category> categories;

  @override
  String toString() {
    return 'ShoppingItemDetailsState.loaded(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShoppingItemDetailsLoaded &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categories);

  @override
  $ShoppingItemDetailsLoadedCopyWith<ShoppingItemDetailsLoaded> get copyWith =>
      _$ShoppingItemDetailsLoadedCopyWithImpl<ShoppingItemDetailsLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult loaded(List<Category> categories),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult loaded(List<Category> categories),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(ShoppingItemDetailsLoading value),
    @required TResult loaded(ShoppingItemDetailsLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(ShoppingItemDetailsLoading value),
    TResult loaded(ShoppingItemDetailsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ShoppingItemDetailsLoaded implements ShoppingItemDetailsState {
  const factory ShoppingItemDetailsLoaded(
      {@required List<Category> categories}) = _$ShoppingItemDetailsLoaded;

  List<Category> get categories;
  $ShoppingItemDetailsLoadedCopyWith<ShoppingItemDetailsLoaded> get copyWith;
}
