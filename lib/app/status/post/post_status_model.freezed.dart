// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostStatusData _$PostStatusDataFromJson(Map<String, dynamic> json) {
  return _PostStatusData.fromJson(json);
}

/// @nodoc
class _$PostStatusDataTearOff {
  const _$PostStatusDataTearOff();

  _PostStatusData call(
      {required String? subject,
      required String? text,
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @JsonKey(name: 'visibility')
          required String visibilityString,
      required List<String>? to,
      @JsonKey(name: 'media_attachments')
          required List<UnifediApiMediaAttachment>? mediaAttachments,
      required PostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_status')
          required UnifediApiStatus? inReplyToUnifediApiStatus,
      @JsonKey(name: 'in_reply_to_conversation_id')
          required String? inReplyToConversationId,
      @JsonKey(name: 'is_nsfw_sensitive_enabled')
          required bool isNsfwSensitiveEnabled,
      required String? language,
      @JsonKey(name: 'expires_in_seconds')
          required int? expiresInSeconds}) {
    return _PostStatusData(
      subject: subject,
      text: text,
      scheduledAt: scheduledAt,
      visibilityString: visibilityString,
      to: to,
      mediaAttachments: mediaAttachments,
      poll: poll,
      inReplyToUnifediApiStatus: inReplyToUnifediApiStatus,
      inReplyToConversationId: inReplyToConversationId,
      isNsfwSensitiveEnabled: isNsfwSensitiveEnabled,
      language: language,
      expiresInSeconds: expiresInSeconds,
    );
  }

  PostStatusData fromJson(Map<String, Object> json) {
    return PostStatusData.fromJson(json);
  }
}

/// @nodoc
const $PostStatusData = _$PostStatusDataTearOff();

/// @nodoc
mixin _$PostStatusData {
  String? get subject => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'visibility')
  String get visibilityString => throw _privateConstructorUsedError;
  List<String>? get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_attachments')
  List<UnifediApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  PostStatusPoll? get poll => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_reply_to_status')
  UnifediApiStatus? get inReplyToUnifediApiStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'in_reply_to_conversation_id')
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_nsfw_sensitive_enabled')
  bool get isNsfwSensitiveEnabled => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in_seconds')
  int? get expiresInSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostStatusDataCopyWith<PostStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStatusDataCopyWith<$Res> {
  factory $PostStatusDataCopyWith(
          PostStatusData value, $Res Function(PostStatusData) then) =
      _$PostStatusDataCopyWithImpl<$Res>;
  $Res call(
      {String? subject,
      String? text,
      @JsonKey(name: 'scheduled_at')
          DateTime? scheduledAt,
      @JsonKey(name: 'visibility')
          String visibilityString,
      List<String>? to,
      @JsonKey(name: 'media_attachments')
          List<UnifediApiMediaAttachment>? mediaAttachments,
      PostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_status')
          UnifediApiStatus? inReplyToUnifediApiStatus,
      @JsonKey(name: 'in_reply_to_conversation_id')
          String? inReplyToConversationId,
      @JsonKey(name: 'is_nsfw_sensitive_enabled')
          bool isNsfwSensitiveEnabled,
      String? language,
      @JsonKey(name: 'expires_in_seconds')
          int? expiresInSeconds});

  $PostStatusPollCopyWith<$Res>? get poll;
  $UnifediApiStatusCopyWith<$Res>? get inReplyToUnifediApiStatus;
}

/// @nodoc
class _$PostStatusDataCopyWithImpl<$Res>
    implements $PostStatusDataCopyWith<$Res> {
  _$PostStatusDataCopyWithImpl(this._value, this._then);

  final PostStatusData _value;
  // ignore: unused_field
  final $Res Function(PostStatusData) _then;

  @override
  $Res call({
    Object? subject = freezed,
    Object? text = freezed,
    Object? scheduledAt = freezed,
    Object? visibilityString = freezed,
    Object? to = freezed,
    Object? mediaAttachments = freezed,
    Object? poll = freezed,
    Object? inReplyToUnifediApiStatus = freezed,
    Object? inReplyToConversationId = freezed,
    Object? isNsfwSensitiveEnabled = freezed,
    Object? language = freezed,
    Object? expiresInSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibilityString: visibilityString == freezed
          ? _value.visibilityString
          : visibilityString // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiMediaAttachment>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PostStatusPoll?,
      inReplyToUnifediApiStatus: inReplyToUnifediApiStatus == freezed
          ? _value.inReplyToUnifediApiStatus
          : inReplyToUnifediApiStatus // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      inReplyToConversationId: inReplyToConversationId == freezed
          ? _value.inReplyToConversationId
          : inReplyToConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNsfwSensitiveEnabled: isNsfwSensitiveEnabled == freezed
          ? _value.isNsfwSensitiveEnabled
          : isNsfwSensitiveEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $PostStatusPollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PostStatusPollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value));
    });
  }

  @override
  $UnifediApiStatusCopyWith<$Res>? get inReplyToUnifediApiStatus {
    if (_value.inReplyToUnifediApiStatus == null) {
      return null;
    }

    return $UnifediApiStatusCopyWith<$Res>(_value.inReplyToUnifediApiStatus!,
        (value) {
      return _then(_value.copyWith(inReplyToUnifediApiStatus: value));
    });
  }
}

