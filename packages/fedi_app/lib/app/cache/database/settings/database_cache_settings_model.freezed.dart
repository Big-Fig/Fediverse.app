// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'database_cache_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DatabaseCacheSettings _$DatabaseCacheSettingsFromJson(
    Map<String, dynamic> json) {
  return _DatabaseCacheSettings.fromJson(json);
}

/// @nodoc
class _$DatabaseCacheSettingsTearOff {
  const _$DatabaseCacheSettingsTearOff();

  _DatabaseCacheSettings call(
      {@HiveField(2)
      @JsonKey(name: 'entries_count_by_type_limit_type')
          required String entriesCountByTypeLimitTypeString,
      @HiveField(3)
      @JsonKey(name: 'age_limit_in_microseconds_type')
          required String ageLimitTypeString}) {
    return _DatabaseCacheSettings(
      entriesCountByTypeLimitTypeString: entriesCountByTypeLimitTypeString,
      ageLimitTypeString: ageLimitTypeString,
    );
  }

  DatabaseCacheSettings fromJson(Map<String, Object?> json) {
    return DatabaseCacheSettings.fromJson(json);
  }
}

/// @nodoc
const $DatabaseCacheSettings = _$DatabaseCacheSettingsTearOff();

/// @nodoc
mixin _$DatabaseCacheSettings {
  @HiveField(2)
  @JsonKey(name: 'entries_count_by_type_limit_type')
  String get entriesCountByTypeLimitTypeString =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'age_limit_in_microseconds_type')
  String get ageLimitTypeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatabaseCacheSettingsCopyWith<DatabaseCacheSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseCacheSettingsCopyWith<$Res> {
  factory $DatabaseCacheSettingsCopyWith(DatabaseCacheSettings value,
          $Res Function(DatabaseCacheSettings) then) =
      _$DatabaseCacheSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(2)
      @JsonKey(name: 'entries_count_by_type_limit_type')
          String entriesCountByTypeLimitTypeString,
      @HiveField(3)
      @JsonKey(name: 'age_limit_in_microseconds_type')
          String ageLimitTypeString});
}

/// @nodoc
class _$DatabaseCacheSettingsCopyWithImpl<$Res>
    implements $DatabaseCacheSettingsCopyWith<$Res> {
  _$DatabaseCacheSettingsCopyWithImpl(this._value, this._then);

  final DatabaseCacheSettings _value;
  // ignore: unused_field
  final $Res Function(DatabaseCacheSettings) _then;

  @override
  $Res call({
    Object? entriesCountByTypeLimitTypeString = freezed,
    Object? ageLimitTypeString = freezed,
  }) {
    return _then(_value.copyWith(
      entriesCountByTypeLimitTypeString: entriesCountByTypeLimitTypeString ==
              freezed
          ? _value.entriesCountByTypeLimitTypeString
          : entriesCountByTypeLimitTypeString // ignore: cast_nullable_to_non_nullable
              as String,
      ageLimitTypeString: ageLimitTypeString == freezed
          ? _value.ageLimitTypeString
          : ageLimitTypeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DatabaseCacheSettingsCopyWith<$Res>
    implements $DatabaseCacheSettingsCopyWith<$Res> {
  factory _$DatabaseCacheSettingsCopyWith(_DatabaseCacheSettings value,
          $Res Function(_DatabaseCacheSettings) then) =
      __$DatabaseCacheSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(2)
      @JsonKey(name: 'entries_count_by_type_limit_type')
          String entriesCountByTypeLimitTypeString,
      @HiveField(3)
      @JsonKey(name: 'age_limit_in_microseconds_type')
          String ageLimitTypeString});
}

/// @nodoc
class __$DatabaseCacheSettingsCopyWithImpl<$Res>
    extends _$DatabaseCacheSettingsCopyWithImpl<$Res>
    implements _$DatabaseCacheSettingsCopyWith<$Res> {
  __$DatabaseCacheSettingsCopyWithImpl(_DatabaseCacheSettings _value,
      $Res Function(_DatabaseCacheSettings) _then)
      : super(_value, (v) => _then(v as _DatabaseCacheSettings));

  @override
  _DatabaseCacheSettings get _value => super._value as _DatabaseCacheSettings;

  @override
  $Res call({
    Object? entriesCountByTypeLimitTypeString = freezed,
    Object? ageLimitTypeString = freezed,
  }) {
    return _then(_DatabaseCacheSettings(
      entriesCountByTypeLimitTypeString: entriesCountByTypeLimitTypeString ==
              freezed
          ? _value.entriesCountByTypeLimitTypeString
          : entriesCountByTypeLimitTypeString // ignore: cast_nullable_to_non_nullable
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
class _$_DatabaseCacheSettings extends _DatabaseCacheSettings {
  const _$_DatabaseCacheSettings(
      {@HiveField(2)
      @JsonKey(name: 'entries_count_by_type_limit_type')
          required this.entriesCountByTypeLimitTypeString,
      @HiveField(3)
      @JsonKey(name: 'age_limit_in_microseconds_type')
          required this.ageLimitTypeString})
      : super._();

  factory _$_DatabaseCacheSettings.fromJson(Map<String, dynamic> json) =>
      _$$_DatabaseCacheSettingsFromJson(json);

  @override
  @HiveField(2)
  @JsonKey(name: 'entries_count_by_type_limit_type')
  final String entriesCountByTypeLimitTypeString;
  @override
  @HiveField(3)
  @JsonKey(name: 'age_limit_in_microseconds_type')
  final String ageLimitTypeString;

  @override
  String toString() {
    return 'DatabaseCacheSettings(entriesCountByTypeLimitTypeString: $entriesCountByTypeLimitTypeString, ageLimitTypeString: $ageLimitTypeString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DatabaseCacheSettings &&
            (identical(other.entriesCountByTypeLimitTypeString,
                    entriesCountByTypeLimitTypeString) ||
                other.entriesCountByTypeLimitTypeString ==
                    entriesCountByTypeLimitTypeString) &&
            (identical(other.ageLimitTypeString, ageLimitTypeString) ||
                other.ageLimitTypeString == ageLimitTypeString));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, entriesCountByTypeLimitTypeString, ageLimitTypeString);

  @JsonKey(ignore: true)
  @override
  _$DatabaseCacheSettingsCopyWith<_DatabaseCacheSettings> get copyWith =>
      __$DatabaseCacheSettingsCopyWithImpl<_DatabaseCacheSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatabaseCacheSettingsToJson(this);
  }
}

abstract class _DatabaseCacheSettings extends DatabaseCacheSettings {
  const factory _DatabaseCacheSettings(
      {@HiveField(2)
      @JsonKey(name: 'entries_count_by_type_limit_type')
          required String entriesCountByTypeLimitTypeString,
      @HiveField(3)
      @JsonKey(name: 'age_limit_in_microseconds_type')
          required String ageLimitTypeString}) = _$_DatabaseCacheSettings;
  const _DatabaseCacheSettings._() : super._();

  factory _DatabaseCacheSettings.fromJson(Map<String, dynamic> json) =
      _$_DatabaseCacheSettings.fromJson;

  @override
  @HiveField(2)
  @JsonKey(name: 'entries_count_by_type_limit_type')
  String get entriesCountByTypeLimitTypeString;
  @override
  @HiveField(3)
  @JsonKey(name: 'age_limit_in_microseconds_type')
  String get ageLimitTypeString;
  @override
  @JsonKey(ignore: true)
  _$DatabaseCacheSettingsCopyWith<_DatabaseCacheSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
