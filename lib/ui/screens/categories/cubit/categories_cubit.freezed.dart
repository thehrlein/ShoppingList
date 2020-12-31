// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CategoriesStateTearOff {
  const _$CategoriesStateTearOff();

// ignore: unused_element
  CategoriesLoading loading() {
    return const CategoriesLoading();
  }

// ignore: unused_element
  CategoriesLoaded loaded({@required List<Category> categories}) {
    return CategoriesLoaded(
      categories: categories,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CategoriesState = _$CategoriesStateTearOff();

/// @nodoc
mixin _$CategoriesState {
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
    @required TResult loading(CategoriesLoading value),
    @required TResult loaded(CategoriesLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(CategoriesLoading value),
    TResult loaded(CategoriesLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  final CategoriesState _value;
  // ignore: unused_field
  final $Res Function(CategoriesState) _then;
}

/// @nodoc
abstract class $CategoriesLoadingCopyWith<$Res> {
  factory $CategoriesLoadingCopyWith(
          CategoriesLoading value, $Res Function(CategoriesLoading) then) =
      _$CategoriesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoriesLoadingCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesLoadingCopyWith<$Res> {
  _$CategoriesLoadingCopyWithImpl(
      CategoriesLoading _value, $Res Function(CategoriesLoading) _then)
      : super(_value, (v) => _then(v as CategoriesLoading));

  @override
  CategoriesLoading get _value => super._value as CategoriesLoading;
}

/// @nodoc
class _$CategoriesLoading implements CategoriesLoading {
  const _$CategoriesLoading();

  @override
  String toString() {
    return 'CategoriesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoriesLoading);
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
    @required TResult loading(CategoriesLoading value),
    @required TResult loaded(CategoriesLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(CategoriesLoading value),
    TResult loaded(CategoriesLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoriesLoading implements CategoriesState {
  const factory CategoriesLoading() = _$CategoriesLoading;
}

/// @nodoc
abstract class $CategoriesLoadedCopyWith<$Res> {
  factory $CategoriesLoadedCopyWith(
          CategoriesLoaded value, $Res Function(CategoriesLoaded) then) =
      _$CategoriesLoadedCopyWithImpl<$Res>;
  $Res call({List<Category> categories});
}

/// @nodoc
class _$CategoriesLoadedCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesLoadedCopyWith<$Res> {
  _$CategoriesLoadedCopyWithImpl(
      CategoriesLoaded _value, $Res Function(CategoriesLoaded) _then)
      : super(_value, (v) => _then(v as CategoriesLoaded));

  @override
  CategoriesLoaded get _value => super._value as CategoriesLoaded;

  @override
  $Res call({
    Object categories = freezed,
  }) {
    return _then(CategoriesLoaded(
      categories: categories == freezed
          ? _value.categories
          : categories as List<Category>,
    ));
  }
}

/// @nodoc
class _$CategoriesLoaded implements CategoriesLoaded {
  const _$CategoriesLoaded({@required this.categories})
      : assert(categories != null);

  @override
  final List<Category> categories;

  @override
  String toString() {
    return 'CategoriesState.loaded(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoriesLoaded &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categories);

  @override
  $CategoriesLoadedCopyWith<CategoriesLoaded> get copyWith =>
      _$CategoriesLoadedCopyWithImpl<CategoriesLoaded>(this, _$identity);

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
    @required TResult loading(CategoriesLoading value),
    @required TResult loaded(CategoriesLoaded value),
  }) {
    assert(loading != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(CategoriesLoading value),
    TResult loaded(CategoriesLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CategoriesLoaded implements CategoriesState {
  const factory CategoriesLoaded({@required List<Category> categories}) =
      _$CategoriesLoaded;

  List<Category> get categories;
  $CategoriesLoadedCopyWith<CategoriesLoaded> get copyWith;
}
