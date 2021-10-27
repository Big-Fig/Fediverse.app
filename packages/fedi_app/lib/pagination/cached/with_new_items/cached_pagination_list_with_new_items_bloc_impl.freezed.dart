// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cached_pagination_list_with_new_items_bloc_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalculateNewItemsInputDataTearOff {
  const _$CalculateNewItemsInputDataTearOff();

  _CalculateNewItemsInputData<TItem>
      call<TItem extends IEqualComparableObj<TItem>>(
          {required List<TItem>? superItems,
          required List<TItem>? mergedNewItems,
          required List<TItem> updatedItems}) {
    return _CalculateNewItemsInputData<TItem>(
      superItems: superItems,
      mergedNewItems: mergedNewItems,
      updatedItems: updatedItems,
    );
  }
}

/// @nodoc
const $CalculateNewItemsInputData = _$CalculateNewItemsInputDataTearOff();

/// @nodoc
mixin _$CalculateNewItemsInputData<TItem extends IEqualComparableObj<TItem>> {
  List<TItem>? get superItems => throw _privateConstructorUsedError;
  List<TItem>? get mergedNewItems => throw _privateConstructorUsedError;
  List<TItem> get updatedItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculateNewItemsInputDataCopyWith<TItem, CalculateNewItemsInputData<TItem>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculateNewItemsInputDataCopyWith<
    TItem extends IEqualComparableObj<TItem>, $Res> {
  factory $CalculateNewItemsInputDataCopyWith(
          CalculateNewItemsInputData<TItem> value,
          $Res Function(CalculateNewItemsInputData<TItem>) then) =
      _$CalculateNewItemsInputDataCopyWithImpl<TItem, $Res>;
  $Res call(
      {List<TItem>? superItems,
      List<TItem>? mergedNewItems,
      List<TItem> updatedItems});
}

/// @nodoc
class _$CalculateNewItemsInputDataCopyWithImpl<
    TItem extends IEqualComparableObj<TItem>,
    $Res> implements $CalculateNewItemsInputDataCopyWith<TItem, $Res> {
  _$CalculateNewItemsInputDataCopyWithImpl(this._value, this._then);

  final CalculateNewItemsInputData<TItem> _value;
  // ignore: unused_field
  final $Res Function(CalculateNewItemsInputData<TItem>) _then;

  @override
  $Res call({
    Object? superItems = freezed,
    Object? mergedNewItems = freezed,
    Object? updatedItems = freezed,
  }) {
    return _then(_value.copyWith(
      superItems: superItems == freezed
          ? _value.superItems
          : superItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>?,
      mergedNewItems: mergedNewItems == freezed
          ? _value.mergedNewItems
          : mergedNewItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>?,
      updatedItems: updatedItems == freezed
          ? _value.updatedItems
          : updatedItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>,
    ));
  }
}

/// @nodoc
abstract class _$CalculateNewItemsInputDataCopyWith<
    TItem extends IEqualComparableObj<TItem>,
    $Res> implements $CalculateNewItemsInputDataCopyWith<TItem, $Res> {
  factory _$CalculateNewItemsInputDataCopyWith(
          _CalculateNewItemsInputData<TItem> value,
          $Res Function(_CalculateNewItemsInputData<TItem>) then) =
      __$CalculateNewItemsInputDataCopyWithImpl<TItem, $Res>;
  @override
  $Res call(
      {List<TItem>? superItems,
      List<TItem>? mergedNewItems,
      List<TItem> updatedItems});
}

/// @nodoc
class __$CalculateNewItemsInputDataCopyWithImpl<
        TItem extends IEqualComparableObj<TItem>,
        $Res> extends _$CalculateNewItemsInputDataCopyWithImpl<TItem, $Res>
    implements _$CalculateNewItemsInputDataCopyWith<TItem, $Res> {
  __$CalculateNewItemsInputDataCopyWithImpl(
      _CalculateNewItemsInputData<TItem> _value,
      $Res Function(_CalculateNewItemsInputData<TItem>) _then)
      : super(_value, (v) => _then(v as _CalculateNewItemsInputData<TItem>));

  @override
  _CalculateNewItemsInputData<TItem> get _value =>
      super._value as _CalculateNewItemsInputData<TItem>;

  @override
  $Res call({
    Object? superItems = freezed,
    Object? mergedNewItems = freezed,
    Object? updatedItems = freezed,
  }) {
    return _then(_CalculateNewItemsInputData<TItem>(
      superItems: superItems == freezed
          ? _value.superItems
          : superItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>?,
      mergedNewItems: mergedNewItems == freezed
          ? _value.mergedNewItems
          : mergedNewItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>?,
      updatedItems: updatedItems == freezed
          ? _value.updatedItems
          : updatedItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>,
    ));
  }
}

/// @nodoc

class _$_CalculateNewItemsInputData<TItem extends IEqualComparableObj<TItem>>
    with DiagnosticableTreeMixin
    implements _CalculateNewItemsInputData<TItem> {
  const _$_CalculateNewItemsInputData(
      {required this.superItems,
      required this.mergedNewItems,
      required this.updatedItems});

  @override
  final List<TItem>? superItems;
  @override
  final List<TItem>? mergedNewItems;
  @override
  final List<TItem> updatedItems;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalculateNewItemsInputData<$TItem>(superItems: $superItems, mergedNewItems: $mergedNewItems, updatedItems: $updatedItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalculateNewItemsInputData<$TItem>'))
      ..add(DiagnosticsProperty('superItems', superItems))
      ..add(DiagnosticsProperty('mergedNewItems', mergedNewItems))
      ..add(DiagnosticsProperty('updatedItems', updatedItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculateNewItemsInputData<TItem> &&
            const DeepCollectionEquality()
                .equals(other.superItems, superItems) &&
            const DeepCollectionEquality()
                .equals(other.mergedNewItems, mergedNewItems) &&
            const DeepCollectionEquality()
                .equals(other.updatedItems, updatedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(superItems),
      const DeepCollectionEquality().hash(mergedNewItems),
      const DeepCollectionEquality().hash(updatedItems));

  @JsonKey(ignore: true)
  @override
  _$CalculateNewItemsInputDataCopyWith<TItem,
          _CalculateNewItemsInputData<TItem>>
      get copyWith => __$CalculateNewItemsInputDataCopyWithImpl<TItem,
          _CalculateNewItemsInputData<TItem>>(this, _$identity);
}

abstract class _CalculateNewItemsInputData<
        TItem extends IEqualComparableObj<TItem>>
    implements CalculateNewItemsInputData<TItem> {
  const factory _CalculateNewItemsInputData(
          {required List<TItem>? superItems,
          required List<TItem>? mergedNewItems,
          required List<TItem> updatedItems}) =
      _$_CalculateNewItemsInputData<TItem>;

  @override
  List<TItem>? get superItems;
  @override
  List<TItem>? get mergedNewItems;
  @override
  List<TItem> get updatedItems;
  @override
  @JsonKey(ignore: true)
  _$CalculateNewItemsInputDataCopyWith<TItem,
          _CalculateNewItemsInputData<TItem>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$CalculateActuallyNewRequestTearOff {
  const _$CalculateActuallyNewRequestTearOff();

  _CalculateActuallyNewRequest<TItem> call<TItem>(
      {required TItem? newerItem,
      required List<TItem> newItems,
      required List<TItem> currentItems}) {
    return _CalculateActuallyNewRequest<TItem>(
      newerItem: newerItem,
      newItems: newItems,
      currentItems: currentItems,
    );
  }
}

/// @nodoc
const $CalculateActuallyNewRequest = _$CalculateActuallyNewRequestTearOff();

/// @nodoc
mixin _$CalculateActuallyNewRequest<TItem> {
  TItem? get newerItem => throw _privateConstructorUsedError;
  List<TItem> get newItems => throw _privateConstructorUsedError;
  List<TItem> get currentItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculateActuallyNewRequestCopyWith<TItem,
          CalculateActuallyNewRequest<TItem>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculateActuallyNewRequestCopyWith<TItem, $Res> {
  factory $CalculateActuallyNewRequestCopyWith(
          CalculateActuallyNewRequest<TItem> value,
          $Res Function(CalculateActuallyNewRequest<TItem>) then) =
      _$CalculateActuallyNewRequestCopyWithImpl<TItem, $Res>;
  $Res call({TItem? newerItem, List<TItem> newItems, List<TItem> currentItems});
}

/// @nodoc
class _$CalculateActuallyNewRequestCopyWithImpl<TItem, $Res>
    implements $CalculateActuallyNewRequestCopyWith<TItem, $Res> {
  _$CalculateActuallyNewRequestCopyWithImpl(this._value, this._then);

  final CalculateActuallyNewRequest<TItem> _value;
  // ignore: unused_field
  final $Res Function(CalculateActuallyNewRequest<TItem>) _then;

  @override
  $Res call({
    Object? newerItem = freezed,
    Object? newItems = freezed,
    Object? currentItems = freezed,
  }) {
    return _then(_value.copyWith(
      newerItem: newerItem == freezed
          ? _value.newerItem
          : newerItem // ignore: cast_nullable_to_non_nullable
              as TItem?,
      newItems: newItems == freezed
          ? _value.newItems
          : newItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>,
      currentItems: currentItems == freezed
          ? _value.currentItems
          : currentItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>,
    ));
  }
}

/// @nodoc
abstract class _$CalculateActuallyNewRequestCopyWith<TItem, $Res>
    implements $CalculateActuallyNewRequestCopyWith<TItem, $Res> {
  factory _$CalculateActuallyNewRequestCopyWith(
          _CalculateActuallyNewRequest<TItem> value,
          $Res Function(_CalculateActuallyNewRequest<TItem>) then) =
      __$CalculateActuallyNewRequestCopyWithImpl<TItem, $Res>;
  @override
  $Res call({TItem? newerItem, List<TItem> newItems, List<TItem> currentItems});
}

/// @nodoc
class __$CalculateActuallyNewRequestCopyWithImpl<TItem, $Res>
    extends _$CalculateActuallyNewRequestCopyWithImpl<TItem, $Res>
    implements _$CalculateActuallyNewRequestCopyWith<TItem, $Res> {
  __$CalculateActuallyNewRequestCopyWithImpl(
      _CalculateActuallyNewRequest<TItem> _value,
      $Res Function(_CalculateActuallyNewRequest<TItem>) _then)
      : super(_value, (v) => _then(v as _CalculateActuallyNewRequest<TItem>));

  @override
  _CalculateActuallyNewRequest<TItem> get _value =>
      super._value as _CalculateActuallyNewRequest<TItem>;

  @override
  $Res call({
    Object? newerItem = freezed,
    Object? newItems = freezed,
    Object? currentItems = freezed,
  }) {
    return _then(_CalculateActuallyNewRequest<TItem>(
      newerItem: newerItem == freezed
          ? _value.newerItem
          : newerItem // ignore: cast_nullable_to_non_nullable
              as TItem?,
      newItems: newItems == freezed
          ? _value.newItems
          : newItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>,
      currentItems: currentItems == freezed
          ? _value.currentItems
          : currentItems // ignore: cast_nullable_to_non_nullable
              as List<TItem>,
    ));
  }
}

/// @nodoc

class _$_CalculateActuallyNewRequest<TItem>
    with DiagnosticableTreeMixin
    implements _CalculateActuallyNewRequest<TItem> {
  const _$_CalculateActuallyNewRequest(
      {required this.newerItem,
      required this.newItems,
      required this.currentItems});

  @override
  final TItem? newerItem;
  @override
  final List<TItem> newItems;
  @override
  final List<TItem> currentItems;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalculateActuallyNewRequest<$TItem>(newerItem: $newerItem, newItems: $newItems, currentItems: $currentItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalculateActuallyNewRequest<$TItem>'))
      ..add(DiagnosticsProperty('newerItem', newerItem))
      ..add(DiagnosticsProperty('newItems', newItems))
      ..add(DiagnosticsProperty('currentItems', currentItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculateActuallyNewRequest<TItem> &&
            const DeepCollectionEquality().equals(other.newerItem, newerItem) &&
            const DeepCollectionEquality().equals(other.newItems, newItems) &&
            const DeepCollectionEquality()
                .equals(other.currentItems, currentItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(newerItem),
      const DeepCollectionEquality().hash(newItems),
      const DeepCollectionEquality().hash(currentItems));

  @JsonKey(ignore: true)
  @override
  _$CalculateActuallyNewRequestCopyWith<TItem,
          _CalculateActuallyNewRequest<TItem>>
      get copyWith => __$CalculateActuallyNewRequestCopyWithImpl<TItem,
          _CalculateActuallyNewRequest<TItem>>(this, _$identity);
}

abstract class _CalculateActuallyNewRequest<TItem>
    implements CalculateActuallyNewRequest<TItem> {
  const factory _CalculateActuallyNewRequest(
          {required TItem? newerItem,
          required List<TItem> newItems,
          required List<TItem> currentItems}) =
      _$_CalculateActuallyNewRequest<TItem>;

  @override
  TItem? get newerItem;
  @override
  List<TItem> get newItems;
  @override
  List<TItem> get currentItems;
  @override
  @JsonKey(ignore: true)
  _$CalculateActuallyNewRequestCopyWith<TItem,
          _CalculateActuallyNewRequest<TItem>>
      get copyWith => throw _privateConstructorUsedError;
}
