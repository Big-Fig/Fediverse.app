// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_schedule_post_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiSchedulePostStatus _$UnifediApiSchedulePostStatusFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiSchedulePostStatus.fromJson(json);
}

/// @nodoc
class _$UnifediApiSchedulePostStatusTearOff {
  const _$UnifediApiSchedulePostStatusTearOff();

  _UnifediApiSchedulePostStatus call(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          required String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id')
          required String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id')
          required String? inReplyToId,
      @HiveField(4)
          required String? language,
      @HiveField(5)
          required String visibility,
      @JsonKey(name: 'media_ids')
      @HiveField(6)
          required List<String>? mediaIds,
      @HiveField(7)
          required UnifediApiPostStatusPoll? poll,
      @HiveField(8)
          required bool? preview,
      @HiveField(9)
          required bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(11)
          required String? status,
      @HiveField(12)
          required List<String>? to,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          required DateTime scheduledAt}) {
    return _UnifediApiSchedulePostStatus(
      contentType: contentType,
      expiresInSeconds: expiresInSeconds,
      inReplyToConversationId: inReplyToConversationId,
      inReplyToId: inReplyToId,
      language: language,
      visibility: visibility,
      mediaIds: mediaIds,
      poll: poll,
      preview: preview,
      sensitive: sensitive,
      spoilerText: spoilerText,
      status: status,
      to: to,
      scheduledAt: scheduledAt,
    );
  }

  UnifediApiSchedulePostStatus fromJson(Map<String, Object?> json) {
    return UnifediApiSchedulePostStatus.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiSchedulePostStatus = _$UnifediApiSchedulePostStatusTearOff();

/// @nodoc
mixin _$UnifediApiSchedulePostStatus {
  @HiveField(0)
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  int? get expiresInSeconds => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_conversation_id')
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id')
  String? get inReplyToId => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(5)
  String get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_ids')
  @HiveField(6)
  List<String>? get mediaIds => throw _privateConstructorUsedError;
  @HiveField(7)
  UnifediApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @HiveField(8)
  bool? get preview => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get sensitive => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get status => throw _privateConstructorUsedError;
  @HiveField(12)
  List<String>? get to => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString)
  @HiveField(13)
  DateTime get scheduledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiSchedulePostStatusCopyWith<UnifediApiSchedulePostStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiSchedulePostStatusCopyWith<$Res> {
  factory $UnifediApiSchedulePostStatusCopyWith(
          UnifediApiSchedulePostStatus value,
          $Res Function(UnifediApiSchedulePostStatus) then) =
      _$UnifediApiSchedulePostStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id')
          String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id')
          String? inReplyToId,
      @HiveField(4)
          String? language,
      @HiveField(5)
          String visibility,
      @JsonKey(name: 'media_ids')
      @HiveField(6)
          List<String>? mediaIds,
      @HiveField(7)
          UnifediApiPostStatusPoll? poll,
      @HiveField(8)
          bool? preview,
      @HiveField(9)
          bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(11)
          String? status,
      @HiveField(12)
          List<String>? to,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          DateTime scheduledAt});

  $UnifediApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$UnifediApiSchedulePostStatusCopyWithImpl<$Res>
    implements $UnifediApiSchedulePostStatusCopyWith<$Res> {
  _$UnifediApiSchedulePostStatusCopyWithImpl(this._value, this._then);

  final UnifediApiSchedulePostStatus _value;
  // ignore: unused_field
  final $Res Function(UnifediApiSchedulePostStatus) _then;

  @override
  $Res call({
    Object? contentType = freezed,
    Object? expiresInSeconds = freezed,
    Object? inReplyToConversationId = freezed,
    Object? inReplyToId = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
    Object? mediaIds = freezed,
    Object? poll = freezed,
    Object? preview = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? status = freezed,
    Object? to = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_value.copyWith(
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      inReplyToConversationId: inReplyToConversationId == freezed
          ? _value.inReplyToConversationId
          : inReplyToConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      mediaIds: mediaIds == freezed
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as UnifediApiPostStatusPoll?,
      preview: preview == freezed
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as bool?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$UnifediApiSchedulePostStatusCopyWith<$Res>
    implements $UnifediApiSchedulePostStatusCopyWith<$Res> {
  factory _$UnifediApiSchedulePostStatusCopyWith(
          _UnifediApiSchedulePostStatus value,
          $Res Function(_UnifediApiSchedulePostStatus) then) =
      __$UnifediApiSchedulePostStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id')
          String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id')
          String? inReplyToId,
      @HiveField(4)
          String? language,
      @HiveField(5)
          String visibility,
      @JsonKey(name: 'media_ids')
      @HiveField(6)
          List<String>? mediaIds,
      @HiveField(7)
          UnifediApiPostStatusPoll? poll,
      @HiveField(8)
          bool? preview,
      @HiveField(9)
          bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(11)
          String? status,
      @HiveField(12)
          List<String>? to,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          DateTime scheduledAt});

  @override
  $UnifediApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$UnifediApiSchedulePostStatusCopyWithImpl<$Res>
    extends _$UnifediApiSchedulePostStatusCopyWithImpl<$Res>
    implements _$UnifediApiSchedulePostStatusCopyWith<$Res> {
  __$UnifediApiSchedulePostStatusCopyWithImpl(
      _UnifediApiSchedulePostStatus _value,
      $Res Function(_UnifediApiSchedulePostStatus) _then)
      : super(_value, (v) => _then(v as _UnifediApiSchedulePostStatus));

  @override
  _UnifediApiSchedulePostStatus get _value =>
      super._value as _UnifediApiSchedulePostStatus;

  @override
  $Res call({
    Object? contentType = freezed,
    Object? expiresInSeconds = freezed,
    Object? inReplyToConversationId = freezed,
    Object? inReplyToId = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
    Object? mediaIds = freezed,
    Object? poll = freezed,
    Object? preview = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? status = freezed,
    Object? to = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_UnifediApiSchedulePostStatus(
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      inReplyToConversationId: inReplyToConversationId == freezed
          ? _value.inReplyToConversationId
          : inReplyToConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
      mediaIds: mediaIds == freezed
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as UnifediApiPostStatusPoll?,
      preview: preview == freezed
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as bool?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiSchedulePostStatus implements _UnifediApiSchedulePostStatus {
  const _$_UnifediApiSchedulePostStatus(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          required this.contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required this.expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id')
          required this.inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id')
          required this.inReplyToId,
      @HiveField(4)
          required this.language,
      @HiveField(5)
          required this.visibility,
      @JsonKey(name: 'media_ids')
      @HiveField(6)
          required this.mediaIds,
      @HiveField(7)
          required this.poll,
      @HiveField(8)
          required this.preview,
      @HiveField(9)
          required this.sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required this.spoilerText,
      @HiveField(11)
          required this.status,
      @HiveField(12)
          required this.to,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          required this.scheduledAt});

  factory _$_UnifediApiSchedulePostStatus.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiSchedulePostStatusFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'content_type')
  final String? contentType;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  final int? expiresInSeconds;
  @override
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_conversation_id')
  final String? inReplyToConversationId;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id')
  final String? inReplyToId;
  @override
  @HiveField(4)
  final String? language;
  @override
  @HiveField(5)
  final String visibility;
  @override
  @JsonKey(name: 'media_ids')
  @HiveField(6)
  final List<String>? mediaIds;
  @override
  @HiveField(7)
  final UnifediApiPostStatusPoll? poll;
  @override
  @HiveField(8)
  final bool? preview;
  @override
  @HiveField(9)
  final bool sensitive;
  @override
  @HiveField(10)
  @JsonKey(name: 'spoiler_text')
  final String? spoilerText;
  @override
  @HiveField(11)
  final String? status;
  @override
  @HiveField(12)
  final List<String>? to;
  @override
  @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString)
  @HiveField(13)
  final DateTime scheduledAt;

  @override
  String toString() {
    return 'UnifediApiSchedulePostStatus(contentType: $contentType, expiresInSeconds: $expiresInSeconds, inReplyToConversationId: $inReplyToConversationId, inReplyToId: $inReplyToId, language: $language, visibility: $visibility, mediaIds: $mediaIds, poll: $poll, preview: $preview, sensitive: $sensitive, spoilerText: $spoilerText, status: $status, to: $to, scheduledAt: $scheduledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiSchedulePostStatus &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                other.expiresInSeconds == expiresInSeconds) &&
            (identical(
                    other.inReplyToConversationId, inReplyToConversationId) ||
                other.inReplyToConversationId == inReplyToConversationId) &&
            (identical(other.inReplyToId, inReplyToId) ||
                other.inReplyToId == inReplyToId) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other.mediaIds, mediaIds) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.spoilerText, spoilerText) ||
                other.spoilerText == spoilerText) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      contentType,
      expiresInSeconds,
      inReplyToConversationId,
      inReplyToId,
      language,
      visibility,
      const DeepCollectionEquality().hash(mediaIds),
      poll,
      preview,
      sensitive,
      spoilerText,
      status,
      const DeepCollectionEquality().hash(to),
      scheduledAt);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiSchedulePostStatusCopyWith<_UnifediApiSchedulePostStatus>
      get copyWith => __$UnifediApiSchedulePostStatusCopyWithImpl<
          _UnifediApiSchedulePostStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiSchedulePostStatusToJson(this);
  }
}

