// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'crash_reporting_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CrashReportingSettings _$CrashReportingSettingsFromJson(
    Map<String, dynamic> json) {
  return _CrashReportingSettings.fromJson(json);
}

/// @nodoc
class _$CrashReportingSettingsTearOff {
  const _$CrashReportingSettingsTearOff();

  _CrashReportingSettings call(
      {@HiveField(0)
      @JsonKey(name: 'reporting_enabled')
          required bool reportingEnabled}) {
    return _CrashReportingSettings(
      reportingEnabled: reportingEnabled,
    );
  }

  CrashReportingSettings fromJson(Map<String, Object> json) {
    return CrashReportingSettings.fromJson(json);
  }
}

/// @nodoc
const $CrashReportingSettings = _$CrashReportingSettingsTearOff();

/// @nodoc
mixin _$CrashReportingSettings {
  @HiveField(0)
  @JsonKey(name: 'reporting_enabled')
  bool get reportingEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrashReportingSettingsCopyWith<CrashReportingSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrashReportingSettingsCopyWith<$Res> {
  factory $CrashReportingSettingsCopyWith(CrashReportingSettings value,
          $Res Function(CrashReportingSettings) then) =
      _$CrashReportingSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'reporting_enabled')
          bool reportingEnabled});
}

/// @nodoc
class _$CrashReportingSettingsCopyWithImpl<$Res>
    implements $CrashReportingSettingsCopyWith<$Res> {
  _$CrashReportingSettingsCopyWithImpl(this._value, this._then);

  final CrashReportingSettings _value;
  // ignore: unused_field
  final $Res Function(CrashReportingSettings) _then;

  @override
  $Res call({
    Object? reportingEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      reportingEnabled: reportingEnabled == freezed
          ? _value.reportingEnabled
          : reportingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CrashReportingSettingsCopyWith<$Res>
    implements $CrashReportingSettingsCopyWith<$Res> {
  factory _$CrashReportingSettingsCopyWith(_CrashReportingSettings value,
          $Res Function(_CrashReportingSettings) then) =
      __$CrashReportingSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'reporting_enabled')
          bool reportingEnabled});
}

/// @nodoc
class __$CrashReportingSettingsCopyWithImpl<$Res>
    extends _$CrashReportingSettingsCopyWithImpl<$Res>
    implements _$CrashReportingSettingsCopyWith<$Res> {
  __$CrashReportingSettingsCopyWithImpl(_CrashReportingSettings _value,
      $Res Function(_CrashReportingSettings) _then)
      : super(_value, (v) => _then(v as _CrashReportingSettings));

  @override
  _CrashReportingSettings get _value => super._value as _CrashReportingSettings;

  @override
  $Res call({
    Object? reportingEnabled = freezed,
  }) {
    return _then(_CrashReportingSettings(
      reportingEnabled: reportingEnabled == freezed
          ? _value.reportingEnabled
          : reportingEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CrashReportingSettings extends _CrashReportingSettings {
  const _$_CrashReportingSettings(
      {@HiveField(0)
      @JsonKey(name: 'reporting_enabled')
          required this.reportingEnabled})
      : super._();

  factory _$_CrashReportingSettings.fromJson(Map<String, dynamic> json) =>
      _$$_CrashReportingSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'reporting_enabled')
  final bool reportingEnabled;

  @override
  String toString() {
    return 'CrashReportingSettings(reportingEnabled: $reportingEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CrashReportingSettings &&
            (identical(other.reportingEnabled, reportingEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.reportingEnabled, reportingEnabled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(reportingEnabled);

  @JsonKey(ignore: true)
  @override
  _$CrashReportingSettingsCopyWith<_CrashReportingSettings> get copyWith =>
      __$CrashReportingSettingsCopyWithImpl<_CrashReportingSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CrashReportingSettingsToJson(this);
  }
}

abstract class _CrashReportingSettings extends CrashReportingSettings {
  const factory _CrashReportingSettings(
      {@HiveField(0)
      @JsonKey(name: 'reporting_enabled')
          required bool reportingEnabled}) = _$_CrashReportingSettings;
  const _CrashReportingSettings._() : super._();

  factory _CrashReportingSettings.fromJson(Map<String, dynamic> json) =
      _$_CrashReportingSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'reporting_enabled')
  bool get reportingEnabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CrashReportingSettingsCopyWith<_CrashReportingSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
