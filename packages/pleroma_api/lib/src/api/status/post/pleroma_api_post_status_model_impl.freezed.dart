// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_post_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPostStatus _$PleromaApiPostStatusFromJson(Map<String, dynamic> json) {
  return _PleromaApiPostStatus.fromJson(json);
}

/// @nodoc
class _$PleromaApiPostStatusTearOff {
  const _$PleromaApiPostStatusTearOff();

  _PleromaApiPostStatus call(
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
          required PleromaApiPostStatusPoll? poll,
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
    return _PleromaApiPostStatus(
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

  PleromaApiPostStatus fromJson(Map<String, Object> json) {
    return PleromaApiPostStatus.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPostStatus = _$PleromaApiPostStatusTearOff();

/// @nodoc
mixin _$PleromaApiPostStatus {
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
  PleromaApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
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
  $PleromaApiPostStatusCopyWith<PleromaApiPostStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPostStatusCopyWith<$Res> {
  factory $PleromaApiPostStatusCopyWith(PleromaApiPostStatus value,
          $Res Function(PleromaApiPostStatus) then) =
      _$PleromaApiPostStatusCopyWithImpl<$Res>;
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
          PleromaApiPostStatusPoll? poll,
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

  $PleromaApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$PleromaApiPostStatusCopyWithImpl<$Res>
    implements $PleromaApiPostStatusCopyWith<$Res> {
  _$PleromaApiPostStatusCopyWithImpl(this._value, this._then);

  final PleromaApiPostStatus _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPostStatus) _then;

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
              as PleromaApiPostStatusPoll?,
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
  $PleromaApiPostStatusPollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PleromaApiPostStatusPollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiPostStatusCopyWith<$Res>
    implements $PleromaApiPostStatusCopyWith<$Res> {
  factory _$PleromaApiPostStatusCopyWith(_PleromaApiPostStatus value,
          $Res Function(_PleromaApiPostStatus) then) =
      __$PleromaApiPostStatusCopyWithImpl<$Res>;
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
          PleromaApiPostStatusPoll? poll,
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
  $PleromaApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$PleromaApiPostStatusCopyWithImpl<$Res>
    extends _$PleromaApiPostStatusCopyWithImpl<$Res>
    implements _$PleromaApiPostStatusCopyWith<$Res> {
  __$PleromaApiPostStatusCopyWithImpl(
      _PleromaApiPostStatus _value, $Res Function(_PleromaApiPostStatus) _then)
      : super(_value, (v) => _then(v as _PleromaApiPostStatus));

  @override
  _PleromaApiPostStatus get _value => super._value as _PleromaApiPostStatus;

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
    return _then(_PleromaApiPostStatus(
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
              as PleromaApiPostStatusPoll?,
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
class _$_PleromaApiPostStatus implements _PleromaApiPostStatus {
  const _$_PleromaApiPostStatus(
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

  factory _$_PleromaApiPostStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPostStatusFromJson(json);

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
  final PleromaApiPostStatusPoll? poll;
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
    return 'PleromaApiPostStatus(contentType: $contentType, expiresInSeconds: $expiresInSeconds, inReplyToConversationId: $inReplyToConversationId, inReplyToId: $inReplyToId, language: $language, visibility: $visibility, mediaIds: $mediaIds, poll: $poll, preview: $preview, sensitive: $sensitive, spoilerText: $spoilerText, status: $status, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiPostStatus &&
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
  _$PleromaApiPostStatusCopyWith<_PleromaApiPostStatus> get copyWith =>
      __$PleromaApiPostStatusCopyWithImpl<_PleromaApiPostStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPostStatusToJson(this);
  }
}

abstract class _PleromaApiPostStatus implements PleromaApiPostStatus {
  const factory _PleromaApiPostStatus(
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
          required PleromaApiPostStatusPoll? poll,
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
          required List<String>? to}) = _$_PleromaApiPostStatus;

  factory _PleromaApiPostStatus.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPostStatus.fromJson;

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
  PleromaApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
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
  _$PleromaApiPostStatusCopyWith<_PleromaApiPostStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
