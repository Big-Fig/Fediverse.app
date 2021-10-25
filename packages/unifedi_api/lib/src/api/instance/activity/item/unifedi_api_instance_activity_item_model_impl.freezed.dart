// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_activity_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceActivityItem _$UnifediApiInstanceActivityItemFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceActivityItem.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceActivityItemTearOff {
  const _$UnifediApiInstanceActivityItemTearOff();

  _UnifediApiInstanceActivityItem call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int logins,
      @HiveField(1)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int registrations,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int statuses,
      @HiveField(3)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int week}) {
    return _UnifediApiInstanceActivityItem(
      logins: logins,
      registrations: registrations,
      statuses: statuses,
      week: week,
    );
  }

  UnifediApiInstanceActivityItem fromJson(Map<String, Object> json) {
    return UnifediApiInstanceActivityItem.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceActivityItem =
    _$UnifediApiInstanceActivityItemTearOff();

/// @nodoc
mixin _$UnifediApiInstanceActivityItem {
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get logins => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get registrations => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get statuses => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get week => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceActivityItemCopyWith<UnifediApiInstanceActivityItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceActivityItemCopyWith<$Res> {
  factory $UnifediApiInstanceActivityItemCopyWith(
          UnifediApiInstanceActivityItem value,
          $Res Function(UnifediApiInstanceActivityItem) then) =
      _$UnifediApiInstanceActivityItemCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int logins,
      @HiveField(1)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int registrations,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int statuses,
      @HiveField(3)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int week});
}

/// @nodoc
class _$UnifediApiInstanceActivityItemCopyWithImpl<$Res>
    implements $UnifediApiInstanceActivityItemCopyWith<$Res> {
  _$UnifediApiInstanceActivityItemCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceActivityItem _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceActivityItem) _then;

  @override
  $Res call({
    Object? logins = freezed,
    Object? registrations = freezed,
    Object? statuses = freezed,
    Object? week = freezed,
  }) {
    return _then(_value.copyWith(
      logins: logins == freezed
          ? _value.logins
          : logins // ignore: cast_nullable_to_non_nullable
              as int,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as int,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as int,
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceActivityItemCopyWith<$Res>
    implements $UnifediApiInstanceActivityItemCopyWith<$Res> {
  factory _$UnifediApiInstanceActivityItemCopyWith(
          _UnifediApiInstanceActivityItem value,
          $Res Function(_UnifediApiInstanceActivityItem) then) =
      __$UnifediApiInstanceActivityItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int logins,
      @HiveField(1)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int registrations,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int statuses,
      @HiveField(3)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          int week});
}

/// @nodoc
class __$UnifediApiInstanceActivityItemCopyWithImpl<$Res>
    extends _$UnifediApiInstanceActivityItemCopyWithImpl<$Res>
    implements _$UnifediApiInstanceActivityItemCopyWith<$Res> {
  __$UnifediApiInstanceActivityItemCopyWithImpl(
      _UnifediApiInstanceActivityItem _value,
      $Res Function(_UnifediApiInstanceActivityItem) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceActivityItem));

  @override
  _UnifediApiInstanceActivityItem get _value =>
      super._value as _UnifediApiInstanceActivityItem;

  @override
  $Res call({
    Object? logins = freezed,
    Object? registrations = freezed,
    Object? statuses = freezed,
    Object? week = freezed,
  }) {
    return _then(_UnifediApiInstanceActivityItem(
      logins: logins == freezed
          ? _value.logins
          : logins // ignore: cast_nullable_to_non_nullable
              as int,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as int,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as int,
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceActivityItem
    implements _UnifediApiInstanceActivityItem {
  const _$_UnifediApiInstanceActivityItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.logins,
      @HiveField(1)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.registrations,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.statuses,
      @HiveField(3)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required this.week});

  factory _$_UnifediApiInstanceActivityItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceActivityItemFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int logins;
  @override
  @HiveField(1)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int registrations;
  @override
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int statuses;
  @override
  @HiveField(3)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  final int week;

  @override
  String toString() {
    return 'UnifediApiInstanceActivityItem(logins: $logins, registrations: $registrations, statuses: $statuses, week: $week)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceActivityItem &&
            (identical(other.logins, logins) ||
                const DeepCollectionEquality().equals(other.logins, logins)) &&
            (identical(other.registrations, registrations) ||
                const DeepCollectionEquality()
                    .equals(other.registrations, registrations)) &&
            (identical(other.statuses, statuses) ||
                const DeepCollectionEquality()
                    .equals(other.statuses, statuses)) &&
            (identical(other.week, week) ||
                const DeepCollectionEquality().equals(other.week, week)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(logins) ^
      const DeepCollectionEquality().hash(registrations) ^
      const DeepCollectionEquality().hash(statuses) ^
      const DeepCollectionEquality().hash(week);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceActivityItemCopyWith<_UnifediApiInstanceActivityItem>
      get copyWith => __$UnifediApiInstanceActivityItemCopyWithImpl<
          _UnifediApiInstanceActivityItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceActivityItemToJson(this);
  }
}

abstract class _UnifediApiInstanceActivityItem
    implements UnifediApiInstanceActivityItem {
  const factory _UnifediApiInstanceActivityItem(
      {@HiveField(0)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int logins,
      @HiveField(1)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int registrations,
      @HiveField(2)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int statuses,
      @HiveField(3)
      @JsonKey(fromJson: JsonParseHelper.fromStringToInt, toJson: JsonParseHelper.toStringFromInt)
          required int week}) = _$_UnifediApiInstanceActivityItem;

  factory _UnifediApiInstanceActivityItem.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceActivityItem.fromJson;

  @override
  @HiveField(0)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get logins => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get registrations => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get statuses => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  int get week => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceActivityItemCopyWith<_UnifediApiInstanceActivityItem>
      get copyWith => throw _privateConstructorUsedError;
}
