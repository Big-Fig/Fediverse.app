// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_frontend_configurations_soapbox_fe_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFrontendConfigurationsSoapboxFe
    _$PleromaApiFrontendConfigurationsSoapboxFeFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurationsSoapboxFe.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsSoapboxFeTearOff {
  const _$PleromaApiFrontendConfigurationsSoapboxFeTearOff();

  _PleromaApiFrontendConfigurationsSoapboxFe call(
      {@HiveField(0) required String? brandColor}) {
    return _PleromaApiFrontendConfigurationsSoapboxFe(
      brandColor: brandColor,
    );
  }

  PleromaApiFrontendConfigurationsSoapboxFe fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurationsSoapboxFe.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurationsSoapboxFe =
    _$PleromaApiFrontendConfigurationsSoapboxFeTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurationsSoapboxFe {
// @JsonKey(name: 'brand_color')
  @HiveField(0)
  String? get brandColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<
          PleromaApiFrontendConfigurationsSoapboxFe>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsSoapboxFeCopyWith(
          PleromaApiFrontendConfigurationsSoapboxFe value,
          $Res Function(PleromaApiFrontendConfigurationsSoapboxFe) then) =
      _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String? brandColor});
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl(
      this._value, this._then);

  final PleromaApiFrontendConfigurationsSoapboxFe _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurationsSoapboxFe) _then;

  @override
  $Res call({
    Object? brandColor = freezed,
  }) {
    return _then(_value.copyWith(
      brandColor: brandColor == freezed
          ? _value.brandColor
          : brandColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith(
          _PleromaApiFrontendConfigurationsSoapboxFe value,
          $Res Function(_PleromaApiFrontendConfigurationsSoapboxFe) then) =
      __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String? brandColor});
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl(
      _PleromaApiFrontendConfigurationsSoapboxFe _value,
      $Res Function(_PleromaApiFrontendConfigurationsSoapboxFe) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiFrontendConfigurationsSoapboxFe));

  @override
  _PleromaApiFrontendConfigurationsSoapboxFe get _value =>
      super._value as _PleromaApiFrontendConfigurationsSoapboxFe;

  @override
  $Res call({
    Object? brandColor = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurationsSoapboxFe(
      brandColor: brandColor == freezed
          ? _value.brandColor
          : brandColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurationsSoapboxFe
    implements _PleromaApiFrontendConfigurationsSoapboxFe {
  const _$_PleromaApiFrontendConfigurationsSoapboxFe(
      {@HiveField(0) required this.brandColor});

  factory _$_PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsSoapboxFeFromJson(json);

  @override // @JsonKey(name: 'brand_color')
  @HiveField(0)
  final String? brandColor;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurationsSoapboxFe(brandColor: $brandColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurationsSoapboxFe &&
            (identical(other.brandColor, brandColor) ||
                const DeepCollectionEquality()
                    .equals(other.brandColor, brandColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(brandColor);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<
          _PleromaApiFrontendConfigurationsSoapboxFe>
      get copyWith => __$PleromaApiFrontendConfigurationsSoapboxFeCopyWithImpl<
          _PleromaApiFrontendConfigurationsSoapboxFe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsSoapboxFeToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurationsSoapboxFe
    implements PleromaApiFrontendConfigurationsSoapboxFe {
  const factory _PleromaApiFrontendConfigurationsSoapboxFe(
          {@HiveField(0) required String? brandColor}) =
      _$_PleromaApiFrontendConfigurationsSoapboxFe;

  factory _PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiFrontendConfigurationsSoapboxFe.fromJson;

  @override // @JsonKey(name: 'brand_color')
  @HiveField(0)
  String? get brandColor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsSoapboxFeCopyWith<
          _PleromaApiFrontendConfigurationsSoapboxFe>
      get copyWith => throw _privateConstructorUsedError;
}
