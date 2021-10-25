// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_schedule_post_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiSchedulePostStatus _$MastodonApiSchedulePostStatusFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiSchedulePostStatus.fromJson(json);
}

/// @nodoc
class _$MastodonApiSchedulePostStatusTearOff {
  const _$MastodonApiSchedulePostStatusTearOff();

  _MastodonApiSchedulePostStatus call(
      {@HiveField(3)
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
          required MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          required bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(11)
          required String? status,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          required DateTime scheduledAt}) {
    return _MastodonApiSchedulePostStatus(
      inReplyToId: inReplyToId,
      language: language,
      visibility: visibility,
      mediaIds: mediaIds,
      poll: poll,
      sensitive: sensitive,
      spoilerText: spoilerText,
      status: status,
      scheduledAt: scheduledAt,
    );
  }

  MastodonApiSchedulePostStatus fromJson(Map<String, Object> json) {
    return MastodonApiSchedulePostStatus.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiSchedulePostStatus = _$MastodonApiSchedulePostStatusTearOff();

/// @nodoc
mixin _$MastodonApiSchedulePostStatus {
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
  MastodonApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get sensitive => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString)
  @HiveField(13)
  DateTime get scheduledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiSchedulePostStatusCopyWith<MastodonApiSchedulePostStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiSchedulePostStatusCopyWith<$Res> {
  factory $MastodonApiSchedulePostStatusCopyWith(
          MastodonApiSchedulePostStatus value,
          $Res Function(MastodonApiSchedulePostStatus) then) =
      _$MastodonApiSchedulePostStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3)
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
          MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(11)
          String? status,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          DateTime scheduledAt});

  $MastodonApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$MastodonApiSchedulePostStatusCopyWithImpl<$Res>
    implements $MastodonApiSchedulePostStatusCopyWith<$Res> {
  _$MastodonApiSchedulePostStatusCopyWithImpl(this._value, this._then);

  final MastodonApiSchedulePostStatus _value;
  // ignore: unused_field
  final $Res Function(MastodonApiSchedulePostStatus) _then;

  @override
  $Res call({
    Object? inReplyToId = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
    Object? mediaIds = freezed,
    Object? poll = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? status = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_value.copyWith(
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
              as MastodonApiPostStatusPoll?,
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
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $MastodonApiPostStatusPollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $MastodonApiPostStatusPollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiSchedulePostStatusCopyWith<$Res>
    implements $MastodonApiSchedulePostStatusCopyWith<$Res> {
  factory _$MastodonApiSchedulePostStatusCopyWith(
          _MastodonApiSchedulePostStatus value,
          $Res Function(_MastodonApiSchedulePostStatus) then) =
      __$MastodonApiSchedulePostStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3)
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
          MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(11)
          String? status,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          DateTime scheduledAt});

  @override
  $MastodonApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$MastodonApiSchedulePostStatusCopyWithImpl<$Res>
    extends _$MastodonApiSchedulePostStatusCopyWithImpl<$Res>
    implements _$MastodonApiSchedulePostStatusCopyWith<$Res> {
  __$MastodonApiSchedulePostStatusCopyWithImpl(
      _MastodonApiSchedulePostStatus _value,
      $Res Function(_MastodonApiSchedulePostStatus) _then)
      : super(_value, (v) => _then(v as _MastodonApiSchedulePostStatus));

  @override
  _MastodonApiSchedulePostStatus get _value =>
      super._value as _MastodonApiSchedulePostStatus;

  @override
  $Res call({
    Object? inReplyToId = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
    Object? mediaIds = freezed,
    Object? poll = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? status = freezed,
    Object? scheduledAt = freezed,
  }) {
    return _then(_MastodonApiSchedulePostStatus(
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
              as MastodonApiPostStatusPoll?,
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
      scheduledAt: scheduledAt == freezed
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiSchedulePostStatus
    implements _MastodonApiSchedulePostStatus {
  const _$_MastodonApiSchedulePostStatus(
      {@HiveField(3)
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
      @HiveField(9)
          required this.sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required this.spoilerText,
      @HiveField(11)
          required this.status,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          required this.scheduledAt});

  factory _$_MastodonApiSchedulePostStatus.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiSchedulePostStatusFromJson(json);

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
  final MastodonApiPostStatusPoll? poll;
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
  @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString)
  @HiveField(13)
  final DateTime scheduledAt;

  @override
  String toString() {
    return 'MastodonApiSchedulePostStatus(inReplyToId: $inReplyToId, language: $language, visibility: $visibility, mediaIds: $mediaIds, poll: $poll, sensitive: $sensitive, spoilerText: $spoilerText, status: $status, scheduledAt: $scheduledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiSchedulePostStatus &&
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
            (identical(other.sensitive, sensitive) ||
                const DeepCollectionEquality()
                    .equals(other.sensitive, sensitive)) &&
            (identical(other.spoilerText, spoilerText) ||
                const DeepCollectionEquality()
                    .equals(other.spoilerText, spoilerText)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.scheduledAt, scheduledAt) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledAt, scheduledAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(inReplyToId) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(mediaIds) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(sensitive) ^
      const DeepCollectionEquality().hash(spoilerText) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(scheduledAt);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiSchedulePostStatusCopyWith<_MastodonApiSchedulePostStatus>
      get copyWith => __$MastodonApiSchedulePostStatusCopyWithImpl<
          _MastodonApiSchedulePostStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiSchedulePostStatusToJson(this);
  }
}

abstract class _MastodonApiSchedulePostStatus
    implements MastodonApiSchedulePostStatus {
  const factory _MastodonApiSchedulePostStatus(
      {@HiveField(3)
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
          required MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          required bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(11)
          required String? status,
      @JsonKey(
          name: 'scheduled_at',
          toJson: JsonParseHelper.toUTCIsoString,
          fromJson: JsonParseHelper.fromUTCIsoString)
      @HiveField(13)
          required DateTime scheduledAt}) = _$_MastodonApiSchedulePostStatus;

  factory _MastodonApiSchedulePostStatus.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiSchedulePostStatus.fromJson;

  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id')
  String? get inReplyToId => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get language => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get visibility => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'media_ids')
  @HiveField(6)
  List<String>? get mediaIds => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  MastodonApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
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
  @JsonKey(
      name: 'scheduled_at',
      toJson: JsonParseHelper.toUTCIsoString,
      fromJson: JsonParseHelper.fromUTCIsoString)
  @HiveField(13)
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiSchedulePostStatusCopyWith<_MastodonApiSchedulePostStatus>
      get copyWith => throw _privateConstructorUsedError;
}
