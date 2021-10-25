// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_scopes_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessScopes _$PleromaApiAccessScopesFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessScopes.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessScopesTearOff {
  const _$PleromaApiAccessScopesTearOff();

  _PleromaApiAccessScopes call(
      {@HiveField(0)
          required List<String> globalPermissions,
      @HiveField(1)
          required List<PleromaApiAccessScopesItem> targetPermissions}) {
    return _PleromaApiAccessScopes(
      globalPermissions: globalPermissions,
      targetPermissions: targetPermissions,
    );
  }

  PleromaApiAccessScopes fromJson(Map<String, Object> json) {
    return PleromaApiAccessScopes.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessScopes = _$PleromaApiAccessScopesTearOff();

/// @nodoc
mixin _$PleromaApiAccessScopes {
  @HiveField(0)
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PleromaApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessScopesCopyWith<PleromaApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessScopesCopyWith<$Res> {
  factory $PleromaApiAccessScopesCopyWith(PleromaApiAccessScopes value,
          $Res Function(PleromaApiAccessScopes) then) =
      _$PleromaApiAccessScopesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> globalPermissions,
      @HiveField(1) List<PleromaApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class _$PleromaApiAccessScopesCopyWithImpl<$Res>
    implements $PleromaApiAccessScopesCopyWith<$Res> {
  _$PleromaApiAccessScopesCopyWithImpl(this._value, this._then);

  final PleromaApiAccessScopes _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessScopes) _then;

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
              as List<PleromaApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiAccessScopesCopyWith<$Res>
    implements $PleromaApiAccessScopesCopyWith<$Res> {
  factory _$PleromaApiAccessScopesCopyWith(_PleromaApiAccessScopes value,
          $Res Function(_PleromaApiAccessScopes) then) =
      __$PleromaApiAccessScopesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String> globalPermissions,
      @HiveField(1) List<PleromaApiAccessScopesItem> targetPermissions});
}

/// @nodoc
class __$PleromaApiAccessScopesCopyWithImpl<$Res>
    extends _$PleromaApiAccessScopesCopyWithImpl<$Res>
    implements _$PleromaApiAccessScopesCopyWith<$Res> {
  __$PleromaApiAccessScopesCopyWithImpl(_PleromaApiAccessScopes _value,
      $Res Function(_PleromaApiAccessScopes) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessScopes));

  @override
  _PleromaApiAccessScopes get _value => super._value as _PleromaApiAccessScopes;

  @override
  $Res call({
    Object? globalPermissions = freezed,
    Object? targetPermissions = freezed,
  }) {
    return _then(_PleromaApiAccessScopes(
      globalPermissions: globalPermissions == freezed
          ? _value.globalPermissions
          : globalPermissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetPermissions: targetPermissions == freezed
          ? _value.targetPermissions
          : targetPermissions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccessScopesItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccessScopes implements _PleromaApiAccessScopes {
  const _$_PleromaApiAccessScopes(
      {@HiveField(0) required this.globalPermissions,
      @HiveField(1) required this.targetPermissions});

  factory _$_PleromaApiAccessScopes.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccessScopesFromJson(json);

  @override
  @HiveField(0)
  final List<String> globalPermissions;
  @override
  @HiveField(1)
  final List<PleromaApiAccessScopesItem> targetPermissions;

  @override
  String toString() {
    return 'PleromaApiAccessScopes(globalPermissions: $globalPermissions, targetPermissions: $targetPermissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccessScopes &&
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
  _$PleromaApiAccessScopesCopyWith<_PleromaApiAccessScopes> get copyWith =>
      __$PleromaApiAccessScopesCopyWithImpl<_PleromaApiAccessScopes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessScopesToJson(this);
  }
}

abstract class _PleromaApiAccessScopes implements PleromaApiAccessScopes {
  const factory _PleromaApiAccessScopes(
          {@HiveField(0)
              required List<String> globalPermissions,
          @HiveField(1)
              required List<PleromaApiAccessScopesItem> targetPermissions}) =
      _$_PleromaApiAccessScopes;

  factory _PleromaApiAccessScopes.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccessScopes.fromJson;

  @override
  @HiveField(0)
  List<String> get globalPermissions => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<PleromaApiAccessScopesItem> get targetPermissions =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessScopesCopyWith<_PleromaApiAccessScopes> get copyWith =>
      throw _privateConstructorUsedError;
}
