// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_push_subscription_alerts_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPushSubscriptionAlerts _$UnifediApiPushSubscriptionAlertsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPushSubscribeRequestDataAlerts.fromJson(json);
}

/// @nodoc
class _$UnifediApiPushSubscriptionAlertsTearOff {
  const _$UnifediApiPushSubscriptionAlertsTearOff();

  _UnifediApiPushSubscribeRequestDataAlerts call(
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
      @JsonKey(name: 'unifedi:chat_mention')
          required bool? chatMention,
      @HiveField(6)
      @JsonKey(name: 'unifedi:emoji_reaction')
          required bool? emojiReaction}) {
    return _UnifediApiPushSubscribeRequestDataAlerts(
      favourite: favourite,
      follow: follow,
      mention: mention,
      reblog: reblog,
      poll: poll,
      chatMention: chatMention,
      emojiReaction: emojiReaction,
    );
  }

  UnifediApiPushSubscriptionAlerts fromJson(Map<String, Object?> json) {
    return UnifediApiPushSubscriptionAlerts.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPushSubscriptionAlerts =
    _$UnifediApiPushSubscriptionAlertsTearOff();

/// @nodoc
mixin _$UnifediApiPushSubscriptionAlerts {
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
  @JsonKey(name: 'unifedi:chat_mention')
  bool? get chatMention => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'unifedi:emoji_reaction')
  bool? get emojiReaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPushSubscriptionAlertsCopyWith<UnifediApiPushSubscriptionAlerts>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPushSubscriptionAlertsCopyWith<$Res> {
  factory $UnifediApiPushSubscriptionAlertsCopyWith(
          UnifediApiPushSubscriptionAlerts value,
          $Res Function(UnifediApiPushSubscriptionAlerts) then) =
      _$UnifediApiPushSubscriptionAlertsCopyWithImpl<$Res>;
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
      @JsonKey(name: 'unifedi:chat_mention')
          bool? chatMention,
      @HiveField(6)
      @JsonKey(name: 'unifedi:emoji_reaction')
          bool? emojiReaction});
}

/// @nodoc
class _$UnifediApiPushSubscriptionAlertsCopyWithImpl<$Res>
    implements $UnifediApiPushSubscriptionAlertsCopyWith<$Res> {
  _$UnifediApiPushSubscriptionAlertsCopyWithImpl(this._value, this._then);

  final UnifediApiPushSubscriptionAlerts _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPushSubscriptionAlerts) _then;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
    Object? chatMention = freezed,
    Object? emojiReaction = freezed,
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
      chatMention: chatMention == freezed
          ? _value.chatMention
          : chatMention // ignore: cast_nullable_to_non_nullable
              as bool?,
      emojiReaction: emojiReaction == freezed
          ? _value.emojiReaction
          : emojiReaction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiPushSubscribeRequestDataAlertsCopyWith<$Res>
    implements $UnifediApiPushSubscriptionAlertsCopyWith<$Res> {
  factory _$UnifediApiPushSubscribeRequestDataAlertsCopyWith(
          _UnifediApiPushSubscribeRequestDataAlerts value,
          $Res Function(_UnifediApiPushSubscribeRequestDataAlerts) then) =
      __$UnifediApiPushSubscribeRequestDataAlertsCopyWithImpl<$Res>;
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
      @JsonKey(name: 'unifedi:chat_mention')
          bool? chatMention,
      @HiveField(6)
      @JsonKey(name: 'unifedi:emoji_reaction')
          bool? emojiReaction});
}

/// @nodoc
class __$UnifediApiPushSubscribeRequestDataAlertsCopyWithImpl<$Res>
    extends _$UnifediApiPushSubscriptionAlertsCopyWithImpl<$Res>
    implements _$UnifediApiPushSubscribeRequestDataAlertsCopyWith<$Res> {
  __$UnifediApiPushSubscribeRequestDataAlertsCopyWithImpl(
      _UnifediApiPushSubscribeRequestDataAlerts _value,
      $Res Function(_UnifediApiPushSubscribeRequestDataAlerts) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiPushSubscribeRequestDataAlerts));

  @override
  _UnifediApiPushSubscribeRequestDataAlerts get _value =>
      super._value as _UnifediApiPushSubscribeRequestDataAlerts;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
    Object? chatMention = freezed,
    Object? emojiReaction = freezed,
  }) {
    return _then(_UnifediApiPushSubscribeRequestDataAlerts(
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
      chatMention: chatMention == freezed
          ? _value.chatMention
          : chatMention // ignore: cast_nullable_to_non_nullable
              as bool?,
      emojiReaction: emojiReaction == freezed
          ? _value.emojiReaction
          : emojiReaction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPushSubscribeRequestDataAlerts
    implements _UnifediApiPushSubscribeRequestDataAlerts {
  const _$_UnifediApiPushSubscribeRequestDataAlerts(
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
      @JsonKey(name: 'unifedi:chat_mention')
          required this.chatMention,
      @HiveField(6)
      @JsonKey(name: 'unifedi:emoji_reaction')
          required this.emojiReaction});

  factory _$_UnifediApiPushSubscribeRequestDataAlerts.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPushSubscribeRequestDataAlertsFromJson(json);

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
  @JsonKey(name: 'unifedi:chat_mention')
  final bool? chatMention;
  @override
  @HiveField(6)
  @JsonKey(name: 'unifedi:emoji_reaction')
  final bool? emojiReaction;

  @override
  String toString() {
    return 'UnifediApiPushSubscriptionAlerts(favourite: $favourite, follow: $follow, mention: $mention, reblog: $reblog, poll: $poll, chatMention: $chatMention, emojiReaction: $emojiReaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPushSubscribeRequestDataAlerts &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.mention, mention) || other.mention == mention) &&
            (identical(other.reblog, reblog) || other.reblog == reblog) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.chatMention, chatMention) ||
                other.chatMention == chatMention) &&
            (identical(other.emojiReaction, emojiReaction) ||
                other.emojiReaction == emojiReaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favourite, follow, mention,
      reblog, poll, chatMention, emojiReaction);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPushSubscribeRequestDataAlertsCopyWith<
          _UnifediApiPushSubscribeRequestDataAlerts>
      get copyWith => __$UnifediApiPushSubscribeRequestDataAlertsCopyWithImpl<
          _UnifediApiPushSubscribeRequestDataAlerts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPushSubscribeRequestDataAlertsToJson(this);
  }
}

abstract class _UnifediApiPushSubscribeRequestDataAlerts
    implements UnifediApiPushSubscriptionAlerts {
  const factory _UnifediApiPushSubscribeRequestDataAlerts(
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
          @JsonKey(name: 'unifedi:chat_mention')
              required bool? chatMention,
          @HiveField(6)
          @JsonKey(name: 'unifedi:emoji_reaction')
              required bool? emojiReaction}) =
      _$_UnifediApiPushSubscribeRequestDataAlerts;

  factory _UnifediApiPushSubscribeRequestDataAlerts.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPushSubscribeRequestDataAlerts.fromJson;

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
  @HiveField(5)
  @JsonKey(name: 'unifedi:chat_mention')
  bool? get chatMention;
  @override
  @HiveField(6)
  @JsonKey(name: 'unifedi:emoji_reaction')
  bool? get emojiReaction;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPushSubscribeRequestDataAlertsCopyWith<
          _UnifediApiPushSubscribeRequestDataAlerts>
      get copyWith => throw _privateConstructorUsedError;
}
