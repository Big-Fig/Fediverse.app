// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'toast_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToastSettings _$ToastSettingsFromJson(Map<String, dynamic> json) {
  return _ToastSettings.fromJson(json);
}

/// @nodoc
class _$ToastSettingsTearOff {
  const _$ToastSettingsTearOff();

  _ToastSettings call(
      {@HiveField(3)
      @JsonKey(name: 'push_settings')
          required PushSettings pushSettings,
      @HiveField(4)
      @JsonKey(name: 'handling_type_string')
          required String handlingTypeString}) {
    return _ToastSettings(
      pushSettings: pushSettings,
      handlingTypeString: handlingTypeString,
    );
  }

  ToastSettings fromJson(Map<String, Object?> json) {
    return ToastSettings.fromJson(json);
  }
}

/// @nodoc
const $ToastSettings = _$ToastSettingsTearOff();

/// @nodoc
mixin _$ToastSettings {
  @HiveField(3)
  @JsonKey(name: 'push_settings')
  PushSettings get pushSettings => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'handling_type_string')
  String get handlingTypeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToastSettingsCopyWith<ToastSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToastSettingsCopyWith<$Res> {
  factory $ToastSettingsCopyWith(
          ToastSettings value, $Res Function(ToastSettings) then) =
      _$ToastSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'push_settings')
          PushSettings pushSettings,
      @HiveField(4)
      @JsonKey(name: 'handling_type_string')
          String handlingTypeString});

  $PushSettingsCopyWith<$Res> get pushSettings;
}

/// @nodoc
class _$ToastSettingsCopyWithImpl<$Res>
    implements $ToastSettingsCopyWith<$Res> {
  _$ToastSettingsCopyWithImpl(this._value, this._then);

  final ToastSettings _value;
  // ignore: unused_field
  final $Res Function(ToastSettings) _then;

  @override
  $Res call({
    Object? pushSettings = freezed,
    Object? handlingTypeString = freezed,
  }) {
    return _then(_value.copyWith(
      pushSettings: pushSettings == freezed
          ? _value.pushSettings
          : pushSettings // ignore: cast_nullable_to_non_nullable
              as PushSettings,
      handlingTypeString: handlingTypeString == freezed
          ? _value.handlingTypeString
          : handlingTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $PushSettingsCopyWith<$Res> get pushSettings {
    return $PushSettingsCopyWith<$Res>(_value.pushSettings, (value) {
      return _then(_value.copyWith(pushSettings: value));
    });
  }
}

/// @nodoc
abstract class _$ToastSettingsCopyWith<$Res>
    implements $ToastSettingsCopyWith<$Res> {
  factory _$ToastSettingsCopyWith(
          _ToastSettings value, $Res Function(_ToastSettings) then) =
      __$ToastSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3)
      @JsonKey(name: 'push_settings')
          PushSettings pushSettings,
      @HiveField(4)
      @JsonKey(name: 'handling_type_string')
          String handlingTypeString});

  @override
  $PushSettingsCopyWith<$Res> get pushSettings;
}

/// @nodoc
class __$ToastSettingsCopyWithImpl<$Res>
    extends _$ToastSettingsCopyWithImpl<$Res>
    implements _$ToastSettingsCopyWith<$Res> {
  __$ToastSettingsCopyWithImpl(
      _ToastSettings _value, $Res Function(_ToastSettings) _then)
      : super(_value, (v) => _then(v as _ToastSettings));

  @override
  _ToastSettings get _value => super._value as _ToastSettings;

  @override
  $Res call({
    Object? pushSettings = freezed,
    Object? handlingTypeString = freezed,
  }) {
    return _then(_ToastSettings(
      pushSettings: pushSettings == freezed
          ? _value.pushSettings
          : pushSettings // ignore: cast_nullable_to_non_nullable
              as PushSettings,
      handlingTypeString: handlingTypeString == freezed
          ? _value.handlingTypeString
          : handlingTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToastSettings extends _ToastSettings {
  const _$_ToastSettings(
      {@HiveField(3)
      @JsonKey(name: 'push_settings')
          required this.pushSettings,
      @HiveField(4)
      @JsonKey(name: 'handling_type_string')
          required this.handlingTypeString})
      : super._();

  factory _$_ToastSettings.fromJson(Map<String, dynamic> json) =>
      _$$_ToastSettingsFromJson(json);

  @override
  @HiveField(3)
  @JsonKey(name: 'push_settings')
  final PushSettings pushSettings;
  @override
  @HiveField(4)
  @JsonKey(name: 'handling_type_string')
  final String handlingTypeString;

  @override
  String toString() {
    return 'ToastSettings(pushSettings: $pushSettings, handlingTypeString: $handlingTypeString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ToastSettings &&
            (identical(other.pushSettings, pushSettings) ||
                other.pushSettings == pushSettings) &&
            (identical(other.handlingTypeString, handlingTypeString) ||
                other.handlingTypeString == handlingTypeString));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pushSettings, handlingTypeString);

  @JsonKey(ignore: true)
  @override
  _$ToastSettingsCopyWith<_ToastSettings> get copyWith =>
      __$ToastSettingsCopyWithImpl<_ToastSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToastSettingsToJson(this);
  }
}

abstract class _ToastSettings extends ToastSettings {
  const factory _ToastSettings(
      {@HiveField(3)
      @JsonKey(name: 'push_settings')
          required PushSettings pushSettings,
      @HiveField(4)
      @JsonKey(name: 'handling_type_string')
          required String handlingTypeString}) = _$_ToastSettings;
  const _ToastSettings._() : super._();

  factory _ToastSettings.fromJson(Map<String, dynamic> json) =
      _$_ToastSettings.fromJson;

  @override
  @HiveField(3)
  @JsonKey(name: 'push_settings')
  PushSettings get pushSettings;
  @override
  @HiveField(4)
  @JsonKey(name: 'handling_type_string')
  String get handlingTypeString;
  @override
  @JsonKey(ignore: true)
  _$ToastSettingsCopyWith<_ToastSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
