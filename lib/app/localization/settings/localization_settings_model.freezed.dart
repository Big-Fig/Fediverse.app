// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'localization_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalizationSettings _$LocalizationSettingsFromJson(Map<String, dynamic> json) {
  return _LocalizationSettings.fromJson(json);
}

/// @nodoc
class _$LocalizationSettingsTearOff {
  const _$LocalizationSettingsTearOff();

  _LocalizationSettings call(
      {@HiveField(0)
      @JsonKey(name: 'localization_locale')
          required LocalizationLocale? localizationLocale}) {
    return _LocalizationSettings(
      localizationLocale: localizationLocale,
    );
  }

  LocalizationSettings fromJson(Map<String, Object> json) {
    return LocalizationSettings.fromJson(json);
  }
}

/// @nodoc
const $LocalizationSettings = _$LocalizationSettingsTearOff();

/// @nodoc
mixin _$LocalizationSettings {
  @HiveField(0)
  @JsonKey(name: 'localization_locale')
  LocalizationLocale? get localizationLocale =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationSettingsCopyWith<LocalizationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationSettingsCopyWith<$Res> {
  factory $LocalizationSettingsCopyWith(LocalizationSettings value,
          $Res Function(LocalizationSettings) then) =
      _$LocalizationSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'localization_locale')
          LocalizationLocale? localizationLocale});

  $LocalizationLocaleCopyWith<$Res>? get localizationLocale;
}

/// @nodoc
class _$LocalizationSettingsCopyWithImpl<$Res>
    implements $LocalizationSettingsCopyWith<$Res> {
  _$LocalizationSettingsCopyWithImpl(this._value, this._then);

  final LocalizationSettings _value;
  // ignore: unused_field
  final $Res Function(LocalizationSettings) _then;

  @override
  $Res call({
    Object? localizationLocale = freezed,
  }) {
    return _then(_value.copyWith(
      localizationLocale: localizationLocale == freezed
          ? _value.localizationLocale
          : localizationLocale // ignore: cast_nullable_to_non_nullable
              as LocalizationLocale?,
    ));
  }

  @override
  $LocalizationLocaleCopyWith<$Res>? get localizationLocale {
    if (_value.localizationLocale == null) {
      return null;
    }

    return $LocalizationLocaleCopyWith<$Res>(_value.localizationLocale!,
        (value) {
      return _then(_value.copyWith(localizationLocale: value));
    });
  }
}

/// @nodoc
abstract class _$LocalizationSettingsCopyWith<$Res>
    implements $LocalizationSettingsCopyWith<$Res> {
  factory _$LocalizationSettingsCopyWith(_LocalizationSettings value,
          $Res Function(_LocalizationSettings) then) =
      __$LocalizationSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'localization_locale')
          LocalizationLocale? localizationLocale});

  @override
  $LocalizationLocaleCopyWith<$Res>? get localizationLocale;
}

/// @nodoc
class __$LocalizationSettingsCopyWithImpl<$Res>
    extends _$LocalizationSettingsCopyWithImpl<$Res>
    implements _$LocalizationSettingsCopyWith<$Res> {
  __$LocalizationSettingsCopyWithImpl(
      _LocalizationSettings _value, $Res Function(_LocalizationSettings) _then)
      : super(_value, (v) => _then(v as _LocalizationSettings));

  @override
  _LocalizationSettings get _value => super._value as _LocalizationSettings;

  @override
  $Res call({
    Object? localizationLocale = freezed,
  }) {
    return _then(_LocalizationSettings(
      localizationLocale: localizationLocale == freezed
          ? _value.localizationLocale
          : localizationLocale // ignore: cast_nullable_to_non_nullable
              as LocalizationLocale?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalizationSettings extends _LocalizationSettings {
  const _$_LocalizationSettings(
      {@HiveField(0)
      @JsonKey(name: 'localization_locale')
          required this.localizationLocale})
      : super._();

  factory _$_LocalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizationSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'localization_locale')
  final LocalizationLocale? localizationLocale;

  @override
  String toString() {
    return 'LocalizationSettings(localizationLocale: $localizationLocale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalizationSettings &&
            (identical(other.localizationLocale, localizationLocale) ||
                const DeepCollectionEquality()
                    .equals(other.localizationLocale, localizationLocale)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(localizationLocale);

  @JsonKey(ignore: true)
  @override
  _$LocalizationSettingsCopyWith<_LocalizationSettings> get copyWith =>
      __$LocalizationSettingsCopyWithImpl<_LocalizationSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizationSettingsToJson(this);
  }
}

abstract class _LocalizationSettings extends LocalizationSettings {
  const factory _LocalizationSettings(
          {@HiveField(0)
          @JsonKey(name: 'localization_locale')
              required LocalizationLocale? localizationLocale}) =
      _$_LocalizationSettings;
  const _LocalizationSettings._() : super._();

  factory _LocalizationSettings.fromJson(Map<String, dynamic> json) =
      _$_LocalizationSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'localization_locale')
  LocalizationLocale? get localizationLocale =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalizationSettingsCopyWith<_LocalizationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
