// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_federation_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceFederation _$UnifediApiInstanceFederationFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceFederation.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceFederationTearOff {
  const _$UnifediApiInstanceFederationTearOff();

  _UnifediApiInstanceFederation call(
      {@HiveField(0)
          required bool? enabled,
      @HiveField(1)
          required bool? exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          required UnifediApiInstanceFederationMfrObjectAge? mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          required List<String>? mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          required List<String>? quarantinedInstances}) {
    return _UnifediApiInstanceFederation(
      enabled: enabled,
      exclusions: exclusions,
      mrfObjectAge: mrfObjectAge,
      mrfPolicies: mrfPolicies,
      quarantinedInstances: quarantinedInstances,
    );
  }

  UnifediApiInstanceFederation fromJson(Map<String, Object> json) {
    return UnifediApiInstanceFederation.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceFederation = _$UnifediApiInstanceFederationTearOff();

/// @nodoc
mixin _$UnifediApiInstanceFederation {
  @HiveField(0)
  bool? get enabled => throw _privateConstructorUsedError;
  @HiveField(1)
  bool? get exclusions => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'mrf_object_age')
  UnifediApiInstanceFederationMfrObjectAge? get mrfObjectAge =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'mrf_policies')
  List<String>? get mrfPolicies => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'quarantined_instances')
  List<String>? get quarantinedInstances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceFederationCopyWith<UnifediApiInstanceFederation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceFederationCopyWith<$Res> {
  factory $UnifediApiInstanceFederationCopyWith(
          UnifediApiInstanceFederation value,
          $Res Function(UnifediApiInstanceFederation) then) =
      _$UnifediApiInstanceFederationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          bool? enabled,
      @HiveField(1)
          bool? exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          UnifediApiInstanceFederationMfrObjectAge? mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          List<String>? mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          List<String>? quarantinedInstances});

  $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res>? get mrfObjectAge;
}

/// @nodoc
class _$UnifediApiInstanceFederationCopyWithImpl<$Res>
    implements $UnifediApiInstanceFederationCopyWith<$Res> {
  _$UnifediApiInstanceFederationCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceFederation _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceFederation) _then;

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
              as UnifediApiInstanceFederationMfrObjectAge?,
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
  $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res>? get mrfObjectAge {
    if (_value.mrfObjectAge == null) {
      return null;
    }

    return $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res>(
        _value.mrfObjectAge!, (value) {
      return _then(_value.copyWith(mrfObjectAge: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceFederationCopyWith<$Res>
    implements $UnifediApiInstanceFederationCopyWith<$Res> {
  factory _$UnifediApiInstanceFederationCopyWith(
          _UnifediApiInstanceFederation value,
          $Res Function(_UnifediApiInstanceFederation) then) =
      __$UnifediApiInstanceFederationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          bool? enabled,
      @HiveField(1)
          bool? exclusions,
      @HiveField(2)
      @JsonKey(name: 'mrf_object_age')
          UnifediApiInstanceFederationMfrObjectAge? mrfObjectAge,
      @HiveField(3)
      @JsonKey(name: 'mrf_policies')
          List<String>? mrfPolicies,
      @HiveField(4)
      @JsonKey(name: 'quarantined_instances')
          List<String>? quarantinedInstances});

  @override
  $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res>? get mrfObjectAge;
}

/// @nodoc
class __$UnifediApiInstanceFederationCopyWithImpl<$Res>
    extends _$UnifediApiInstanceFederationCopyWithImpl<$Res>
    implements _$UnifediApiInstanceFederationCopyWith<$Res> {
  __$UnifediApiInstanceFederationCopyWithImpl(
      _UnifediApiInstanceFederation _value,
      $Res Function(_UnifediApiInstanceFederation) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceFederation));

  @override
  _UnifediApiInstanceFederation get _value =>
      super._value as _UnifediApiInstanceFederation;

  @override
  $Res call({
    Object? enabled = freezed,
    Object? exclusions = freezed,
    Object? mrfObjectAge = freezed,
    Object? mrfPolicies = freezed,
    Object? quarantinedInstances = freezed,
  }) {
    return _then(_UnifediApiInstanceFederation(
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
              as UnifediApiInstanceFederationMfrObjectAge?,
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
class _$_UnifediApiInstanceFederation implements _UnifediApiInstanceFederation {
  const _$_UnifediApiInstanceFederation(
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

  factory _$_UnifediApiInstanceFederation.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceFederationFromJson(json);

  @override
  @HiveField(0)
  final bool? enabled;
  @override
  @HiveField(1)
  final bool? exclusions;
  @override
  @HiveField(2)
  @JsonKey(name: 'mrf_object_age')
  final UnifediApiInstanceFederationMfrObjectAge? mrfObjectAge;
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
    return 'UnifediApiInstanceFederation(enabled: $enabled, exclusions: $exclusions, mrfObjectAge: $mrfObjectAge, mrfPolicies: $mrfPolicies, quarantinedInstances: $quarantinedInstances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceFederation &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality()
                    .equals(other.enabled, enabled)) &&
            (identical(other.exclusions, exclusions) ||
                const DeepCollectionEquality()
                    .equals(other.exclusions, exclusions)) &&
            (identical(other.mrfObjectAge, mrfObjectAge) ||
                const DeepCollectionEquality()
                    .equals(other.mrfObjectAge, mrfObjectAge)) &&
            (identical(other.mrfPolicies, mrfPolicies) ||
                const DeepCollectionEquality()
                    .equals(other.mrfPolicies, mrfPolicies)) &&
            (identical(other.quarantinedInstances, quarantinedInstances) ||
                const DeepCollectionEquality()
                    .equals(other.quarantinedInstances, quarantinedInstances)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enabled) ^
      const DeepCollectionEquality().hash(exclusions) ^
      const DeepCollectionEquality().hash(mrfObjectAge) ^
      const DeepCollectionEquality().hash(mrfPolicies) ^
      const DeepCollectionEquality().hash(quarantinedInstances);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceFederationCopyWith<_UnifediApiInstanceFederation>
      get copyWith => __$UnifediApiInstanceFederationCopyWithImpl<
          _UnifediApiInstanceFederation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceFederationToJson(this);
  }
}

abstract class _UnifediApiInstanceFederation
    implements UnifediApiInstanceFederation {
  const factory _UnifediApiInstanceFederation(
          {@HiveField(0)
              required bool? enabled,
          @HiveField(1)
              required bool? exclusions,
          @HiveField(2)
          @JsonKey(name: 'mrf_object_age')
              required UnifediApiInstanceFederationMfrObjectAge? mrfObjectAge,
          @HiveField(3)
          @JsonKey(name: 'mrf_policies')
              required List<String>? mrfPolicies,
          @HiveField(4)
          @JsonKey(name: 'quarantined_instances')
              required List<String>? quarantinedInstances}) =
      _$_UnifediApiInstanceFederation;

  factory _UnifediApiInstanceFederation.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceFederation.fromJson;

  @override
  @HiveField(0)
  bool? get enabled => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  bool? get exclusions => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'mrf_object_age')
  UnifediApiInstanceFederationMfrObjectAge? get mrfObjectAge =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'mrf_policies')
  List<String>? get mrfPolicies => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  @JsonKey(name: 'quarantined_instances')
  List<String>? get quarantinedInstances => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceFederationCopyWith<_UnifediApiInstanceFederation>
      get copyWith => throw _privateConstructorUsedError;
}
