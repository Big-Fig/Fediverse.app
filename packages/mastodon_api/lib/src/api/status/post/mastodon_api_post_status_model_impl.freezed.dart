// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_post_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPostStatus _$MastodonApiPostStatusFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPostStatus.fromJson(json);
}

/// @nodoc
class _$MastodonApiPostStatusTearOff {
  const _$MastodonApiPostStatusTearOff();

  _MastodonApiPostStatus call(
      {@HiveField(3)
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
          required MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          required bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(11)
          required String? status}) {
    return _MastodonApiPostStatus(
      inReplyToId: inReplyToId,
      language: language,
      visibility: visibility,
      mediaIds: mediaIds,
      poll: poll,
      sensitive: sensitive,
      spoilerText: spoilerText,
      status: status,
    );
  }

  MastodonApiPostStatus fromJson(Map<String, Object?> json) {
    return MastodonApiPostStatus.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPostStatus = _$MastodonApiPostStatusTearOff();

/// @nodoc
mixin _$MastodonApiPostStatus {
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
  MastodonApiPostStatusPoll? get poll => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get sensitive => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPostStatusCopyWith<MastodonApiPostStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPostStatusCopyWith<$Res> {
  factory $MastodonApiPostStatusCopyWith(MastodonApiPostStatus value,
          $Res Function(MastodonApiPostStatus) then) =
      _$MastodonApiPostStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(3)
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
          MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(11)
          String? status});

  $MastodonApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class _$MastodonApiPostStatusCopyWithImpl<$Res>
    implements $MastodonApiPostStatusCopyWith<$Res> {
  _$MastodonApiPostStatusCopyWithImpl(this._value, this._then);

  final MastodonApiPostStatus _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPostStatus) _then;

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
abstract class _$MastodonApiPostStatusCopyWith<$Res>
    implements $MastodonApiPostStatusCopyWith<$Res> {
  factory _$MastodonApiPostStatusCopyWith(_MastodonApiPostStatus value,
          $Res Function(_MastodonApiPostStatus) then) =
      __$MastodonApiPostStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(3)
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
          MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(11)
          String? status});

  @override
  $MastodonApiPostStatusPollCopyWith<$Res>? get poll;
}

/// @nodoc
class __$MastodonApiPostStatusCopyWithImpl<$Res>
    extends _$MastodonApiPostStatusCopyWithImpl<$Res>
    implements _$MastodonApiPostStatusCopyWith<$Res> {
  __$MastodonApiPostStatusCopyWithImpl(_MastodonApiPostStatus _value,
      $Res Function(_MastodonApiPostStatus) _then)
      : super(_value, (v) => _then(v as _MastodonApiPostStatus));

  @override
  _MastodonApiPostStatus get _value => super._value as _MastodonApiPostStatus;

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
  }) {
    return _then(_MastodonApiPostStatus(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiPostStatus implements _MastodonApiPostStatus {
  const _$_MastodonApiPostStatus(
      {@HiveField(3)
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
      @HiveField(9)
          required this.sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required this.spoilerText,
      @HiveField(11)
          required this.status});

  factory _$_MastodonApiPostStatus.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPostStatusFromJson(json);

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
  String toString() {
    return 'MastodonApiPostStatus(inReplyToId: $inReplyToId, language: $language, visibility: $visibility, mediaIds: $mediaIds, poll: $poll, sensitive: $sensitive, spoilerText: $spoilerText, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPostStatus &&
            (identical(other.inReplyToId, inReplyToId) ||
                other.inReplyToId == inReplyToId) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other.mediaIds, mediaIds) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.spoilerText, spoilerText) ||
                other.spoilerText == spoilerText) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      inReplyToId,
      language,
      visibility,
      const DeepCollectionEquality().hash(mediaIds),
      poll,
      sensitive,
      spoilerText,
      status);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPostStatusCopyWith<_MastodonApiPostStatus> get copyWith =>
      __$MastodonApiPostStatusCopyWithImpl<_MastodonApiPostStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPostStatusToJson(this);
  }
}

abstract class _MastodonApiPostStatus implements MastodonApiPostStatus {
  const factory _MastodonApiPostStatus(
      {@HiveField(3)
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
          required MastodonApiPostStatusPoll? poll,
      @HiveField(9)
          required bool sensitive,
      @HiveField(10)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(11)
          required String? status}) = _$_MastodonApiPostStatus;

  factory _MastodonApiPostStatus.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPostStatus.fromJson;

  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_id', includeIfNull: false)
  String? get inReplyToId;
  @override
  @HiveField(4)
  String? get language;
  @override
  @HiveField(5)
  String get visibility;
  @override
  @HiveField(6)
  @JsonKey(name: 'media_ids')
  List<String>? get mediaIds;
  @override
  @HiveField(7)
  MastodonApiPostStatusPoll? get poll;
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
  @JsonKey(ignore: true)
  _$MastodonApiPostStatusCopyWith<_MastodonApiPostStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
