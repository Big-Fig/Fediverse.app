// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_federation_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceFederation _$PleromaApiInstanceFederationFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstanceFederation.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceFederationTearOff {
  const _$PleromaApiInstanceFederationTearOff();

  _PleromaApiInstanceFederation call(
      {@HiveField(0)
          required bool? enabled,
      @HiveField(1)
          required bool? exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          required PleromaApiInstanceFederationMfrObjectAge? mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          required List<String>? mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          required List<String>? quarantinedInstances}) {
    return _PleromaApiInstanceFederation(
      enabled: enabled,
      exclusions: exclusions,
      mrfObjectAge: mrfObjectAge,
      mrfPolicies: mrfPolicies,
      quarantinedInstances: quarantinedInstances,
    );
  }

  PleromaApiInstanceFederation fromJson(Map<String, Object?> json) {
    return PleromaApiInstanceFederation.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceFederation = _$PleromaApiInstanceFederationTearOff();

/// @nodoc
mixin _$PleromaApiInstanceFederation {
  @HiveField(0)
  bool? get enabled => throw _privateConstructorUsedError;
  @HiveField(1)
  bool? get exclusions => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'mrf_object_age')
  PleromaApiInstanceFederationMfrObjectAge? get mrfObjectAge =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'mrf_policies')
  List<String>? get mrfPolicies => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'quarantined_instances')
  List<String>? get quarantinedInstances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceFederationCopyWith<PleromaApiInstanceFederation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceFederationCopyWith<$Res> {
  factory $PleromaApiInstanceFederationCopyWith(
          PleromaApiInstanceFederation value,
          $Res Function(PleromaApiInstanceFederation) then) =
      _$PleromaApiInstanceFederationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          bool? enabled,
      @HiveField(1)
          bool? exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          PleromaApiInstanceFederationMfrObjectAge? mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          List<String>? mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          List<String>? quarantinedInstances});

  $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res>? get mrfObjectAge;
}

