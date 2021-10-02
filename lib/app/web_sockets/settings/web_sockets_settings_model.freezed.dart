// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_sockets_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebSocketsSettings _$WebSocketsSettingsFromJson(Map<String, dynamic> json) {
  return _WebSocketsSettings.fromJson(json);
}

/// @nodoc
class _$WebSocketsSettingsTearOff {
  const _$WebSocketsSettingsTearOff();

  _WebSocketsSettings call(
      {@HiveField(0)
      @JsonKey(name: 'type_string')
          required String handlingTypeString}) {
    return _WebSocketsSettings(
      handlingTypeString: handlingTypeString,
    );
  }

  WebSocketsSettings fromJson(Map<String, Object> json) {
    return WebSocketsSettings.fromJson(json);
  }
}

/// @nodoc
const $WebSocketsSettings = _$WebSocketsSettingsTearOff();

/// @nodoc
mixin _$WebSocketsSettings {
  @HiveField(0)
  @JsonKey(name: 'type_string')
  String get handlingTypeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebSocketsSettingsCopyWith<WebSocketsSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketsSettingsCopyWith<$Res> {
  factory $WebSocketsSettingsCopyWith(
          WebSocketsSettings value, $Res Function(WebSocketsSettings) then) =
      _$WebSocketsSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'type_string') String handlingTypeString});
}

/// @nodoc
class _$WebSocketsSettingsCopyWithImpl<$Res>
    implements $WebSocketsSettingsCopyWith<$Res> {
  _$WebSocketsSettingsCopyWithImpl(this._value, this._then);

  final WebSocketsSettings _value;
  // ignore: unused_field
  final $Res Function(WebSocketsSettings) _then;

  @override
  $Res call({
    Object? handlingTypeString = freezed,
  }) {
    return _then(_value.copyWith(
      handlingTypeString: handlingTypeString == freezed
          ? _value.handlingTypeString
          : handlingTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WebSocketsSettingsCopyWith<$Res>
    implements $WebSocketsSettingsCopyWith<$Res> {
  factory _$WebSocketsSettingsCopyWith(
          _WebSocketsSettings value, $Res Function(_WebSocketsSettings) then) =
      __$WebSocketsSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'type_string') String handlingTypeString});
}

/// @nodoc
class __$WebSocketsSettingsCopyWithImpl<$Res>
    extends _$WebSocketsSettingsCopyWithImpl<$Res>
    implements _$WebSocketsSettingsCopyWith<$Res> {
  __$WebSocketsSettingsCopyWithImpl(
      _WebSocketsSettings _value, $Res Function(_WebSocketsSettings) _then)
      : super(_value, (v) => _then(v as _WebSocketsSettings));

  @override
  _WebSocketsSettings get _value => super._value as _WebSocketsSettings;

  @override
  $Res call({
    Object? handlingTypeString = freezed,
  }) {
    return _then(_WebSocketsSettings(
      handlingTypeString: handlingTypeString == freezed
          ? _value.handlingTypeString
          : handlingTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebSocketsSettings extends _WebSocketsSettings {
  const _$_WebSocketsSettings(
      {@HiveField(0)
      @JsonKey(name: 'type_string')
          required this.handlingTypeString})
      : super._();

  factory _$_WebSocketsSettings.fromJson(Map<String, dynamic> json) =>
      _$$_WebSocketsSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'type_string')
  final String handlingTypeString;

  @override
  String toString() {
    return 'WebSocketsSettings(handlingTypeString: $handlingTypeString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WebSocketsSettings &&
            (identical(other.handlingTypeString, handlingTypeString) ||
                const DeepCollectionEquality()
                    .equals(other.handlingTypeString, handlingTypeString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(handlingTypeString);

  @JsonKey(ignore: true)
  @override
  _$WebSocketsSettingsCopyWith<_WebSocketsSettings> get copyWith =>
      __$WebSocketsSettingsCopyWithImpl<_WebSocketsSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebSocketsSettingsToJson(this);
  }
}

abstract class _WebSocketsSettings extends WebSocketsSettings {
  const factory _WebSocketsSettings(
      {@HiveField(0)
      @JsonKey(name: 'type_string')
          required String handlingTypeString}) = _$_WebSocketsSettings;
  const _WebSocketsSettings._() : super._();

  factory _WebSocketsSettings.fromJson(Map<String, dynamic> json) =
      _$_WebSocketsSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'type_string')
  String get handlingTypeString => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WebSocketsSettingsCopyWith<_WebSocketsSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
