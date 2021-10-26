// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppAnalyticsData _$AppAnalyticsDataFromJson(Map<String, dynamic> json) {
  return _AppAnalyticsData.fromJson(json);
}

/// @nodoc
class _$AppAnalyticsDataTearOff {
  const _$AppAnalyticsDataTearOff();

  _AppAnalyticsData call(
      {@JsonKey(name: 'appOpenedCount')
      @HiveField(0)
          required int appOpenedCount}) {
    return _AppAnalyticsData(
      appOpenedCount: appOpenedCount,
    );
  }

  AppAnalyticsData fromJson(Map<String, Object> json) {
    return AppAnalyticsData.fromJson(json);
  }
}

/// @nodoc
const $AppAnalyticsData = _$AppAnalyticsDataTearOff();

/// @nodoc
mixin _$AppAnalyticsData {
  @JsonKey(name: 'appOpenedCount')
  @HiveField(0)
  int get appOpenedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppAnalyticsDataCopyWith<AppAnalyticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAnalyticsDataCopyWith<$Res> {
  factory $AppAnalyticsDataCopyWith(
          AppAnalyticsData value, $Res Function(AppAnalyticsData) then) =
      _$AppAnalyticsDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'appOpenedCount') @HiveField(0) int appOpenedCount});
}

/// @nodoc
class _$AppAnalyticsDataCopyWithImpl<$Res>
    implements $AppAnalyticsDataCopyWith<$Res> {
  _$AppAnalyticsDataCopyWithImpl(this._value, this._then);

  final AppAnalyticsData _value;
  // ignore: unused_field
  final $Res Function(AppAnalyticsData) _then;

  @override
  $Res call({
    Object? appOpenedCount = freezed,
  }) {
    return _then(_value.copyWith(
      appOpenedCount: appOpenedCount == freezed
          ? _value.appOpenedCount
          : appOpenedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AppAnalyticsDataCopyWith<$Res>
    implements $AppAnalyticsDataCopyWith<$Res> {
  factory _$AppAnalyticsDataCopyWith(
          _AppAnalyticsData value, $Res Function(_AppAnalyticsData) then) =
      __$AppAnalyticsDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'appOpenedCount') @HiveField(0) int appOpenedCount});
}

/// @nodoc
class __$AppAnalyticsDataCopyWithImpl<$Res>
    extends _$AppAnalyticsDataCopyWithImpl<$Res>
    implements _$AppAnalyticsDataCopyWith<$Res> {
  __$AppAnalyticsDataCopyWithImpl(
      _AppAnalyticsData _value, $Res Function(_AppAnalyticsData) _then)
      : super(_value, (v) => _then(v as _AppAnalyticsData));

  @override
  _AppAnalyticsData get _value => super._value as _AppAnalyticsData;

  @override
  $Res call({
    Object? appOpenedCount = freezed,
  }) {
    return _then(_AppAnalyticsData(
      appOpenedCount: appOpenedCount == freezed
          ? _value.appOpenedCount
          : appOpenedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppAnalyticsData implements _AppAnalyticsData {
  const _$_AppAnalyticsData(
      {@JsonKey(name: 'appOpenedCount')
      @HiveField(0)
          required this.appOpenedCount});

  factory _$_AppAnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$$_AppAnalyticsDataFromJson(json);

  @override
  @JsonKey(name: 'appOpenedCount')
  @HiveField(0)
  final int appOpenedCount;

  @override
  String toString() {
    return 'AppAnalyticsData(appOpenedCount: $appOpenedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppAnalyticsData &&
            (identical(other.appOpenedCount, appOpenedCount) ||
                const DeepCollectionEquality()
                    .equals(other.appOpenedCount, appOpenedCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appOpenedCount);

  @JsonKey(ignore: true)
  @override
  _$AppAnalyticsDataCopyWith<_AppAnalyticsData> get copyWith =>
      __$AppAnalyticsDataCopyWithImpl<_AppAnalyticsData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppAnalyticsDataToJson(this);
  }
}

abstract class _AppAnalyticsData implements AppAnalyticsData {
  const factory _AppAnalyticsData(
      {@JsonKey(name: 'appOpenedCount')
      @HiveField(0)
          required int appOpenedCount}) = _$_AppAnalyticsData;

  factory _AppAnalyticsData.fromJson(Map<String, dynamic> json) =
      _$_AppAnalyticsData.fromJson;

  @override
  @JsonKey(name: 'appOpenedCount')
  @HiveField(0)
  int get appOpenedCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppAnalyticsDataCopyWith<_AppAnalyticsData> get copyWith =>
      throw _privateConstructorUsedError;
}
