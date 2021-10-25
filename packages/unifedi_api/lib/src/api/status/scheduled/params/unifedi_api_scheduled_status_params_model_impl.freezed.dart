// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_scheduled_status_params_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiScheduledStatusParams _$UnifediApiScheduledStatusParamsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiScheduledStatusParams.fromJson(json);
}

/// @nodoc
class _$UnifediApiScheduledStatusParamsTearOff {
  const _$UnifediApiScheduledStatusParamsTearOff();

  _UnifediApiScheduledStatusParams call(
      {@JsonKey(name: 'expires_in')
      @HiveField(0)
          required int? expiresInSeconds,
      @HiveField(1)
          required String? text,
      @JsonKey(name: 'media_ids')
      @HiveField(2)
          required List<String>? mediaIds,
      @HiveField(3)
          required bool sensitive,
      @JsonKey(name: 'spoiler_text')
      @HiveField(4)
          required String? spoilerText,
      @HiveField(5)
          required String visibility,
      @HiveField(6)
          required String? language,
      @JsonKey(name: 'scheduled_at')
      @HiveField(7)
          required DateTime scheduledAt,
      @HiveField(8)
          required UnifediApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          required String? inReplyToId,
      @JsonKey(name: 'in_reply_to_conversation_id')
      @HiveField(12)
          required String? inReplyToConversationId,
      @JsonKey(name: 'to')
      @HiveField(13)
          required List<String>? to}) {
    return _UnifediApiScheduledStatusParams(
      expiresInSeconds: expiresInSeconds,
      text: text,
      mediaIds: mediaIds,
      sensitive: sensitive,
      spoilerText: spoilerText,
      visibility: visibility,
      language: language,
      scheduledAt: scheduledAt,
      poll: poll,
      inReplyToId: inReplyToId,
      inReplyToConversationId: inReplyToConversationId,
      to: to,
    );
  }

