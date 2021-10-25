// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_account_relationship_follow_update_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccountRelationshipFollowUpdate
    _$PleromaApiAccountRelationshipFollowUpdateFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiAccountRelationshipFollowUpdate.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccountRelationshipFollowUpdateTearOff {
  const _$PleromaApiAccountRelationshipFollowUpdateTearOff();

  _PleromaApiAccountRelationshipFollowUpdate call(
      {@JsonKey(name: 'state')
      @HiveField(0)
          required String state,
      @HiveField(1)
          required PleromaApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2)
          required PleromaApiAccountRelationshipFollowUpdateItem following}) {
    return _PleromaApiAccountRelationshipFollowUpdate(
      state: state,
      follower: follower,
      following: following,
    );
  }

  PleromaApiAccountRelationshipFollowUpdate fromJson(Map<String, Object> json) {
    return PleromaApiAccountRelationshipFollowUpdate.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccountRelationshipFollowUpdate =
    _$PleromaApiAccountRelationshipFollowUpdateTearOff();

/// @nodoc
mixin _$PleromaApiAccountRelationshipFollowUpdate {
  @JsonKey(name: 'state')
  @HiveField(0)
  String get state => throw _privateConstructorUsedError;
  @HiveField(1)
  PleromaApiAccountRelationshipFollowUpdateItem get follower =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiAccountRelationshipFollowUpdateItem get following =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccountRelationshipFollowUpdateCopyWith<
          PleromaApiAccountRelationshipFollowUpdate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  factory $PleromaApiAccountRelationshipFollowUpdateCopyWith(
          PleromaApiAccountRelationshipFollowUpdate value,
          $Res Function(PleromaApiAccountRelationshipFollowUpdate) then) =
      _$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'state') @HiveField(0) String state,
      @HiveField(1) PleromaApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2) PleromaApiAccountRelationshipFollowUpdateItem following});

  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get follower;
  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get following;
}

/// @nodoc
class _$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>
    implements $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  _$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl(
      this._value, this._then);

  final PleromaApiAccountRelationshipFollowUpdate _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccountRelationshipFollowUpdate) _then;

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
              as PleromaApiAccountRelationshipFollowUpdateItem,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationshipFollowUpdateItem,
    ));
  }

  @override
  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get follower {
    return $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res>(
        _value.follower, (value) {
      return _then(_value.copyWith(follower: value));
    });
  }

  @override
  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get following {
    return $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res>(
        _value.following, (value) {
      return _then(_value.copyWith(following: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res>
    implements $PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  factory _$PleromaApiAccountRelationshipFollowUpdateCopyWith(
          _PleromaApiAccountRelationshipFollowUpdate value,
          $Res Function(_PleromaApiAccountRelationshipFollowUpdate) then) =
      __$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'state') @HiveField(0) String state,
      @HiveField(1) PleromaApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2) PleromaApiAccountRelationshipFollowUpdateItem following});

  @override
  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get follower;
  @override
  $PleromaApiAccountRelationshipFollowUpdateItemCopyWith<$Res> get following;
}

/// @nodoc
class __$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>
    extends _$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl<$Res>
    implements _$PleromaApiAccountRelationshipFollowUpdateCopyWith<$Res> {
  __$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl(
      _PleromaApiAccountRelationshipFollowUpdate _value,
      $Res Function(_PleromaApiAccountRelationshipFollowUpdate) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiAccountRelationshipFollowUpdate));

  @override
  _PleromaApiAccountRelationshipFollowUpdate get _value =>
      super._value as _PleromaApiAccountRelationshipFollowUpdate;

  @override
  $Res call({
    Object? state = freezed,
    Object? follower = freezed,
    Object? following = freezed,
  }) {
    return _then(_PleromaApiAccountRelationshipFollowUpdate(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      follower: follower == freezed
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationshipFollowUpdateItem,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountRelationshipFollowUpdateItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccountRelationshipFollowUpdate
    implements _PleromaApiAccountRelationshipFollowUpdate {
  const _$_PleromaApiAccountRelationshipFollowUpdate(
      {@JsonKey(name: 'state') @HiveField(0) required this.state,
      @HiveField(1) required this.follower,
      @HiveField(2) required this.following});

  factory _$_PleromaApiAccountRelationshipFollowUpdate.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiAccountRelationshipFollowUpdateFromJson(json);

  @override
  @JsonKey(name: 'state')
  @HiveField(0)
  final String state;
  @override
  @HiveField(1)
  final PleromaApiAccountRelationshipFollowUpdateItem follower;
  @override
  @HiveField(2)
  final PleromaApiAccountRelationshipFollowUpdateItem following;

  @override
  String toString() {
    return 'PleromaApiAccountRelationshipFollowUpdate(state: $state, follower: $follower, following: $following)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiAccountRelationshipFollowUpdate &&
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
  _$PleromaApiAccountRelationshipFollowUpdateCopyWith<
          _PleromaApiAccountRelationshipFollowUpdate>
      get copyWith => __$PleromaApiAccountRelationshipFollowUpdateCopyWithImpl<
          _PleromaApiAccountRelationshipFollowUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccountRelationshipFollowUpdateToJson(this);
  }
}

abstract class _PleromaApiAccountRelationshipFollowUpdate
    implements PleromaApiAccountRelationshipFollowUpdate {
  const factory _PleromaApiAccountRelationshipFollowUpdate(
      {@JsonKey(name: 'state')
      @HiveField(0)
          required String state,
      @HiveField(1)
          required PleromaApiAccountRelationshipFollowUpdateItem follower,
      @HiveField(2)
          required PleromaApiAccountRelationshipFollowUpdateItem
              following}) = _$_PleromaApiAccountRelationshipFollowUpdate;

  factory _PleromaApiAccountRelationshipFollowUpdate.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiAccountRelationshipFollowUpdate.fromJson;

  @override
  @JsonKey(name: 'state')
  @HiveField(0)
  String get state => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  PleromaApiAccountRelationshipFollowUpdateItem get follower =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  PleromaApiAccountRelationshipFollowUpdateItem get following =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccountRelationshipFollowUpdateCopyWith<
          _PleromaApiAccountRelationshipFollowUpdate>
      get copyWith => throw _privateConstructorUsedError;
}
