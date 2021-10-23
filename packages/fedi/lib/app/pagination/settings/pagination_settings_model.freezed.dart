// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationSettings _$PaginationSettingsFromJson(Map<String, dynamic> json) {
  return _PaginationSettings.fromJson(json);
}

/// @nodoc
class _$PaginationSettingsTearOff {
  const _$PaginationSettingsTearOff();

  _PaginationSettings call(
      {@HiveField(0)
      @JsonKey(name: 'page_size')
          required String pageSizeString}) {
    return _PaginationSettings(
      pageSizeString: pageSizeString,
    );
  }

  PaginationSettings fromJson(Map<String, Object> json) {
    return PaginationSettings.fromJson(json);
  }
}

/// @nodoc
const $PaginationSettings = _$PaginationSettingsTearOff();

/// @nodoc
mixin _$PaginationSettings {
  @HiveField(0)
  @JsonKey(name: 'page_size')
  String get pageSizeString => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationSettingsCopyWith<PaginationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationSettingsCopyWith<$Res> {
  factory $PaginationSettingsCopyWith(
          PaginationSettings value, $Res Function(PaginationSettings) then) =
      _$PaginationSettingsCopyWithImpl<$Res>;
  $Res call({@HiveField(0) @JsonKey(name: 'page_size') String pageSizeString});
}

/// @nodoc
class _$PaginationSettingsCopyWithImpl<$Res>
    implements $PaginationSettingsCopyWith<$Res> {
  _$PaginationSettingsCopyWithImpl(this._value, this._then);

  final PaginationSettings _value;
  // ignore: unused_field
  final $Res Function(PaginationSettings) _then;

  @override
  $Res call({
    Object? pageSizeString = freezed,
  }) {
    return _then(_value.copyWith(
      pageSizeString: pageSizeString == freezed
          ? _value.pageSizeString
          : pageSizeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PaginationSettingsCopyWith<$Res>
    implements $PaginationSettingsCopyWith<$Res> {
  factory _$PaginationSettingsCopyWith(
          _PaginationSettings value, $Res Function(_PaginationSettings) then) =
      __$PaginationSettingsCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) @JsonKey(name: 'page_size') String pageSizeString});
}

/// @nodoc
class __$PaginationSettingsCopyWithImpl<$Res>
    extends _$PaginationSettingsCopyWithImpl<$Res>
    implements _$PaginationSettingsCopyWith<$Res> {
  __$PaginationSettingsCopyWithImpl(
      _PaginationSettings _value, $Res Function(_PaginationSettings) _then)
      : super(_value, (v) => _then(v as _PaginationSettings));

  @override
  _PaginationSettings get _value => super._value as _PaginationSettings;

  @override
  $Res call({
    Object? pageSizeString = freezed,
  }) {
    return _then(_PaginationSettings(
      pageSizeString: pageSizeString == freezed
          ? _value.pageSizeString
          : pageSizeString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationSettings extends _PaginationSettings {
  const _$_PaginationSettings(
      {@HiveField(0) @JsonKey(name: 'page_size') required this.pageSizeString})
      : super._();

  factory _$_PaginationSettings.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'page_size')
  final String pageSizeString;

  @override
  String toString() {
    return 'PaginationSettings(pageSizeString: $pageSizeString)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaginationSettings &&
            (identical(other.pageSizeString, pageSizeString) ||
                const DeepCollectionEquality()
                    .equals(other.pageSizeString, pageSizeString)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pageSizeString);

  @JsonKey(ignore: true)
  @override
  _$PaginationSettingsCopyWith<_PaginationSettings> get copyWith =>
      __$PaginationSettingsCopyWithImpl<_PaginationSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationSettingsToJson(this);
  }
}

abstract class _PaginationSettings extends PaginationSettings {
  const factory _PaginationSettings(
      {@HiveField(0)
      @JsonKey(name: 'page_size')
          required String pageSizeString}) = _$_PaginationSettings;
  const _PaginationSettings._() : super._();

  factory _PaginationSettings.fromJson(Map<String, dynamic> json) =
      _$_PaginationSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'page_size')
  String get pageSizeString => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaginationSettingsCopyWith<_PaginationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
