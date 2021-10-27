// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaSettings _$MediaSettingsFromJson(Map<String, dynamic> json) {
  return _MediaSettings.fromJson(json);
}

/// @nodoc
class _$MediaSettingsTearOff {
  const _$MediaSettingsTearOff();

  _MediaSettings call(
      {@HiveField(0) @JsonKey(name: 'auto_init') required bool autoInit,
      @HiveField(1) @JsonKey(name: 'auto_play') required bool autoPlay}) {
    return _MediaSettings(
      autoInit: autoInit,
      autoPlay: autoPlay,
    );
  }

  MediaSettings fromJson(Map<String, Object?> json) {
    return MediaSettings.fromJson(json);
  }
}

/// @nodoc
const $MediaSettings = _$MediaSettingsTearOff();

/// @nodoc
mixin _$MediaSettings {
  @HiveField(0)
  @JsonKey(name: 'auto_init')
  bool get autoInit => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'auto_play')
  bool get autoPlay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaSettingsCopyWith<MediaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaSettingsCopyWith<$Res> {
  factory $MediaSettingsCopyWith(
          MediaSettings value, $Res Function(MediaSettings) then) =
      _$MediaSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) @JsonKey(name: 'auto_init') bool autoInit,
      @HiveField(1) @JsonKey(name: 'auto_play') bool autoPlay});
}

/// @nodoc
class _$MediaSettingsCopyWithImpl<$Res>
    implements $MediaSettingsCopyWith<$Res> {
  _$MediaSettingsCopyWithImpl(this._value, this._then);

  final MediaSettings _value;
  // ignore: unused_field
  final $Res Function(MediaSettings) _then;

  @override
  $Res call({
    Object? autoInit = freezed,
    Object? autoPlay = freezed,
  }) {
    return _then(_value.copyWith(
      autoInit: autoInit == freezed
          ? _value.autoInit
          : autoInit // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MediaSettingsCopyWith<$Res>
    implements $MediaSettingsCopyWith<$Res> {
  factory _$MediaSettingsCopyWith(
          _MediaSettings value, $Res Function(_MediaSettings) then) =
      __$MediaSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) @JsonKey(name: 'auto_init') bool autoInit,
      @HiveField(1) @JsonKey(name: 'auto_play') bool autoPlay});
}

/// @nodoc
class __$MediaSettingsCopyWithImpl<$Res>
    extends _$MediaSettingsCopyWithImpl<$Res>
    implements _$MediaSettingsCopyWith<$Res> {
  __$MediaSettingsCopyWithImpl(
      _MediaSettings _value, $Res Function(_MediaSettings) _then)
      : super(_value, (v) => _then(v as _MediaSettings));

  @override
  _MediaSettings get _value => super._value as _MediaSettings;

  @override
  $Res call({
    Object? autoInit = freezed,
    Object? autoPlay = freezed,
  }) {
    return _then(_MediaSettings(
      autoInit: autoInit == freezed
          ? _value.autoInit
          : autoInit // ignore: cast_nullable_to_non_nullable
              as bool,
      autoPlay: autoPlay == freezed
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaSettings extends _MediaSettings {
  const _$_MediaSettings(
      {@HiveField(0) @JsonKey(name: 'auto_init') required this.autoInit,
      @HiveField(1) @JsonKey(name: 'auto_play') required this.autoPlay})
      : super._();

  factory _$_MediaSettings.fromJson(Map<String, dynamic> json) =>
      _$$_MediaSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'auto_init')
  final bool autoInit;
  @override
  @HiveField(1)
  @JsonKey(name: 'auto_play')
  final bool autoPlay;

  @override
  String toString() {
    return 'MediaSettings(autoInit: $autoInit, autoPlay: $autoPlay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaSettings &&
            (identical(other.autoInit, autoInit) ||
                other.autoInit == autoInit) &&
            (identical(other.autoPlay, autoPlay) ||
                other.autoPlay == autoPlay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, autoInit, autoPlay);

  @JsonKey(ignore: true)
  @override
  _$MediaSettingsCopyWith<_MediaSettings> get copyWith =>
      __$MediaSettingsCopyWithImpl<_MediaSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaSettingsToJson(this);
  }
}

abstract class _MediaSettings extends MediaSettings {
  const factory _MediaSettings(
          {@HiveField(0) @JsonKey(name: 'auto_init') required bool autoInit,
          @HiveField(1) @JsonKey(name: 'auto_play') required bool autoPlay}) =
      _$_MediaSettings;
  const _MediaSettings._() : super._();

  factory _MediaSettings.fromJson(Map<String, dynamic> json) =
      _$_MediaSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'auto_init')
  bool get autoInit;
  @override
  @HiveField(1)
  @JsonKey(name: 'auto_play')
  bool get autoPlay;
  @override
  @JsonKey(ignore: true)
  _$MediaSettingsCopyWith<_MediaSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
