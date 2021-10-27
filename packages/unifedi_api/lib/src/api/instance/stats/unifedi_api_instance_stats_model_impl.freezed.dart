// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_stats_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceStats _$UnifediApiInstanceStatsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceStats.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceStatsTearOff {
  const _$UnifediApiInstanceStatsTearOff();

  _UnifediApiInstanceStats call(
      {@JsonKey(name: 'user_count') @HiveField(0) required int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) required int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) required int? domainCount}) {
    return _UnifediApiInstanceStats(
      userCount: userCount,
      statusCount: statusCount,
      domainCount: domainCount,
    );
  }

  UnifediApiInstanceStats fromJson(Map<String, Object?> json) {
    return UnifediApiInstanceStats.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceStats = _$UnifediApiInstanceStatsTearOff();

/// @nodoc
mixin _$UnifediApiInstanceStats {
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
  $UnifediApiInstanceStatsCopyWith<UnifediApiInstanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceStatsCopyWith<$Res> {
  factory $UnifediApiInstanceStatsCopyWith(UnifediApiInstanceStats value,
          $Res Function(UnifediApiInstanceStats) then) =
      _$UnifediApiInstanceStatsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_count') @HiveField(0) int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) int? domainCount});
}

/// @nodoc
class _$UnifediApiInstanceStatsCopyWithImpl<$Res>
    implements $UnifediApiInstanceStatsCopyWith<$Res> {
  _$UnifediApiInstanceStatsCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceStats _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceStats) _then;

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
abstract class _$UnifediApiInstanceStatsCopyWith<$Res>
    implements $UnifediApiInstanceStatsCopyWith<$Res> {
  factory _$UnifediApiInstanceStatsCopyWith(_UnifediApiInstanceStats value,
          $Res Function(_UnifediApiInstanceStats) then) =
      __$UnifediApiInstanceStatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_count') @HiveField(0) int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) int? domainCount});
}

/// @nodoc
class __$UnifediApiInstanceStatsCopyWithImpl<$Res>
    extends _$UnifediApiInstanceStatsCopyWithImpl<$Res>
    implements _$UnifediApiInstanceStatsCopyWith<$Res> {
  __$UnifediApiInstanceStatsCopyWithImpl(_UnifediApiInstanceStats _value,
      $Res Function(_UnifediApiInstanceStats) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceStats));

  @override
  _UnifediApiInstanceStats get _value =>
      super._value as _UnifediApiInstanceStats;

  @override
  $Res call({
    Object? userCount = freezed,
    Object? statusCount = freezed,
    Object? domainCount = freezed,
  }) {
    return _then(_UnifediApiInstanceStats(
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
class _$_UnifediApiInstanceStats implements _UnifediApiInstanceStats {
  const _$_UnifediApiInstanceStats(
      {@JsonKey(name: 'user_count') @HiveField(0) required this.userCount,
      @JsonKey(name: 'status_count') @HiveField(1) required this.statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) required this.domainCount});

  factory _$_UnifediApiInstanceStats.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceStatsFromJson(json);

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
    return 'UnifediApiInstanceStats(userCount: $userCount, statusCount: $statusCount, domainCount: $domainCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceStats &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount) &&
            (identical(other.statusCount, statusCount) ||
                other.statusCount == statusCount) &&
            (identical(other.domainCount, domainCount) ||
                other.domainCount == domainCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userCount, statusCount, domainCount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceStatsCopyWith<_UnifediApiInstanceStats> get copyWith =>
      __$UnifediApiInstanceStatsCopyWithImpl<_UnifediApiInstanceStats>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceStatsToJson(this);
  }
}

abstract class _UnifediApiInstanceStats implements UnifediApiInstanceStats {
  const factory _UnifediApiInstanceStats(
      {@JsonKey(name: 'user_count')
      @HiveField(0)
          required int? userCount,
      @JsonKey(name: 'status_count')
      @HiveField(1)
          required int? statusCount,
      @JsonKey(name: 'domain_count')
      @HiveField(2)
          required int? domainCount}) = _$_UnifediApiInstanceStats;

  factory _UnifediApiInstanceStats.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceStats.fromJson;

  @override
  @JsonKey(name: 'user_count')
  @HiveField(0)
  int? get userCount;
  @override
  @JsonKey(name: 'status_count')
  @HiveField(1)
  int? get statusCount;
  @override
  @JsonKey(name: 'domain_count')
  @HiveField(2)
  int? get domainCount;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceStatsCopyWith<_UnifediApiInstanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}
