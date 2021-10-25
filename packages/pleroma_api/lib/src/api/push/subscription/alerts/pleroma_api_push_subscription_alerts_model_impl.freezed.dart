// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_push_subscription_alerts_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPushSubscriptionAlerts _$PleromaApiPushSubscriptionAlertsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiPushSubscribeRequestDataAlerts.fromJson(json);
}

/// @nodoc
class _$PleromaApiPushSubscriptionAlertsTearOff {
  const _$PleromaApiPushSubscriptionAlertsTearOff();

  _PleromaApiPushSubscribeRequestDataAlerts call(
      {@HiveField(0)
          required bool? favourite,
      @HiveField(1)
          required bool? follow,
      @HiveField(2)
          required bool? mention,
      @HiveField(3)
          required bool? reblog,
      @HiveField(4)
          required bool? poll,
      @HiveField(5)
      @JsonKey(name: 'pleroma:chat_mention')
          required bool? pleromaChatMention,
      @HiveField(6)
      @JsonKey(name: 'pleroma:emoji_reaction')
          required bool? pleromaEmojiReaction}) {
    return _PleromaApiPushSubscribeRequestDataAlerts(
      favourite: favourite,
      follow: follow,
      mention: mention,
      reblog: reblog,
      poll: poll,
      pleromaChatMention: pleromaChatMention,
      pleromaEmojiReaction: pleromaEmojiReaction,
    );
  }

  PleromaApiPushSubscriptionAlerts fromJson(Map<String, Object> json) {
    return PleromaApiPushSubscriptionAlerts.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPushSubscriptionAlerts =
    _$PleromaApiPushSubscriptionAlertsTearOff();

/// @nodoc
mixin _$PleromaApiPushSubscriptionAlerts {
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
  @HiveField(5)
  @JsonKey(name: 'pleroma:chat_mention')
  bool? get pleromaChatMention => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'pleroma:emoji_reaction')
  bool? get pleromaEmojiReaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiPushSubscriptionAlertsCopyWith<PleromaApiPushSubscriptionAlerts>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPushSubscriptionAlertsCopyWith<$Res> {
  factory $PleromaApiPushSubscriptionAlertsCopyWith(
          PleromaApiPushSubscriptionAlerts value,
          $Res Function(PleromaApiPushSubscriptionAlerts) then) =
      _$PleromaApiPushSubscriptionAlertsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          bool? favourite,
      @HiveField(1)
          bool? follow,
      @HiveField(2)
          bool? mention,
      @HiveField(3)
          bool? reblog,
      @HiveField(4)
          bool? poll,
      @HiveField(5)
      @JsonKey(name: 'pleroma:chat_mention')
          bool? pleromaChatMention,
      @HiveField(6)
      @JsonKey(name: 'pleroma:emoji_reaction')
          bool? pleromaEmojiReaction});
}

/// @nodoc
class _$PleromaApiPushSubscriptionAlertsCopyWithImpl<$Res>
    implements $PleromaApiPushSubscriptionAlertsCopyWith<$Res> {
  _$PleromaApiPushSubscriptionAlertsCopyWithImpl(this._value, this._then);

  final PleromaApiPushSubscriptionAlerts _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPushSubscriptionAlerts) _then;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
    Object? pleromaChatMention = freezed,
    Object? pleromaEmojiReaction = freezed,
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
      pleromaChatMention: pleromaChatMention == freezed
          ? _value.pleromaChatMention
          : pleromaChatMention // ignore: cast_nullable_to_non_nullable
              as bool?,
      pleromaEmojiReaction: pleromaEmojiReaction == freezed
          ? _value.pleromaEmojiReaction
          : pleromaEmojiReaction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiPushSubscribeRequestDataAlertsCopyWith<$Res>
    implements $PleromaApiPushSubscriptionAlertsCopyWith<$Res> {
  factory _$PleromaApiPushSubscribeRequestDataAlertsCopyWith(
          _PleromaApiPushSubscribeRequestDataAlerts value,
          $Res Function(_PleromaApiPushSubscribeRequestDataAlerts) then) =
      __$PleromaApiPushSubscribeRequestDataAlertsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          bool? favourite,
      @HiveField(1)
          bool? follow,
      @HiveField(2)
          bool? mention,
      @HiveField(3)
          bool? reblog,
      @HiveField(4)
          bool? poll,
      @HiveField(5)
      @JsonKey(name: 'pleroma:chat_mention')
          bool? pleromaChatMention,
      @HiveField(6)
      @JsonKey(name: 'pleroma:emoji_reaction')
          bool? pleromaEmojiReaction});
}

