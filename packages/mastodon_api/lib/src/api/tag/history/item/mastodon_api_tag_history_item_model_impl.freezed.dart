// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_tag_history_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiTagHistoryItem _$MastodonApiTagHistoryItemFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiTagHistoryItem.fromJson(json);
}

/// @nodoc
class _$MastodonApiTagHistoryItemTearOff {
  const _$MastodonApiTagHistoryItemTearOff();

  _MastodonApiTagHistoryItem call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int uses}) {
    return _MastodonApiTagHistoryItem(
      accounts: accounts,
      dayInUnixTimestamp: dayInUnixTimestamp,
      uses: uses,
    );
  }

  MastodonApiTagHistoryItem fromJson(Map<String, Object?> json) {
    return MastodonApiTagHistoryItem.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiTagHistoryItem = _$MastodonApiTagHistoryItemTearOff();

/// @nodoc
mixin _$MastodonApiTagHistoryItem {
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
  $MastodonApiTagHistoryItemCopyWith<MastodonApiTagHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiTagHistoryItemCopyWith<$Res> {
  factory $MastodonApiTagHistoryItemCopyWith(MastodonApiTagHistoryItem value,
          $Res Function(MastodonApiTagHistoryItem) then) =
      _$MastodonApiTagHistoryItemCopyWithImpl<$Res>;
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
class _$MastodonApiTagHistoryItemCopyWithImpl<$Res>
    implements $MastodonApiTagHistoryItemCopyWith<$Res> {
  _$MastodonApiTagHistoryItemCopyWithImpl(this._value, this._then);

  final MastodonApiTagHistoryItem _value;
  // ignore: unused_field
  final $Res Function(MastodonApiTagHistoryItem) _then;

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
abstract class _$MastodonApiTagHistoryItemCopyWith<$Res>
    implements $MastodonApiTagHistoryItemCopyWith<$Res> {
  factory _$MastodonApiTagHistoryItemCopyWith(_MastodonApiTagHistoryItem value,
          $Res Function(_MastodonApiTagHistoryItem) then) =
      __$MastodonApiTagHistoryItemCopyWithImpl<$Res>;
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
class __$MastodonApiTagHistoryItemCopyWithImpl<$Res>
    extends _$MastodonApiTagHistoryItemCopyWithImpl<$Res>
    implements _$MastodonApiTagHistoryItemCopyWith<$Res> {
  __$MastodonApiTagHistoryItemCopyWithImpl(_MastodonApiTagHistoryItem _value,
      $Res Function(_MastodonApiTagHistoryItem) _then)
      : super(_value, (v) => _then(v as _MastodonApiTagHistoryItem));

  @override
  _MastodonApiTagHistoryItem get _value =>
      super._value as _MastodonApiTagHistoryItem;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? dayInUnixTimestamp = freezed,
    Object? uses = freezed,
  }) {
    return _then(_MastodonApiTagHistoryItem(
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
class _$_MastodonApiTagHistoryItem implements _MastodonApiTagHistoryItem {
  const _$_MastodonApiTagHistoryItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.uses});

  factory _$_MastodonApiTagHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiTagHistoryItemFromJson(json);

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
    return 'MastodonApiTagHistoryItem(accounts: $accounts, dayInUnixTimestamp: $dayInUnixTimestamp, uses: $uses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiTagHistoryItem &&
            (identical(other.accounts, accounts) ||
                other.accounts == accounts) &&
            (identical(other.dayInUnixTimestamp, dayInUnixTimestamp) ||
                other.dayInUnixTimestamp == dayInUnixTimestamp) &&
            (identical(other.uses, uses) || other.uses == uses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accounts, dayInUnixTimestamp, uses);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiTagHistoryItemCopyWith<_MastodonApiTagHistoryItem>
      get copyWith =>
          __$MastodonApiTagHistoryItemCopyWithImpl<_MastodonApiTagHistoryItem>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiTagHistoryItemToJson(this);
  }
}

abstract class _MastodonApiTagHistoryItem implements MastodonApiTagHistoryItem {
  const factory _MastodonApiTagHistoryItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int accounts,
      @HiveField(1)
      @JsonKey(name: 'day', fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int dayInUnixTimestamp,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int uses}) = _$_MastodonApiTagHistoryItem;

  factory _MastodonApiTagHistoryItem.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiTagHistoryItem.fromJson;

  @override
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get accounts;
  @override
  @HiveField(1)
  @JsonKey(
      name: 'day',
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get dayInUnixTimestamp;
  @override
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get uses;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiTagHistoryItemCopyWith<_MastodonApiTagHistoryItem>
      get copyWith => throw _privateConstructorUsedError;
}
