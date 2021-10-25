// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_activity_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceActivityItem _$PleromaApiInstanceActivityItemFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstanceActivityItem.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceActivityItemTearOff {
  const _$PleromaApiInstanceActivityItemTearOff();

  _PleromaApiInstanceActivityItem call(
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
    return _PleromaApiInstanceActivityItem(
      logins: logins,
      registrations: registrations,
      statuses: statuses,
      week: week,
    );
  }

  PleromaApiInstanceActivityItem fromJson(Map<String, Object> json) {
    return PleromaApiInstanceActivityItem.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceActivityItem =
    _$PleromaApiInstanceActivityItemTearOff();

/// @nodoc
mixin _$PleromaApiInstanceActivityItem {
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
  $PleromaApiInstanceActivityItemCopyWith<PleromaApiInstanceActivityItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceActivityItemCopyWith<$Res> {
  factory $PleromaApiInstanceActivityItemCopyWith(
          PleromaApiInstanceActivityItem value,
          $Res Function(PleromaApiInstanceActivityItem) then) =
      _$PleromaApiInstanceActivityItemCopyWithImpl<$Res>;
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
class _$PleromaApiInstanceActivityItemCopyWithImpl<$Res>
    implements $PleromaApiInstanceActivityItemCopyWith<$Res> {
  _$PleromaApiInstanceActivityItemCopyWithImpl(this._value, this._then);

  final PleromaApiInstanceActivityItem _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceActivityItem) _then;

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
abstract class _$PleromaApiInstanceActivityItemCopyWith<$Res>
    implements $PleromaApiInstanceActivityItemCopyWith<$Res> {
  factory _$PleromaApiInstanceActivityItemCopyWith(
          _PleromaApiInstanceActivityItem value,
          $Res Function(_PleromaApiInstanceActivityItem) then) =
      __$PleromaApiInstanceActivityItemCopyWithImpl<$Res>;
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
class __$PleromaApiInstanceActivityItemCopyWithImpl<$Res>
    extends _$PleromaApiInstanceActivityItemCopyWithImpl<$Res>
    implements _$PleromaApiInstanceActivityItemCopyWith<$Res> {
  __$PleromaApiInstanceActivityItemCopyWithImpl(
      _PleromaApiInstanceActivityItem _value,
      $Res Function(_PleromaApiInstanceActivityItem) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstanceActivityItem));

  @override
  _PleromaApiInstanceActivityItem get _value =>
      super._value as _PleromaApiInstanceActivityItem;

  @override
  $Res call({
    Object? logins = freezed,
    Object? registrations = freezed,
    Object? statuses = freezed,
    Object? week = freezed,
  }) {
    return _then(_PleromaApiInstanceActivityItem(
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
class _$_PleromaApiInstanceActivityItem
    implements _PleromaApiInstanceActivityItem {
  const _$_PleromaApiInstanceActivityItem(
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

  factory _$_PleromaApiInstanceActivityItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceActivityItemFromJson(json);

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
    return 'PleromaApiInstanceActivityItem(logins: $logins, registrations: $registrations, statuses: $statuses, week: $week)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstanceActivityItem &&
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
  _$PleromaApiInstanceActivityItemCopyWith<_PleromaApiInstanceActivityItem>
      get copyWith => __$PleromaApiInstanceActivityItemCopyWithImpl<
          _PleromaApiInstanceActivityItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceActivityItemToJson(this);
  }
}

abstract class _PleromaApiInstanceActivityItem
    implements PleromaApiInstanceActivityItem {
  const factory _PleromaApiInstanceActivityItem(
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
          required int week}) = _$_PleromaApiInstanceActivityItem;

  factory _PleromaApiInstanceActivityItem.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstanceActivityItem.fromJson;

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
  _$PleromaApiInstanceActivityItemCopyWith<_PleromaApiInstanceActivityItem>
      get copyWith => throw _privateConstructorUsedError;
}
