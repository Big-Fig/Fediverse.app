// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_scopes_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessScopesRequirement _$MastodonApiAccessScopesRequirementFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessScopesRequirement.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessScopesRequirementTearOff {
  const _$MastodonApiAccessScopesRequirementTearOff();

  _MastodonApiAccessScopesRequirement call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          required List<MastodonApiAccessScopes> scopesVariants}) {
    return _MastodonApiAccessScopesRequirement(
      scopesVariants: scopesVariants,
    );
  }

  MastodonApiAccessScopesRequirement fromJson(Map<String, Object?> json) {
    return MastodonApiAccessScopesRequirement.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessScopesRequirement =
    _$MastodonApiAccessScopesRequirementTearOff();

/// @nodoc
mixin _$MastodonApiAccessScopesRequirement {
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  List<MastodonApiAccessScopes> get scopesVariants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessScopesRequirementCopyWith<
          MastodonApiAccessScopesRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessScopesRequirementCopyWith<$Res> {
  factory $MastodonApiAccessScopesRequirementCopyWith(
          MastodonApiAccessScopesRequirement value,
          $Res Function(MastodonApiAccessScopesRequirement) then) =
      _$MastodonApiAccessScopesRequirementCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          List<MastodonApiAccessScopes> scopesVariants});
}

/// @nodoc
class _$MastodonApiAccessScopesRequirementCopyWithImpl<$Res>
    implements $MastodonApiAccessScopesRequirementCopyWith<$Res> {
  _$MastodonApiAccessScopesRequirementCopyWithImpl(this._value, this._then);

  final MastodonApiAccessScopesRequirement _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessScopesRequirement) _then;

  @override
  $Res call({
    Object? scopesVariants = freezed,
  }) {
    return _then(_value.copyWith(
      scopesVariants: scopesVariants == freezed
          ? _value.scopesVariants
          : scopesVariants // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiAccessScopes>,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiAccessScopesRequirementCopyWith<$Res>
    implements $MastodonApiAccessScopesRequirementCopyWith<$Res> {
  factory _$MastodonApiAccessScopesRequirementCopyWith(
          _MastodonApiAccessScopesRequirement value,
          $Res Function(_MastodonApiAccessScopesRequirement) then) =
      __$MastodonApiAccessScopesRequirementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          List<MastodonApiAccessScopes> scopesVariants});
}

/// @nodoc
class __$MastodonApiAccessScopesRequirementCopyWithImpl<$Res>
    extends _$MastodonApiAccessScopesRequirementCopyWithImpl<$Res>
    implements _$MastodonApiAccessScopesRequirementCopyWith<$Res> {
  __$MastodonApiAccessScopesRequirementCopyWithImpl(
      _MastodonApiAccessScopesRequirement _value,
      $Res Function(_MastodonApiAccessScopesRequirement) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessScopesRequirement));

  @override
  _MastodonApiAccessScopesRequirement get _value =>
      super._value as _MastodonApiAccessScopesRequirement;

  @override
  $Res call({
    Object? scopesVariants = freezed,
  }) {
    return _then(_MastodonApiAccessScopesRequirement(
      scopesVariants: scopesVariants == freezed
          ? _value.scopesVariants
          : scopesVariants // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiAccessScopes>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessScopesRequirement
    implements _MastodonApiAccessScopesRequirement {
  const _$_MastodonApiAccessScopesRequirement(
      {@HiveField(0)
      @JsonKey(name: 'scopes_variants')
          required this.scopesVariants});

  factory _$_MastodonApiAccessScopesRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiAccessScopesRequirementFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  final List<MastodonApiAccessScopes> scopesVariants;

  @override
  String toString() {
    return 'MastodonApiAccessScopesRequirement(scopesVariants: $scopesVariants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiAccessScopesRequirement &&
            const DeepCollectionEquality()
                .equals(other.scopesVariants, scopesVariants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(scopesVariants));

  @JsonKey(ignore: true)
  @override
  _$MastodonApiAccessScopesRequirementCopyWith<
          _MastodonApiAccessScopesRequirement>
      get copyWith => __$MastodonApiAccessScopesRequirementCopyWithImpl<
          _MastodonApiAccessScopesRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessScopesRequirementToJson(this);
  }
}

abstract class _MastodonApiAccessScopesRequirement
    implements MastodonApiAccessScopesRequirement {
  const factory _MastodonApiAccessScopesRequirement(
          {@HiveField(0)
          @JsonKey(name: 'scopes_variants')
              required List<MastodonApiAccessScopes> scopesVariants}) =
      _$_MastodonApiAccessScopesRequirement;

  factory _MastodonApiAccessScopesRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiAccessScopesRequirement.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'scopes_variants')
  List<MastodonApiAccessScopes> get scopesVariants;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessScopesRequirementCopyWith<
          _MastodonApiAccessScopesRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
