// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_access_scopes_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccessScopesItem _$PleromaApiAccessScopesItemFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccessScopesItem.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccessScopesItemTearOff {
  const _$PleromaApiAccessScopesItemTearOff();

  _PleromaApiAccessScopesItem call(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) {
    return _PleromaApiAccessScopesItem(
      permission: permission,
      target: target,
    );
  }

  PleromaApiAccessScopesItem fromJson(Map<String, Object> json) {
    return PleromaApiAccessScopesItem.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccessScopesItem = _$PleromaApiAccessScopesItemTearOff();

/// @nodoc
mixin _$PleromaApiAccessScopesItem {
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccessScopesItemCopyWith<PleromaApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccessScopesItemCopyWith<$Res> {
  factory $PleromaApiAccessScopesItemCopyWith(PleromaApiAccessScopesItem value,
          $Res Function(PleromaApiAccessScopesItem) then) =
      _$PleromaApiAccessScopesItemCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class _$PleromaApiAccessScopesItemCopyWithImpl<$Res>
    implements $PleromaApiAccessScopesItemCopyWith<$Res> {
  _$PleromaApiAccessScopesItemCopyWithImpl(this._value, this._then);

  final PleromaApiAccessScopesItem _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccessScopesItem) _then;

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
abstract class _$PleromaApiAccessScopesItemCopyWith<$Res>
    implements $PleromaApiAccessScopesItemCopyWith<$Res> {
  factory _$PleromaApiAccessScopesItemCopyWith(
          _PleromaApiAccessScopesItem value,
          $Res Function(_PleromaApiAccessScopesItem) then) =
      __$PleromaApiAccessScopesItemCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class __$PleromaApiAccessScopesItemCopyWithImpl<$Res>
    extends _$PleromaApiAccessScopesItemCopyWithImpl<$Res>
    implements _$PleromaApiAccessScopesItemCopyWith<$Res> {
  __$PleromaApiAccessScopesItemCopyWithImpl(_PleromaApiAccessScopesItem _value,
      $Res Function(_PleromaApiAccessScopesItem) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccessScopesItem));

  @override
  _PleromaApiAccessScopesItem get _value =>
      super._value as _PleromaApiAccessScopesItem;

  @override
  $Res call({
    Object? permission = freezed,
    Object? target = freezed,
  }) {
    return _then(_PleromaApiAccessScopesItem(
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
class _$_PleromaApiAccessScopesItem implements _PleromaApiAccessScopesItem {
  const _$_PleromaApiAccessScopesItem(
      {@HiveField(0) required this.permission,
      @HiveField(1) required this.target});

  factory _$_PleromaApiAccessScopesItem.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccessScopesItemFromJson(json);

  @override
  @HiveField(0)
  final String permission;
  @override
  @HiveField(1)
  final String target;

  @override
  String toString() {
    return 'PleromaApiAccessScopesItem(permission: $permission, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccessScopesItem &&
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
  _$PleromaApiAccessScopesItemCopyWith<_PleromaApiAccessScopesItem>
      get copyWith => __$PleromaApiAccessScopesItemCopyWithImpl<
          _PleromaApiAccessScopesItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccessScopesItemToJson(this);
  }
}

abstract class _PleromaApiAccessScopesItem
    implements PleromaApiAccessScopesItem {
  const factory _PleromaApiAccessScopesItem(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) = _$_PleromaApiAccessScopesItem;

  factory _PleromaApiAccessScopesItem.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccessScopesItem.fromJson;

  @override
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccessScopesItemCopyWith<_PleromaApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}
