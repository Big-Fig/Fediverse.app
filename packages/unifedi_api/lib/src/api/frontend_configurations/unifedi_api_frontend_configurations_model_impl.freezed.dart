// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_frontend_configurations_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFrontendConfigurations _$UnifediApiFrontendConfigurationsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiFrontendConfigurations.fromJson(json);
}

/// @nodoc
class _$UnifediApiFrontendConfigurationsTearOff {
  const _$UnifediApiFrontendConfigurationsTearOff();

  _UnifediApiFrontendConfigurations call(
      {@JsonKey(name: 'brand_hex_color')
      @HiveField(0)
          required String? brandHexColor,
      @JsonKey(name: 'background_image')
      @HiveField(1)
          required String? backgroundImage}) {
    return _UnifediApiFrontendConfigurations(
      brandHexColor: brandHexColor,
      backgroundImage: backgroundImage,
    );
  }

  UnifediApiFrontendConfigurations fromJson(Map<String, Object?> json) {
    return UnifediApiFrontendConfigurations.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFrontendConfigurations =
    _$UnifediApiFrontendConfigurationsTearOff();

/// @nodoc
mixin _$UnifediApiFrontendConfigurations {
  @JsonKey(name: 'brand_hex_color')
  @HiveField(0)
  String? get brandHexColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'background_image')
  @HiveField(1)
  String? get backgroundImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFrontendConfigurationsCopyWith<UnifediApiFrontendConfigurations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFrontendConfigurationsCopyWith<$Res> {
  factory $UnifediApiFrontendConfigurationsCopyWith(
          UnifediApiFrontendConfigurations value,
          $Res Function(UnifediApiFrontendConfigurations) then) =
      _$UnifediApiFrontendConfigurationsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'brand_hex_color')
      @HiveField(0)
          String? brandHexColor,
      @JsonKey(name: 'background_image')
      @HiveField(1)
          String? backgroundImage});
}

/// @nodoc
class _$UnifediApiFrontendConfigurationsCopyWithImpl<$Res>
    implements $UnifediApiFrontendConfigurationsCopyWith<$Res> {
  _$UnifediApiFrontendConfigurationsCopyWithImpl(this._value, this._then);

  final UnifediApiFrontendConfigurations _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFrontendConfigurations) _then;

  @override
  $Res call({
    Object? brandHexColor = freezed,
    Object? backgroundImage = freezed,
  }) {
    return _then(_value.copyWith(
      brandHexColor: brandHexColor == freezed
          ? _value.brandHexColor
          : brandHexColor // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiFrontendConfigurationsCopyWith<$Res>
    implements $UnifediApiFrontendConfigurationsCopyWith<$Res> {
  factory _$UnifediApiFrontendConfigurationsCopyWith(
          _UnifediApiFrontendConfigurations value,
          $Res Function(_UnifediApiFrontendConfigurations) then) =
      __$UnifediApiFrontendConfigurationsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'brand_hex_color')
      @HiveField(0)
          String? brandHexColor,
      @JsonKey(name: 'background_image')
      @HiveField(1)
          String? backgroundImage});
}

/// @nodoc
class __$UnifediApiFrontendConfigurationsCopyWithImpl<$Res>
    extends _$UnifediApiFrontendConfigurationsCopyWithImpl<$Res>
    implements _$UnifediApiFrontendConfigurationsCopyWith<$Res> {
  __$UnifediApiFrontendConfigurationsCopyWithImpl(
      _UnifediApiFrontendConfigurations _value,
      $Res Function(_UnifediApiFrontendConfigurations) _then)
      : super(_value, (v) => _then(v as _UnifediApiFrontendConfigurations));

  @override
  _UnifediApiFrontendConfigurations get _value =>
      super._value as _UnifediApiFrontendConfigurations;

  @override
  $Res call({
    Object? brandHexColor = freezed,
    Object? backgroundImage = freezed,
  }) {
    return _then(_UnifediApiFrontendConfigurations(
      brandHexColor: brandHexColor == freezed
          ? _value.brandHexColor
          : brandHexColor // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFrontendConfigurations
    implements _UnifediApiFrontendConfigurations {
  const _$_UnifediApiFrontendConfigurations(
      {@JsonKey(name: 'brand_hex_color')
      @HiveField(0)
          required this.brandHexColor,
      @JsonKey(name: 'background_image')
      @HiveField(1)
          required this.backgroundImage});

  factory _$_UnifediApiFrontendConfigurations.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFrontendConfigurationsFromJson(json);

  @override
  @JsonKey(name: 'brand_hex_color')
  @HiveField(0)
  final String? brandHexColor;
  @override
  @JsonKey(name: 'background_image')
  @HiveField(1)
  final String? backgroundImage;

  @override
  String toString() {
    return 'UnifediApiFrontendConfigurations(brandHexColor: $brandHexColor, backgroundImage: $backgroundImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiFrontendConfigurations &&
            (identical(other.brandHexColor, brandHexColor) ||
                other.brandHexColor == brandHexColor) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brandHexColor, backgroundImage);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFrontendConfigurationsCopyWith<_UnifediApiFrontendConfigurations>
      get copyWith => __$UnifediApiFrontendConfigurationsCopyWithImpl<
          _UnifediApiFrontendConfigurations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFrontendConfigurationsToJson(this);
  }
}

abstract class _UnifediApiFrontendConfigurations
    implements UnifediApiFrontendConfigurations {
  const factory _UnifediApiFrontendConfigurations(
          {@JsonKey(name: 'brand_hex_color')
          @HiveField(0)
              required String? brandHexColor,
          @JsonKey(name: 'background_image')
          @HiveField(1)
              required String? backgroundImage}) =
      _$_UnifediApiFrontendConfigurations;

  factory _UnifediApiFrontendConfigurations.fromJson(
      Map<String, dynamic> json) = _$_UnifediApiFrontendConfigurations.fromJson;

  @override
  @JsonKey(name: 'brand_hex_color')
  @HiveField(0)
  String? get brandHexColor;
  @override
  @JsonKey(name: 'background_image')
  @HiveField(1)
  String? get backgroundImage;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFrontendConfigurationsCopyWith<_UnifediApiFrontendConfigurations>
      get copyWith => throw _privateConstructorUsedError;
}