/// @nodoc
class __$PleromaApiPushSubscribeRequestDataAlertsCopyWithImpl<$Res>
    extends _$PleromaApiPushSubscriptionAlertsCopyWithImpl<$Res>
    implements _$PleromaApiPushSubscribeRequestDataAlertsCopyWith<$Res> {
  __$PleromaApiPushSubscribeRequestDataAlertsCopyWithImpl(
      _PleromaApiPushSubscribeRequestDataAlerts _value,
      $Res Function(_PleromaApiPushSubscribeRequestDataAlerts) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiPushSubscribeRequestDataAlerts));

  @override
  _PleromaApiPushSubscribeRequestDataAlerts get _value =>
      super._value as _PleromaApiPushSubscribeRequestDataAlerts;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
    Object? pleromaChatMention = freezed,
    Object? pleromaEmojiReaction = freezed,
  }) {
    return _then(_PleromaApiPushSubscribeRequestDataAlerts(
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
      pleromaChatMention: pleromaChatMention == freezed
          ? _value.pleromaChatMention
          : pleromaChatMention // ignore: cast_nullable_to_non_nullable
              as bool?,
      pleromaEmojiReaction: pleromaEmojiReaction == freezed
          ? _value.pleromaEmojiReaction
          : pleromaEmojiReaction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiPushSubscribeRequestDataAlerts
    implements _PleromaApiPushSubscribeRequestDataAlerts {
  const _$_PleromaApiPushSubscribeRequestDataAlerts(
      {@HiveField(0)
          required this.favourite,
      @HiveField(1)
          required this.follow,
      @HiveField(2)
          required this.mention,
      @HiveField(3)
          required this.reblog,
      @HiveField(4)
          required this.poll,
      @HiveField(5)
      @JsonKey(name: 'pleroma:chat_mention')
          required this.pleromaChatMention,
      @HiveField(6)
      @JsonKey(name: 'pleroma:emoji_reaction')
          required this.pleromaEmojiReaction});

  factory _$_PleromaApiPushSubscribeRequestDataAlerts.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiPushSubscribeRequestDataAlertsFromJson(json);

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
  @HiveField(5)
  @JsonKey(name: 'pleroma:chat_mention')
  final bool? pleromaChatMention;
  @override
  @HiveField(6)
  @JsonKey(name: 'pleroma:emoji_reaction')
  final bool? pleromaEmojiReaction;

  @override
  String toString() {
    return 'PleromaApiPushSubscriptionAlerts(favourite: $favourite, follow: $follow, mention: $mention, reblog: $reblog, poll: $poll, pleromaChatMention: $pleromaChatMention, pleromaEmojiReaction: $pleromaEmojiReaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiPushSubscribeRequestDataAlerts &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)) &&
            (identical(other.follow, follow) ||
                const DeepCollectionEquality().equals(other.follow, follow)) &&
            (identical(other.mention, mention) ||
                const DeepCollectionEquality()
                    .equals(other.mention, mention)) &&
            (identical(other.reblog, reblog) ||
                const DeepCollectionEquality().equals(other.reblog, reblog)) &&
            (identical(other.poll, poll) ||
                const DeepCollectionEquality().equals(other.poll, poll)) &&
            (identical(other.pleromaChatMention, pleromaChatMention) ||
                const DeepCollectionEquality()
                    .equals(other.pleromaChatMention, pleromaChatMention)) &&
            (identical(other.pleromaEmojiReaction, pleromaEmojiReaction) ||
                const DeepCollectionEquality()
                    .equals(other.pleromaEmojiReaction, pleromaEmojiReaction)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(follow) ^
      const DeepCollectionEquality().hash(mention) ^
      const DeepCollectionEquality().hash(reblog) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(pleromaChatMention) ^
      const DeepCollectionEquality().hash(pleromaEmojiReaction);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPushSubscribeRequestDataAlertsCopyWith<
          _PleromaApiPushSubscribeRequestDataAlerts>
      get copyWith => __$PleromaApiPushSubscribeRequestDataAlertsCopyWithImpl<
          _PleromaApiPushSubscribeRequestDataAlerts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPushSubscribeRequestDataAlertsToJson(this);
  }
}

abstract class _PleromaApiPushSubscribeRequestDataAlerts
    implements PleromaApiPushSubscriptionAlerts {
  const factory _PleromaApiPushSubscribeRequestDataAlerts(
          {@HiveField(0)
              required bool? favourite,
          @HiveField(1)
              required bool? follow,
          @HiveField(2)
              required bool? mention,
          @HiveField(3)
              required bool? reblog,
          @HiveField(4)
              required bool? poll,
          @HiveField(5)
          @JsonKey(name: 'pleroma:chat_mention')
              required bool? pleromaChatMention,
          @HiveField(6)
          @JsonKey(name: 'pleroma:emoji_reaction')
              required bool? pleromaEmojiReaction}) =
      _$_PleromaApiPushSubscribeRequestDataAlerts;

  factory _PleromaApiPushSubscribeRequestDataAlerts.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiPushSubscribeRequestDataAlerts.fromJson;

  @override
  @HiveField(0)
  bool? get favourite => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  bool? get follow => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool? get mention => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool? get reblog => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool? get poll => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'pleroma:chat_mention')
  bool? get pleromaChatMention => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  @JsonKey(name: 'pleroma:emoji_reaction')
  bool? get pleromaEmojiReaction => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiPushSubscribeRequestDataAlertsCopyWith<
          _PleromaApiPushSubscribeRequestDataAlerts>
      get copyWith => throw _privateConstructorUsedError;
}
