// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_access_scopes_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccessScopesItem _$UnifediApiAccessScopesItemFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccessScopesItem.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccessScopesItemTearOff {
  const _$UnifediApiAccessScopesItemTearOff();

  _UnifediApiAccessScopesItem call(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) {
    return _UnifediApiAccessScopesItem(
      permission: permission,
      target: target,
    );
  }

  UnifediApiAccessScopesItem fromJson(Map<String, Object?> json) {
    return UnifediApiAccessScopesItem.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccessScopesItem = _$UnifediApiAccessScopesItemTearOff();

/// @nodoc
mixin _$UnifediApiAccessScopesItem {
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccessScopesItemCopyWith<UnifediApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccessScopesItemCopyWith<$Res> {
  factory $UnifediApiAccessScopesItemCopyWith(UnifediApiAccessScopesItem value,
          $Res Function(UnifediApiAccessScopesItem) then) =
      _$UnifediApiAccessScopesItemCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class _$UnifediApiAccessScopesItemCopyWithImpl<$Res>
    implements $UnifediApiAccessScopesItemCopyWith<$Res> {
  _$UnifediApiAccessScopesItemCopyWithImpl(this._value, this._then);

  final UnifediApiAccessScopesItem _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccessScopesItem) _then;

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
abstract class _$UnifediApiAccessScopesItemCopyWith<$Res>
    implements $UnifediApiAccessScopesItemCopyWith<$Res> {
  factory _$UnifediApiAccessScopesItemCopyWith(
          _UnifediApiAccessScopesItem value,
          $Res Function(_UnifediApiAccessScopesItem) then) =
      __$UnifediApiAccessScopesItemCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class __$UnifediApiAccessScopesItemCopyWithImpl<$Res>
    extends _$UnifediApiAccessScopesItemCopyWithImpl<$Res>
    implements _$UnifediApiAccessScopesItemCopyWith<$Res> {
  __$UnifediApiAccessScopesItemCopyWithImpl(_UnifediApiAccessScopesItem _value,
      $Res Function(_UnifediApiAccessScopesItem) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccessScopesItem));

  @override
  _UnifediApiAccessScopesItem get _value =>
      super._value as _UnifediApiAccessScopesItem;

  @override
  $Res call({
    Object? permission = freezed,
    Object? target = freezed,
  }) {
    return _then(_UnifediApiAccessScopesItem(
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
class _$_UnifediApiAccessScopesItem implements _UnifediApiAccessScopesItem {
  const _$_UnifediApiAccessScopesItem(
      {@HiveField(0) required this.permission,
      @HiveField(1) required this.target});

  factory _$_UnifediApiAccessScopesItem.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccessScopesItemFromJson(json);

  @override
  @HiveField(0)
  final String permission;
  @override
  @HiveField(1)
  final String target;

  @override
  String toString() {
    return 'UnifediApiAccessScopesItem(permission: $permission, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccessScopesItem &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permission, target);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccessScopesItemCopyWith<_UnifediApiAccessScopesItem>
      get copyWith => __$UnifediApiAccessScopesItemCopyWithImpl<
          _UnifediApiAccessScopesItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccessScopesItemToJson(this);
  }
}

abstract class _UnifediApiAccessScopesItem
    implements UnifediApiAccessScopesItem {
  const factory _UnifediApiAccessScopesItem(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) = _$_UnifediApiAccessScopesItem;

  factory _UnifediApiAccessScopesItem.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccessScopesItem.fromJson;

  @override
  @HiveField(0)
  String get permission;
  @override
  @HiveField(1)
  String get target;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccessScopesItemCopyWith<_UnifediApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}
