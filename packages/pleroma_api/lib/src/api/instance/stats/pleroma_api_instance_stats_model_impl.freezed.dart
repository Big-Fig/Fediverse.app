// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_stats_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceStats _$PleromaApiInstanceStatsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstanceStats.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceStatsTearOff {
  const _$PleromaApiInstanceStatsTearOff();

  _PleromaApiInstanceStats call(
      {@JsonKey(name: 'user_count') @HiveField(0) required int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) required int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) required int? domainCount}) {
    return _PleromaApiInstanceStats(
      userCount: userCount,
      statusCount: statusCount,
      domainCount: domainCount,
    );
  }

  PleromaApiInstanceStats fromJson(Map<String, Object?> json) {
    return PleromaApiInstanceStats.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceStats = _$PleromaApiInstanceStatsTearOff();

/// @nodoc
mixin _$PleromaApiInstanceStats {
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
  $PleromaApiInstanceStatsCopyWith<PleromaApiInstanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceStatsCopyWith<$Res> {
  factory $PleromaApiInstanceStatsCopyWith(PleromaApiInstanceStats value,
          $Res Function(PleromaApiInstanceStats) then) =
      _$PleromaApiInstanceStatsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_count') @HiveField(0) int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) int? domainCount});
}

/// @nodoc
class _$PleromaApiInstanceStatsCopyWithImpl<$Res>
    implements $PleromaApiInstanceStatsCopyWith<$Res> {
  _$PleromaApiInstanceStatsCopyWithImpl(this._value, this._then);

  final PleromaApiInstanceStats _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceStats) _then;

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
abstract class _$PleromaApiInstanceStatsCopyWith<$Res>
    implements $PleromaApiInstanceStatsCopyWith<$Res> {
  factory _$PleromaApiInstanceStatsCopyWith(_PleromaApiInstanceStats value,
          $Res Function(_PleromaApiInstanceStats) then) =
      __$PleromaApiInstanceStatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_count') @HiveField(0) int? userCount,
      @JsonKey(name: 'status_count') @HiveField(1) int? statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) int? domainCount});
}

/// @nodoc
class __$PleromaApiInstanceStatsCopyWithImpl<$Res>
    extends _$PleromaApiInstanceStatsCopyWithImpl<$Res>
    implements _$PleromaApiInstanceStatsCopyWith<$Res> {
  __$PleromaApiInstanceStatsCopyWithImpl(_PleromaApiInstanceStats _value,
      $Res Function(_PleromaApiInstanceStats) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstanceStats));

  @override
  _PleromaApiInstanceStats get _value =>
      super._value as _PleromaApiInstanceStats;

  @override
  $Res call({
    Object? userCount = freezed,
    Object? statusCount = freezed,
    Object? domainCount = freezed,
  }) {
    return _then(_PleromaApiInstanceStats(
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
class _$_PleromaApiInstanceStats implements _PleromaApiInstanceStats {
  const _$_PleromaApiInstanceStats(
      {@JsonKey(name: 'user_count') @HiveField(0) required this.userCount,
      @JsonKey(name: 'status_count') @HiveField(1) required this.statusCount,
      @JsonKey(name: 'domain_count') @HiveField(2) required this.domainCount});

  factory _$_PleromaApiInstanceStats.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceStatsFromJson(json);

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
    return 'PleromaApiInstanceStats(userCount: $userCount, statusCount: $statusCount, domainCount: $domainCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiInstanceStats &&
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
  _$PleromaApiInstanceStatsCopyWith<_PleromaApiInstanceStats> get copyWith =>
      __$PleromaApiInstanceStatsCopyWithImpl<_PleromaApiInstanceStats>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceStatsToJson(this);
  }
}

abstract class _PleromaApiInstanceStats implements PleromaApiInstanceStats {
  const factory _PleromaApiInstanceStats(
      {@JsonKey(name: 'user_count')
      @HiveField(0)
          required int? userCount,
      @JsonKey(name: 'status_count')
      @HiveField(1)
          required int? statusCount,
      @JsonKey(name: 'domain_count')
      @HiveField(2)
          required int? domainCount}) = _$_PleromaApiInstanceStats;

  factory _PleromaApiInstanceStats.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstanceStats.fromJson;

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
  _$PleromaApiInstanceStatsCopyWith<_PleromaApiInstanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}
