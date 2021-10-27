// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiStatus _$PleromaApiStatusFromJson(Map<String, dynamic> json) {
  return _PleromaApiStatus.fromJson(json);
}

/// @nodoc
class _$PleromaApiStatusTearOff {
  const _$PleromaApiStatusTearOff();

  _PleromaApiStatus call(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_id')
          required String? inReplyToId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_account_id')
          required String? inReplyToAccountId,
      @HiveField(4)
          required bool sensitive,
      @HiveField(5)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(6)
          required String uri,
      @HiveField(7)
          required String? url,
      @HiveField(8)
      @JsonKey(name: 'replies_count')
          required int? repliesCount,
      @HiveField(9)
      @JsonKey(name: 'reblogs_count')
          required int? reblogsCount,
      @HiveField(10)
      @JsonKey(name: 'favourites_count')
          required int? favouritesCount,
      @HiveField(11)
          required bool? favourited,
      @HiveField(12)
          required bool? reblogged,
      @HiveField(13)
          required bool? muted,
      @HiveField(14)
          required bool? bookmarked,
      @HiveField(15)
          required bool? pinned,
      @HiveField(16)
          required String? content,
      @HiveField(17)
          required PleromaApiStatus? reblog,
      @HiveField(18)
          required PleromaApiApplication? application,
      @HiveField(19)
          required PleromaApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          required List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          required List<PleromaApiMention>? mentions,
      @HiveField(22)
          required List<PleromaApiTag>? tags,
      @HiveField(23)
          required List<PleromaApiEmoji>? emojis,
      @HiveField(24)
          required PleromaApiPoll? poll,
      @HiveField(25)
          required PleromaApiCard? card,
      @HiveField(26)
          required PleromaApiStatusPleromaPart? pleroma,
      @HiveField(27)
          required String? language,
      @HiveField(28)
          required String visibility}) {
    return _PleromaApiStatus(
      id: id,
      createdAt: createdAt,
      inReplyToId: inReplyToId,
      inReplyToAccountId: inReplyToAccountId,
      sensitive: sensitive,
      spoilerText: spoilerText,
      uri: uri,
      url: url,
      repliesCount: repliesCount,
      reblogsCount: reblogsCount,
      favouritesCount: favouritesCount,
      favourited: favourited,
      reblogged: reblogged,
      muted: muted,
      bookmarked: bookmarked,
      pinned: pinned,
      content: content,
      reblog: reblog,
      application: application,
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: mentions,
      tags: tags,
      emojis: emojis,
      poll: poll,
      card: card,
      pleroma: pleroma,
      language: language,
      visibility: visibility,
    );
  }

  PleromaApiStatus fromJson(Map<String, Object?> json) {
    return PleromaApiStatus.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiStatus = _$PleromaApiStatusTearOff();

/// @nodoc
mixin _$PleromaApiStatus {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_id')
  String? get inReplyToId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_account_id')
  String? get inReplyToAccountId => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get sensitive => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText => throw _privateConstructorUsedError;
  @HiveField(6)
  String get uri => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'replies_count')
  int? get repliesCount => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'reblogs_count')
  int? get reblogsCount => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'favourites_count')
  int? get favouritesCount => throw _privateConstructorUsedError;
  @HiveField(11)
  bool? get favourited => throw _privateConstructorUsedError;
  @HiveField(12)
  bool? get reblogged => throw _privateConstructorUsedError;
  @HiveField(13)
  bool? get muted => throw _privateConstructorUsedError;
  @HiveField(14)
  bool? get bookmarked => throw _privateConstructorUsedError;
  @HiveField(15)
  bool? get pinned => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get content => throw _privateConstructorUsedError;
  @HiveField(17)
  PleromaApiStatus? get reblog => throw _privateConstructorUsedError;
  @HiveField(18)
  PleromaApiApplication? get application => throw _privateConstructorUsedError;
  @HiveField(19)
  PleromaApiAccount get account => throw _privateConstructorUsedError;
  @HiveField(20)
  @JsonKey(name: 'media_attachments')
  List<PleromaApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @HiveField(21)
  List<PleromaApiMention>? get mentions => throw _privateConstructorUsedError;
  @HiveField(22)
  List<PleromaApiTag>? get tags => throw _privateConstructorUsedError;
  @HiveField(23)
  List<PleromaApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @HiveField(24)
  PleromaApiPoll? get poll => throw _privateConstructorUsedError;
  @HiveField(25)
  PleromaApiCard? get card => throw _privateConstructorUsedError;
  @HiveField(26)
  PleromaApiStatusPleromaPart? get pleroma =>
      throw _privateConstructorUsedError;
  @HiveField(27)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(28)
  String get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiStatusCopyWith<PleromaApiStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiStatusCopyWith<$Res> {
  factory $PleromaApiStatusCopyWith(
          PleromaApiStatus value, $Res Function(PleromaApiStatus) then) =
      _$PleromaApiStatusCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_id')
          String? inReplyToId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_account_id')
          String? inReplyToAccountId,
      @HiveField(4)
          bool sensitive,
      @HiveField(5)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(6)
          String uri,
      @HiveField(7)
          String? url,
      @HiveField(8)
      @JsonKey(name: 'replies_count')
          int? repliesCount,
      @HiveField(9)
      @JsonKey(name: 'reblogs_count')
          int? reblogsCount,
      @HiveField(10)
      @JsonKey(name: 'favourites_count')
          int? favouritesCount,
      @HiveField(11)
          bool? favourited,
      @HiveField(12)
          bool? reblogged,
      @HiveField(13)
          bool? muted,
      @HiveField(14)
          bool? bookmarked,
      @HiveField(15)
          bool? pinned,
      @HiveField(16)
          String? content,
      @HiveField(17)
          PleromaApiStatus? reblog,
      @HiveField(18)
          PleromaApiApplication? application,
      @HiveField(19)
          PleromaApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          List<PleromaApiMention>? mentions,
      @HiveField(22)
          List<PleromaApiTag>? tags,
      @HiveField(23)
          List<PleromaApiEmoji>? emojis,
      @HiveField(24)
          PleromaApiPoll? poll,
      @HiveField(25)
          PleromaApiCard? card,
      @HiveField(26)
          PleromaApiStatusPleromaPart? pleroma,
      @HiveField(27)
          String? language,
      @HiveField(28)
          String visibility});

  $PleromaApiStatusCopyWith<$Res>? get reblog;
  $PleromaApiApplicationCopyWith<$Res>? get application;
  $PleromaApiAccountCopyWith<$Res> get account;
  $PleromaApiPollCopyWith<$Res>? get poll;
  $PleromaApiCardCopyWith<$Res>? get card;
  $PleromaApiStatusPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class _$PleromaApiStatusCopyWithImpl<$Res>
    implements $PleromaApiStatusCopyWith<$Res> {
  _$PleromaApiStatusCopyWithImpl(this._value, this._then);

  final PleromaApiStatus _value;
  // ignore: unused_field
  final $Res Function(PleromaApiStatus) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? inReplyToId = freezed,
    Object? inReplyToAccountId = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? uri = freezed,
    Object? url = freezed,
    Object? repliesCount = freezed,
    Object? reblogsCount = freezed,
    Object? favouritesCount = freezed,
    Object? favourited = freezed,
    Object? reblogged = freezed,
    Object? muted = freezed,
    Object? bookmarked = freezed,
    Object? pinned = freezed,
    Object? content = freezed,
    Object? reblog = freezed,
    Object? application = freezed,
    Object? account = freezed,
    Object? mediaAttachments = freezed,
    Object? mentions = freezed,
    Object? tags = freezed,
    Object? emojis = freezed,
    Object? poll = freezed,
    Object? card = freezed,
    Object? pleroma = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      inReplyToAccountId: inReplyToAccountId == freezed
          ? _value.inReplyToAccountId
          : inReplyToAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      repliesCount: repliesCount == freezed
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      reblogsCount: reblogsCount == freezed
          ? _value.reblogsCount
          : reblogsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      favouritesCount: favouritesCount == freezed
          ? _value.favouritesCount
          : favouritesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      favourited: favourited == freezed
          ? _value.favourited
          : favourited // ignore: cast_nullable_to_non_nullable
              as bool?,
      reblogged: reblogged == freezed
          ? _value.reblogged
          : reblogged // ignore: cast_nullable_to_non_nullable
              as bool?,
      muted: muted == freezed
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarked: bookmarked == freezed
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      reblog: reblog == freezed
          ? _value.reblog
          : reblog // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus?,
      application: application == freezed
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as PleromaApiApplication?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMediaAttachment>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMention>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiEmoji>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PleromaApiPoll?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PleromaApiCard?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatusPleromaPart?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $PleromaApiStatusCopyWith<$Res>? get reblog {
    if (_value.reblog == null) {
      return null;
    }

    return $PleromaApiStatusCopyWith<$Res>(_value.reblog!, (value) {
      return _then(_value.copyWith(reblog: value));
    });
  }

  @override
  $PleromaApiApplicationCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $PleromaApiApplicationCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value));
    });
  }

  @override
  $PleromaApiAccountCopyWith<$Res> get account {
    return $PleromaApiAccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $PleromaApiPollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PleromaApiPollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value));
    });
  }

  @override
  $PleromaApiCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $PleromaApiCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value));
    });
  }

  @override
  $PleromaApiStatusPleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiStatusPleromaPartCopyWith<$Res>(_value.pleroma!, (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiStatusCopyWith<$Res>
    implements $PleromaApiStatusCopyWith<$Res> {
  factory _$PleromaApiStatusCopyWith(
          _PleromaApiStatus value, $Res Function(_PleromaApiStatus) then) =
      __$PleromaApiStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
      @JsonKey(name: 'created_at')
          DateTime createdAt,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_id')
          String? inReplyToId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_account_id')
          String? inReplyToAccountId,
      @HiveField(4)
          bool sensitive,
      @HiveField(5)
      @JsonKey(name: 'spoiler_text')
          String? spoilerText,
      @HiveField(6)
          String uri,
      @HiveField(7)
          String? url,
      @HiveField(8)
      @JsonKey(name: 'replies_count')
          int? repliesCount,
      @HiveField(9)
      @JsonKey(name: 'reblogs_count')
          int? reblogsCount,
      @HiveField(10)
      @JsonKey(name: 'favourites_count')
          int? favouritesCount,
      @HiveField(11)
          bool? favourited,
      @HiveField(12)
          bool? reblogged,
      @HiveField(13)
          bool? muted,
      @HiveField(14)
          bool? bookmarked,
      @HiveField(15)
          bool? pinned,
      @HiveField(16)
          String? content,
      @HiveField(17)
          PleromaApiStatus? reblog,
      @HiveField(18)
          PleromaApiApplication? application,
      @HiveField(19)
          PleromaApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          List<PleromaApiMention>? mentions,
      @HiveField(22)
          List<PleromaApiTag>? tags,
      @HiveField(23)
          List<PleromaApiEmoji>? emojis,
      @HiveField(24)
          PleromaApiPoll? poll,
      @HiveField(25)
          PleromaApiCard? card,
      @HiveField(26)
          PleromaApiStatusPleromaPart? pleroma,
      @HiveField(27)
          String? language,
      @HiveField(28)
          String visibility});

  @override
  $PleromaApiStatusCopyWith<$Res>? get reblog;
  @override
  $PleromaApiApplicationCopyWith<$Res>? get application;
  @override
  $PleromaApiAccountCopyWith<$Res> get account;
  @override
  $PleromaApiPollCopyWith<$Res>? get poll;
  @override
  $PleromaApiCardCopyWith<$Res>? get card;
  @override
  $PleromaApiStatusPleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class __$PleromaApiStatusCopyWithImpl<$Res>
    extends _$PleromaApiStatusCopyWithImpl<$Res>
    implements _$PleromaApiStatusCopyWith<$Res> {
  __$PleromaApiStatusCopyWithImpl(
      _PleromaApiStatus _value, $Res Function(_PleromaApiStatus) _then)
      : super(_value, (v) => _then(v as _PleromaApiStatus));

  @override
  _PleromaApiStatus get _value => super._value as _PleromaApiStatus;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? inReplyToId = freezed,
    Object? inReplyToAccountId = freezed,
    Object? sensitive = freezed,
    Object? spoilerText = freezed,
    Object? uri = freezed,
    Object? url = freezed,
    Object? repliesCount = freezed,
    Object? reblogsCount = freezed,
    Object? favouritesCount = freezed,
    Object? favourited = freezed,
    Object? reblogged = freezed,
    Object? muted = freezed,
    Object? bookmarked = freezed,
    Object? pinned = freezed,
    Object? content = freezed,
    Object? reblog = freezed,
    Object? application = freezed,
    Object? account = freezed,
    Object? mediaAttachments = freezed,
    Object? mentions = freezed,
    Object? tags = freezed,
    Object? emojis = freezed,
    Object? poll = freezed,
    Object? card = freezed,
    Object? pleroma = freezed,
    Object? language = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_PleromaApiStatus(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inReplyToId: inReplyToId == freezed
          ? _value.inReplyToId
          : inReplyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      inReplyToAccountId: inReplyToAccountId == freezed
          ? _value.inReplyToAccountId
          : inReplyToAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as String?,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      repliesCount: repliesCount == freezed
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      reblogsCount: reblogsCount == freezed
          ? _value.reblogsCount
          : reblogsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      favouritesCount: favouritesCount == freezed
          ? _value.favouritesCount
          : favouritesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      favourited: favourited == freezed
          ? _value.favourited
          : favourited // ignore: cast_nullable_to_non_nullable
              as bool?,
      reblogged: reblogged == freezed
          ? _value.reblogged
          : reblogged // ignore: cast_nullable_to_non_nullable
              as bool?,
      muted: muted == freezed
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool?,
      bookmarked: bookmarked == freezed
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      reblog: reblog == freezed
          ? _value.reblog
          : reblog // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatus?,
      application: application == freezed
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as PleromaApiApplication?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMediaAttachment>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiMention>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiEmoji>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PleromaApiPoll?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PleromaApiCard?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatusPleromaPart?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiStatus implements _PleromaApiStatus {
  const _$_PleromaApiStatus(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_id')
          required this.inReplyToId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_account_id')
          required this.inReplyToAccountId,
      @HiveField(4)
          required this.sensitive,
      @HiveField(5)
      @JsonKey(name: 'spoiler_text')
          required this.spoilerText,
      @HiveField(6)
          required this.uri,
      @HiveField(7)
          required this.url,
      @HiveField(8)
      @JsonKey(name: 'replies_count')
          required this.repliesCount,
      @HiveField(9)
      @JsonKey(name: 'reblogs_count')
          required this.reblogsCount,
      @HiveField(10)
      @JsonKey(name: 'favourites_count')
          required this.favouritesCount,
      @HiveField(11)
          required this.favourited,
      @HiveField(12)
          required this.reblogged,
      @HiveField(13)
          required this.muted,
      @HiveField(14)
          required this.bookmarked,
      @HiveField(15)
          required this.pinned,
      @HiveField(16)
          required this.content,
      @HiveField(17)
          required this.reblog,
      @HiveField(18)
          required this.application,
      @HiveField(19)
          required this.account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          required this.mediaAttachments,
      @HiveField(21)
          required this.mentions,
      @HiveField(22)
          required this.tags,
      @HiveField(23)
          required this.emojis,
      @HiveField(24)
          required this.poll,
      @HiveField(25)
          required this.card,
      @HiveField(26)
          required this.pleroma,
      @HiveField(27)
          required this.language,
      @HiveField(28)
          required this.visibility});

  factory _$_PleromaApiStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiStatusFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_id')
  final String? inReplyToId;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_account_id')
  final String? inReplyToAccountId;
  @override
  @HiveField(4)
  final bool sensitive;
  @override
  @HiveField(5)
  @JsonKey(name: 'spoiler_text')
  final String? spoilerText;
  @override
  @HiveField(6)
  final String uri;
  @override
  @HiveField(7)
  final String? url;
  @override
  @HiveField(8)
  @JsonKey(name: 'replies_count')
  final int? repliesCount;
  @override
  @HiveField(9)
  @JsonKey(name: 'reblogs_count')
  final int? reblogsCount;
  @override
  @HiveField(10)
  @JsonKey(name: 'favourites_count')
  final int? favouritesCount;
  @override
  @HiveField(11)
  final bool? favourited;
  @override
  @HiveField(12)
  final bool? reblogged;
  @override
  @HiveField(13)
  final bool? muted;
  @override
  @HiveField(14)
  final bool? bookmarked;
  @override
  @HiveField(15)
  final bool? pinned;
  @override
  @HiveField(16)
  final String? content;
  @override
  @HiveField(17)
  final PleromaApiStatus? reblog;
  @override
  @HiveField(18)
  final PleromaApiApplication? application;
  @override
  @HiveField(19)
  final PleromaApiAccount account;
  @override
  @HiveField(20)
  @JsonKey(name: 'media_attachments')
  final List<PleromaApiMediaAttachment>? mediaAttachments;
  @override
  @HiveField(21)
  final List<PleromaApiMention>? mentions;
  @override
  @HiveField(22)
  final List<PleromaApiTag>? tags;
  @override
  @HiveField(23)
  final List<PleromaApiEmoji>? emojis;
  @override
  @HiveField(24)
  final PleromaApiPoll? poll;
  @override
  @HiveField(25)
  final PleromaApiCard? card;
  @override
  @HiveField(26)
  final PleromaApiStatusPleromaPart? pleroma;
  @override
  @HiveField(27)
  final String? language;
  @override
  @HiveField(28)
  final String visibility;

  @override
  String toString() {
    return 'PleromaApiStatus(id: $id, createdAt: $createdAt, inReplyToId: $inReplyToId, inReplyToAccountId: $inReplyToAccountId, sensitive: $sensitive, spoilerText: $spoilerText, uri: $uri, url: $url, repliesCount: $repliesCount, reblogsCount: $reblogsCount, favouritesCount: $favouritesCount, favourited: $favourited, reblogged: $reblogged, muted: $muted, bookmarked: $bookmarked, pinned: $pinned, content: $content, reblog: $reblog, application: $application, account: $account, mediaAttachments: $mediaAttachments, mentions: $mentions, tags: $tags, emojis: $emojis, poll: $poll, card: $card, pleroma: $pleroma, language: $language, visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.inReplyToId, inReplyToId) ||
                other.inReplyToId == inReplyToId) &&
            (identical(other.inReplyToAccountId, inReplyToAccountId) ||
                other.inReplyToAccountId == inReplyToAccountId) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.spoilerText, spoilerText) ||
                other.spoilerText == spoilerText) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            (identical(other.reblogsCount, reblogsCount) ||
                other.reblogsCount == reblogsCount) &&
            (identical(other.favouritesCount, favouritesCount) ||
                other.favouritesCount == favouritesCount) &&
            (identical(other.favourited, favourited) ||
                other.favourited == favourited) &&
            (identical(other.reblogged, reblogged) ||
                other.reblogged == reblogged) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reblog, reblog) || other.reblog == reblog) &&
            (identical(other.application, application) ||
                other.application == application) &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality()
                .equals(other.mediaAttachments, mediaAttachments) &&
            const DeepCollectionEquality().equals(other.mentions, mentions) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.emojis, emojis) &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.pleroma, pleroma) || other.pleroma == pleroma) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        inReplyToId,
        inReplyToAccountId,
        sensitive,
        spoilerText,
        uri,
        url,
        repliesCount,
        reblogsCount,
        favouritesCount,
        favourited,
        reblogged,
        muted,
        bookmarked,
        pinned,
        content,
        reblog,
        application,
        account,
        const DeepCollectionEquality().hash(mediaAttachments),
        const DeepCollectionEquality().hash(mentions),
        const DeepCollectionEquality().hash(tags),
        const DeepCollectionEquality().hash(emojis),
        poll,
        card,
        pleroma,
        language,
        visibility
      ]);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiStatusCopyWith<_PleromaApiStatus> get copyWith =>
      __$PleromaApiStatusCopyWithImpl<_PleromaApiStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiStatusToJson(this);
  }
}