/// @nodoc
class _$PleromaApiInstanceFederationCopyWithImpl<$Res>
    implements $PleromaApiInstanceFederationCopyWith<$Res> {
  _$PleromaApiInstanceFederationCopyWithImpl(this._value, this._then);

  final PleromaApiInstanceFederation _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceFederation) _then;

  @override
  $Res call({
    Object? enabled = freezed,
    Object? exclusions = freezed,
    Object? mrfObjectAge = freezed,
    Object? mrfPolicies = freezed,
    Object? quarantinedInstances = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      exclusions: exclusions == freezed
          ? _value.exclusions
          : exclusions // ignore: cast_nullable_to_non_nullable
              as bool?,
      mrfObjectAge: mrfObjectAge == freezed
          ? _value.mrfObjectAge
          : mrfObjectAge // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFederationMfrObjectAge?,
      mrfPolicies: mrfPolicies == freezed
          ? _value.mrfPolicies
          : mrfPolicies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      quarantinedInstances: quarantinedInstances == freezed
          ? _value.quarantinedInstances
          : quarantinedInstances // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res>? get mrfObjectAge {
    if (_value.mrfObjectAge == null) {
      return null;
    }

    return $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res>(
        _value.mrfObjectAge!, (value) {
      return _then(_value.copyWith(mrfObjectAge: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiInstanceFederationCopyWith<$Res>
    implements $PleromaApiInstanceFederationCopyWith<$Res> {
  factory _$PleromaApiInstanceFederationCopyWith(
          _PleromaApiInstanceFederation value,
          $Res Function(_PleromaApiInstanceFederation) then) =
      __$PleromaApiInstanceFederationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          bool? enabled,
      @HiveField(1)
          bool? exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          PleromaApiInstanceFederationMfrObjectAge? mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          List<String>? mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          List<String>? quarantinedInstances});

  @override
  $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res>? get mrfObjectAge;
}

/// @nodoc
class __$PleromaApiInstanceFederationCopyWithImpl<$Res>
    extends _$PleromaApiInstanceFederationCopyWithImpl<$Res>
    implements _$PleromaApiInstanceFederationCopyWith<$Res> {
  __$PleromaApiInstanceFederationCopyWithImpl(
      _PleromaApiInstanceFederation _value,
      $Res Function(_PleromaApiInstanceFederation) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstanceFederation));

  @override
  _PleromaApiInstanceFederation get _value =>
      super._value as _PleromaApiInstanceFederation;

  @override
  $Res call({
    Object? enabled = freezed,
    Object? exclusions = freezed,
    Object? mrfObjectAge = freezed,
    Object? mrfPolicies = freezed,
    Object? quarantinedInstances = freezed,
  }) {
    return _then(_PleromaApiInstanceFederation(
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      exclusions: exclusions == freezed
          ? _value.exclusions
          : exclusions // ignore: cast_nullable_to_non_nullable
              as bool?,
      mrfObjectAge: mrfObjectAge == freezed
          ? _value.mrfObjectAge
          : mrfObjectAge // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceFederationMfrObjectAge?,
      mrfPolicies: mrfPolicies == freezed
          ? _value.mrfPolicies
          : mrfPolicies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      quarantinedInstances: quarantinedInstances == freezed
          ? _value.quarantinedInstances
          : quarantinedInstances // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstanceFederation implements _PleromaApiInstanceFederation {
  const _$_PleromaApiInstanceFederation(
      {@HiveField(0)
          required this.enabled,
      @HiveField(1)
          required this.exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          required this.mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          required this.mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          required this.quarantinedInstances});

  factory _$_PleromaApiInstanceFederation.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceFederationFromJson(json);

  @override
  @HiveField(0)
  final bool? enabled;
  @override
  @HiveField(1)
  final bool? exclusions;
  @override
  @HiveField(2)
  @JsonKey(name: 'mrf_object_age')
  final PleromaApiInstanceFederationMfrObjectAge? mrfObjectAge;
  @override
  @HiveField(3)
  @JsonKey(name: 'mrf_policies')
  final List<String>? mrfPolicies;
  @override
  @HiveField(4)
  @JsonKey(name: 'quarantined_instances')
  final List<String>? quarantinedInstances;

  @override
  String toString() {
    return 'PleromaApiInstanceFederation(enabled: $enabled, exclusions: $exclusions, mrfObjectAge: $mrfObjectAge, mrfPolicies: $mrfPolicies, quarantinedInstances: $quarantinedInstances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiInstanceFederation &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.exclusions, exclusions) ||
                other.exclusions == exclusions) &&
            (identical(other.mrfObjectAge, mrfObjectAge) ||
                other.mrfObjectAge == mrfObjectAge) &&
            const DeepCollectionEquality()
                .equals(other.mrfPolicies, mrfPolicies) &&
            const DeepCollectionEquality()
                .equals(other.quarantinedInstances, quarantinedInstances));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      enabled,
      exclusions,
      mrfObjectAge,
      const DeepCollectionEquality().hash(mrfPolicies),
      const DeepCollectionEquality().hash(quarantinedInstances));

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceFederationCopyWith<_PleromaApiInstanceFederation>
      get copyWith => __$PleromaApiInstanceFederationCopyWithImpl<
          _PleromaApiInstanceFederation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceFederationToJson(this);
  }
}

abstract class _PleromaApiInstanceFederation
    implements PleromaApiInstanceFederation {
  const factory _PleromaApiInstanceFederation(
          {@HiveField(0)
              required bool? enabled,
          @HiveField(1)
              required bool? exclusions,
          @HiveField(2)
          @JsonKey(name: 'mrf_object_age')
              required PleromaApiInstanceFederationMfrObjectAge? mrfObjectAge,
          @HiveField(3)
          @JsonKey(name: 'mrf_policies')
              required List<String>? mrfPolicies,
          @HiveField(4)
          @JsonKey(name: 'quarantined_instances')
              required List<String>? quarantinedInstances}) =
      _$_PleromaApiInstanceFederation;

  factory _PleromaApiInstanceFederation.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstanceFederation.fromJson;

  @override
  @HiveField(0)
  bool? get enabled;
  @override
  @HiveField(1)
  bool? get exclusions;
  @override
  @HiveField(2)
  @JsonKey(name: 'mrf_object_age')
  PleromaApiInstanceFederationMfrObjectAge? get mrfObjectAge;
  @override
  @HiveField(3)
  @JsonKey(name: 'mrf_policies')
  List<String>? get mrfPolicies;
  @override
  @HiveField(4)
  @JsonKey(name: 'quarantined_instances')
  List<String>? get quarantinedInstances;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceFederationCopyWith<_PleromaApiInstanceFederation>
      get copyWith => throw _privateConstructorUsedError;
}
