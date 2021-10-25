// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_history_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTagHistory _$UnifediApiTagHistoryFromJson(Map<String, dynamic> json) {
  return _UnifediApiTagHistory.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagHistoryTearOff {
  const _$UnifediApiTagHistoryTearOff();

  _UnifediApiTagHistory call(
      {@HiveField(0) required List<UnifediApiTagHistoryItem> items}) {
    return _UnifediApiTagHistory(
      items: items,
    );
  }

  UnifediApiTagHistory fromJson(Map<String, Object> json) {
    return UnifediApiTagHistory.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagHistory = _$UnifediApiTagHistoryTearOff();

/// @nodoc
mixin _$UnifediApiTagHistory {
  @HiveField(0)
  List<UnifediApiTagHistoryItem> get items =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTagHistoryCopyWith<UnifediApiTagHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagHistoryCopyWith<$Res> {
  factory $UnifediApiTagHistoryCopyWith(UnifediApiTagHistory value,
          $Res Function(UnifediApiTagHistory) then) =
      _$UnifediApiTagHistoryCopyWithImpl<$Res>;
  $Res call({@HiveField(0) List<UnifediApiTagHistoryItem> items});
}

/// @nodoc
class _$UnifediApiTagHistoryCopyWithImpl<$Res>
    implements $UnifediApiTagHistoryCopyWith<$Res> {
  _$UnifediApiTagHistoryCopyWithImpl(this._value, this._then);

  final UnifediApiTagHistory _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagHistory) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTagHistoryItem>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiTagHistoryCopyWith<$Res>
    implements $UnifediApiTagHistoryCopyWith<$Res> {
  factory _$UnifediApiTagHistoryCopyWith(_UnifediApiTagHistory value,
          $Res Function(_UnifediApiTagHistory) then) =
      __$UnifediApiTagHistoryCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) List<UnifediApiTagHistoryItem> items});
}

/// @nodoc
class __$UnifediApiTagHistoryCopyWithImpl<$Res>
    extends _$UnifediApiTagHistoryCopyWithImpl<$Res>
    implements _$UnifediApiTagHistoryCopyWith<$Res> {
  __$UnifediApiTagHistoryCopyWithImpl(
      _UnifediApiTagHistory _value, $Res Function(_UnifediApiTagHistory) _then)
      : super(_value, (v) => _then(v as _UnifediApiTagHistory));

  @override
  _UnifediApiTagHistory get _value => super._value as _UnifediApiTagHistory;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_UnifediApiTagHistory(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTagHistoryItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTagHistory implements _UnifediApiTagHistory {
  const _$_UnifediApiTagHistory({@HiveField(0) required this.items});

  factory _$_UnifediApiTagHistory.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiTagHistoryFromJson(json);

  @override
  @HiveField(0)
  final List<UnifediApiTagHistoryItem> items;

  @override
  String toString() {
    return 'UnifediApiTagHistory(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiTagHistory &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTagHistoryCopyWith<_UnifediApiTagHistory> get copyWith =>
      __$UnifediApiTagHistoryCopyWithImpl<_UnifediApiTagHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagHistoryToJson(this);
  }
}

abstract class _UnifediApiTagHistory implements UnifediApiTagHistory {
  const factory _UnifediApiTagHistory(
          {@HiveField(0) required List<UnifediApiTagHistoryItem> items}) =
      _$_UnifediApiTagHistory;

  factory _UnifediApiTagHistory.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiTagHistory.fromJson;

  @override
  @HiveField(0)
  List<UnifediApiTagHistoryItem> get items =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTagHistoryCopyWith<_UnifediApiTagHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
