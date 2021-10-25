// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_instance_stats_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiInstanceStats _$MastodonApiInstanceStatsFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiInstanceStats.fromJson(json);
}

/// @nodoc
class _$MastodonApiInstanceStatsTearOff {
  const _$MastodonApiInstanceStatsTearOff();

  _MastodonApiInstanceStats call(
      {@JsonKey(name: 'user_count') @HiveField(0) required int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) required int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) required int? domainCount}) {
    return _MastodonApiInstanceStats(
      userCount: userCount,
      statusCount: statusCount,
      domainCount: domainCount,
    );
  }

  MastodonApiInstanceStats fromJson(Map<String, Object> json) {
    return MastodonApiInstanceStats.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiInstanceStats = _$MastodonApiInstanceStatsTearOff();

/// @nodoc
mixin _$MastodonApiInstanceStats {
  @JsonKey(name: 'user_count')
  @HiveField(0)
  int? get userCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_count')
  @HiveField(1)
  int? get statusCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'domain_count')
  @HiveField(2)
  int? get domainCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiInstanceStatsCopyWith<MastodonApiInstanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiInstanceStatsCopyWith<$Res> {
  factory $MastodonApiInstanceStatsCopyWith(MastodonApiInstanceStats value,
          $Res Function(MastodonApiInstanceStats) then) =
      _$MastodonApiInstanceStatsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_count') @HiveField(0) int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) int? domainCount});
}

/// @nodoc
class _$MastodonApiInstanceStatsCopyWithImpl<$Res>
    implements $MastodonApiInstanceStatsCopyWith<$Res> {
  _$MastodonApiInstanceStatsCopyWithImpl(this._value, this._then);

  final MastodonApiInstanceStats _value;
  // ignore: unused_field
  final $Res Function(MastodonApiInstanceStats) _then;

  @override
  $Res call({
    Object? userCount = freezed,
    Object? statusCount = freezed,
    Object? domainCount = freezed,
  }) {
    return _then(_value.copyWith(
      userCount: userCount == freezed
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCount: statusCount == freezed
          ? _value.statusCount
          : statusCount // ignore: cast_nullable_to_non_nullable
              as int?,
      domainCount: domainCount == freezed
          ? _value.domainCount
          : domainCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiInstanceStatsCopyWith<$Res>
    implements $MastodonApiInstanceStatsCopyWith<$Res> {
  factory _$MastodonApiInstanceStatsCopyWith(_MastodonApiInstanceStats value,
          $Res Function(_MastodonApiInstanceStats) then) =
      __$MastodonApiInstanceStatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_count') @HiveField(0) int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) int? domainCount});
}

/// @nodoc
class __$MastodonApiInstanceStatsCopyWithImpl<$Res>
    extends _$MastodonApiInstanceStatsCopyWithImpl<$Res>
    implements _$MastodonApiInstanceStatsCopyWith<$Res> {
  __$MastodonApiInstanceStatsCopyWithImpl(_MastodonApiInstanceStats _value,
      $Res Function(_MastodonApiInstanceStats) _then)
      : super(_value, (v) => _then(v as _MastodonApiInstanceStats));

  @override
  _MastodonApiInstanceStats get _value =>
      super._value as _MastodonApiInstanceStats;

  @override
  $Res call({
    Object? userCount = freezed,
    Object? statusCount = freezed,
    Object? domainCount = freezed,
  }) {
    return _then(_MastodonApiInstanceStats(
      userCount: userCount == freezed
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCount: statusCount == freezed
          ? _value.statusCount
          : statusCount // ignore: cast_nullable_to_non_nullable
              as int?,
      domainCount: domainCount == freezed
          ? _value.domainCount
          : domainCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiInstanceStats implements _MastodonApiInstanceStats {
  const _$_MastodonApiInstanceStats(
      {@JsonKey(name: 'user_count') @HiveField(0) required this.userCount,
      @JsonKey(name: 'status_count') @HiveField(1) required this.statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) required this.domainCount});

  factory _$_MastodonApiInstanceStats.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiInstanceStatsFromJson(json);

  @override
  @JsonKey(name: 'user_count')
  @HiveField(0)
  final int? userCount;
  @override
  @JsonKey(name: 'status_count')
  @HiveField(1)
  final int? statusCount;
  @override
  @JsonKey(name: 'domain_count')
  @HiveField(2)
  final int? domainCount;

  @override
  String toString() {
    return 'MastodonApiInstanceStats(userCount: $userCount, statusCount: $statusCount, domainCount: $domainCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiInstanceStats &&
            (identical(other.userCount, userCount) ||
                const DeepCollectionEquality()
                    .equals(other.userCount, userCount)) &&
            (identical(other.statusCount, statusCount) ||
                const DeepCollectionEquality()
                    .equals(other.statusCount, statusCount)) &&
            (identical(other.domainCount, domainCount) ||
                const DeepCollectionEquality()
                    .equals(other.domainCount, domainCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userCount) ^
      const DeepCollectionEquality().hash(statusCount) ^
      const DeepCollectionEquality().hash(domainCount);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiInstanceStatsCopyWith<_MastodonApiInstanceStats> get copyWith =>
      __$MastodonApiInstanceStatsCopyWithImpl<_MastodonApiInstanceStats>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiInstanceStatsToJson(this);
  }
}

abstract class _MastodonApiInstanceStats implements MastodonApiInstanceStats {
  const factory _MastodonApiInstanceStats(
      {@JsonKey(name: 'user_count')
      @HiveField(0)
          required int? userCount,
      @JsonKey(name: 'status_count')
      @HiveField(1)
          required int? statusCount,
      @JsonKey(name: 'domain_count')
      @HiveField(2)
          required int? domainCount}) = _$_MastodonApiInstanceStats;

  factory _MastodonApiInstanceStats.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiInstanceStats.fromJson;

  @override
  @JsonKey(name: 'user_count')
  @HiveField(0)
  int? get userCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'status_count')
  @HiveField(1)
  int? get statusCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'domain_count')
  @HiveField(2)
  int? get domainCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiInstanceStatsCopyWith<_MastodonApiInstanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}
