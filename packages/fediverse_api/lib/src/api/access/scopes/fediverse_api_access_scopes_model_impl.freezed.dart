// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_access_scopes_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiAccessScopes _$FediverseApiAccessScopesFromJson(
    Map<String, dynamic> json) {
  return _FediverseApiAccessScopes.fromJson(json);
}

/// @nodoc
class _$FediverseApiAccessScopesTearOff {
  const _$FediverseApiAccessScopesTearOff();

  _FediverseApiAccessScopes call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          required List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          required List<FediverseApiAccessScopesItem> targetPermissions}) {
    return _FediverseApiAccessScopes(
      globalPermissions: globalPermissions,
      targetPermissions: targetPermissions,
    );
  }

  FediverseApiAccessScopes fromJson(Map<String, Object> json) {
    return FediverseApiAccessScopes.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiAccessScopes = _$FediverseApiAccessScopesTearOff();

/// @nodoc
mixin _$FediverseApiAccessScopes {
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  List<FediverseApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiAccessScopesCopyWith<FediverseApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiAccessScopesCopyWith<$Res> {
  factory $FediverseApiAccessScopesCopyWith(FediverseApiAccessScopes value,
          $Res Function(FediverseApiAccessScopes) then) =
      _$FediverseApiAccessScopesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          List<FediverseApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class _$FediverseApiAccessScopesCopyWithImpl<$Res>
    implements $FediverseApiAccessScopesCopyWith<$Res> {
  _$FediverseApiAccessScopesCopyWithImpl(this._value, this._then);

  final FediverseApiAccessScopes _value;
  // ignore: unused_field
  final $Res Function(FediverseApiAccessScopes) _then;

  @override
  $Res call({
    Object? globalPermissions = freezed,
    Object? targetPermissions = freezed,
  }) {
    return _then(_value.copyWith(
      globalPermissions: globalPermissions == freezed
          ? _value.globalPermissions
          : globalPermissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetPermissions: targetPermissions == freezed
          ? _value.targetPermissions
          : targetPermissions // ignore: cast_nullable_to_non_nullable
              as List<FediverseApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
abstract class _$FediverseApiAccessScopesCopyWith<$Res>
    implements $FediverseApiAccessScopesCopyWith<$Res> {
  factory _$FediverseApiAccessScopesCopyWith(_FediverseApiAccessScopes value,
          $Res Function(_FediverseApiAccessScopes) then) =
      __$FediverseApiAccessScopesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          List<FediverseApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class __$FediverseApiAccessScopesCopyWithImpl<$Res>
    extends _$FediverseApiAccessScopesCopyWithImpl<$Res>
    implements _$FediverseApiAccessScopesCopyWith<$Res> {
  __$FediverseApiAccessScopesCopyWithImpl(_FediverseApiAccessScopes _value,
      $Res Function(_FediverseApiAccessScopes) _then)
      : super(_value, (v) => _then(v as _FediverseApiAccessScopes));

  @override
  _FediverseApiAccessScopes get _value =>
      super._value as _FediverseApiAccessScopes;

  @override
  $Res call({
    Object? globalPermissions = freezed,
    Object? targetPermissions = freezed,
  }) {
    return _then(_FediverseApiAccessScopes(
      globalPermissions: globalPermissions == freezed
          ? _value.globalPermissions
          : globalPermissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetPermissions: targetPermissions == freezed
          ? _value.targetPermissions
          : targetPermissions // ignore: cast_nullable_to_non_nullable
              as List<FediverseApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediverseApiAccessScopes implements _FediverseApiAccessScopes {
  const _$_FediverseApiAccessScopes(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          required this.globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          required this.targetPermissions});

  factory _$_FediverseApiAccessScopes.fromJson(Map<String, dynamic> json) =>
      _$$_FediverseApiAccessScopesFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  final List<String> globalPermissions;
  @override
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  final List<FediverseApiAccessScopesItem> targetPermissions;

  @override
  String toString() {
    return 'FediverseApiAccessScopes(globalPermissions: $globalPermissions, targetPermissions: $targetPermissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiAccessScopes &&
            (identical(other.globalPermissions, globalPermissions) ||
                const DeepCollectionEquality()
                    .equals(other.globalPermissions, globalPermissions)) &&
            (identical(other.targetPermissions, targetPermissions) ||
                const DeepCollectionEquality()
                    .equals(other.targetPermissions, targetPermissions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(globalPermissions) ^
      const DeepCollectionEquality().hash(targetPermissions);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiAccessScopesCopyWith<_FediverseApiAccessScopes> get copyWith =>
      __$FediverseApiAccessScopesCopyWithImpl<_FediverseApiAccessScopes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiAccessScopesToJson(this);
  }
}

abstract class _FediverseApiAccessScopes implements FediverseApiAccessScopes {
  const factory _FediverseApiAccessScopes(
          {@HiveField(0)
          @JsonKey(name: 'global_permissions')
              required List<String> globalPermissions,
          @HiveField(1)
          @JsonKey(name: 'target_permissions')
              required List<FediverseApiAccessScopesItem> targetPermissions}) =
      _$_FediverseApiAccessScopes;

  factory _FediverseApiAccessScopes.fromJson(Map<String, dynamic> json) =
      _$_FediverseApiAccessScopes.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  List<FediverseApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiAccessScopesCopyWith<_FediverseApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}