abstract class _PleromaApiStatus implements PleromaApiStatus {
  const factory _PleromaApiStatus(
      {@HiveField(0)
          required String id,
      @HiveField(1)
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @HiveField(2)
      @JsonKey(name: 'in_reply_to_id')
          required String? inReplyToId,
      @HiveField(3)
      @JsonKey(name: 'in_reply_to_account_id')
          required String? inReplyToAccountId,
      @HiveField(4)
          required bool sensitive,
      @HiveField(5)
      @JsonKey(name: 'spoiler_text')
          required String? spoilerText,
      @HiveField(6)
          required String uri,
      @HiveField(7)
          required String? url,
      @HiveField(8)
      @JsonKey(name: 'replies_count')
          required int? repliesCount,
      @HiveField(9)
      @JsonKey(name: 'reblogs_count')
          required int? reblogsCount,
      @HiveField(10)
      @JsonKey(name: 'favourites_count')
          required int? favouritesCount,
      @HiveField(11)
          required bool? favourited,
      @HiveField(12)
          required bool? reblogged,
      @HiveField(13)
          required bool? muted,
      @HiveField(14)
          required bool? bookmarked,
      @HiveField(15)
          required bool? pinned,
      @HiveField(16)
          required String? content,
      @HiveField(17)
          required PleromaApiStatus? reblog,
      @HiveField(18)
          required PleromaApiApplication? application,
      @HiveField(19)
          required PleromaApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          required List<PleromaApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          required List<PleromaApiMention>? mentions,
      @HiveField(22)
          required List<PleromaApiTag>? tags,
      @HiveField(23)
          required List<PleromaApiEmoji>? emojis,
      @HiveField(24)
          required PleromaApiPoll? poll,
      @HiveField(25)
          required PleromaApiCard? card,
      @HiveField(26)
          required PleromaApiStatusPleromaPart? pleroma,
      @HiveField(27)
          required String? language,
      @HiveField(28)
          required String visibility}) = _$_PleromaApiStatus;

