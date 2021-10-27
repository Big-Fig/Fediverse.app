// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'files_cache_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilesCacheSettings _$FilesCacheSettingsFromJson(Map<String, dynamic> json) {
  return _FilesCacheSettings.fromJson(json);
}

/// @nodoc
class _$FilesCacheSettingsTearOff {
  const _$FilesCacheSettingsTearOff();

  _FilesCacheSettings call(
      {@HiveField(2)
      @JsonKey(name: 'files_cache_size_limit_count_type_string')
          required String sizeLimitCountTypeString,
      @HiveField(3)
      @JsonKey(name: 'files_cache_ageL_limit_type_string')
          required String ageLimitTypeString}) {
    return _FilesCacheSettings(
      sizeLimitCountTypeString: sizeLimitCountTypeString,
      ageLimitTypeString: ageLimitTypeString,
    );
  }

  FilesCacheSettings fromJson(Map<String, Object?> json) {
    return FilesCacheSettings.fromJson(json);
  }
}

/// @nodoc
const $FilesCacheSettings = _$FilesCacheSettingsTearOff();

/// @nodoc
mixin _$FilesCacheSettings {
  @HiveField(2)
  @JsonKey(name: 'files_cache_size_limit_count_type_string')
  String get sizeLimitCountTypeString => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'files_cache_ageL_limit_type_string')
  String get ageLimitTypeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilesCacheSettingsCopyWith<FilesCacheSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesCacheSettingsCopyWith<$Res> {
  factory $FilesCacheSettingsCopyWith(
          FilesCacheSettings value, $Res Function(FilesCacheSettings) then) =
      _$FilesCacheSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(2)
      @JsonKey(name: 'files_cache_size_limit_count_type_string')
          String sizeLimitCountTypeString,
      @HiveField(3)
      @JsonKey(name: 'files_cache_ageL_limit_type_string')
          String ageLimitTypeString});
}

/// @nodoc
class _$FilesCacheSettingsCopyWithImpl<$Res>
    implements $FilesCacheSettingsCopyWith<$Res> {
  _$FilesCacheSettingsCopyWithImpl(this._value, this._then);

  final FilesCacheSettings _value;
  // ignore: unused_field
  final $Res Function(FilesCacheSettings) _then;

  @override
  $Res call({
    Object? sizeLimitCountTypeString = freezed,
    Object? ageLimitTypeString = freezed,
  }) {
    return _then(_value.copyWith(
      sizeLimitCountTypeString: sizeLimitCountTypeString == freezed
          ? _value.sizeLimitCountTypeString
          : sizeLimitCountTypeString // ignore: cast_nullable_to_non_nullable
              as String,
      ageLimitTypeString: ageLimitTypeString == freezed
          ? _value.ageLimitTypeString
          : ageLimitTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FilesCacheSettingsCopyWith<$Res>
    implements $FilesCacheSettingsCopyWith<$Res> {
  factory _$FilesCacheSettingsCopyWith(
          _FilesCacheSettings value, $Res Function(_FilesCacheSettings) then) =
      __$FilesCacheSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(2)
      @JsonKey(name: 'files_cache_size_limit_count_type_string')
          String sizeLimitCountTypeString,
      @HiveField(3)
      @JsonKey(name: 'files_cache_ageL_limit_type_string')
          String ageLimitTypeString});
}

/// @nodoc
class __$FilesCacheSettingsCopyWithImpl<$Res>
    extends _$FilesCacheSettingsCopyWithImpl<$Res>
    implements _$FilesCacheSettingsCopyWith<$Res> {
  __$FilesCacheSettingsCopyWithImpl(
      _FilesCacheSettings _value, $Res Function(_FilesCacheSettings) _then)
      : super(_value, (v) => _then(v as _FilesCacheSettings));

  @override
  _FilesCacheSettings get _value => super._value as _FilesCacheSettings;

  @override
  $Res call({
    Object? sizeLimitCountTypeString = freezed,
    Object? ageLimitTypeString = freezed,
  }) {
    return _then(_FilesCacheSettings(
      sizeLimitCountTypeString: sizeLimitCountTypeString == freezed
          ? _value.sizeLimitCountTypeString
          : sizeLimitCountTypeString // ignore: cast_nullable_to_non_nullable
              as String,
      ageLimitTypeString: ageLimitTypeString == freezed
          ? _value.ageLimitTypeString
          : ageLimitTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FilesCacheSettings extends _FilesCacheSettings {
  const _$_FilesCacheSettings(
      {@HiveField(2)
      @JsonKey(name: 'files_cache_size_limit_count_type_string')
          required this.sizeLimitCountTypeString,
      @HiveField(3)
      @JsonKey(name: 'files_cache_ageL_limit_type_string')
          required this.ageLimitTypeString})
      : super._();

  factory _$_FilesCacheSettings.fromJson(Map<String, dynamic> json) =>
      _$$_FilesCacheSettingsFromJson(json);

  @override
  @HiveField(2)
  @JsonKey(name: 'files_cache_size_limit_count_type_string')
  final String sizeLimitCountTypeString;
  @override
  @HiveField(3)
  @JsonKey(name: 'files_cache_ageL_limit_type_string')
  final String ageLimitTypeString;

  @override
  String toString() {
    return 'FilesCacheSettings(sizeLimitCountTypeString: $sizeLimitCountTypeString, ageLimitTypeString: $ageLimitTypeString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilesCacheSettings &&
            (identical(
                    other.sizeLimitCountTypeString, sizeLimitCountTypeString) ||
                other.sizeLimitCountTypeString == sizeLimitCountTypeString) &&
            (identical(other.ageLimitTypeString, ageLimitTypeString) ||
                other.ageLimitTypeString == ageLimitTypeString));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sizeLimitCountTypeString, ageLimitTypeString);

  @JsonKey(ignore: true)
  @override
  _$FilesCacheSettingsCopyWith<_FilesCacheSettings> get copyWith =>
      __$FilesCacheSettingsCopyWithImpl<_FilesCacheSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilesCacheSettingsToJson(this);
  }
}

abstract class _FilesCacheSettings extends FilesCacheSettings {
  const factory _FilesCacheSettings(
      {@HiveField(2)
      @JsonKey(name: 'files_cache_size_limit_count_type_string')
          required String sizeLimitCountTypeString,
      @HiveField(3)
      @JsonKey(name: 'files_cache_ageL_limit_type_string')
          required String ageLimitTypeString}) = _$_FilesCacheSettings;
  const _FilesCacheSettings._() : super._();

  factory _FilesCacheSettings.fromJson(Map<String, dynamic> json) =
      _$_FilesCacheSettings.fromJson;

  @override
  @HiveField(2)
  @JsonKey(name: 'files_cache_size_limit_count_type_string')
  String get sizeLimitCountTypeString;
  @override
  @HiveField(3)
  @JsonKey(name: 'files_cache_ageL_limit_type_string')
  String get ageLimitTypeString;
  @override
  @JsonKey(ignore: true)
  _$FilesCacheSettingsCopyWith<_FilesCacheSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