/// @nodoc
abstract class _$PostStatusDataCopyWith<$Res>
    implements $PostStatusDataCopyWith<$Res> {
  factory _$PostStatusDataCopyWith(
          _PostStatusData value, $Res Function(_PostStatusData) then) =
      __$PostStatusDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? subject,
      String? text,
      @JsonKey(name: 'scheduled_at')
          DateTime? scheduledAt,
      @JsonKey(name: 'visibility')
          String visibilityString,
      List<String>? to,
      @JsonKey(name: 'media_attachments')
          List<UnifediApiMediaAttachment>? mediaAttachments,
      PostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_status')
          UnifediApiStatus? inReplyToUnifediApiStatus,
      @JsonKey(name: 'in_reply_to_conversation_id')
          String? inReplyToConversationId,
      @JsonKey(name: 'is_nsfw_sensitive_enabled')
          bool isNsfwSensitiveEnabled,
      String? language,
      @JsonKey(name: 'expires_in_seconds')
          int? expiresInSeconds});

  @override
  $PostStatusPollCopyWith<$Res>? get poll;
  @override
  $UnifediApiStatusCopyWith<$Res>? get inReplyToUnifediApiStatus;
}

/// @nodoc
class __$PostStatusDataCopyWithImpl<$Res>
    extends _$PostStatusDataCopyWithImpl<$Res>
    implements _$PostStatusDataCopyWith<$Res> {
  __$PostStatusDataCopyWithImpl(
      _PostStatusData _value, $Res Function(_PostStatusData) _then)
      : super(_value, (v) => _then(v as _PostStatusData));

  @override
  _PostStatusData get _value => super._value as _PostStatusData;

  @override
  $Res call({
    Object? subject = freezed,
    Object? text = freezed,
    Object? scheduledAt = freezed,
    Object? visibilityString = freezed,
    Object? to = freezed,
    Object? mediaAttachments = freezed,
    Object? poll = freezed,
    Object? inReplyToUnifediApiStatus = freezed,
    Object? inReplyToConversationId = freezed,
    Object? isNsfwSensitiveEnabled = freezed,
    Object? language = freezed,
    Object? expiresInSeconds = freezed,
  }) {
    return _then(_PostStatusData(
      subject: subject == freezed
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibilityString: visibilityString == freezed
          ? _value.visibilityString
          : visibilityString // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiMediaAttachment>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PostStatusPoll?,
      inReplyToUnifediApiStatus: inReplyToUnifediApiStatus == freezed
          ? _value.inReplyToUnifediApiStatus
          : inReplyToUnifediApiStatus // ignore: cast_nullable_to_non_nullable
              as UnifediApiStatus?,
      inReplyToConversationId: inReplyToConversationId == freezed
          ? _value.inReplyToConversationId
          : inReplyToConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isNsfwSensitiveEnabled: isNsfwSensitiveEnabled == freezed
          ? _value.isNsfwSensitiveEnabled
          : isNsfwSensitiveEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresInSeconds: expiresInSeconds == freezed
          ? _value.expiresInSeconds
          : expiresInSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostStatusData extends _PostStatusData {
  const _$_PostStatusData(
      {required this.subject,
      required this.text,
      @JsonKey(name: 'scheduled_at')
          required this.scheduledAt,
      @JsonKey(name: 'visibility')
          required this.visibilityString,
      required this.to,
      @JsonKey(name: 'media_attachments')
          required this.mediaAttachments,
      required this.poll,
      @JsonKey(name: 'in_reply_to_status')
          required this.inReplyToUnifediApiStatus,
      @JsonKey(name: 'in_reply_to_conversation_id')
          required this.inReplyToConversationId,
      @JsonKey(name: 'is_nsfw_sensitive_enabled')
          required this.isNsfwSensitiveEnabled,
      required this.language,
      @JsonKey(name: 'expires_in_seconds')
          required this.expiresInSeconds})
      : super._();

  factory _$_PostStatusData.fromJson(Map<String, dynamic> json) =>
      _$$_PostStatusDataFromJson(json);

  @override
  final String? subject;
  @override
  final String? text;
  @override
  @JsonKey(name: 'scheduled_at')
  final DateTime? scheduledAt;
  @override
  @JsonKey(name: 'visibility')
  final String visibilityString;
  @override
  final List<String>? to;
  @override
  @JsonKey(name: 'media_attachments')
  final List<UnifediApiMediaAttachment>? mediaAttachments;
  @override
  final PostStatusPoll? poll;
  @override
  @JsonKey(name: 'in_reply_to_status')
  final UnifediApiStatus? inReplyToUnifediApiStatus;
  @override
  @JsonKey(name: 'in_reply_to_conversation_id')
  final String? inReplyToConversationId;
  @override
  @JsonKey(name: 'is_nsfw_sensitive_enabled')
  final bool isNsfwSensitiveEnabled;
  @override
  final String? language;
  @override
  @JsonKey(name: 'expires_in_seconds')
  final int? expiresInSeconds;

  @override
  String toString() {
    return 'PostStatusData(subject: $subject, text: $text, scheduledAt: $scheduledAt, visibilityString: $visibilityString, to: $to, mediaAttachments: $mediaAttachments, poll: $poll, inReplyToUnifediApiStatus: $inReplyToUnifediApiStatus, inReplyToConversationId: $inReplyToConversationId, isNsfwSensitiveEnabled: $isNsfwSensitiveEnabled, language: $language, expiresInSeconds: $expiresInSeconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostStatusData &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.scheduledAt, scheduledAt) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledAt, scheduledAt)) &&
            (identical(other.visibilityString, visibilityString) ||
                const DeepCollectionEquality()
                    .equals(other.visibilityString, visibilityString)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.mediaAttachments, mediaAttachments) ||
                const DeepCollectionEquality()
                    .equals(other.mediaAttachments, mediaAttachments)) &&
            (identical(other.poll, poll) ||
                const DeepCollectionEquality().equals(other.poll, poll)) &&
            (identical(other.inReplyToUnifediApiStatus,
                    inReplyToUnifediApiStatus) ||
                const DeepCollectionEquality().equals(
                    other.inReplyToUnifediApiStatus,
                    inReplyToUnifediApiStatus)) &&
            (identical(
                    other.inReplyToConversationId, inReplyToConversationId) ||
                const DeepCollectionEquality().equals(
                    other.inReplyToConversationId, inReplyToConversationId)) &&
            (identical(other.isNsfwSensitiveEnabled, isNsfwSensitiveEnabled) ||
                const DeepCollectionEquality().equals(
                    other.isNsfwSensitiveEnabled, isNsfwSensitiveEnabled)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.expiresInSeconds, expiresInSeconds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(scheduledAt) ^
      const DeepCollectionEquality().hash(visibilityString) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(mediaAttachments) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(inReplyToUnifediApiStatus) ^
      const DeepCollectionEquality().hash(inReplyToConversationId) ^
      const DeepCollectionEquality().hash(isNsfwSensitiveEnabled) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(expiresInSeconds);

  @JsonKey(ignore: true)
  @override
  _$PostStatusDataCopyWith<_PostStatusData> get copyWith =>
      __$PostStatusDataCopyWithImpl<_PostStatusData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostStatusDataToJson(this);
  }
}

abstract class _PostStatusData extends PostStatusData {
  const factory _PostStatusData(
      {required String? subject,
      required String? text,
      @JsonKey(name: 'scheduled_at')
          required DateTime? scheduledAt,
      @JsonKey(name: 'visibility')
          required String visibilityString,
      required List<String>? to,
      @JsonKey(name: 'media_attachments')
          required List<UnifediApiMediaAttachment>? mediaAttachments,
      required PostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_status')
          required UnifediApiStatus? inReplyToUnifediApiStatus,
      @JsonKey(name: 'in_reply_to_conversation_id')
          required String? inReplyToConversationId,
      @JsonKey(name: 'is_nsfw_sensitive_enabled')
          required bool isNsfwSensitiveEnabled,
      required String? language,
      @JsonKey(name: 'expires_in_seconds')
          required int? expiresInSeconds}) = _$_PostStatusData;
  const _PostStatusData._() : super._();

  factory _PostStatusData.fromJson(Map<String, dynamic> json) =
      _$_PostStatusData.fromJson;

  @override
  String? get subject => throw _privateConstructorUsedError;
  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'visibility')
  String get visibilityString => throw _privateConstructorUsedError;
  @override
  List<String>? get to => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'media_attachments')
  List<UnifediApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @override
  PostStatusPoll? get poll => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'in_reply_to_status')
  UnifediApiStatus? get inReplyToUnifediApiStatus =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'in_reply_to_conversation_id')
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'is_nsfw_sensitive_enabled')
  bool get isNsfwSensitiveEnabled => throw _privateConstructorUsedError;
  @override
  String? get language => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'expires_in_seconds')
  int? get expiresInSeconds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostStatusDataCopyWith<_PostStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}
