// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_frontend_configurations_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFrontendConfigurations _$PleromaApiFrontendConfigurationsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurations.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsTearOff {
  const _$PleromaApiFrontendConfigurationsTearOff();

  _PleromaApiFrontendConfigurations call(
      {@JsonKey(name: 'masto_fe')
      @HiveField(0)
          required PleromaApiFrontendConfigurationsMastoFe? mastoFe,
      @JsonKey(name: 'pleroma_fe')
      @HiveField(1)
          required PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
      @JsonKey(name: 'soapbox_fe')
      @HiveField(2)
          required PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe}) {
    return _PleromaApiFrontendConfigurations(
      mastoFe: mastoFe,
      pleromaFe: pleromaFe,
      soapboxFe: soapboxFe,
    );
  }

  PleromaApiFrontendConfigurations fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurations.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurations =
    _$PleromaApiFrontendConfigurationsTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurations {
  @JsonKey(name: 'masto_fe')
  @HiveField(0)
  PleromaApiFrontendConfigurationsMastoFe? get mastoFe =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'pleroma_fe')
  @HiveField(1)
  PleromaApiFrontendConfigurationsPleromaFe? get pleromaFe =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'soapbox_fe')
  @HiveField(2)
  PleromaApiFrontendConfigurationsSoapboxFe? get soapboxFe =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsCopyWith<PleromaApiFrontendConfigurations>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsCopyWith(
          PleromaApiFrontendConfigurations value,
          $Res Function(PleromaApiFrontendConfigurations) then) =
      _$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'masto_fe')
      @HiveField(0)
          PleromaApiFrontendConfigurationsMastoFe? mastoFe,
      @JsonKey(name: 'pleroma_fe')
      @HiveField(1)
          PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
      @JsonKey(name: 'soapbox_fe')
      @HiveField(2)
          PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe});

  $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>? get mastoFe;
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>? get pleromaFe;
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>? get soapboxFe;
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsCopyWithImpl(this._value, this._then);

  final PleromaApiFrontendConfigurations _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurations) _then;

  @override
  $Res call({
    Object? mastoFe = freezed,
    Object? pleromaFe = freezed,
    Object? soapboxFe = freezed,
  }) {
    return _then(_value.copyWith(
      mastoFe: mastoFe == freezed
          ? _value.mastoFe
          : mastoFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsMastoFe?,
      pleromaFe: pleromaFe == freezed
          ? _value.pleromaFe
          : pleromaFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsPleromaFe?,
      soapboxFe: soapboxFe == freezed
          ? _value.soapboxFe
          : soapboxFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsSoapboxFe?,
    ));
  }

  @override
  $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>? get mastoFe {
    if (_value.mastoFe == null) {
      return null;
    }

    return $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>(
        _value.mastoFe!, (value) {
      return _then(_value.copyWith(mastoFe: value));
    });
  }

  @override
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>? get pleromaFe {
    if (_value.pleromaFe == null) {
      return null;
    }

    return $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>(
        _value.pleromaFe!, (value) {
      return _then(_value.copyWith(pleromaFe: value));
    });
  }

  @override
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>? get soapboxFe {
    if (_value.soapboxFe == null) {
      return null;
    }

    return $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>(
        _value.soapboxFe!, (value) {
      return _then(_value.copyWith(soapboxFe: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsCopyWith(
          _PleromaApiFrontendConfigurations value,
          $Res Function(_PleromaApiFrontendConfigurations) then) =
      __$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'masto_fe')
      @HiveField(0)
          PleromaApiFrontendConfigurationsMastoFe? mastoFe,
      @JsonKey(name: 'pleroma_fe')
      @HiveField(1)
          PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
      @JsonKey(name: 'soapbox_fe')
      @HiveField(2)
          PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe});

  @override
  $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>? get mastoFe;
  @override
  $PleromaApiFrontendConfigurationsPleromaFeCopyWith<$Res>? get pleromaFe;
  @override
  $PleromaApiFrontendConfigurationsSoapboxFeCopyWith<$Res>? get soapboxFe;
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsCopyWithImpl(
      _PleromaApiFrontendConfigurations _value,
      $Res Function(_PleromaApiFrontendConfigurations) _then)
      : super(_value, (v) => _then(v as _PleromaApiFrontendConfigurations));

  @override
  _PleromaApiFrontendConfigurations get _value =>
      super._value as _PleromaApiFrontendConfigurations;

  @override
  $Res call({
    Object? mastoFe = freezed,
    Object? pleromaFe = freezed,
    Object? soapboxFe = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurations(
      mastoFe: mastoFe == freezed
          ? _value.mastoFe
          : mastoFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsMastoFe?,
      pleromaFe: pleromaFe == freezed
          ? _value.pleromaFe
          : pleromaFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsPleromaFe?,
      soapboxFe: soapboxFe == freezed
          ? _value.soapboxFe
          : soapboxFe // ignore: cast_nullable_to_non_nullable
              as PleromaApiFrontendConfigurationsSoapboxFe?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurations
    implements _PleromaApiFrontendConfigurations {
  const _$_PleromaApiFrontendConfigurations(
      {@JsonKey(name: 'masto_fe') @HiveField(0) required this.mastoFe,
      @JsonKey(name: 'pleroma_fe') @HiveField(1) required this.pleromaFe,
      @JsonKey(name: 'soapbox_fe') @HiveField(2) required this.soapboxFe});

  factory _$_PleromaApiFrontendConfigurations.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsFromJson(json);

  @override
  @JsonKey(name: 'masto_fe')
  @HiveField(0)
  final PleromaApiFrontendConfigurationsMastoFe? mastoFe;
  @override
  @JsonKey(name: 'pleroma_fe')
  @HiveField(1)
  final PleromaApiFrontendConfigurationsPleromaFe? pleromaFe;
  @override
  @JsonKey(name: 'soapbox_fe')
  @HiveField(2)
  final PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurations(mastoFe: $mastoFe, pleromaFe: $pleromaFe, soapboxFe: $soapboxFe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurations &&
            (identical(other.mastoFe, mastoFe) ||
                const DeepCollectionEquality()
                    .equals(other.mastoFe, mastoFe)) &&
            (identical(other.pleromaFe, pleromaFe) ||
                const DeepCollectionEquality()
                    .equals(other.pleromaFe, pleromaFe)) &&
            (identical(other.soapboxFe, soapboxFe) ||
                const DeepCollectionEquality()
                    .equals(other.soapboxFe, soapboxFe)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mastoFe) ^
      const DeepCollectionEquality().hash(pleromaFe) ^
      const DeepCollectionEquality().hash(soapboxFe);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsCopyWith<_PleromaApiFrontendConfigurations>
      get copyWith => __$PleromaApiFrontendConfigurationsCopyWithImpl<
          _PleromaApiFrontendConfigurations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurations
    implements PleromaApiFrontendConfigurations {
  const factory _PleromaApiFrontendConfigurations(
          {@JsonKey(name: 'masto_fe')
          @HiveField(0)
              required PleromaApiFrontendConfigurationsMastoFe? mastoFe,
          @JsonKey(name: 'pleroma_fe')
          @HiveField(1)
              required PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
          @JsonKey(name: 'soapbox_fe')
          @HiveField(2)
              required PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe}) =
      _$_PleromaApiFrontendConfigurations;

  factory _PleromaApiFrontendConfigurations.fromJson(
      Map<String, dynamic> json) = _$_PleromaApiFrontendConfigurations.fromJson;

  @override
  @JsonKey(name: 'masto_fe')
  @HiveField(0)
  PleromaApiFrontendConfigurationsMastoFe? get mastoFe =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pleroma_fe')
  @HiveField(1)
  PleromaApiFrontendConfigurationsPleromaFe? get pleromaFe =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'soapbox_fe')
  @HiveField(2)
  PleromaApiFrontendConfigurationsSoapboxFe? get soapboxFe =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsCopyWith<_PleromaApiFrontendConfigurations>
      get copyWith => throw _privateConstructorUsedError;
}
