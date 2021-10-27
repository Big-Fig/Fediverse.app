// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_push_subscription_alerts_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPushSubscriptionAlerts _$MastodonApiPushSubscriptionAlertsFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPushSubscribeRequestDataAlerts.fromJson(json);
}

/// @nodoc
class _$MastodonApiPushSubscriptionAlertsTearOff {
  const _$MastodonApiPushSubscriptionAlertsTearOff();

  _MastodonApiPushSubscribeRequestDataAlerts call(
      {@HiveField(0) required bool? favourite,
      @HiveField(1) required bool? follow,
      @HiveField(2) required bool? mention,
      @HiveField(3) required bool? reblog,
      @HiveField(4) required bool? poll}) {
    return _MastodonApiPushSubscribeRequestDataAlerts(
      favourite: favourite,
      follow: follow,
      mention: mention,
      reblog: reblog,
      poll: poll,
    );
  }

  MastodonApiPushSubscriptionAlerts fromJson(Map<String, Object?> json) {
    return MastodonApiPushSubscriptionAlerts.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPushSubscriptionAlerts =
    _$MastodonApiPushSubscriptionAlertsTearOff();

/// @nodoc
mixin _$MastodonApiPushSubscriptionAlerts {
  @HiveField(0)
  bool? get favourite => throw _privateConstructorUsedError;
  @HiveField(1)
  bool? get follow => throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get mention => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get reblog => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get poll => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPushSubscriptionAlertsCopyWith<MastodonApiPushSubscriptionAlerts>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPushSubscriptionAlertsCopyWith<$Res> {
  factory $MastodonApiPushSubscriptionAlertsCopyWith(
          MastodonApiPushSubscriptionAlerts value,
          $Res Function(MastodonApiPushSubscriptionAlerts) then) =
      _$MastodonApiPushSubscriptionAlertsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) bool? favourite,
      @HiveField(1) bool? follow,
      @HiveField(2) bool? mention,
      @HiveField(3) bool? reblog,
      @HiveField(4) bool? poll});
}

/// @nodoc
class _$MastodonApiPushSubscriptionAlertsCopyWithImpl<$Res>
    implements $MastodonApiPushSubscriptionAlertsCopyWith<$Res> {
  _$MastodonApiPushSubscriptionAlertsCopyWithImpl(this._value, this._then);

  final MastodonApiPushSubscriptionAlerts _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPushSubscriptionAlerts) _then;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
  }) {
    return _then(_value.copyWith(
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      follow: follow == freezed
          ? _value.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as bool?,
      mention: mention == freezed
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as bool?,
      reblog: reblog == freezed
          ? _value.reblog
          : reblog // ignore: cast_nullable_to_non_nullable
              as bool?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiPushSubscribeRequestDataAlertsCopyWith<$Res>
    implements $MastodonApiPushSubscriptionAlertsCopyWith<$Res> {
  factory _$MastodonApiPushSubscribeRequestDataAlertsCopyWith(
          _MastodonApiPushSubscribeRequestDataAlerts value,
          $Res Function(_MastodonApiPushSubscribeRequestDataAlerts) then) =
      __$MastodonApiPushSubscribeRequestDataAlertsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) bool? favourite,
      @HiveField(1) bool? follow,
      @HiveField(2) bool? mention,
      @HiveField(3) bool? reblog,
      @HiveField(4) bool? poll});
}

/// @nodoc
class __$MastodonApiPushSubscribeRequestDataAlertsCopyWithImpl<$Res>
    extends _$MastodonApiPushSubscriptionAlertsCopyWithImpl<$Res>
    implements _$MastodonApiPushSubscribeRequestDataAlertsCopyWith<$Res> {
  __$MastodonApiPushSubscribeRequestDataAlertsCopyWithImpl(
      _MastodonApiPushSubscribeRequestDataAlerts _value,
      $Res Function(_MastodonApiPushSubscribeRequestDataAlerts) _then)
      : super(_value,
            (v) => _then(v as _MastodonApiPushSubscribeRequestDataAlerts));

  @override
  _MastodonApiPushSubscribeRequestDataAlerts get _value =>
      super._value as _MastodonApiPushSubscribeRequestDataAlerts;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
  }) {
    return _then(_MastodonApiPushSubscribeRequestDataAlerts(
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      follow: follow == freezed
          ? _value.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as bool?,
      mention: mention == freezed
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as bool?,
      reblog: reblog == freezed
          ? _value.reblog
          : reblog // ignore: cast_nullable_to_non_nullable
              as bool?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPushSubscribeRequestDataAlerts
    implements _MastodonApiPushSubscribeRequestDataAlerts {
  const _$_MastodonApiPushSubscribeRequestDataAlerts(
      {@HiveField(0) required this.favourite,
      @HiveField(1) required this.follow,
      @HiveField(2) required this.mention,
      @HiveField(3) required this.reblog,
      @HiveField(4) required this.poll});

  factory _$_MastodonApiPushSubscribeRequestDataAlerts.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiPushSubscribeRequestDataAlertsFromJson(json);

  @override
  @HiveField(0)
  final bool? favourite;
  @override
  @HiveField(1)
  final bool? follow;
  @override
  @HiveField(2)
  final bool? mention;
  @override
  @HiveField(3)
  final bool? reblog;
  @override
  @HiveField(4)
  final bool? poll;

  @override
  String toString() {
    return 'MastodonApiPushSubscriptionAlerts(favourite: $favourite, follow: $follow, mention: $mention, reblog: $reblog, poll: $poll)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPushSubscribeRequestDataAlerts &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.mention, mention) || other.mention == mention) &&
            (identical(other.reblog, reblog) || other.reblog == reblog) &&
            (identical(other.poll, poll) || other.poll == poll));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, favourite, follow, mention, reblog, poll);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPushSubscribeRequestDataAlertsCopyWith<
          _MastodonApiPushSubscribeRequestDataAlerts>
      get copyWith => __$MastodonApiPushSubscribeRequestDataAlertsCopyWithImpl<
          _MastodonApiPushSubscribeRequestDataAlerts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPushSubscribeRequestDataAlertsToJson(this);
  }
}

abstract class _MastodonApiPushSubscribeRequestDataAlerts
    implements MastodonApiPushSubscriptionAlerts {
  const factory _MastodonApiPushSubscribeRequestDataAlerts(
          {@HiveField(0) required bool? favourite,
          @HiveField(1) required bool? follow,
          @HiveField(2) required bool? mention,
          @HiveField(3) required bool? reblog,
          @HiveField(4) required bool? poll}) =
      _$_MastodonApiPushSubscribeRequestDataAlerts;

  factory _MastodonApiPushSubscribeRequestDataAlerts.fromJson(
          Map<String, dynamic> json) =
      _$_MastodonApiPushSubscribeRequestDataAlerts.fromJson;

  @override
  @HiveField(0)
  bool? get favourite;
  @override
  @HiveField(1)
  bool? get follow;
  @override
  @HiveField(2)
  bool? get mention;
  @override
  @HiveField(3)
  bool? get reblog;
  @override
  @HiveField(4)
  bool? get poll;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiPushSubscribeRequestDataAlertsCopyWith<
          _MastodonApiPushSubscribeRequestDataAlerts>
      get copyWith => throw _privateConstructorUsedError;
}
