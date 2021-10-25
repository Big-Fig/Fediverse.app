// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_relationship_follow_update_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountRelationshipFollowUpdate
    _$UnifediApiAccountRelationshipFollowUpdateFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiAccountRelationshipFollowUpdate.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountRelationshipFollowUpdateTearOff {
  const _$UnifediApiAccountRelationshipFollowUpdateTearOff();

  _UnifediApiAccountRelationshipFollowUpdate call(
      {@JsonKey(name: 'state')
      @HiveField(0)
          required String state,
      @HiveField(1)
          required UnifediApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2)
          required UnifediApiAccountRelationshipFollowUpdateItem following}) {
    return _UnifediApiAccountRelationshipFollowUpdate(
      state: state,
      follower: follower,
      following: following,
    );
  }

  UnifediApiAccountRelationshipFollowUpdate fromJson(Map<String, Object> json) {
    return UnifediApiAccountRelationshipFollowUpdate.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountRelationshipFollowUpdate =
    _$UnifediApiAccountRelationshipFollowUpdateTearOff();

/// @nodoc
mixin _$UnifediApiAccountRelationshipFollowUpdate {
  @JsonKey(name: 'state')
  @HiveField(0)
  String get state => throw _privateConstructorUsedError;
  @HiveField(1)
  UnifediApiAccountRelationshipFollowUpdateItem get follower =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiAccountRelationshipFollowUpdateItem get following =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountRelationshipFollowUpdateCopyWith<
          UnifediApiAccountRelationshipFollowUpdate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  factory $UnifediApiAccountRelationshipFollowUpdateCopyWith(
          UnifediApiAccountRelationshipFollowUpdate value,
          $Res Function(UnifediApiAccountRelationshipFollowUpdate) then) =
      _$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'state') @HiveField(0) String state,
      @HiveField(1) UnifediApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2) UnifediApiAccountRelationshipFollowUpdateItem following});

  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get follower;
  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get following;
}

/// @nodoc
class _$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>
    implements $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  _$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl(
      this._value, this._then);

  final UnifediApiAccountRelationshipFollowUpdate _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountRelationshipFollowUpdate) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      follower: follower == freezed
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationshipFollowUpdateItem,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationshipFollowUpdateItem,
    ));
  }

  @override
  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get follower {
    return $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res>(
        _value.follower, (value) {
      return _then(_value.copyWith(follower: value));
    });
  }

  @override
  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get following {
    return $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res>(
        _value.following, (value) {
      return _then(_value.copyWith(following: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res>
    implements $UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  factory _$UnifediApiAccountRelationshipFollowUpdateCopyWith(
          _UnifediApiAccountRelationshipFollowUpdate value,
          $Res Function(_UnifediApiAccountRelationshipFollowUpdate) then) =
      __$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'state') @HiveField(0) String state,
      @HiveField(1) UnifediApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2) UnifediApiAccountRelationshipFollowUpdateItem following});

  @override
  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get follower;
  @override
  $UnifediApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get following;
}

/// @nodoc
class __$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>
    extends _$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>
    implements _$UnifediApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  __$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl(
      _UnifediApiAccountRelationshipFollowUpdate _value,
      $Res Function(_UnifediApiAccountRelationshipFollowUpdate) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiAccountRelationshipFollowUpdate));

  @override
  _UnifediApiAccountRelationshipFollowUpdate get _value =>
      super._value as _UnifediApiAccountRelationshipFollowUpdate;

  @override
  $Res call({
    Object? state = freezed,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(_UnifediApiAccountRelationshipFollowUpdate(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      follower: follower == freezed
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationshipFollowUpdateItem,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccountRelationshipFollowUpdateItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountRelationshipFollowUpdate
    implements _UnifediApiAccountRelationshipFollowUpdate {
  const _$_UnifediApiAccountRelationshipFollowUpdate(
      {@JsonKey(name: 'state') @HiveField(0) required this.state,
      @HiveField(1) required this.follower,
      @HiveField(2) required this.following});

  factory _$_UnifediApiAccountRelationshipFollowUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountRelationshipFollowUpdateFromJson(json);

  @override
  @JsonKey(name: 'state')
  @HiveField(0)
  final String state;
  @override
  @HiveField(1)
  final UnifediApiAccountRelationshipFollowUpdateItem follower;
  @override
  @HiveField(2)
  final UnifediApiAccountRelationshipFollowUpdateItem following;

  @override
  String toString() {
    return 'UnifediApiAccountRelationshipFollowUpdate(state: $state, follower: $follower, following: $following)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiAccountRelationshipFollowUpdate &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.follower, follower) ||
                const DeepCollectionEquality()
                    .equals(other.follower, follower)) &&
            (identical(other.following, following) ||
                const DeepCollectionEquality()
                    .equals(other.following, following)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(follower) ^
      const DeepCollectionEquality().hash(following);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountRelationshipFollowUpdateCopyWith<
          _UnifediApiAccountRelationshipFollowUpdate>
      get copyWith => __$UnifediApiAccountRelationshipFollowUpdateCopyWithImpl<
          _UnifediApiAccountRelationshipFollowUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountRelationshipFollowUpdateToJson(this);
  }
}

abstract class _UnifediApiAccountRelationshipFollowUpdate
    implements UnifediApiAccountRelationshipFollowUpdate {
  const factory _UnifediApiAccountRelationshipFollowUpdate(
      {@JsonKey(name: 'state')
      @HiveField(0)
          required String state,
      @HiveField(1)
          required UnifediApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2)
          required UnifediApiAccountRelationshipFollowUpdateItem
              following}) = _$_UnifediApiAccountRelationshipFollowUpdate;

  factory _UnifediApiAccountRelationshipFollowUpdate.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountRelationshipFollowUpdate.fromJson;

  @override
  @JsonKey(name: 'state')
  @HiveField(0)
  String get state => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  UnifediApiAccountRelationshipFollowUpdateItem get follower =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  UnifediApiAccountRelationshipFollowUpdateItem get following =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountRelationshipFollowUpdateCopyWith<
          _UnifediApiAccountRelationshipFollowUpdate>
      get copyWith => throw _privateConstructorUsedError;
}
