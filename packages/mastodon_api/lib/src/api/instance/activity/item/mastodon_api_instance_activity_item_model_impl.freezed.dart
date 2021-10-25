// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_instance_activity_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiInstanceActivityItem _$MastodonApiInstanceActivityItemFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiInstanceActivityItem.fromJson(json);
}

/// @nodoc
class _$MastodonApiInstanceActivityItemTearOff {
  const _$MastodonApiInstanceActivityItemTearOff();

  _MastodonApiInstanceActivityItem call(
      {@JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(0)
          required int week,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(1)
          required int statuses,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(2)
          required int logins,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(3)
          required int registrations}) {
    return _MastodonApiInstanceActivityItem(
      week: week,
      statuses: statuses,
      logins: logins,
      registrations: registrations,
    );
  }

  MastodonApiInstanceActivityItem fromJson(Map<String, Object> json) {
    return MastodonApiInstanceActivityItem.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiInstanceActivityItem =
    _$MastodonApiInstanceActivityItemTearOff();

/// @nodoc
mixin _$MastodonApiInstanceActivityItem {
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(0)
  int get week => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(1)
  int get statuses => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(2)
  int get logins => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(3)
  int get registrations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiInstanceActivityItemCopyWith<MastodonApiInstanceActivityItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiInstanceActivityItemCopyWith<$Res> {
  factory $MastodonApiInstanceActivityItemCopyWith(
          MastodonApiInstanceActivityItem value,
          $Res Function(MastodonApiInstanceActivityItem) then) =
      _$MastodonApiInstanceActivityItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(0)
          int week,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(1)
          int statuses,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(2)
          int logins,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(3)
          int registrations});
}

/// @nodoc
class _$MastodonApiInstanceActivityItemCopyWithImpl<$Res>
    implements $MastodonApiInstanceActivityItemCopyWith<$Res> {
  _$MastodonApiInstanceActivityItemCopyWithImpl(this._value, this._then);

  final MastodonApiInstanceActivityItem _value;
  // ignore: unused_field
  final $Res Function(MastodonApiInstanceActivityItem) _then;

  @override
  $Res call({
    Object? week = freezed,
    Object? statuses = freezed,
    Object? logins = freezed,
    Object? registrations = freezed,
  }) {
    return _then(_value.copyWith(
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as int,
      logins: logins == freezed
          ? _value.logins
          : logins // ignore: cast_nullable_to_non_nullable
              as int,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiInstanceActivityItemCopyWith<$Res>
    implements $MastodonApiInstanceActivityItemCopyWith<$Res> {
  factory _$MastodonApiInstanceActivityItemCopyWith(
          _MastodonApiInstanceActivityItem value,
          $Res Function(_MastodonApiInstanceActivityItem) then) =
      __$MastodonApiInstanceActivityItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(0)
          int week,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(1)
          int statuses,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(2)
          int logins,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(3)
          int registrations});
}

/// @nodoc
class __$MastodonApiInstanceActivityItemCopyWithImpl<$Res>
    extends _$MastodonApiInstanceActivityItemCopyWithImpl<$Res>
    implements _$MastodonApiInstanceActivityItemCopyWith<$Res> {
  __$MastodonApiInstanceActivityItemCopyWithImpl(
      _MastodonApiInstanceActivityItem _value,
      $Res Function(_MastodonApiInstanceActivityItem) _then)
      : super(_value, (v) => _then(v as _MastodonApiInstanceActivityItem));

  @override
  _MastodonApiInstanceActivityItem get _value =>
      super._value as _MastodonApiInstanceActivityItem;

  @override
  $Res call({
    Object? week = freezed,
    Object? statuses = freezed,
    Object? logins = freezed,
    Object? registrations = freezed,
  }) {
    return _then(_MastodonApiInstanceActivityItem(
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as int,
      logins: logins == freezed
          ? _value.logins
          : logins // ignore: cast_nullable_to_non_nullable
              as int,
      registrations: registrations == freezed
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiInstanceActivityItem
    implements _MastodonApiInstanceActivityItem {
  const _$_MastodonApiInstanceActivityItem(
      {@JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(0)
          required this.week,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(1)
          required this.statuses,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(2)
          required this.logins,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(3)
          required this.registrations});

  factory _$_MastodonApiInstanceActivityItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiInstanceActivityItemFromJson(json);

  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(0)
  final int week;
  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(1)
  final int statuses;
  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(2)
  final int logins;
  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(3)
  final int registrations;

  @override
  String toString() {
    return 'MastodonApiInstanceActivityItem(week: $week, statuses: $statuses, logins: $logins, registrations: $registrations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiInstanceActivityItem &&
            (identical(other.week, week) ||
                const DeepCollectionEquality().equals(other.week, week)) &&
            (identical(other.statuses, statuses) ||
                const DeepCollectionEquality()
                    .equals(other.statuses, statuses)) &&
            (identical(other.logins, logins) ||
                const DeepCollectionEquality().equals(other.logins, logins)) &&
            (identical(other.registrations, registrations) ||
                const DeepCollectionEquality()
                    .equals(other.registrations, registrations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(week) ^
      const DeepCollectionEquality().hash(statuses) ^
      const DeepCollectionEquality().hash(logins) ^
      const DeepCollectionEquality().hash(registrations);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiInstanceActivityItemCopyWith<_MastodonApiInstanceActivityItem>
      get copyWith => __$MastodonApiInstanceActivityItemCopyWithImpl<
          _MastodonApiInstanceActivityItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiInstanceActivityItemToJson(this);
  }
}

abstract class _MastodonApiInstanceActivityItem
    implements MastodonApiInstanceActivityItem {
  const factory _MastodonApiInstanceActivityItem(
      {@JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(0)
          required int week,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(1)
          required int statuses,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(2)
          required int logins,
      @JsonKey(
          fromJson: JsonParseHelper.fromStringToInt,
          toJson: JsonParseHelper.toStringFromInt)
      @HiveField(3)
          required int registrations}) = _$_MastodonApiInstanceActivityItem;

  factory _MastodonApiInstanceActivityItem.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiInstanceActivityItem.fromJson;

  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(0)
  int get week => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(1)
  int get statuses => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(2)
  int get logins => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      fromJson: JsonParseHelper.fromStringToInt,
      toJson: JsonParseHelper.toStringFromInt)
  @HiveField(3)
  int get registrations => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiInstanceActivityItemCopyWith<_MastodonApiInstanceActivityItem>
      get copyWith => throw _privateConstructorUsedError;
}
