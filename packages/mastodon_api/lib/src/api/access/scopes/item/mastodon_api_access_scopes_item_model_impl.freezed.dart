// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_access_scopes_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiAccessScopesItem _$MastodonApiAccessScopesItemFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiAccessScopesItem.fromJson(json);
}

/// @nodoc
class _$MastodonApiAccessScopesItemTearOff {
  const _$MastodonApiAccessScopesItemTearOff();

  _MastodonApiAccessScopesItem call(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) {
    return _MastodonApiAccessScopesItem(
      permission: permission,
      target: target,
    );
  }

  MastodonApiAccessScopesItem fromJson(Map<String, Object> json) {
    return MastodonApiAccessScopesItem.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiAccessScopesItem = _$MastodonApiAccessScopesItemTearOff();

/// @nodoc
mixin _$MastodonApiAccessScopesItem {
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiAccessScopesItemCopyWith<MastodonApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiAccessScopesItemCopyWith<$Res> {
  factory $MastodonApiAccessScopesItemCopyWith(
          MastodonApiAccessScopesItem value,
          $Res Function(MastodonApiAccessScopesItem) then) =
      _$MastodonApiAccessScopesItemCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class _$MastodonApiAccessScopesItemCopyWithImpl<$Res>
    implements $MastodonApiAccessScopesItemCopyWith<$Res> {
  _$MastodonApiAccessScopesItemCopyWithImpl(this._value, this._then);

  final MastodonApiAccessScopesItem _value;
  // ignore: unused_field
  final $Res Function(MastodonApiAccessScopesItem) _then;

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
abstract class _$MastodonApiAccessScopesItemCopyWith<$Res>
    implements $MastodonApiAccessScopesItemCopyWith<$Res> {
  factory _$MastodonApiAccessScopesItemCopyWith(
          _MastodonApiAccessScopesItem value,
          $Res Function(_MastodonApiAccessScopesItem) then) =
      __$MastodonApiAccessScopesItemCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String permission, @HiveField(1) String target});
}

/// @nodoc
class __$MastodonApiAccessScopesItemCopyWithImpl<$Res>
    extends _$MastodonApiAccessScopesItemCopyWithImpl<$Res>
    implements _$MastodonApiAccessScopesItemCopyWith<$Res> {
  __$MastodonApiAccessScopesItemCopyWithImpl(
      _MastodonApiAccessScopesItem _value,
      $Res Function(_MastodonApiAccessScopesItem) _then)
      : super(_value, (v) => _then(v as _MastodonApiAccessScopesItem));

  @override
  _MastodonApiAccessScopesItem get _value =>
      super._value as _MastodonApiAccessScopesItem;

  @override
  $Res call({
    Object? permission = freezed,
    Object? target = freezed,
  }) {
    return _then(_MastodonApiAccessScopesItem(
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
class _$_MastodonApiAccessScopesItem implements _MastodonApiAccessScopesItem {
  const _$_MastodonApiAccessScopesItem(
      {@HiveField(0) required this.permission,
      @HiveField(1) required this.target});

  factory _$_MastodonApiAccessScopesItem.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiAccessScopesItemFromJson(json);

  @override
  @HiveField(0)
  final String permission;
  @override
  @HiveField(1)
  final String target;

  @override
  String toString() {
    return 'MastodonApiAccessScopesItem(permission: $permission, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiAccessScopesItem &&
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
  _$MastodonApiAccessScopesItemCopyWith<_MastodonApiAccessScopesItem>
      get copyWith => __$MastodonApiAccessScopesItemCopyWithImpl<
          _MastodonApiAccessScopesItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiAccessScopesItemToJson(this);
  }
}

abstract class _MastodonApiAccessScopesItem
    implements MastodonApiAccessScopesItem {
  const factory _MastodonApiAccessScopesItem(
      {@HiveField(0) required String permission,
      @HiveField(1) required String target}) = _$_MastodonApiAccessScopesItem;

  factory _MastodonApiAccessScopesItem.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiAccessScopesItem.fromJson;

  @override
  @HiveField(0)
  String get permission => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get target => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiAccessScopesItemCopyWith<_MastodonApiAccessScopesItem>
      get copyWith => throw _privateConstructorUsedError;
}
