// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_tag_history_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTagHistoryItem _$UnifediApiTagHistoryItemFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiTagHistoryItem.fromJson(json);
}

/// @nodoc
class _$UnifediApiTagHistoryItemTearOff {
  const _$UnifediApiTagHistoryItemTearOff();

  _UnifediApiTagHistoryItem call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int uses}) {
    return _UnifediApiTagHistoryItem(
      accounts: accounts,
      dayInUnixTimestamp: dayInUnixTimestamp,
      uses: uses,
    );
  }

  UnifediApiTagHistoryItem fromJson(Map<String, Object> json) {
    return UnifediApiTagHistoryItem.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTagHistoryItem = _$UnifediApiTagHistoryItemTearOff();

/// @nodoc
mixin _$UnifediApiTagHistoryItem {
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
  $UnifediApiTagHistoryItemCopyWith<UnifediApiTagHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTagHistoryItemCopyWith<$Res> {
  factory $UnifediApiTagHistoryItemCopyWith(UnifediApiTagHistoryItem value,
          $Res Function(UnifediApiTagHistoryItem) then) =
      _$UnifediApiTagHistoryItemCopyWithImpl<$Res>;
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
class _$UnifediApiTagHistoryItemCopyWithImpl<$Res>
    implements $UnifediApiTagHistoryItemCopyWith<$Res> {
  _$UnifediApiTagHistoryItemCopyWithImpl(this._value, this._then);

  final UnifediApiTagHistoryItem _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTagHistoryItem) _then;

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
abstract class _$UnifediApiTagHistoryItemCopyWith<$Res>
    implements $UnifediApiTagHistoryItemCopyWith<$Res> {
  factory _$UnifediApiTagHistoryItemCopyWith(_UnifediApiTagHistoryItem value,
          $Res Function(_UnifediApiTagHistoryItem) then) =
      __$UnifediApiTagHistoryItemCopyWithImpl<$Res>;
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
class __$UnifediApiTagHistoryItemCopyWithImpl<$Res>
    extends _$UnifediApiTagHistoryItemCopyWithImpl<$Res>
    implements _$UnifediApiTagHistoryItemCopyWith<$Res> {
  __$UnifediApiTagHistoryItemCopyWithImpl(_UnifediApiTagHistoryItem _value,
      $Res Function(_UnifediApiTagHistoryItem) _then)
      : super(_value, (v) => _then(v as _UnifediApiTagHistoryItem));

  @override
  _UnifediApiTagHistoryItem get _value =>
      super._value as _UnifediApiTagHistoryItem;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? dayInUnixTimestamp = freezed,
    Object? uses = freezed,
  }) {
    return _then(_UnifediApiTagHistoryItem(
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
class _$_UnifediApiTagHistoryItem implements _UnifediApiTagHistoryItem {
  const _$_UnifediApiTagHistoryItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.uses});

  factory _$_UnifediApiTagHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiTagHistoryItemFromJson(json);

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
    return 'UnifediApiTagHistoryItem(accounts: $accounts, dayInUnixTimestamp: $dayInUnixTimestamp, uses: $uses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiTagHistoryItem &&
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
  _$UnifediApiTagHistoryItemCopyWith<_UnifediApiTagHistoryItem> get copyWith =>
      __$UnifediApiTagHistoryItemCopyWithImpl<_UnifediApiTagHistoryItem>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTagHistoryItemToJson(this);
  }
}

abstract class _UnifediApiTagHistoryItem implements UnifediApiTagHistoryItem {
  const factory _UnifediApiTagHistoryItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int uses}) = _$_UnifediApiTagHistoryItem;

  factory _UnifediApiTagHistoryItem.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiTagHistoryItem.fromJson;

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
  _$UnifediApiTagHistoryItemCopyWith<_UnifediApiTagHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}
