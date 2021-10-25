// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_metadata_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceMetadata _$PleromaApiInstanceMetadataFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstanceMetadata.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceMetadataTearOff {
  const _$PleromaApiInstanceMetadataTearOff();

  _PleromaApiInstanceMetadata call(
      {@HiveField(0)
          required List<String>? features,
      @HiveField(2)
      @JsonKey(name: 'post_formats')
          required List<String>? postFormats,
      @HiveField(3)
      @JsonKey(name: 'account_activation_required')
          required bool? accountActivationRequired,
      @HiveField(4)
      @JsonKey(name: 'fields_limits')
          required PleromaApiInstanceFieldLimits? fieldsLimits,
      @HiveField(5)
          required PleromaApiInstanceFederation? federation}) {
    return _PleromaApiInstanceMetadata(
      features: features,
      postFormats: postFormats,
      accountActivationRequired: accountActivationRequired,
      fieldsLimits: fieldsLimits,
      federation: federation,
    );
  }

  PleromaApiInstanceMetadata fromJson(Map<String, Object> json) {
    return PleromaApiInstanceMetadata.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceMetadata = _$PleromaApiInstanceMetadataTearOff();

/// @nodoc
mixin _$PleromaApiInstanceMetadata {
  @HiveField(0)
  List<String>? get features => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'post_formats')
  List<String>? get postFormats => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'account_activation_required')
  bool? get accountActivationRequired => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'fields_limits')
  PleromaApiInstanceFieldLimits? get fieldsLimits =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  PleromaApiInstanceFederation? get federation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceMetadataCopyWith<PleromaApiInstanceMetadata>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceMetadataCopyWith<$Res> {
  factory $PleromaApiInstanceMetadataCopyWith(PleromaApiInstanceMetadata value,
          $Res Function(PleromaApiInstanceMetadata) then) =
      _$PleromaApiInstanceMetadataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          List<String>? features,
      @HiveField(2)
      @JsonKey(name: 'post_formats')
          List<String>? postFormats,
      @HiveField(3)
      @JsonKey(name: 'account_activation_required')
          bool? accountActivationRequired,
      @HiveField(4)
      @JsonKey(name: 'fields_limits')
          PleromaApiInstanceFieldLimits? fieldsLimits,
      @HiveField(5)
          PleromaApiInstanceFederation? federation});

  $PleromaApiInstanceFieldLimitsCopyWith<$Res>? get fieldsLimits;
  $PleromaApiInstanceFederationCopyWith<$Res>? get federation;
}

