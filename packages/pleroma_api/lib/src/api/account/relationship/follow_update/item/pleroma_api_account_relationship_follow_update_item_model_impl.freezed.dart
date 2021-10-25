// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_account_relationship_follow_update_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccountRelationshipFollowUpdateItem
    _$PleromaApiAccountRelationshipFollowUpdateItemFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiAccountRelationshipFollowUpdateItem.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccountRelationshipFollowUpdateItemTearOff {
  const _$PleromaApiAccountRelationshipFollowUpdateItemTearOff();

  _PleromaApiAccountRelationshipFollowUpdateItem call(
      {@JsonKey(name: 'id')
      @HiveField(1)
          required String accountId,
      @JsonKey(name: 'follower_count')
      @HiveField(2)
          required int? followerCount,
      @JsonKey(name: 'following_count')
      @HiveField(3)
          required int? followingCount}) {
    return _PleromaApiAccountRelationshipFollowUpdateItem(
      accountId: accountId,
      followerCount: followerCount,
      followingCount: followingCount,
    );
  }

  PleromaApiAccountRelationshipFollowUpdateItem fromJson(
      Map<String, Object> json) {
    return PleromaApiAccountRelationshipFollowUpdateItem.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccountRelationshipFollowUpdateItem =
    _$PleromaApiAccountRelationshipFollowUpdateItemTearOff();

/// @nodoc
mixin _$PleromaApiAccountRelationshipFollowUpdateItem {
  @JsonKey(name: 'id')
  @HiveField(1)
  String get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'follower_count')
  @HiveField(2)
  int? get followerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_count')
  @HiveField(3)
  int? get followingCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<
          PleromaApiAccountRelationshipFollowUpdateItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  factory $PleromaApiAccountRelationshipFollowUpdateItemCopyWith(
          PleromaApiAccountRelationshipFollowUpdateItem value,
          $Res Function(PleromaApiAccountRelationshipFollowUpdateItem) then) =
      _$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') @HiveField(1) String accountId,
      @JsonKey(name: 'follower_count') @HiveField(2) int? followerCount,
      @JsonKey(name: 'following_count') @HiveField(3) int? followingCount});
}

/// @nodoc
class _$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>
    implements $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  _$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl(
      this._value, this._then);

  final PleromaApiAccountRelationshipFollowUpdateItem _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccountRelationshipFollowUpdateItem) _then;

  @override
  $Res call({
    Object? accountId = freezed,
    Object? followerCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: followerCount == freezed
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCount: followingCount == freezed
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res>
    implements $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  factory _$PleromaApiAccountRelationshipFollowUpdateItemCopyWith(
          _PleromaApiAccountRelationshipFollowUpdateItem value,
          $Res Function(_PleromaApiAccountRelationshipFollowUpdateItem) then) =
      __$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') @HiveField(1) String accountId,
      @JsonKey(name: 'follower_count') @HiveField(2) int? followerCount,
      @JsonKey(name: 'following_count') @HiveField(3) int? followingCount});
}

/// @nodoc
class __$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>
    extends _$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>
    implements _$PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  __$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl(
      _PleromaApiAccountRelationshipFollowUpdateItem _value,
      $Res Function(_PleromaApiAccountRelationshipFollowUpdateItem) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiAccountRelationshipFollowUpdateItem));

  @override
  _PleromaApiAccountRelationshipFollowUpdateItem get _value =>
      super._value as _PleromaApiAccountRelationshipFollowUpdateItem;

  @override
  $Res call({
    Object? accountId = freezed,
    Object? followerCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_PleromaApiAccountRelationshipFollowUpdateItem(
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: followerCount == freezed
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCount: followingCount == freezed
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccountRelationshipFollowUpdateItem
    implements _PleromaApiAccountRelationshipFollowUpdateItem {
  const _$_PleromaApiAccountRelationshipFollowUpdateItem(
      {@JsonKey(name: 'id')
      @HiveField(1)
          required this.accountId,
      @JsonKey(name: 'follower_count')
      @HiveField(2)
          required this.followerCount,
      @JsonKey(name: 'following_count')
      @HiveField(3)
          required this.followingCount});

  factory _$_PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAccountRelationshipFollowUpdateItemFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(1)
  final String accountId;
  @override
  @JsonKey(name: 'follower_count')
  @HiveField(2)
  final int? followerCount;
  @override
  @JsonKey(name: 'following_count')
  @HiveField(3)
  final int? followingCount;

  @override
  String toString() {
    return 'PleromaApiAccountRelationshipFollowUpdateItem(accountId: $accountId, followerCount: $followerCount, followingCount: $followingCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccountRelationshipFollowUpdateItem &&
            (identical(other.accountId, accountId) ||
                const DeepCollectionEquality()
                    .equals(other.accountId, accountId)) &&
            (identical(other.followerCount, followerCount) ||
                const DeepCollectionEquality()
                    .equals(other.followerCount, followerCount)) &&
            (identical(other.followingCount, followingCount) ||
                const DeepCollectionEquality()
                    .equals(other.followingCount, followingCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accountId) ^
      const DeepCollectionEquality().hash(followerCount) ^
      const DeepCollectionEquality().hash(followingCount);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccountRelationshipFollowUpdateItemCopyWith<
          _PleromaApiAccountRelationshipFollowUpdateItem>
      get copyWith =>
          __$PleromaApiAccountRelationshipFollowUpdateItemCopyWithImpl<
              _PleromaApiAccountRelationshipFollowUpdateItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccountRelationshipFollowUpdateItemToJson(this);
  }
}

abstract class _PleromaApiAccountRelationshipFollowUpdateItem
    implements PleromaApiAccountRelationshipFollowUpdateItem {
  const factory _PleromaApiAccountRelationshipFollowUpdateItem(
          {@JsonKey(name: 'id')
          @HiveField(1)
              required String accountId,
          @JsonKey(name: 'follower_count')
          @HiveField(2)
              required int? followerCount,
          @JsonKey(name: 'following_count')
          @HiveField(3)
              required int? followingCount}) =
      _$_PleromaApiAccountRelationshipFollowUpdateItem;

  factory _PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiAccountRelationshipFollowUpdateItem.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(1)
  String get accountId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'follower_count')
  @HiveField(2)
  int? get followerCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'following_count')
  @HiveField(3)
  int? get followingCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccountRelationshipFollowUpdateItemCopyWith<
          _PleromaApiAccountRelationshipFollowUpdateItem>
      get copyWith => throw _privateConstructorUsedError;
}
