// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'localization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalizationLocale _$LocalizationLocaleFromJson(Map<String, dynamic> json) {
  return _LocalizationLocale.fromJson(json);
}

/// @nodoc
class _$LocalizationLocaleTearOff {
  const _$LocalizationLocaleTearOff();

  _LocalizationLocale call(
      {@JsonKey(name: 'languageCode')
      @HiveField(0)
          required String languageCode,
      @JsonKey(name: 'scriptCode')
      @HiveField(1)
          required String? scriptCode,
      @JsonKey(name: 'countryCode')
      @HiveField(2)
          required String? countryCode}) {
    return _LocalizationLocale(
      languageCode: languageCode,
      scriptCode: scriptCode,
      countryCode: countryCode,
    );
  }

  LocalizationLocale fromJson(Map<String, Object> json) {
    return LocalizationLocale.fromJson(json);
  }
}

/// @nodoc
const $LocalizationLocale = _$LocalizationLocaleTearOff();

/// @nodoc
mixin _$LocalizationLocale {
  @JsonKey(name: 'languageCode')
  @HiveField(0)
  String get languageCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'scriptCode')
  @HiveField(1)
  String? get scriptCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryCode')
  @HiveField(2)
  String? get countryCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationLocaleCopyWith<LocalizationLocale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationLocaleCopyWith<$Res> {
  factory $LocalizationLocaleCopyWith(
          LocalizationLocale value, $Res Function(LocalizationLocale) then) =
      _$LocalizationLocaleCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'languageCode') @HiveField(0) String languageCode,
      @JsonKey(name: 'scriptCode') @HiveField(1) String? scriptCode,
      @JsonKey(name: 'countryCode') @HiveField(2) String? countryCode});
}

/// @nodoc
class _$LocalizationLocaleCopyWithImpl<$Res>
    implements $LocalizationLocaleCopyWith<$Res> {
  _$LocalizationLocaleCopyWithImpl(this._value, this._then);

  final LocalizationLocale _value;
  // ignore: unused_field
  final $Res Function(LocalizationLocale) _then;

  @override
  $Res call({
    Object? languageCode = freezed,
    Object? scriptCode = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      scriptCode: scriptCode == freezed
          ? _value.scriptCode
          : scriptCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocalizationLocaleCopyWith<$Res>
    implements $LocalizationLocaleCopyWith<$Res> {
  factory _$LocalizationLocaleCopyWith(
          _LocalizationLocale value, $Res Function(_LocalizationLocale) then) =
      __$LocalizationLocaleCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'languageCode') @HiveField(0) String languageCode,
      @JsonKey(name: 'scriptCode') @HiveField(1) String? scriptCode,
      @JsonKey(name: 'countryCode') @HiveField(2) String? countryCode});
}

/// @nodoc
class __$LocalizationLocaleCopyWithImpl<$Res>
    extends _$LocalizationLocaleCopyWithImpl<$Res>
    implements _$LocalizationLocaleCopyWith<$Res> {
  __$LocalizationLocaleCopyWithImpl(
      _LocalizationLocale _value, $Res Function(_LocalizationLocale) _then)
      : super(_value, (v) => _then(v as _LocalizationLocale));

  @override
  _LocalizationLocale get _value => super._value as _LocalizationLocale;

  @override
  $Res call({
    Object? languageCode = freezed,
    Object? scriptCode = freezed,
    Object? countryCode = freezed,
  }) {
    return _then(_LocalizationLocale(
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      scriptCode: scriptCode == freezed
          ? _value.scriptCode
          : scriptCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalizationLocale extends _LocalizationLocale {
  const _$_LocalizationLocale(
      {@JsonKey(name: 'languageCode') @HiveField(0) required this.languageCode,
      @JsonKey(name: 'scriptCode') @HiveField(1) required this.scriptCode,
      @JsonKey(name: 'countryCode') @HiveField(2) required this.countryCode})
      : super._();

  factory _$_LocalizationLocale.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizationLocaleFromJson(json);

  @override
  @JsonKey(name: 'languageCode')
  @HiveField(0)
  final String languageCode;
  @override
  @JsonKey(name: 'scriptCode')
  @HiveField(1)
  final String? scriptCode;
  @override
  @JsonKey(name: 'countryCode')
  @HiveField(2)
  final String? countryCode;

  @override
  String toString() {
    return 'LocalizationLocale(languageCode: $languageCode, scriptCode: $scriptCode, countryCode: $countryCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalizationLocale &&
            (identical(other.languageCode, languageCode) ||
                const DeepCollectionEquality()
                    .equals(other.languageCode, languageCode)) &&
            (identical(other.scriptCode, scriptCode) ||
                const DeepCollectionEquality()
                    .equals(other.scriptCode, scriptCode)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(languageCode) ^
      const DeepCollectionEquality().hash(scriptCode) ^
      const DeepCollectionEquality().hash(countryCode);

  @JsonKey(ignore: true)
  @override
  _$LocalizationLocaleCopyWith<_LocalizationLocale> get copyWith =>
      __$LocalizationLocaleCopyWithImpl<_LocalizationLocale>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizationLocaleToJson(this);
  }
}

abstract class _LocalizationLocale extends LocalizationLocale {
  const factory _LocalizationLocale(
      {@JsonKey(name: 'languageCode')
      @HiveField(0)
          required String languageCode,
      @JsonKey(name: 'scriptCode')
      @HiveField(1)
          required String? scriptCode,
      @JsonKey(name: 'countryCode')
      @HiveField(2)
          required String? countryCode}) = _$_LocalizationLocale;
  const _LocalizationLocale._() : super._();

  factory _LocalizationLocale.fromJson(Map<String, dynamic> json) =
      _$_LocalizationLocale.fromJson;

  @override
  @JsonKey(name: 'languageCode')
  @HiveField(0)
  String get languageCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'scriptCode')
  @HiveField(1)
  String? get scriptCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'countryCode')
  @HiveField(2)
  String? get countryCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalizationLocaleCopyWith<_LocalizationLocale> get copyWith =>
      throw _privateConstructorUsedError;
}
