// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ui_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UiSettings _$UiSettingsFromJson(Map<String, dynamic> json) {
  return _UiSettings.fromJson(json);
}

/// @nodoc
class _$UiSettingsTearOff {
  const _$UiSettingsTearOff();

  _UiSettings call(
      {@HiveField(0)
      @JsonKey(name: 'theme_id')
          required String? themeId,
      @HiveField(1)
      @JsonKey(name: 'status_font_size')
          required String statusFontSizeString}) {
    return _UiSettings(
      themeId: themeId,
      statusFontSizeString: statusFontSizeString,
    );
  }

  UiSettings fromJson(Map<String, Object> json) {
    return UiSettings.fromJson(json);
  }
}

/// @nodoc
const $UiSettings = _$UiSettingsTearOff();

/// @nodoc
mixin _$UiSettings {
  @HiveField(0)
  @JsonKey(name: 'theme_id')
  String? get themeId => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'status_font_size')
  String get statusFontSizeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UiSettingsCopyWith<UiSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiSettingsCopyWith<$Res> {
  factory $UiSettingsCopyWith(
          UiSettings value, $Res Function(UiSettings) then) =
      _$UiSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'theme_id')
          String? themeId,
      @HiveField(1)
      @JsonKey(name: 'status_font_size')
          String statusFontSizeString});
}

/// @nodoc
class _$UiSettingsCopyWithImpl<$Res> implements $UiSettingsCopyWith<$Res> {
  _$UiSettingsCopyWithImpl(this._value, this._then);

  final UiSettings _value;
  // ignore: unused_field
  final $Res Function(UiSettings) _then;

  @override
  $Res call({
    Object? themeId = freezed,
    Object? statusFontSizeString = freezed,
  }) {
    return _then(_value.copyWith(
      themeId: themeId == freezed
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFontSizeString: statusFontSizeString == freezed
          ? _value.statusFontSizeString
          : statusFontSizeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UiSettingsCopyWith<$Res> implements $UiSettingsCopyWith<$Res> {
  factory _$UiSettingsCopyWith(
          _UiSettings value, $Res Function(_UiSettings) then) =
      __$UiSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'theme_id')
          String? themeId,
      @HiveField(1)
      @JsonKey(name: 'status_font_size')
          String statusFontSizeString});
}

/// @nodoc
class __$UiSettingsCopyWithImpl<$Res> extends _$UiSettingsCopyWithImpl<$Res>
    implements _$UiSettingsCopyWith<$Res> {
  __$UiSettingsCopyWithImpl(
      _UiSettings _value, $Res Function(_UiSettings) _then)
      : super(_value, (v) => _then(v as _UiSettings));

  @override
  _UiSettings get _value => super._value as _UiSettings;

  @override
  $Res call({
    Object? themeId = freezed,
    Object? statusFontSizeString = freezed,
  }) {
    return _then(_UiSettings(
      themeId: themeId == freezed
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFontSizeString: statusFontSizeString == freezed
          ? _value.statusFontSizeString
          : statusFontSizeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UiSettings extends _UiSettings {
  const _$_UiSettings(
      {@HiveField(0)
      @JsonKey(name: 'theme_id')
          required this.themeId,
      @HiveField(1)
      @JsonKey(name: 'status_font_size')
          required this.statusFontSizeString})
      : super._();

  factory _$_UiSettings.fromJson(Map<String, dynamic> json) =>
      _$$_UiSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'theme_id')
  final String? themeId;
  @override
  @HiveField(1)
  @JsonKey(name: 'status_font_size')
  final String statusFontSizeString;

  @override
  String toString() {
    return 'UiSettings(themeId: $themeId, statusFontSizeString: $statusFontSizeString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UiSettings &&
            (identical(other.themeId, themeId) ||
                const DeepCollectionEquality()
                    .equals(other.themeId, themeId)) &&
            (identical(other.statusFontSizeString, statusFontSizeString) ||
                const DeepCollectionEquality()
                    .equals(other.statusFontSizeString, statusFontSizeString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(themeId) ^
      const DeepCollectionEquality().hash(statusFontSizeString);

  @JsonKey(ignore: true)
  @override
  _$UiSettingsCopyWith<_UiSettings> get copyWith =>
      __$UiSettingsCopyWithImpl<_UiSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UiSettingsToJson(this);
  }
}

abstract class _UiSettings extends UiSettings {
  const factory _UiSettings(
      {@HiveField(0)
      @JsonKey(name: 'theme_id')
          required String? themeId,
      @HiveField(1)
      @JsonKey(name: 'status_font_size')
          required String statusFontSizeString}) = _$_UiSettings;
  const _UiSettings._() : super._();

  factory _UiSettings.fromJson(Map<String, dynamic> json) =
      _$_UiSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'theme_id')
  String? get themeId => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'status_font_size')
  String get statusFontSizeString => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UiSettingsCopyWith<_UiSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
