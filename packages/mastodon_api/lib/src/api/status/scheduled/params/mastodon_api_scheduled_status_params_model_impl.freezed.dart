// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_scheduled_status_params_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiScheduledStatusParams _$MastodonApiScheduledStatusParamsFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiScheduledStatusParams.fromJson(json);
}

/// @nodoc
class _$MastodonApiScheduledStatusParamsTearOff {
  const _$MastodonApiScheduledStatusParamsTearOff();

  _MastodonApiScheduledStatusParams call(
      {@HiveField(1)
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
          required DateTime? scheduledAt,
      @HiveField(8)
          required MastodonApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          required String? inReplyToId}) {
    return _MastodonApiScheduledStatusParams(
      text: text,
      mediaIds: mediaIds,
      sensitive: sensitive,
      spoilerText: spoilerText,
      visibility: visibility,
      language: language,
      scheduledAt: scheduledAt,
      poll: poll,
      inReplyToId: inReplyToId,
    );
  }

  MastodonApiScheduledStatusParams fromJson(Map<String, Object?> json) {
    return MastodonApiScheduledStatusParams.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiScheduledStatusParams =
    _$MastodonApiScheduledStatusParamsTearOff();

/// @nodoc
mixin _$MastodonApiScheduledStatusParams {
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
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  @HiveField(8)
  MastodonApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_reply_to_id')
  @HiveField(10)
  String? get inReplyToId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiScheduledStatusParamsCopyWith<MastodonApiScheduledStatusParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiScheduledStatusParamsCopyWith<$Res> {
  factory $MastodonApiScheduledStatusParamsCopyWith(
          MastodonApiScheduledStatusParams value,
          $Res Function(MastodonApiScheduledStatusParams) then) =
      _$MastodonApiScheduledStatusParamsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) String? text,
      @JsonKey(name: 'media_ids') @HiveField(2) List<String>? mediaIds,
      @HiveField(3) bool sensitive,
      @JsonKey(name: 'spoiler_text') @HiveField(4) String? spoilerText,
      @HiveField(5) String visibility,
      @HiveField(6) String? language,
      @JsonKey(name: 'scheduled_at') @HiveField(7) DateTime? scheduledAt,
      @HiveField(8) MastodonApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id') @HiveField(10) String? inReplyToId});

  $MastodonApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$MastodonApiScheduledStatusParamsCopyWithImpl<$Res>
    implements $MastodonApiScheduledStatusParamsCopyWith<$Res> {
  _$MastodonApiScheduledStatusParamsCopyWithImpl(this._value, this._then);

  final MastodonApiScheduledStatusParams _value;
  // ignore: unused_field
  final $Res Function(MastodonApiScheduledStatusParams) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? mediaIds = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? visibility = freezed,
    Object? language = freezed,
    Object? scheduledAt = freezed,
    Object? poll = freezed,
    Object? inReplyToId = freezed,
  }) {
    return _then(_value.copyWith(
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
              as DateTime?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as MastodonApiPostStatusPoll?,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$MastodonApiScheduledStatusParamsCopyWith<$Res>
    implements $MastodonApiScheduledStatusParamsCopyWith<$Res> {
  factory _$MastodonApiScheduledStatusParamsCopyWith(
          _MastodonApiScheduledStatusParams value,
          $Res Function(_MastodonApiScheduledStatusParams) then) =
      __$MastodonApiScheduledStatusParamsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) String? text,
      @JsonKey(name: 'media_ids') @HiveField(2) List<String>? mediaIds,
      @HiveField(3) bool sensitive,
      @JsonKey(name: 'spoiler_text') @HiveField(4) String? spoilerText,
      @HiveField(5) String visibility,
      @HiveField(6) String? language,
      @JsonKey(name: 'scheduled_at') @HiveField(7) DateTime? scheduledAt,
      @HiveField(8) MastodonApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id') @HiveField(10) String? inReplyToId});

  @override
  $MastodonApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$MastodonApiScheduledStatusParamsCopyWithImpl<$Res>
    extends _$MastodonApiScheduledStatusParamsCopyWithImpl<$Res>
    implements _$MastodonApiScheduledStatusParamsCopyWith<$Res> {
  __$MastodonApiScheduledStatusParamsCopyWithImpl(
      _MastodonApiScheduledStatusParams _value,
      $Res Function(_MastodonApiScheduledStatusParams) _then)
      : super(_value, (v) => _then(v as _MastodonApiScheduledStatusParams));

  @override
  _MastodonApiScheduledStatusParams get _value =>
      super._value as _MastodonApiScheduledStatusParams;

  @override
  $Res call({
    Object? text = freezed,
    Object? mediaIds = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? visibility = freezed,
    Object? language = freezed,
    Object? scheduledAt = freezed,
    Object? poll = freezed,
    Object? inReplyToId = freezed,
  }) {
    return _then(_MastodonApiScheduledStatusParams(
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
              as DateTime?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as MastodonApiPostStatusPoll?,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiScheduledStatusParams
    implements _MastodonApiScheduledStatusParams {
  const _$_MastodonApiScheduledStatusParams(
      {@HiveField(1)
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
          required this.inReplyToId});

  factory _$_MastodonApiScheduledStatusParams.fromJson(
          Map<String, dynamic> json) =>
      _$$_MastodonApiScheduledStatusParamsFromJson(json);

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
  final DateTime? scheduledAt;
  @override
  @HiveField(8)
  final MastodonApiPostStatusPoll? poll;
  @override
  @JsonKey(name: 'in_reply_to_id')
  @HiveField(10)
  final String? inReplyToId;

  @override
  String toString() {
    return 'MastodonApiScheduledStatusParams(text: $text, mediaIds: $mediaIds, sensitive: $sensitive, spoilerText: $spoilerText, visibility: $visibility, language: $language, scheduledAt: $scheduledAt, poll: $poll, inReplyToId: $inReplyToId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiScheduledStatusParams &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.mediaIds, mediaIds) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.spoilerText, spoilerText) ||
                other.spoilerText == spoilerText) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.inReplyToId, inReplyToId) ||
                other.inReplyToId == inReplyToId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      const DeepCollectionEquality().hash(mediaIds),
      sensitive,
      spoilerText,
      visibility,
      language,
      scheduledAt,
      poll,
      inReplyToId);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiScheduledStatusParamsCopyWith<_MastodonApiScheduledStatusParams>
      get copyWith => __$MastodonApiScheduledStatusParamsCopyWithImpl<
          _MastodonApiScheduledStatusParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiScheduledStatusParamsToJson(this);
  }
}

abstract class _MastodonApiScheduledStatusParams
    implements MastodonApiScheduledStatusParams {
  const factory _MastodonApiScheduledStatusParams(
      {@HiveField(1)
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
          required DateTime? scheduledAt,
      @HiveField(8)
          required MastodonApiPostStatusPoll? poll,
      @JsonKey(name: 'in_reply_to_id')
      @HiveField(10)
          required String? inReplyToId}) = _$_MastodonApiScheduledStatusParams;

  factory _MastodonApiScheduledStatusParams.fromJson(
      Map<String, dynamic> json) = _$_MastodonApiScheduledStatusParams.fromJson;

  @override
  @HiveField(1)
  String? get text;
  @override
  @JsonKey(name: 'media_ids')
  @HiveField(2)
  List<String>? get mediaIds;
  @override
  @HiveField(3)
  bool get sensitive;
  @override
  @JsonKey(name: 'spoiler_text')
  @HiveField(4)
  String? get spoilerText;
  @override
  @HiveField(5)
  String get visibility;
  @override
  @HiveField(6)
  String? get language;
  @override
  @JsonKey(name: 'scheduled_at')
  @HiveField(7)
  DateTime? get scheduledAt;
  @override
  @HiveField(8)
  MastodonApiPostStatusPoll? get poll;
  @override
  @JsonKey(name: 'in_reply_to_id')
  @HiveField(10)
  String? get inReplyToId;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiScheduledStatusParamsCopyWith<_MastodonApiScheduledStatusParams>
      get copyWith => throw _privateConstructorUsedError;
}
