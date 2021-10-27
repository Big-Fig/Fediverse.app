// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_scopes_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessScopesRequirement _$PleromaApiAccessScopesRequirementFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessScopesRequirement.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessScopesRequirementTearOff {
  const _$PleromaApiAccessScopesRequirementTearOff();

  _PleromaApiAccessScopesRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          required List<PleromaApiAccessScopes> scopesVariants}) {
    return _PleromaApiAccessScopesRequirement(
      scopesVariants: scopesVariants,
    );
  }

  PleromaApiAccessScopesRequirement fromJson(Map<String, Object?> json) {
    return PleromaApiAccessScopesRequirement.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessScopesRequirement =
    _$PleromaApiAccessScopesRequirementTearOff();

/// @nodoc
mixin _$PleromaApiAccessScopesRequirement {
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  List<PleromaApiAccessScopes> get scopesVariants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessScopesRequirementCopyWith<PleromaApiAccessScopesRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessScopesRequirementCopyWith<$Res> {
  factory $PleromaApiAccessScopesRequirementCopyWith(
          PleromaApiAccessScopesRequirement value,
          $Res Function(PleromaApiAccessScopesRequirement) then) =
      _$PleromaApiAccessScopesRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          List<PleromaApiAccessScopes> scopesVariants});
}

/// @nodoc
class _$PleromaApiAccessScopesRequirementCopyWithImpl<$Res>
    implements $PleromaApiAccessScopesRequirementCopyWith<$Res> {
  _$PleromaApiAccessScopesRequirementCopyWithImpl(this._value, this._then);

  final PleromaApiAccessScopesRequirement _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessScopesRequirement) _then;

  @override
  $Res call({
    Object? scopesVariants = freezed,
  }) {
    return _then(_value.copyWith(
      scopesVariants: scopesVariants == freezed
          ? _value.scopesVariants
          : scopesVariants // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccessScopes>,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiAccessScopesRequirementCopyWith<$Res>
    implements $PleromaApiAccessScopesRequirementCopyWith<$Res> {
  factory _$PleromaApiAccessScopesRequirementCopyWith(
          _PleromaApiAccessScopesRequirement value,
          $Res Function(_PleromaApiAccessScopesRequirement) then) =
      __$PleromaApiAccessScopesRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          List<PleromaApiAccessScopes> scopesVariants});
}

/// @nodoc
class __$PleromaApiAccessScopesRequirementCopyWithImpl<$Res>
    extends _$PleromaApiAccessScopesRequirementCopyWithImpl<$Res>
    implements _$PleromaApiAccessScopesRequirementCopyWith<$Res> {
  __$PleromaApiAccessScopesRequirementCopyWithImpl(
      _PleromaApiAccessScopesRequirement _value,
      $Res Function(_PleromaApiAccessScopesRequirement) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessScopesRequirement));

  @override
  _PleromaApiAccessScopesRequirement get _value =>
      super._value as _PleromaApiAccessScopesRequirement;

  @override
  $Res call({
    Object? scopesVariants = freezed,
  }) {
    return _then(_PleromaApiAccessScopesRequirement(
      scopesVariants: scopesVariants == freezed
          ? _value.scopesVariants
          : scopesVariants // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccessScopes>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessScopesRequirement
    implements _PleromaApiAccessScopesRequirement {
  const _$_PleromaApiAccessScopesRequirement(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          required this.scopesVariants});

  factory _$_PleromaApiAccessScopesRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAccessScopesRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  final List<PleromaApiAccessScopes> scopesVariants;

  @override
  String toString() {
    return 'PleromaApiAccessScopesRequirement(scopesVariants: $scopesVariants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAccessScopesRequirement &&
            const DeepCollectionEquality()
                .equals(other.scopesVariants, scopesVariants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(scopesVariants));

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccessScopesRequirementCopyWith<
          _PleromaApiAccessScopesRequirement>
      get copyWith => __$PleromaApiAccessScopesRequirementCopyWithImpl<
          _PleromaApiAccessScopesRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessScopesRequirementToJson(this);
  }
}

abstract class _PleromaApiAccessScopesRequirement
    implements PleromaApiAccessScopesRequirement {
  const factory _PleromaApiAccessScopesRequirement(
          {@HiveField(0)
          @JsonKey(name: 'scopes_variants')
              required List<PleromaApiAccessScopes> scopesVariants}) =
      _$_PleromaApiAccessScopesRequirement;

  factory _PleromaApiAccessScopesRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiAccessScopesRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  List<PleromaApiAccessScopes> get scopesVariants;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessScopesRequirementCopyWith<
          _PleromaApiAccessScopesRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
