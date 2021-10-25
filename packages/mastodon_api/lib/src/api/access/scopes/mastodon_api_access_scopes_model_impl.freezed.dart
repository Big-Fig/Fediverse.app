// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_scopes_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessScopes _$MastodonApiAccessScopesFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessScopes.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessScopesTearOff {
  const _$MastodonApiAccessScopesTearOff();

  _MastodonApiAccessScopes call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          required List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          required List<MastodonApiAccessScopesItem> targetPermissions}) {
    return _MastodonApiAccessScopes(
      globalPermissions: globalPermissions,
      targetPermissions: targetPermissions,
    );
  }

  MastodonApiAccessScopes fromJson(Map<String, Object> json) {
    return MastodonApiAccessScopes.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessScopes = _$MastodonApiAccessScopesTearOff();

/// @nodoc
mixin _$MastodonApiAccessScopes {
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  List<MastodonApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessScopesCopyWith<MastodonApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessScopesCopyWith<$Res> {
  factory $MastodonApiAccessScopesCopyWith(MastodonApiAccessScopes value,
          $Res Function(MastodonApiAccessScopes) then) =
      _$MastodonApiAccessScopesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          List<MastodonApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class _$MastodonApiAccessScopesCopyWithImpl<$Res>
    implements $MastodonApiAccessScopesCopyWith<$Res> {
  _$MastodonApiAccessScopesCopyWithImpl(this._value, this._then);

  final MastodonApiAccessScopes _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessScopes) _then;

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
              as List<MastodonApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiAccessScopesCopyWith<$Res>
    implements $MastodonApiAccessScopesCopyWith<$Res> {
  factory _$MastodonApiAccessScopesCopyWith(_MastodonApiAccessScopes value,
          $Res Function(_MastodonApiAccessScopes) then) =
      __$MastodonApiAccessScopesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          List<String> globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          List<MastodonApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class __$MastodonApiAccessScopesCopyWithImpl<$Res>
    extends _$MastodonApiAccessScopesCopyWithImpl<$Res>
    implements _$MastodonApiAccessScopesCopyWith<$Res> {
  __$MastodonApiAccessScopesCopyWithImpl(_MastodonApiAccessScopes _value,
      $Res Function(_MastodonApiAccessScopes) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessScopes));

  @override
  _MastodonApiAccessScopes get _value =>
      super._value as _MastodonApiAccessScopes;

  @override
  $Res call({
    Object? globalPermissions = freezed,
    Object? targetPermissions = freezed,
  }) {
    return _then(_MastodonApiAccessScopes(
      globalPermissions: globalPermissions == freezed
          ? _value.globalPermissions
          : globalPermissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetPermissions: targetPermissions == freezed
          ? _value.targetPermissions
          : targetPermissions // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiAccessScopes implements _MastodonApiAccessScopes {
  const _$_MastodonApiAccessScopes(
      {@HiveField(0)
      @JsonKey(name: 'global_permissions')
          required this.globalPermissions,
      @HiveField(1)
      @JsonKey(name: 'target_permissions')
          required this.targetPermissions});

  factory _$_MastodonApiAccessScopes.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccessScopesFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  final List<String> globalPermissions;
  @override
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  final List<MastodonApiAccessScopesItem> targetPermissions;

  @override
  String toString() {
    return 'MastodonApiAccessScopes(globalPermissions: $globalPermissions, targetPermissions: $targetPermissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccessScopes &&
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
  _$MastodonApiAccessScopesCopyWith<_MastodonApiAccessScopes> get copyWith =>
      __$MastodonApiAccessScopesCopyWithImpl<_MastodonApiAccessScopes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessScopesToJson(this);
  }
}

abstract class _MastodonApiAccessScopes implements MastodonApiAccessScopes {
  const factory _MastodonApiAccessScopes(
          {@HiveField(0)
          @JsonKey(name: 'global_permissions')
              required List<String> globalPermissions,
          @HiveField(1)
          @JsonKey(name: 'target_permissions')
              required List<MastodonApiAccessScopesItem> targetPermissions}) =
      _$_MastodonApiAccessScopes;

  factory _MastodonApiAccessScopes.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccessScopes.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'global_permissions')
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'target_permissions')
  List<MastodonApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessScopesCopyWith<_MastodonApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}
