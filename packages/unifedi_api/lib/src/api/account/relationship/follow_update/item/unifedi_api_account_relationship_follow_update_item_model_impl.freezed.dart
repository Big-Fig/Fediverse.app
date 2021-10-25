// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_relationship_follow_update_item_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountRelationshipFollowUpdateItem
    _$UnifediApiAccountRelationshipFollowUpdateItemFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccountRelationshipFollowUpdateItem.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountRelationshipFollowUpdateItemTearOff {
  const _$UnifediApiAccountRelationshipFollowUpdateItemTearOff();

  _UnifediApiAccountRelationshipFollowUpdateItem call(
      {@JsonKey(name: 'id')
      @HiveField(1)
          required String accountId,
      @JsonKey(name: 'follower_count')
      @HiveField(2)
          required int? followerCount,
      @JsonKey(name: 'following_count')
      @HiveField(3)
          required int? followingCount}) {
    return _UnifediApiAccountRelationshipFollowUpdateItem(
      accountId: accountId,
      followerCount: followerCount,
      followingCount: followingCount,
    );
  }

  UnifediApiAccountRelationshipFollowUpdateItem fromJson(
      Map<String, Object> json) {
    return UnifediApiAccountRelationshipFollowUpdateItem.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountRelationshipFollowUpdateItem =
    _$UnifediApiAccountRelationshipFollowUpdateItemTearOff();

/// @nodoc
mixin _$UnifediApiAccountRelationshipFollowUpdateItem {
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
  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<
          UnifediApiAccountRelationshipFollowUpdateItem>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  factory $UnifediApiAccountRelationshipFollowUpdateItemCopyWith(
          UnifediApiAccountRelationshipFollowUpdateItem value,
          $Res Function(UnifediApiAccountRelationshipFollowUpdateItem) then) =
      _$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') @HiveField(1) String accountId,
      @JsonKey(name: 'follower_count') @HiveField(2) int? followerCount,
      @JsonKey(name: 'following_count') @HiveField(3) int? followingCount});
}

/// @nodoc
class _$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>
    implements $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  _$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccountRelationshipFollowUpdateItem _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountRelationshipFollowUpdateItem) _then;

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
abstract class _$UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res>
    implements $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  factory _$UnifediApiAccountRelationshipFollowUpdateItemCopyWith(
          _UnifediApiAccountRelationshipFollowUpdateItem value,
          $Res Function(_UnifediApiAccountRelationshipFollowUpdateItem) then) =
      __$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') @HiveField(1) String accountId,
      @JsonKey(name: 'follower_count') @HiveField(2) int? followerCount,
      @JsonKey(name: 'following_count') @HiveField(3) int? followingCount});
}

/// @nodoc
class __$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>
    extends _$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl<$Res>
    implements _$UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> {
  __$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl(
      _UnifediApiAccountRelationshipFollowUpdateItem _value,
      $Res Function(_UnifediApiAccountRelationshipFollowUpdateItem) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccountRelationshipFollowUpdateItem));

  @override
  _UnifediApiAccountRelationshipFollowUpdateItem get _value =>
      super._value as _UnifediApiAccountRelationshipFollowUpdateItem;

  @override
  $Res call({
    Object? accountId = freezed,
    Object? followerCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_UnifediApiAccountRelationshipFollowUpdateItem(
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
class _$_UnifediApiAccountRelationshipFollowUpdateItem
    implements _UnifediApiAccountRelationshipFollowUpdateItem {
  const _$_UnifediApiAccountRelationshipFollowUpdateItem(
      {@JsonKey(name: 'id')
      @HiveField(1)
          required this.accountId,
      @JsonKey(name: 'follower_count')
      @HiveField(2)
          required this.followerCount,
      @JsonKey(name: 'following_count')
      @HiveField(3)
          required this.followingCount});

  factory _$_UnifediApiAccountRelationshipFollowUpdateItem.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountRelationshipFollowUpdateItemFromJson(json);

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
    return 'UnifediApiAccountRelationshipFollowUpdateItem(accountId: $accountId, followerCount: $followerCount, followingCount: $followingCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccountRelationshipFollowUpdateItem &&
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
  _$UnifediApiAccountRelationshipFollowUpdateItemCopyWith<
          _UnifediApiAccountRelationshipFollowUpdateItem>
      get copyWith =>
          __$UnifediApiAccountRelationshipFollowUpdateItemCopyWithImpl<
              _UnifediApiAccountRelationshipFollowUpdateItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountRelationshipFollowUpdateItemToJson(this);
  }
}

abstract class _UnifediApiAccountRelationshipFollowUpdateItem
    implements UnifediApiAccountRelationshipFollowUpdateItem {
  const factory _UnifediApiAccountRelationshipFollowUpdateItem(
          {@JsonKey(name: 'id')
          @HiveField(1)
              required String accountId,
          @JsonKey(name: 'follower_count')
          @HiveField(2)
              required int? followerCount,
          @JsonKey(name: 'following_count')
          @HiveField(3)
              required int? followingCount}) =
      _$_UnifediApiAccountRelationshipFollowUpdateItem;

  factory _UnifediApiAccountRelationshipFollowUpdateItem.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountRelationshipFollowUpdateItem.fromJson;

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
  _$UnifediApiAccountRelationshipFollowUpdateItemCopyWith<
          _UnifediApiAccountRelationshipFollowUpdateItem>
      get copyWith => throw _privateConstructorUsedError;
}