  UnifediApiScheduledStatusParams fromJson(Map<String, Object> json) {
    return UnifediApiScheduledStatusParams.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiScheduledStatusParams =
    _$UnifediApiScheduledStatusParamsTearOff();

/// @nodoc
mixin _$UnifediApiScheduledStatusParams {
  @JsonKey(name: 'expires_in')
  @HiveField(0)
  int? get expiresInSeconds => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_ids')
  @HiveField(2)
  List<String>? get mediaIds => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get sensitive => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoiler_text')
  @HiveField(4)
  String? get spoilerText => throw _privateConstructorUsedError;
  @HiveField(5)
  String get visibility => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at')
  @HiveField(7)
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  @HiveField(8)
  UnifediApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_reply_to_id')
  @HiveField(10)
  String? get inReplyToId => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_reply_to_conversation_id')
  @HiveField(12)
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'to')
  @HiveField(13)
  List<String>? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiScheduledStatusParamsCopyWith<UnifediApiScheduledStatusParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiScheduledStatusParamsCopyWith<$Res> {
  factory $UnifediApiScheduledStatusParamsCopyWith(
          UnifediApiScheduledStatusParams value,
          $Res Function(UnifediApiScheduledStatusParams) then) =
      _$UnifediApiScheduledStatusParamsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'expires_in')
      @HiveField(0)
          int? expiresInSeconds,
      @HiveField(1)
          String? text,
      @JsonKey(name: 'media_ids')
      @HiveField(2)
          List<String>? mediaIds,
      @HiveField(3)
          bool sensitive,
      @JsonKey(name: 'spoiler_text')
      @HiveField(4)
          String? spoilerText,
      @HiveField(5)
          String visibility,
      @HiveField(6)
          String? language,
      @JsonKey(name: 'scheduled_at')
      @HiveField(7)
          DateTime scheduledAt,
      @HiveField(8)
          UnifediApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          String? inReplyToId,
      @JsonKey(name: 'in_reply_to_conversation_id')
      @HiveField(12)
          String? inReplyToConversationId,
      @JsonKey(name: 'to')
      @HiveField(13)
          List<String>? to});

  $UnifediApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$UnifediApiScheduledStatusParamsCopyWithImpl<$Res>
    implements $UnifediApiScheduledStatusParamsCopyWith<$Res> {
  _$UnifediApiScheduledStatusParamsCopyWithImpl(this._value, this._then);

  final UnifediApiScheduledStatusParams _value;
  // ignore: unused_field
  final $Res Function(UnifediApiScheduledStatusParams) _then;

  @override
  $Res call({
    Object? expiresInSeconds = freezed,
    Object? text = freezed,
    Object? mediaIds = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? visibility = freezed,
    Object? language = freezed,
    Object? scheduledAt = freezed,
    Object? poll = freezed,
    Object? inReplyToId = freezed,
    Object? inReplyToConversationId = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaIds: mediaIds == freezed
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as UnifediApiPostStatusPoll?,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      inReplyToConversationId: inReplyToConversationId == freezed
          ? _value.inReplyToConversationId
          : inReplyToConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  @override
  $UnifediApiPostStatusPollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $UnifediApiPostStatusPollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiScheduledStatusParamsCopyWith<$Res>
    implements $UnifediApiScheduledStatusParamsCopyWith<$Res> {
  factory _$UnifediApiScheduledStatusParamsCopyWith(
          _UnifediApiScheduledStatusParams value,
          $Res Function(_UnifediApiScheduledStatusParams) then) =
      __$UnifediApiScheduledStatusParamsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'expires_in')
      @HiveField(0)
          int? expiresInSeconds,
      @HiveField(1)
          String? text,
      @JsonKey(name: 'media_ids')
      @HiveField(2)
          List<String>? mediaIds,
      @HiveField(3)
          bool sensitive,
      @JsonKey(name: 'spoiler_text')
      @HiveField(4)
          String? spoilerText,
      @HiveField(5)
          String visibility,
      @HiveField(6)
          String? language,
      @JsonKey(name: 'scheduled_at')
      @HiveField(7)
          DateTime scheduledAt,
      @HiveField(8)
          UnifediApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          String? inReplyToId,
      @JsonKey(name: 'in_reply_to_conversation_id')
      @HiveField(12)
          String? inReplyToConversationId,
      @JsonKey(name: 'to')
      @HiveField(13)
          List<String>? to});

  @override
  $UnifediApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$UnifediApiScheduledStatusParamsCopyWithImpl<$Res>
    extends _$UnifediApiScheduledStatusParamsCopyWithImpl<$Res>
    implements _$UnifediApiScheduledStatusParamsCopyWith<$Res> {
  __$UnifediApiScheduledStatusParamsCopyWithImpl(
      _UnifediApiScheduledStatusParams _value,
      $Res Function(_UnifediApiScheduledStatusParams) _then)
      : super(_value, (v) => _then(v as _UnifediApiScheduledStatusParams));

  @override
  _UnifediApiScheduledStatusParams get _value =>
      super._value as _UnifediApiScheduledStatusParams;

  @override
  $Res call({
    Object? expiresInSeconds = freezed,
    Object? text = freezed,
    Object? mediaIds = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? visibility = freezed,
    Object? language = freezed,
    Object? scheduledAt = freezed,
    Object? poll = freezed,
    Object? inReplyToId = freezed,
    Object? inReplyToConversationId = freezed,
    Object? to = freezed,
  }) {
    return _then(_UnifediApiScheduledStatusParams(
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaIds: mediaIds == freezed
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as UnifediApiPostStatusPoll?,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      inReplyToConversationId: inReplyToConversationId == freezed
          ? _value.inReplyToConversationId
          : inReplyToConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiScheduledStatusParams
    implements _UnifediApiScheduledStatusParams {
  const _$_UnifediApiScheduledStatusParams(
      {@JsonKey(name: 'expires_in')
      @HiveField(0)
          required this.expiresInSeconds,
      @HiveField(1)
          required this.text,
      @JsonKey(name: 'media_ids')
      @HiveField(2)
          required this.mediaIds,
      @HiveField(3)
          required this.sensitive,
      @JsonKey(name: 'spoiler_text')
      @HiveField(4)
          required this.spoilerText,
      @HiveField(5)
          required this.visibility,
      @HiveField(6)
          required this.language,
      @JsonKey(name: 'scheduled_at')
      @HiveField(7)
          required this.scheduledAt,
      @HiveField(8)
          required this.poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          required this.inReplyToId,
      @JsonKey(name: 'in_reply_to_conversation_id')
      @HiveField(12)
          required this.inReplyToConversationId,
      @JsonKey(name: 'to')
      @HiveField(13)
          required this.to});

  factory _$_UnifediApiScheduledStatusParams.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiScheduledStatusParamsFromJson(json);

  @override
  @JsonKey(name: 'expires_in')
  @HiveField(0)
  final int? expiresInSeconds;
  @override
  @HiveField(1)
  final String? text;
  @override
  @JsonKey(name: 'media_ids')
  @HiveField(2)
  final List<String>? mediaIds;
  @override
  @HiveField(3)
  final bool sensitive;
  @override
  @JsonKey(name: 'spoiler_text')
  @HiveField(4)
  final String? spoilerText;
  @override
  @HiveField(5)
  final String visibility;
  @override
  @HiveField(6)
  final String? language;
  @override
  @JsonKey(name: 'scheduled_at')
  @HiveField(7)
  final DateTime scheduledAt;
  @override
  @HiveField(8)
  final UnifediApiPostStatusPoll? poll;
  @override
  @JsonKey(name: 'in_reply_to_id')
  @HiveField(10)
  final String? inReplyToId;
  @override
  @JsonKey(name: 'in_reply_to_conversation_id')
  @HiveField(12)
  final String? inReplyToConversationId;
  @override
  @JsonKey(name: 'to')
  @HiveField(13)
  final List<String>? to;

  @override
  String toString() {
    return 'UnifediApiScheduledStatusParams(expiresInSeconds: $expiresInSeconds, text: $text, mediaIds: $mediaIds, sensitive: $sensitive, spoilerText: $spoilerText, visibility: $visibility, language: $language, scheduledAt: $scheduledAt, poll: $poll, inReplyToId: $inReplyToId, inReplyToConversationId: $inReplyToConversationId, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiScheduledStatusParams &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.expiresInSeconds, expiresInSeconds)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.mediaIds, mediaIds) ||
                const DeepCollectionEquality()
                    .equals(other.mediaIds, mediaIds)) &&
            (identical(other.sensitive, sensitive) ||
                const DeepCollectionEquality()
                    .equals(other.sensitive, sensitive)) &&
            (identical(other.spoilerText, spoilerText) ||
                const DeepCollectionEquality()
                    .equals(other.spoilerText, spoilerText)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.scheduledAt, scheduledAt) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledAt, scheduledAt)) &&
            (identical(other.poll, poll) ||
                const DeepCollectionEquality().equals(other.poll, poll)) &&
            (identical(other.inReplyToId, inReplyToId) ||
                const DeepCollectionEquality()
                    .equals(other.inReplyToId, inReplyToId)) &&
            (identical(
                    other.inReplyToConversationId, inReplyToConversationId) ||
                const DeepCollectionEquality().equals(
                    other.inReplyToConversationId, inReplyToConversationId)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(expiresInSeconds) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(mediaIds) ^
      const DeepCollectionEquality().hash(sensitive) ^
      const DeepCollectionEquality().hash(spoilerText) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(scheduledAt) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(inReplyToId) ^
      const DeepCollectionEquality().hash(inReplyToConversationId) ^
      const DeepCollectionEquality().hash(to);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiScheduledStatusParamsCopyWith<_UnifediApiScheduledStatusParams>
      get copyWith => __$UnifediApiScheduledStatusParamsCopyWithImpl<
          _UnifediApiScheduledStatusParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiScheduledStatusParamsToJson(this);
  }
}

abstract class _UnifediApiScheduledStatusParams
    implements UnifediApiScheduledStatusParams {
  const factory _UnifediApiScheduledStatusParams(
      {@JsonKey(name: 'expires_in')
      @HiveField(0)
          required int? expiresInSeconds,
      @HiveField(1)
          required String? text,
      @JsonKey(name: 'media_ids')
      @HiveField(2)
          required List<String>? mediaIds,
      @HiveField(3)
          required bool sensitive,
      @JsonKey(name: 'spoiler_text')
      @HiveField(4)
          required String? spoilerText,
      @HiveField(5)
          required String visibility,
      @HiveField(6)
          required String? language,
      @JsonKey(name: 'scheduled_at')
      @HiveField(7)
          required DateTime scheduledAt,
      @HiveField(8)
          required UnifediApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          required String? inReplyToId,
      @JsonKey(name: 'in_reply_to_conversation_id')
      @HiveField(12)
          required String? inReplyToConversationId,
      @JsonKey(name: 'to')
      @HiveField(13)
          required List<String>? to}) = _$_UnifediApiScheduledStatusParams;

  factory _UnifediApiScheduledStatusParams.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiScheduledStatusParams.fromJson;

  @override
  @JsonKey(name: 'expires_in')
  @HiveField(0)
  int? get expiresInSeconds => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'media_ids')
  @HiveField(2)
  List<String>? get mediaIds => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool get sensitive => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'spoiler_text')
  @HiveField(4)
  String? get spoilerText => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get visibility => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String? get language => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'scheduled_at')
  @HiveField(7)
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  UnifediApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'in_reply_to_id')
  @HiveField(10)
  String? get inReplyToId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'in_reply_to_conversation_id')
  @HiveField(12)
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'to')
  @HiveField(13)
  List<String>? get to => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiScheduledStatusParamsCopyWith<_UnifediApiScheduledStatusParams>
      get copyWith => throw _privateConstructorUsedError;
}