/// @nodoc
class _$PleromaApiInstanceMetadataCopyWithImpl<$Res>
    implements $PleromaApiInstanceMetadataCopyWith<$Res> {
  _$PleromaApiInstanceMetadataCopyWithImpl(this._value, this._then);

  final PleromaApiInstanceMetadata _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceMetadata) _then;

  @override
  $Res call({
    Object? features = freezed,
    Object? postFormats = freezed,
    Object? accountActivationRequired = freezed,
    Object? fieldsLimits = freezed,
    Object? federation = freezed,
  }) {
    return _then(_value.copyWith(
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      postFormats: postFormats == freezed
          ? _value.postFormats
          : postFormats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      accountActivationRequired: accountActivationRequired == freezed
          ? _value.accountActivationRequired
          : accountActivationRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      fieldsLimits: fieldsLimits == freezed
          ? _value.fieldsLimits
          : fieldsLimits // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFieldLimits?,
      federation: federation == freezed
          ? _value.federation
          : federation // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFederation?,
    ));
  }

  @override
  $PleromaApiInstanceFieldLimitsCopyWith<$Res>? get fieldsLimits {
    if (_value.fieldsLimits == null) {
      return null;
    }

    return $PleromaApiInstanceFieldLimitsCopyWith<$Res>(_value.fieldsLimits!,
        (value) {
      return _then(_value.copyWith(fieldsLimits: value));
    });
  }

  @override
  $PleromaApiInstanceFederationCopyWith<$Res>? get federation {
    if (_value.federation == null) {
      return null;
    }

    return $PleromaApiInstanceFederationCopyWith<$Res>(_value.federation!,
        (value) {
      return _then(_value.copyWith(federation: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiInstanceMetadataCopyWith<$Res>
    implements $PleromaApiInstanceMetadataCopyWith<$Res> {
  factory _$PleromaApiInstanceMetadataCopyWith(
          _PleromaApiInstanceMetadata value,
          $Res Function(_PleromaApiInstanceMetadata) then) =
      __$PleromaApiInstanceMetadataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          List<String>? features,
      @HiveField(2)
      @JsonKey(name: 'post_formats')
          List<String>? postFormats,
      @HiveField(3)
      @JsonKey(name: 'account_activation_required')
          bool? accountActivationRequired,
      @HiveField(4)
      @JsonKey(name: 'fields_limits')
          PleromaApiInstanceFieldLimits? fieldsLimits,
      @HiveField(5)
          PleromaApiInstanceFederation? federation});

  @override
  $PleromaApiInstanceFieldLimitsCopyWith<$Res>? get fieldsLimits;
  @override
  $PleromaApiInstanceFederationCopyWith<$Res>? get federation;
}

/// @nodoc
class __$PleromaApiInstanceMetadataCopyWithImpl<$Res>
    extends _$PleromaApiInstanceMetadataCopyWithImpl<$Res>
    implements _$PleromaApiInstanceMetadataCopyWith<$Res> {
  __$PleromaApiInstanceMetadataCopyWithImpl(_PleromaApiInstanceMetadata _value,
      $Res Function(_PleromaApiInstanceMetadata) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstanceMetadata));

  @override
  _PleromaApiInstanceMetadata get _value =>
      super._value as _PleromaApiInstanceMetadata;

  @override
  $Res call({
    Object? features = freezed,
    Object? postFormats = freezed,
    Object? accountActivationRequired = freezed,
    Object? fieldsLimits = freezed,
    Object? federation = freezed,
  }) {
    return _then(_PleromaApiInstanceMetadata(
      features: features == freezed
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      postFormats: postFormats == freezed
          ? _value.postFormats
          : postFormats // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      accountActivationRequired: accountActivationRequired == freezed
          ? _value.accountActivationRequired
          : accountActivationRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      fieldsLimits: fieldsLimits == freezed
          ? _value.fieldsLimits
          : fieldsLimits // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFieldLimits?,
      federation: federation == freezed
          ? _value.federation
          : federation // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFederation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstanceMetadata implements _PleromaApiInstanceMetadata {
  const _$_PleromaApiInstanceMetadata(
      {@HiveField(0)
          required this.features,
      @HiveField(2)
      @JsonKey(name: 'post_formats')
          required this.postFormats,
      @HiveField(3)
      @JsonKey(name: 'account_activation_required')
          required this.accountActivationRequired,
      @HiveField(4)
      @JsonKey(name: 'fields_limits')
          required this.fieldsLimits,
      @HiveField(5)
          required this.federation});

  factory _$_PleromaApiInstanceMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceMetadataFromJson(json);

  @override
  @HiveField(0)
  final List<String>? features;
  @override
  @HiveField(2)
  @JsonKey(name: 'post_formats')
  final List<String>? postFormats;
  @override
  @HiveField(3)
  @JsonKey(name: 'account_activation_required')
  final bool? accountActivationRequired;
  @override
  @HiveField(4)
  @JsonKey(name: 'fields_limits')
  final PleromaApiInstanceFieldLimits? fieldsLimits;
  @override
  @HiveField(5)
  final PleromaApiInstanceFederation? federation;

  @override
  String toString() {
    return 'PleromaApiInstanceMetadata(features: $features, postFormats: $postFormats, accountActivationRequired: $accountActivationRequired, fieldsLimits: $fieldsLimits, federation: $federation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstanceMetadata &&
            (identical(other.features, features) ||
                const DeepCollectionEquality()
                    .equals(other.features, features)) &&
            (identical(other.postFormats, postFormats) ||
                const DeepCollectionEquality()
                    .equals(other.postFormats, postFormats)) &&
            (identical(other.accountActivationRequired,
                    accountActivationRequired) ||
                const DeepCollectionEquality().equals(
                    other.accountActivationRequired,
                    accountActivationRequired)) &&
            (identical(other.fieldsLimits, fieldsLimits) ||
                const DeepCollectionEquality()
                    .equals(other.fieldsLimits, fieldsLimits)) &&
            (identical(other.federation, federation) ||
                const DeepCollectionEquality()
                    .equals(other.federation, federation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(features) ^
      const DeepCollectionEquality().hash(postFormats) ^
      const DeepCollectionEquality().hash(accountActivationRequired) ^
      const DeepCollectionEquality().hash(fieldsLimits) ^
      const DeepCollectionEquality().hash(federation);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceMetadataCopyWith<_PleromaApiInstanceMetadata>
      get copyWith => __$PleromaApiInstanceMetadataCopyWithImpl<
          _PleromaApiInstanceMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceMetadataToJson(this);
  }
}

abstract class _PleromaApiInstanceMetadata
    implements PleromaApiInstanceMetadata {
  const factory _PleromaApiInstanceMetadata(
          {@HiveField(0)
              required List<String>? features,
          @HiveField(2)
          @JsonKey(name: 'post_formats')
              required List<String>? postFormats,
          @HiveField(3)
          @JsonKey(name: 'account_activation_required')
              required bool? accountActivationRequired,
          @HiveField(4)
          @JsonKey(name: 'fields_limits')
              required PleromaApiInstanceFieldLimits? fieldsLimits,
          @HiveField(5)
              required PleromaApiInstanceFederation? federation}) =
      _$_PleromaApiInstanceMetadata;

  factory _PleromaApiInstanceMetadata.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstanceMetadata.fromJson;

  @override
  @HiveField(0)
  List<String>? get features => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'post_formats')
  List<String>? get postFormats => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'account_activation_required')
  bool? get accountActivationRequired => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'fields_limits')
  PleromaApiInstanceFieldLimits? get fieldsLimits =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  PleromaApiInstanceFederation? get federation =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceMetadataCopyWith<_PleromaApiInstanceMetadata>
      get copyWith => throw _privateConstructorUsedError;
}
