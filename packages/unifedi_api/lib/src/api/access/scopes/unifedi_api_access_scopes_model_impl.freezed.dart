// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_scopes_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessScopes _$UnifediApiAccessScopesFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessScopes.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessScopesTearOff {
  const _$UnifediApiAccessScopesTearOff();

  _UnifediApiAccessScopes call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          required List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          required List<UnifediApiAccessScopesItem> targetPermissions}) {
    return _UnifediApiAccessScopes(
      globalPermissions: globalPermissions,
      targetPermissions: targetPermissions,
    );
  }

  UnifediApiAccessScopes fromJson(Map<String, Object> json) {
    return UnifediApiAccessScopes.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessScopes = _$UnifediApiAccessScopesTearOff();

/// @nodoc
mixin _$UnifediApiAccessScopes {
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  List<UnifediApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessScopesCopyWith<UnifediApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessScopesCopyWith<$Res> {
  factory $UnifediApiAccessScopesCopyWith(UnifediApiAccessScopes value,
          $Res Function(UnifediApiAccessScopes) then) =
      _$UnifediApiAccessScopesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          List<UnifediApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class _$UnifediApiAccessScopesCopyWithImpl<$Res>
    implements $UnifediApiAccessScopesCopyWith<$Res> {
  _$UnifediApiAccessScopesCopyWithImpl(this._value, this._then);

  final UnifediApiAccessScopes _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessScopes) _then;

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
              as List<UnifediApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiAccessScopesCopyWith<$Res>
    implements $UnifediApiAccessScopesCopyWith<$Res> {
  factory _$UnifediApiAccessScopesCopyWith(_UnifediApiAccessScopes value,
          $Res Function(_UnifediApiAccessScopes) then) =
      __$UnifediApiAccessScopesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          List<UnifediApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class __$UnifediApiAccessScopesCopyWithImpl<$Res>
    extends _$UnifediApiAccessScopesCopyWithImpl<$Res>
    implements _$UnifediApiAccessScopesCopyWith<$Res> {
  __$UnifediApiAccessScopesCopyWithImpl(_UnifediApiAccessScopes _value,
      $Res Function(_UnifediApiAccessScopes) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessScopes));

  @override
  _UnifediApiAccessScopes get _value => super._value as _UnifediApiAccessScopes;

  @override
  $Res call({
    Object? globalPermissions = freezed,
    Object? targetPermissions = freezed,
  }) {
    return _then(_UnifediApiAccessScopes(
      globalPermissions: globalPermissions == freezed
          ? _value.globalPermissions
          : globalPermissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetPermissions: targetPermissions == freezed
          ? _value.targetPermissions
          : targetPermissions // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccessScopes implements _UnifediApiAccessScopes {
  const _$_UnifediApiAccessScopes(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          required this.globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          required this.targetPermissions});

  factory _$_UnifediApiAccessScopes.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessScopesFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  final List<String> globalPermissions;
  @override
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  final List<UnifediApiAccessScopesItem> targetPermissions;

  @override
  String toString() {
    return 'UnifediApiAccessScopes(globalPermissions: $globalPermissions, targetPermissions: $targetPermissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccessScopes &&
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
  _$UnifediApiAccessScopesCopyWith<_UnifediApiAccessScopes> get copyWith =>
      __$UnifediApiAccessScopesCopyWithImpl<_UnifediApiAccessScopes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessScopesToJson(this);
  }
}

abstract class _UnifediApiAccessScopes implements UnifediApiAccessScopes {
  const factory _UnifediApiAccessScopes(
          {@HiveField(0)
          @JsonKey(name: 'global_permissions')
              required List<String> globalPermissions,
          @HiveField(1)
          @JsonKey(name: 'target_permissions')
              required List<UnifediApiAccessScopesItem> targetPermissions}) =
      _$_UnifediApiAccessScopes;

  factory _UnifediApiAccessScopes.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessScopes.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  List<UnifediApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessScopesCopyWith<_UnifediApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}
