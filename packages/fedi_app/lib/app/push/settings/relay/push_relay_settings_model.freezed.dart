// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'push_relay_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushRelaySettings _$PushRelaySettingsFromJson(Map<String, dynamic> json) {
  return _PushRelaySettings.fromJson(json);
}

/// @nodoc
class _$PushRelaySettingsTearOff {
  const _$PushRelaySettingsTearOff();

  _PushRelaySettings call(
      {@HiveField(0)
      @JsonKey(name: 'push_relay_base_url')
          required String pushRelayBaseUrl}) {
    return _PushRelaySettings(
      pushRelayBaseUrl: pushRelayBaseUrl,
    );
  }

  PushRelaySettings fromJson(Map<String, Object?> json) {
    return PushRelaySettings.fromJson(json);
  }
}

/// @nodoc
const $PushRelaySettings = _$PushRelaySettingsTearOff();

/// @nodoc
mixin _$PushRelaySettings {
  @HiveField(0)
  @JsonKey(name: 'push_relay_base_url')
  String get pushRelayBaseUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushRelaySettingsCopyWith<PushRelaySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushRelaySettingsCopyWith<$Res> {
  factory $PushRelaySettingsCopyWith(
          PushRelaySettings value, $Res Function(PushRelaySettings) then) =
      _$PushRelaySettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'push_relay_base_url')
          String pushRelayBaseUrl});
}

/// @nodoc
class _$PushRelaySettingsCopyWithImpl<$Res>
    implements $PushRelaySettingsCopyWith<$Res> {
  _$PushRelaySettingsCopyWithImpl(this._value, this._then);

  final PushRelaySettings _value;
  // ignore: unused_field
  final $Res Function(PushRelaySettings) _then;

  @override
  $Res call({
    Object? pushRelayBaseUrl = freezed,
  }) {
    return _then(_value.copyWith(
      pushRelayBaseUrl: pushRelayBaseUrl == freezed
          ? _value.pushRelayBaseUrl
          : pushRelayBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PushRelaySettingsCopyWith<$Res>
    implements $PushRelaySettingsCopyWith<$Res> {
  factory _$PushRelaySettingsCopyWith(
          _PushRelaySettings value, $Res Function(_PushRelaySettings) then) =
      __$PushRelaySettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'push_relay_base_url')
          String pushRelayBaseUrl});
}

/// @nodoc
class __$PushRelaySettingsCopyWithImpl<$Res>
    extends _$PushRelaySettingsCopyWithImpl<$Res>
    implements _$PushRelaySettingsCopyWith<$Res> {
  __$PushRelaySettingsCopyWithImpl(
      _PushRelaySettings _value, $Res Function(_PushRelaySettings) _then)
      : super(_value, (v) => _then(v as _PushRelaySettings));

  @override
  _PushRelaySettings get _value => super._value as _PushRelaySettings;

  @override
  $Res call({
    Object? pushRelayBaseUrl = freezed,
  }) {
    return _then(_PushRelaySettings(
      pushRelayBaseUrl: pushRelayBaseUrl == freezed
          ? _value.pushRelayBaseUrl
          : pushRelayBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushRelaySettings extends _PushRelaySettings {
  const _$_PushRelaySettings(
      {@HiveField(0)
      @JsonKey(name: 'push_relay_base_url')
          required this.pushRelayBaseUrl})
      : super._();

  factory _$_PushRelaySettings.fromJson(Map<String, dynamic> json) =>
      _$$_PushRelaySettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'push_relay_base_url')
  final String pushRelayBaseUrl;

  @override
  String toString() {
    return 'PushRelaySettings(pushRelayBaseUrl: $pushRelayBaseUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PushRelaySettings &&
            (identical(other.pushRelayBaseUrl, pushRelayBaseUrl) ||
                other.pushRelayBaseUrl == pushRelayBaseUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pushRelayBaseUrl);

  @JsonKey(ignore: true)
  @override
  _$PushRelaySettingsCopyWith<_PushRelaySettings> get copyWith =>
      __$PushRelaySettingsCopyWithImpl<_PushRelaySettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushRelaySettingsToJson(this);
  }
}

abstract class _PushRelaySettings extends PushRelaySettings {
  const factory _PushRelaySettings(
      {@HiveField(0)
      @JsonKey(name: 'push_relay_base_url')
          required String pushRelayBaseUrl}) = _$_PushRelaySettings;
  const _PushRelaySettings._() : super._();

  factory _PushRelaySettings.fromJson(Map<String, dynamic> json) =
      _$_PushRelaySettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'push_relay_base_url')
  String get pushRelayBaseUrl;
  @override
  @JsonKey(ignore: true)
  _$PushRelaySettingsCopyWith<_PushRelaySettings> get copyWith =>
      throw _privateConstructorUsedError;
}