  factory _PleromaApiStatus.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiStatus.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_id')
  String? get inReplyToId;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_account_id')
  String? get inReplyToAccountId;
  @override
  @HiveField(4)
  bool get sensitive;
  @override
  @HiveField(5)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText;
  @override
  @HiveField(6)
  String get uri;
  @override
  @HiveField(7)
  String? get url;
  @override
  @HiveField(8)
  @JsonKey(name: 'replies_count')
  int? get repliesCount;
  @override
  @HiveField(9)
  @JsonKey(name: 'reblogs_count')
  int? get reblogsCount;
  @override
  @HiveField(10)
  @JsonKey(name: 'favourites_count')
  int? get favouritesCount;
  @override
  @HiveField(11)
  bool? get favourited;
  @override
  @HiveField(12)
  bool? get reblogged;
  @override
  @HiveField(13)
  bool? get muted;
  @override
  @HiveField(14)
  bool? get bookmarked;
  @override
  @HiveField(15)
  bool? get pinned;
  @override
  @HiveField(16)
  String? get content;
  @override
  @HiveField(17)
  PleromaApiStatus? get reblog;
  @override
  @HiveField(18)
  PleromaApiApplication? get application;
  @override
  @HiveField(19)
  PleromaApiAccount get account;
  @override
  @HiveField(20)
  @JsonKey(name: 'media_attachments')
  List<PleromaApiMediaAttachment>? get mediaAttachments;
  @override
  @HiveField(21)
  List<PleromaApiMention>? get mentions;
  @override
  @HiveField(22)
  List<PleromaApiTag>? get tags;
  @override
  @HiveField(23)
  List<PleromaApiEmoji>? get emojis;
  @override
  @HiveField(24)
  PleromaApiPoll? get poll;
  @override
  @HiveField(25)
  PleromaApiCard? get card;
  @override
  @HiveField(26)
  PleromaApiStatusPleromaPart? get pleroma;
  @override
  @HiveField(27)
  String? get language;
  @override
  @HiveField(28)
  String get visibility;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiStatusCopyWith<_PleromaApiStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

PleromaApiStatusPleromaPart _$PleromaApiStatusPleromaPartFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiStatusPleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiStatusPleromaPartTearOff {
  const _$PleromaApiStatusPleromaPartTearOff();

  _PleromaApiStatusPleromaPart call(
      {@HiveField(0)
          required PleromaApiContentVariants? content,
      @JsonKey(name: 'conversation_id')
      @HiveField(1)
          required int? conversationId,
      @HiveField(2)
      @JsonKey(name: 'direct_conversation_id')
          required int? directConversationId,
      @JsonKey(name: 'in_reply_to_account_acct')
      @HiveField(3)
          required String? inReplyToAccountAcct,
      @HiveField(4)
          required bool? local,
      @JsonKey(name: 'spoiler_text')
      @HiveField(5)
          required PleromaApiContentVariants? spoilerText,
      @JsonKey(name: 'expires_at')
      @HiveField(6)
          required DateTime? expiresAt,
      @HiveField(7)
      @JsonKey(name: 'thread_muted')
          required bool? threadMuted,
      @HiveField(8)
      @JsonKey(name: 'emoji_reactions')
          required List<PleromaApiStatusEmojiReaction>? emojiReactions}) {
    return _PleromaApiStatusPleromaPart(
      content: content,
      conversationId: conversationId,
      directConversationId: directConversationId,
      inReplyToAccountAcct: inReplyToAccountAcct,
      local: local,
      spoilerText: spoilerText,
      expiresAt: expiresAt,
      threadMuted: threadMuted,
      emojiReactions: emojiReactions,
    );
  }

  PleromaApiStatusPleromaPart fromJson(Map<String, Object?> json) {
    return PleromaApiStatusPleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiStatusPleromaPart = _$PleromaApiStatusPleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiStatusPleromaPart {
// a map consisting of alternate representations
// of the content property with
// the key being it's mimetype.
// Currently the only alternate representation supported is text/plain
  @HiveField(0)
  PleromaApiContentVariants? get content =>
      throw _privateConstructorUsedError; // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: 'conversation_id')
  @HiveField(1)
  int? get conversationId =>
      throw _privateConstructorUsedError; // the ID of the Mastodon direct message conversation the status
// is associated with (if any)
  @HiveField(2)
  @JsonKey(name: 'direct_conversation_id')
  int? get directConversationId =>
      throw _privateConstructorUsedError; // the acct property of User entity for replied user (if any)
  @JsonKey(name: 'in_reply_to_account_acct')
  @HiveField(3)
  String? get inReplyToAccountAcct => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get local => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoiler_text')
  @HiveField(5)
  PleromaApiContentVariants? get spoilerText =>
      throw _privateConstructorUsedError; // a datetime (iso8601) that states when
// the post will expire (be deleted automatically),
// or empty if the post wont expire
  @JsonKey(name: 'expires_at')
  @HiveField(6)
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'thread_muted')
  bool? get threadMuted =>
      throw _privateConstructorUsedError; // A list with emoji / reaction maps. The format is
// {name: '☕', count: 1, me: true}.
// Contains no information about the reacting users,
// for that use the /statuses/:id/reactions endpoint.
  @HiveField(8)
  @JsonKey(name: 'emoji_reactions')
  List<PleromaApiStatusEmojiReaction>? get emojiReactions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiStatusPleromaPartCopyWith<PleromaApiStatusPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiStatusPleromaPartCopyWith<$Res> {
  factory $PleromaApiStatusPleromaPartCopyWith(
          PleromaApiStatusPleromaPart value,
          $Res Function(PleromaApiStatusPleromaPart) then) =
      _$PleromaApiStatusPleromaPartCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          PleromaApiContentVariants? content,
      @JsonKey(name: 'conversation_id')
      @HiveField(1)
          int? conversationId,
      @HiveField(2)
      @JsonKey(name: 'direct_conversation_id')
          int? directConversationId,
      @JsonKey(name: 'in_reply_to_account_acct')
      @HiveField(3)
          String? inReplyToAccountAcct,
      @HiveField(4)
          bool? local,
      @JsonKey(name: 'spoiler_text')
      @HiveField(5)
          PleromaApiContentVariants? spoilerText,
      @JsonKey(name: 'expires_at')
      @HiveField(6)
          DateTime? expiresAt,
      @HiveField(7)
      @JsonKey(name: 'thread_muted')
          bool? threadMuted,
      @HiveField(8)
      @JsonKey(name: 'emoji_reactions')
          List<PleromaApiStatusEmojiReaction>? emojiReactions});

  $PleromaApiContentVariantsCopyWith<$Res>? get content;
  $PleromaApiContentVariantsCopyWith<$Res>? get spoilerText;
}

/// @nodoc
class _$PleromaApiStatusPleromaPartCopyWithImpl<$Res>
    implements $PleromaApiStatusPleromaPartCopyWith<$Res> {
  _$PleromaApiStatusPleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiStatusPleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiStatusPleromaPart) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? conversationId = freezed,
    Object? directConversationId = freezed,
    Object? inReplyToAccountAcct = freezed,
    Object? local = freezed,
    Object? spoilerText = freezed,
    Object? expiresAt = freezed,
    Object? threadMuted = freezed,
    Object? emojiReactions = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as PleromaApiContentVariants?,
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      directConversationId: directConversationId == freezed
          ? _value.directConversationId
          : directConversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      inReplyToAccountAcct: inReplyToAccountAcct == freezed
          ? _value.inReplyToAccountAcct
          : inReplyToAccountAcct // ignore: cast_nullable_to_non_nullable
              as String?,
      local: local == freezed
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as bool?,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as PleromaApiContentVariants?,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      threadMuted: threadMuted == freezed
          ? _value.threadMuted
          : threadMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      emojiReactions: emojiReactions == freezed
          ? _value.emojiReactions
          : emojiReactions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatusEmojiReaction>?,
    ));
  }

  @override
  $PleromaApiContentVariantsCopyWith<$Res>? get content {
    if (_value.content == null) {
      return null;
    }

    return $PleromaApiContentVariantsCopyWith<$Res>(_value.content!, (value) {
      return _then(_value.copyWith(content: value));
    });
  }

  @override
  $PleromaApiContentVariantsCopyWith<$Res>? get spoilerText {
    if (_value.spoilerText == null) {
      return null;
    }

    return $PleromaApiContentVariantsCopyWith<$Res>(_value.spoilerText!,
        (value) {
      return _then(_value.copyWith(spoilerText: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiStatusPleromaPartCopyWith<$Res>
    implements $PleromaApiStatusPleromaPartCopyWith<$Res> {
  factory _$PleromaApiStatusPleromaPartCopyWith(
          _PleromaApiStatusPleromaPart value,
          $Res Function(_PleromaApiStatusPleromaPart) then) =
      __$PleromaApiStatusPleromaPartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          PleromaApiContentVariants? content,
      @JsonKey(name: 'conversation_id')
      @HiveField(1)
          int? conversationId,
      @HiveField(2)
      @JsonKey(name: 'direct_conversation_id')
          int? directConversationId,
      @JsonKey(name: 'in_reply_to_account_acct')
      @HiveField(3)
          String? inReplyToAccountAcct,
      @HiveField(4)
          bool? local,
      @JsonKey(name: 'spoiler_text')
      @HiveField(5)
          PleromaApiContentVariants? spoilerText,
      @JsonKey(name: 'expires_at')
      @HiveField(6)
          DateTime? expiresAt,
      @HiveField(7)
      @JsonKey(name: 'thread_muted')
          bool? threadMuted,
      @HiveField(8)
      @JsonKey(name: 'emoji_reactions')
          List<PleromaApiStatusEmojiReaction>? emojiReactions});

  @override
  $PleromaApiContentVariantsCopyWith<$Res>? get content;
  @override
  $PleromaApiContentVariantsCopyWith<$Res>? get spoilerText;
}

/// @nodoc
class __$PleromaApiStatusPleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiStatusPleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiStatusPleromaPartCopyWith<$Res> {
  __$PleromaApiStatusPleromaPartCopyWithImpl(
      _PleromaApiStatusPleromaPart _value,
      $Res Function(_PleromaApiStatusPleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiStatusPleromaPart));

  @override
  _PleromaApiStatusPleromaPart get _value =>
      super._value as _PleromaApiStatusPleromaPart;

  @override
  $Res call({
    Object? content = freezed,
    Object? conversationId = freezed,
    Object? directConversationId = freezed,
    Object? inReplyToAccountAcct = freezed,
    Object? local = freezed,
    Object? spoilerText = freezed,
    Object? expiresAt = freezed,
    Object? threadMuted = freezed,
    Object? emojiReactions = freezed,
  }) {
    return _then(_PleromaApiStatusPleromaPart(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as PleromaApiContentVariants?,
      conversationId: conversationId == freezed
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      directConversationId: directConversationId == freezed
          ? _value.directConversationId
          : directConversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      inReplyToAccountAcct: inReplyToAccountAcct == freezed
          ? _value.inReplyToAccountAcct
          : inReplyToAccountAcct // ignore: cast_nullable_to_non_nullable
              as String?,
      local: local == freezed
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as bool?,
      spoilerText: spoilerText == freezed
          ? _value.spoilerText
          : spoilerText // ignore: cast_nullable_to_non_nullable
              as PleromaApiContentVariants?,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      threadMuted: threadMuted == freezed
          ? _value.threadMuted
          : threadMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      emojiReactions: emojiReactions == freezed
          ? _value.emojiReactions
          : emojiReactions // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatusEmojiReaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiStatusPleromaPart implements _PleromaApiStatusPleromaPart {
  const _$_PleromaApiStatusPleromaPart(
      {@HiveField(0)
          required this.content,
      @JsonKey(name: 'conversation_id')
      @HiveField(1)
          required this.conversationId,
      @HiveField(2)
      @JsonKey(name: 'direct_conversation_id')
          required this.directConversationId,
      @JsonKey(name: 'in_reply_to_account_acct')
      @HiveField(3)
          required this.inReplyToAccountAcct,
      @HiveField(4)
          required this.local,
      @JsonKey(name: 'spoiler_text')
      @HiveField(5)
          required this.spoilerText,
      @JsonKey(name: 'expires_at')
      @HiveField(6)
          required this.expiresAt,
      @HiveField(7)
      @JsonKey(name: 'thread_muted')
          required this.threadMuted,
      @HiveField(8)
      @JsonKey(name: 'emoji_reactions')
          required this.emojiReactions});

  factory _$_PleromaApiStatusPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiStatusPleromaPartFromJson(json);

  @override // a map consisting of alternate representations
// of the content property with
// the key being it's mimetype.
// Currently the only alternate representation supported is text/plain
  @HiveField(0)
  final PleromaApiContentVariants? content;
  @override // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: 'conversation_id')
  @HiveField(1)
  final int? conversationId;
  @override // the ID of the Mastodon direct message conversation the status
// is associated with (if any)
  @HiveField(2)
  @JsonKey(name: 'direct_conversation_id')
  final int? directConversationId;
  @override // the acct property of User entity for replied user (if any)
  @JsonKey(name: 'in_reply_to_account_acct')
  @HiveField(3)
  final String? inReplyToAccountAcct;
  @override
  @HiveField(4)
  final bool? local;
  @override
  @JsonKey(name: 'spoiler_text')
  @HiveField(5)
  final PleromaApiContentVariants? spoilerText;
  @override // a datetime (iso8601) that states when
// the post will expire (be deleted automatically),
// or empty if the post wont expire
  @JsonKey(name: 'expires_at')
  @HiveField(6)
  final DateTime? expiresAt;
  @override
  @HiveField(7)
  @JsonKey(name: 'thread_muted')
  final bool? threadMuted;
  @override // A list with emoji / reaction maps. The format is
// {name: '☕', count: 1, me: true}.
// Contains no information about the reacting users,
// for that use the /statuses/:id/reactions endpoint.
  @HiveField(8)
  @JsonKey(name: 'emoji_reactions')
  final List<PleromaApiStatusEmojiReaction>? emojiReactions;

  @override
  String toString() {
    return 'PleromaApiStatusPleromaPart(content: $content, conversationId: $conversationId, directConversationId: $directConversationId, inReplyToAccountAcct: $inReplyToAccountAcct, local: $local, spoilerText: $spoilerText, expiresAt: $expiresAt, threadMuted: $threadMuted, emojiReactions: $emojiReactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiStatusPleromaPart &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.directConversationId, directConversationId) ||
                other.directConversationId == directConversationId) &&
            (identical(other.inReplyToAccountAcct, inReplyToAccountAcct) ||
                other.inReplyToAccountAcct == inReplyToAccountAcct) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.spoilerText, spoilerText) ||
                other.spoilerText == spoilerText) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.threadMuted, threadMuted) ||
                other.threadMuted == threadMuted) &&
            const DeepCollectionEquality()
                .equals(other.emojiReactions, emojiReactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      content,
      conversationId,
      directConversationId,
      inReplyToAccountAcct,
      local,
      spoilerText,
      expiresAt,
      threadMuted,
      const DeepCollectionEquality().hash(emojiReactions));

  @JsonKey(ignore: true)
  @override
  _$PleromaApiStatusPleromaPartCopyWith<_PleromaApiStatusPleromaPart>
      get copyWith => __$PleromaApiStatusPleromaPartCopyWithImpl<
          _PleromaApiStatusPleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiStatusPleromaPartToJson(this);
  }
}

abstract class _PleromaApiStatusPleromaPart
    implements PleromaApiStatusPleromaPart {
  const factory _PleromaApiStatusPleromaPart(
          {@HiveField(0)
              required PleromaApiContentVariants? content,
          @JsonKey(name: 'conversation_id')
          @HiveField(1)
              required int? conversationId,
          @HiveField(2)
          @JsonKey(name: 'direct_conversation_id')
              required int? directConversationId,
          @JsonKey(name: 'in_reply_to_account_acct')
          @HiveField(3)
              required String? inReplyToAccountAcct,
          @HiveField(4)
              required bool? local,
          @JsonKey(name: 'spoiler_text')
          @HiveField(5)
              required PleromaApiContentVariants? spoilerText,
          @JsonKey(name: 'expires_at')
          @HiveField(6)
              required DateTime? expiresAt,
          @HiveField(7)
          @JsonKey(name: 'thread_muted')
              required bool? threadMuted,
          @HiveField(8)
          @JsonKey(name: 'emoji_reactions')
              required List<PleromaApiStatusEmojiReaction>? emojiReactions}) =
      _$_PleromaApiStatusPleromaPart;

  factory _PleromaApiStatusPleromaPart.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiStatusPleromaPart.fromJson;

  @override // a map consisting of alternate representations
// of the content property with
// the key being it's mimetype.
// Currently the only alternate representation supported is text/plain
  @HiveField(0)
  PleromaApiContentVariants? get content;
  @override // the ID of the AP context the status is associated with (if any)
  @JsonKey(name: 'conversation_id')
  @HiveField(1)
  int? get conversationId;
  @override // the ID of the Mastodon direct message conversation the status
// is associated with (if any)
  @HiveField(2)
  @JsonKey(name: 'direct_conversation_id')
  int? get directConversationId;
  @override // the acct property of User entity for replied user (if any)
  @JsonKey(name: 'in_reply_to_account_acct')
  @HiveField(3)
  String? get inReplyToAccountAcct;
  @override
  @HiveField(4)
  bool? get local;
  @override
  @JsonKey(name: 'spoiler_text')
  @HiveField(5)
  PleromaApiContentVariants? get spoilerText;
  @override // a datetime (iso8601) that states when
// the post will expire (be deleted automatically),
// or empty if the post wont expire
  @JsonKey(name: 'expires_at')
  @HiveField(6)
  DateTime? get expiresAt;
  @override
  @HiveField(7)
  @JsonKey(name: 'thread_muted')
  bool? get threadMuted;
  @override // A list with emoji / reaction maps. The format is
// {name: '☕', count: 1, me: true}.
// Contains no information about the reacting users,
// for that use the /statuses/:id/reactions endpoint.
  @HiveField(8)
  @JsonKey(name: 'emoji_reactions')
  List<PleromaApiStatusEmojiReaction>? get emojiReactions;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiStatusPleromaPartCopyWith<_PleromaApiStatusPleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}
