// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_access_scopes_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiAccessScopesRequirement
    _$FediverseApiAccessScopesRequirementFromJson(Map<String, dynamic> json) {
  return _FediverseApiAccessScopesRequirement.fromJson(json);
}

/// @nodoc
class _$FediverseApiAccessScopesRequirementTearOff {
  const _$FediverseApiAccessScopesRequirementTearOff();

  _FediverseApiAccessScopesRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          required List<FediverseApiAccessScopes> scopesVariants}) {
    return _FediverseApiAccessScopesRequirement(
      scopesVariants: scopesVariants,
    );
  }

  FediverseApiAccessScopesRequirement fromJson(Map<String, Object?> json) {
    return FediverseApiAccessScopesRequirement.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiAccessScopesRequirement =
    _$FediverseApiAccessScopesRequirementTearOff();

/// @nodoc
mixin _$FediverseApiAccessScopesRequirement {
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  List<FediverseApiAccessScopes> get scopesVariants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiAccessScopesRequirementCopyWith<
          FediverseApiAccessScopesRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiAccessScopesRequirementCopyWith<$Res> {
  factory $FediverseApiAccessScopesRequirementCopyWith(
          FediverseApiAccessScopesRequirement value,
          $Res Function(FediverseApiAccessScopesRequirement) then) =
      _$FediverseApiAccessScopesRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          List<FediverseApiAccessScopes> scopesVariants});
}

/// @nodoc
class _$FediverseApiAccessScopesRequirementCopyWithImpl<$Res>
    implements $FediverseApiAccessScopesRequirementCopyWith<$Res> {
  _$FediverseApiAccessScopesRequirementCopyWithImpl(this._value, this._then);

  final FediverseApiAccessScopesRequirement _value;
  // ignore: unused_field
  final $Res Function(FediverseApiAccessScopesRequirement) _then;

  @override
  $Res call({
    Object? scopesVariants = freezed,
  }) {
    return _then(_value.copyWith(
      scopesVariants: scopesVariants == freezed
          ? _value.scopesVariants
          : scopesVariants // ignore: cast_nullable_to_non_nullable
              as List<FediverseApiAccessScopes>,
    ));
  }
}

/// @nodoc
abstract class _$FediverseApiAccessScopesRequirementCopyWith<$Res>
    implements $FediverseApiAccessScopesRequirementCopyWith<$Res> {
  factory _$FediverseApiAccessScopesRequirementCopyWith(
          _FediverseApiAccessScopesRequirement value,
          $Res Function(_FediverseApiAccessScopesRequirement) then) =
      __$FediverseApiAccessScopesRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          List<FediverseApiAccessScopes> scopesVariants});
}

/// @nodoc
class __$FediverseApiAccessScopesRequirementCopyWithImpl<$Res>
    extends _$FediverseApiAccessScopesRequirementCopyWithImpl<$Res>
    implements _$FediverseApiAccessScopesRequirementCopyWith<$Res> {
  __$FediverseApiAccessScopesRequirementCopyWithImpl(
      _FediverseApiAccessScopesRequirement _value,
      $Res Function(_FediverseApiAccessScopesRequirement) _then)
      : super(_value, (v) => _then(v as _FediverseApiAccessScopesRequirement));

  @override
  _FediverseApiAccessScopesRequirement get _value =>
      super._value as _FediverseApiAccessScopesRequirement;

  @override
  $Res call({
    Object? scopesVariants = freezed,
  }) {
    return _then(_FediverseApiAccessScopesRequirement(
      scopesVariants: scopesVariants == freezed
          ? _value.scopesVariants
          : scopesVariants // ignore: cast_nullable_to_non_nullable
              as List<FediverseApiAccessScopes>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediverseApiAccessScopesRequirement
    implements _FediverseApiAccessScopesRequirement {
  const _$_FediverseApiAccessScopesRequirement(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          required this.scopesVariants});

  factory _$_FediverseApiAccessScopesRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_FediverseApiAccessScopesRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  final List<FediverseApiAccessScopes> scopesVariants;

  @override
  String toString() {
    return 'FediverseApiAccessScopesRequirement(scopesVariants: $scopesVariants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FediverseApiAccessScopesRequirement &&
            const DeepCollectionEquality()
                .equals(other.scopesVariants, scopesVariants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(scopesVariants));

  @JsonKey(ignore: true)
  @override
  _$FediverseApiAccessScopesRequirementCopyWith<
          _FediverseApiAccessScopesRequirement>
      get copyWith => __$FediverseApiAccessScopesRequirementCopyWithImpl<
          _FediverseApiAccessScopesRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiAccessScopesRequirementToJson(this);
  }
}

abstract class _FediverseApiAccessScopesRequirement
    implements FediverseApiAccessScopesRequirement {
  const factory _FediverseApiAccessScopesRequirement(
          {@HiveField(0)
          @JsonKey(name: 'scopes_variants')
              required List<FediverseApiAccessScopes> scopesVariants}) =
      _$_FediverseApiAccessScopesRequirement;

  factory _FediverseApiAccessScopesRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_FediverseApiAccessScopesRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  List<FediverseApiAccessScopes> get scopesVariants;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiAccessScopesRequirementCopyWith<
          _FediverseApiAccessScopesRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
