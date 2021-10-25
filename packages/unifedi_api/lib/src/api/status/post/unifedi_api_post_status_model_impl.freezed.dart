// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostStatus _$UnifediApiPostStatusFromJson(Map<String, dynamic> json) {
  return _UnifediApiPostStatus.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostStatusTearOff {
  const _$UnifediApiPostStatusTearOff();

  _UnifediApiPostStatus call(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          required String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
          required String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
          required String? inReplyToId,
      @HiveField(4)
          required String? language,
      @HiveField(5)
          required String visibility,
      @HiveField(6)
      @JsonKey(name: 'media_ids')
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
          required List<String>? to}) {
    return _UnifediApiPostStatus(
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
    );
  }

  UnifediApiPostStatus fromJson(Map<String, Object> json) {
    return UnifediApiPostStatus.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostStatus = _$UnifediApiPostStatusTearOff();

/// @nodoc
mixin _$UnifediApiPostStatus {
  @HiveField(0)
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  int? get expiresInSeconds => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
  String? get inReplyToId => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(5)
  String get visibility => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'media_ids')
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostStatusCopyWith<UnifediApiPostStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostStatusCopyWith<$Res> {
  factory $UnifediApiPostStatusCopyWith(UnifediApiPostStatus value,
          $Res Function(UnifediApiPostStatus) then) =
      _$UnifediApiPostStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
          String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
          String? inReplyToId,
      @HiveField(4)
          String? language,
      @HiveField(5)
          String visibility,
      @HiveField(6)
      @JsonKey(name: 'media_ids')
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
          List<String>? to});

  $UnifediApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$UnifediApiPostStatusCopyWithImpl<$Res>
    implements $UnifediApiPostStatusCopyWith<$Res> {
  _$UnifediApiPostStatusCopyWithImpl(this._value, this._then);

  final UnifediApiPostStatus _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostStatus) _then;

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
abstract class _$UnifediApiPostStatusCopyWith<$Res>
    implements $UnifediApiPostStatusCopyWith<$Res> {
  factory _$UnifediApiPostStatusCopyWith(_UnifediApiPostStatus value,
          $Res Function(_UnifediApiPostStatus) then) =
      __$UnifediApiPostStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
          String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
          String? inReplyToId,
      @HiveField(4)
          String? language,
      @HiveField(5)
          String visibility,
      @HiveField(6)
      @JsonKey(name: 'media_ids')
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
          List<String>? to});

  @override
  $UnifediApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$UnifediApiPostStatusCopyWithImpl<$Res>
    extends _$UnifediApiPostStatusCopyWithImpl<$Res>
    implements _$UnifediApiPostStatusCopyWith<$Res> {
  __$UnifediApiPostStatusCopyWithImpl(
      _UnifediApiPostStatus _value, $Res Function(_UnifediApiPostStatus) _then)
      : super(_value, (v) => _then(v as _UnifediApiPostStatus));

  @override
  _UnifediApiPostStatus get _value => super._value as _UnifediApiPostStatus;

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
  }) {
    return _then(_UnifediApiPostStatus(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostStatus implements _UnifediApiPostStatus {
  const _$_UnifediApiPostStatus(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          required this.contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required this.expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
          required this.inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
          required this.inReplyToId,
      @HiveField(4)
          required this.language,
      @HiveField(5)
          required this.visibility,
      @HiveField(6)
      @JsonKey(name: 'media_ids')
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
          required this.to});

  factory _$_UnifediApiPostStatus.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPostStatusFromJson(json);

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
  @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
  final String? inReplyToConversationId;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
  final String? inReplyToId;
  @override
  @HiveField(4)
  final String? language;
  @override
  @HiveField(5)
  final String visibility;
  @override
  @HiveField(6)
  @JsonKey(name: 'media_ids')
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
  String toString() {
    return 'UnifediApiPostStatus(contentType: $contentType, expiresInSeconds: $expiresInSeconds, inReplyToConversationId: $inReplyToConversationId, inReplyToId: $inReplyToId, language: $language, visibility: $visibility, mediaIds: $mediaIds, poll: $poll, preview: $preview, sensitive: $sensitive, spoilerText: $spoilerText, status: $status, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPostStatus &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.expiresInSeconds, expiresInSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.expiresInSeconds, expiresInSeconds)) &&
            (identical(
                    other.inReplyToConversationId, inReplyToConversationId) ||
                const DeepCollectionEquality().equals(
                    other.inReplyToConversationId, inReplyToConversationId)) &&
            (identical(other.inReplyToId, inReplyToId) ||
                const DeepCollectionEquality()
                    .equals(other.inReplyToId, inReplyToId)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.mediaIds, mediaIds) ||
                const DeepCollectionEquality()
                    .equals(other.mediaIds, mediaIds)) &&
            (identical(other.poll, poll) ||
                const DeepCollectionEquality().equals(other.poll, poll)) &&
            (identical(other.preview, preview) ||
                const DeepCollectionEquality()
                    .equals(other.preview, preview)) &&
            (identical(other.sensitive, sensitive) ||
                const DeepCollectionEquality()
                    .equals(other.sensitive, sensitive)) &&
            (identical(other.spoilerText, spoilerText) ||
                const DeepCollectionEquality()
                    .equals(other.spoilerText, spoilerText)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(expiresInSeconds) ^
      const DeepCollectionEquality().hash(inReplyToConversationId) ^
      const DeepCollectionEquality().hash(inReplyToId) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(mediaIds) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(preview) ^
      const DeepCollectionEquality().hash(sensitive) ^
      const DeepCollectionEquality().hash(spoilerText) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(to);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostStatusCopyWith<_UnifediApiPostStatus> get copyWith =>
      __$UnifediApiPostStatusCopyWithImpl<_UnifediApiPostStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostStatusToJson(this);
  }
}

abstract class _UnifediApiPostStatus implements UnifediApiPostStatus {
  const factory _UnifediApiPostStatus(
      {@HiveField(0)
      @JsonKey(name: 'content_type')
          required String? contentType,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required int? expiresInSeconds,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
          required String? inReplyToConversationId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
          required String? inReplyToId,
      @HiveField(4)
          required String? language,
      @HiveField(5)
          required String visibility,
      @HiveField(6)
      @JsonKey(name: 'media_ids')
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
          required List<String>? to}) = _$_UnifediApiPostStatus;

  factory _UnifediApiPostStatus.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPostStatus.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  int? get expiresInSeconds => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_conversation_id', includeIfNull: false)
  String? get inReplyToConversationId => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
  String? get inReplyToId => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get language => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get visibility => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  @JsonKey(name: 'media_ids')
  List<String>? get mediaIds => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  UnifediApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  bool? get preview => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  bool get sensitive => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  String? get status => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  List<String>? get to => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostStatusCopyWith<_UnifediApiPostStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