abstract class _UnifediApiSchedulePostStatus
    implements UnifediApiSchedulePostStatus {
  const factory _UnifediApiSchedulePostStatus(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          required String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id')
          required String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id')
          required String? inReplyToId,
      @HiveField(4)
          required String? language,
      @HiveField(5)
          required String visibility,
      @JsonKey(name: 'media_ids')
      @HiveField(6)
          required List<String>? mediaIds,
      @HiveField(7)
          required UnifediApiPostStatusPoll? poll,
      @HiveField(8)
          required bool? preview,
      @HiveField(9)
          required bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(11)
          required String? status,
      @HiveField(12)
          required List<String>? to,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          required DateTime scheduledAt}) = _$_UnifediApiSchedulePostStatus;

  factory _UnifediApiSchedulePostStatus.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiSchedulePostStatus.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'content_type')
  String? get contentType;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  int? get expiresInSeconds;
  @override
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_conversation_id')
  String? get inReplyToConversationId;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id')
  String? get inReplyToId;
  @override
  @HiveField(4)
  String? get language;
  @override
  @HiveField(5)
  String get visibility;
  @override
  @JsonKey(name: 'media_ids')
  @HiveField(6)
  List<String>? get mediaIds;
  @override
  @HiveField(7)
  UnifediApiPostStatusPoll? get poll;
  @override
  @HiveField(8)
  bool? get preview;
  @override
  @HiveField(9)
  bool get sensitive;
  @override
  @HiveField(10)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText;
  @override
  @HiveField(11)
  String? get status;
  @override
  @HiveField(12)
  List<String>? get to;
  @override
  @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString)
  @HiveField(13)
  DateTime get scheduledAt;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiSchedulePostStatusCopyWith<_UnifediApiSchedulePostStatus>
      get copyWith => throw _privateConstructorUsedError;
}
