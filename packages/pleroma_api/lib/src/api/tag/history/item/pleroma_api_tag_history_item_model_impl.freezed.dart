// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_tag_history_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiTagHistoryItem _$PleromaApiTagHistoryItemFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiTagHistoryItem.fromJson(json);
}

/// @nodoc
class _$PleromaApiTagHistoryItemTearOff {
  const _$PleromaApiTagHistoryItemTearOff();

  _PleromaApiTagHistoryItem call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int uses}) {
    return _PleromaApiTagHistoryItem(
      accounts: accounts,
      dayInUnixTimestamp: dayInUnixTimestamp,
      uses: uses,
    );
  }

  PleromaApiTagHistoryItem fromJson(Map<String, Object> json) {
    return PleromaApiTagHistoryItem.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiTagHistoryItem = _$PleromaApiTagHistoryItemTearOff();

/// @nodoc
mixin _$PleromaApiTagHistoryItem {
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get accounts => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(
      name: 'day',
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get dayInUnixTimestamp => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get uses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiTagHistoryItemCopyWith<PleromaApiTagHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiTagHistoryItemCopyWith<$Res> {
  factory $PleromaApiTagHistoryItemCopyWith(PleromaApiTagHistoryItem value,
          $Res Function(PleromaApiTagHistoryItem) then) =
      _$PleromaApiTagHistoryItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int uses});
}

/// @nodoc
class _$PleromaApiTagHistoryItemCopyWithImpl<$Res>
    implements $PleromaApiTagHistoryItemCopyWith<$Res> {
  _$PleromaApiTagHistoryItemCopyWithImpl(this._value, this._then);

  final PleromaApiTagHistoryItem _value;
  // ignore: unused_field
  final $Res Function(PleromaApiTagHistoryItem) _then;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? dayInUnixTimestamp = freezed,
    Object? uses = freezed,
  }) {
    return _then(_value.copyWith(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as int,
      dayInUnixTimestamp: dayInUnixTimestamp == freezed
          ? _value.dayInUnixTimestamp
          : dayInUnixTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      uses: uses == freezed
          ? _value.uses
          : uses // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiTagHistoryItemCopyWith<$Res>
    implements $PleromaApiTagHistoryItemCopyWith<$Res> {
  factory _$PleromaApiTagHistoryItemCopyWith(_PleromaApiTagHistoryItem value,
          $Res Function(_PleromaApiTagHistoryItem) then) =
      __$PleromaApiTagHistoryItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int uses});
}

/// @nodoc
class __$PleromaApiTagHistoryItemCopyWithImpl<$Res>
    extends _$PleromaApiTagHistoryItemCopyWithImpl<$Res>
    implements _$PleromaApiTagHistoryItemCopyWith<$Res> {
  __$PleromaApiTagHistoryItemCopyWithImpl(_PleromaApiTagHistoryItem _value,
      $Res Function(_PleromaApiTagHistoryItem) _then)
      : super(_value, (v) => _then(v as _PleromaApiTagHistoryItem));

  @override
  _PleromaApiTagHistoryItem get _value =>
      super._value as _PleromaApiTagHistoryItem;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? dayInUnixTimestamp = freezed,
    Object? uses = freezed,
  }) {
    return _then(_PleromaApiTagHistoryItem(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as int,
      dayInUnixTimestamp: dayInUnixTimestamp == freezed
          ? _value.dayInUnixTimestamp
          : dayInUnixTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      uses: uses == freezed
          ? _value.uses
          : uses // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiTagHistoryItem implements _PleromaApiTagHistoryItem {
  const _$_PleromaApiTagHistoryItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.uses});

  factory _$_PleromaApiTagHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiTagHistoryItemFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int accounts;
  @override
  @HiveField(1)
  @JsonKey(
      name: 'day',
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int dayInUnixTimestamp;
  @override
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int uses;

  @override
  String toString() {
    return 'PleromaApiTagHistoryItem(accounts: $accounts, dayInUnixTimestamp: $dayInUnixTimestamp, uses: $uses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiTagHistoryItem &&
            (identical(other.accounts, accounts) ||
                const DeepCollectionEquality()
                    .equals(other.accounts, accounts)) &&
            (identical(other.dayInUnixTimestamp, dayInUnixTimestamp) ||
                const DeepCollectionEquality()
                    .equals(other.dayInUnixTimestamp, dayInUnixTimestamp)) &&
            (identical(other.uses, uses) ||
                const DeepCollectionEquality().equals(other.uses, uses)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accounts) ^
      const DeepCollectionEquality().hash(dayInUnixTimestamp) ^
      const DeepCollectionEquality().hash(uses);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiTagHistoryItemCopyWith<_PleromaApiTagHistoryItem> get copyWith =>
      __$PleromaApiTagHistoryItemCopyWithImpl<_PleromaApiTagHistoryItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiTagHistoryItemToJson(this);
  }
}

abstract class _PleromaApiTagHistoryItem implements PleromaApiTagHistoryItem {
  const factory _PleromaApiTagHistoryItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int uses}) = _$_PleromaApiTagHistoryItem;

  factory _PleromaApiTagHistoryItem.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiTagHistoryItem.fromJson;

  @override
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(
      name: 'day',
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get dayInUnixTimestamp => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get uses => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiTagHistoryItemCopyWith<_PleromaApiTagHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
