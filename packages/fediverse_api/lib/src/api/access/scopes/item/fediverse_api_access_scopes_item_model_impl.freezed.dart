// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_access_scopes_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FediverseApiAccessScopesItem _$FediverseApiAccessScopesItemFromJson(
    Map<String, dynamic> json) {
  return _FediverseApiAccessScopesItem.fromJson(json);
}

/// @nodoc
class _$FediverseApiAccessScopesItemTearOff {
  const _$FediverseApiAccessScopesItemTearOff();

  _FediverseApiAccessScopesItem call(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) {
    return _FediverseApiAccessScopesItem(
      permission: permission,
      target: target,
    );
  }

  FediverseApiAccessScopesItem fromJson(Map<String, Object> json) {
    return FediverseApiAccessScopesItem.fromJson(json);
  }
}

/// @nodoc
const $FediverseApiAccessScopesItem = _$FediverseApiAccessScopesItemTearOff();

/// @nodoc
mixin _$FediverseApiAccessScopesItem {
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FediverseApiAccessScopesItemCopyWith<FediverseApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiAccessScopesItemCopyWith<$Res> {
  factory $FediverseApiAccessScopesItemCopyWith(
          FediverseApiAccessScopesItem value,
          $Res Function(FediverseApiAccessScopesItem) then) =
      _$FediverseApiAccessScopesItemCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class _$FediverseApiAccessScopesItemCopyWithImpl<$Res>
    implements $FediverseApiAccessScopesItemCopyWith<$Res> {
  _$FediverseApiAccessScopesItemCopyWithImpl(this._value, this._then);

  final FediverseApiAccessScopesItem _value;
  // ignore: unused_field
  final $Res Function(FediverseApiAccessScopesItem) _then;

  @override
  $Res call({
    Object? permission = freezed,
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FediverseApiAccessScopesItemCopyWith<$Res>
    implements $FediverseApiAccessScopesItemCopyWith<$Res> {
  factory _$FediverseApiAccessScopesItemCopyWith(
          _FediverseApiAccessScopesItem value,
          $Res Function(_FediverseApiAccessScopesItem) then) =
      __$FediverseApiAccessScopesItemCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class __$FediverseApiAccessScopesItemCopyWithImpl<$Res>
    extends _$FediverseApiAccessScopesItemCopyWithImpl<$Res>
    implements _$FediverseApiAccessScopesItemCopyWith<$Res> {
  __$FediverseApiAccessScopesItemCopyWithImpl(
      _FediverseApiAccessScopesItem _value,
      $Res Function(_FediverseApiAccessScopesItem) _then)
      : super(_value, (v) => _then(v as _FediverseApiAccessScopesItem));

  @override
  _FediverseApiAccessScopesItem get _value =>
      super._value as _FediverseApiAccessScopesItem;

  @override
  $Res call({
    Object? permission = freezed,
    Object? target = freezed,
  }) {
    return _then(_FediverseApiAccessScopesItem(
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FediverseApiAccessScopesItem implements _FediverseApiAccessScopesItem {
  const _$_FediverseApiAccessScopesItem(
      {@HiveField(0) required this.permission,
      @HiveField(1) required this.target});

  factory _$_FediverseApiAccessScopesItem.fromJson(Map<String, dynamic> json) =>
      _$$_FediverseApiAccessScopesItemFromJson(json);

  @override
  @HiveField(0)
  final String permission;
  @override
  @HiveField(1)
  final String target;

  @override
  String toString() {
    return 'FediverseApiAccessScopesItem(permission: $permission, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiAccessScopesItem &&
            (identical(other.permission, permission) ||
                const DeepCollectionEquality()
                    .equals(other.permission, permission)) &&
            (identical(other.target, target) ||
                const DeepCollectionEquality().equals(other.target, target)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(permission) ^
      const DeepCollectionEquality().hash(target);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiAccessScopesItemCopyWith<_FediverseApiAccessScopesItem>
      get copyWith => __$FediverseApiAccessScopesItemCopyWithImpl<
          _FediverseApiAccessScopesItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FediverseApiAccessScopesItemToJson(this);
  }
}

abstract class _FediverseApiAccessScopesItem
    implements FediverseApiAccessScopesItem {
  const factory _FediverseApiAccessScopesItem(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) = _$_FediverseApiAccessScopesItem;

  factory _FediverseApiAccessScopesItem.fromJson(Map<String, dynamic> json) =
      _$_FediverseApiAccessScopesItem.fromJson;

  @override
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiAccessScopesItemCopyWith<_FediverseApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}
