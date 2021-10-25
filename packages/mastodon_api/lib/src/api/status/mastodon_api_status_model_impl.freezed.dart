// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_status_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiStatus _$MastodonApiStatusFromJson(Map<String, dynamic> json) {
  return _MastodonApiStatus.fromJson(json);
}

/// @nodoc
class _$MastodonApiStatusTearOff {
  const _$MastodonApiStatusTearOff();

  _MastodonApiStatus call(
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
          required MastodonApiStatus? reblog,
      @HiveField(18)
          required MastodonApiApplication? application,
      @HiveField(19)
          required MastodonApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          required List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          required List<MastodonApiMention>? mentions,
      @HiveField(22)
          required List<MastodonApiTag>? tags,
      @HiveField(23)
          required List<MastodonApiEmoji>? emojis,
      @HiveField(24)
          required MastodonApiPoll? poll,
      @HiveField(25)
          required MastodonApiCard? card,
      @HiveField(27)
          required String? language,
      @HiveField(28)
          required String visibility}) {
    return _MastodonApiStatus(
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
      language: language,
      visibility: visibility,
    );
  }

  MastodonApiStatus fromJson(Map<String, Object> json) {
    return MastodonApiStatus.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiStatus = _$MastodonApiStatusTearOff();

/// @nodoc
mixin _$MastodonApiStatus {
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
  MastodonApiStatus? get reblog => throw _privateConstructorUsedError;
  @HiveField(18)
  MastodonApiApplication? get application => throw _privateConstructorUsedError;
  @HiveField(19)
  MastodonApiAccount get account => throw _privateConstructorUsedError;
  @HiveField(20)
  @JsonKey(name: 'media_attachments')
  List<MastodonApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @HiveField(21)
  List<MastodonApiMention>? get mentions => throw _privateConstructorUsedError;
  @HiveField(22)
  List<MastodonApiTag>? get tags => throw _privateConstructorUsedError;
  @HiveField(23)
  List<MastodonApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @HiveField(24)
  MastodonApiPoll? get poll => throw _privateConstructorUsedError;
  @HiveField(25)
  MastodonApiCard? get card => throw _privateConstructorUsedError;
  @HiveField(27)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(28)
  String get visibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiStatusCopyWith<MastodonApiStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiStatusCopyWith<$Res> {
  factory $MastodonApiStatusCopyWith(
          MastodonApiStatus value, $Res Function(MastodonApiStatus) then) =
      _$MastodonApiStatusCopyWithImpl<$Res>;
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
          MastodonApiStatus? reblog,
      @HiveField(18)
          MastodonApiApplication? application,
      @HiveField(19)
          MastodonApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          List<MastodonApiMention>? mentions,
      @HiveField(22)
          List<MastodonApiTag>? tags,
      @HiveField(23)
          List<MastodonApiEmoji>? emojis,
      @HiveField(24)
          MastodonApiPoll? poll,
      @HiveField(25)
          MastodonApiCard? card,
      @HiveField(27)
          String? language,
      @HiveField(28)
          String visibility});

  $MastodonApiStatusCopyWith<$Res>? get reblog;
  $MastodonApiApplicationCopyWith<$Res>? get application;
  $MastodonApiAccountCopyWith<$Res> get account;
  $MastodonApiPollCopyWith<$Res>? get poll;
  $MastodonApiCardCopyWith<$Res>? get card;
}

/// @nodoc
class _$MastodonApiStatusCopyWithImpl<$Res>
    implements $MastodonApiStatusCopyWith<$Res> {
  _$MastodonApiStatusCopyWithImpl(this._value, this._then);

  final MastodonApiStatus _value;
  // ignore: unused_field
  final $Res Function(MastodonApiStatus) _then;

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
              as MastodonApiStatus?,
      application: application == freezed
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as MastodonApiApplication?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMediaAttachment>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMention>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTag>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiEmoji>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as MastodonApiPoll?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as MastodonApiCard?,
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
  $MastodonApiStatusCopyWith<$Res>? get reblog {
    if (_value.reblog == null) {
      return null;
    }

    return $MastodonApiStatusCopyWith<$Res>(_value.reblog!, (value) {
      return _then(_value.copyWith(reblog: value));
    });
  }

  @override
  $MastodonApiApplicationCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $MastodonApiApplicationCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value));
    });
  }

  @override
  $MastodonApiAccountCopyWith<$Res> get account {
    return $MastodonApiAccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $MastodonApiPollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $MastodonApiPollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value));
    });
  }

  @override
  $MastodonApiCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $MastodonApiCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc
abstract class _$MastodonApiStatusCopyWith<$Res>
    implements $MastodonApiStatusCopyWith<$Res> {
  factory _$MastodonApiStatusCopyWith(
          _MastodonApiStatus value, $Res Function(_MastodonApiStatus) then) =
      __$MastodonApiStatusCopyWithImpl<$Res>;
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
          MastodonApiStatus? reblog,
      @HiveField(18)
          MastodonApiApplication? application,
      @HiveField(19)
          MastodonApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          List<MastodonApiMention>? mentions,
      @HiveField(22)
          List<MastodonApiTag>? tags,
      @HiveField(23)
          List<MastodonApiEmoji>? emojis,
      @HiveField(24)
          MastodonApiPoll? poll,
      @HiveField(25)
          MastodonApiCard? card,
      @HiveField(27)
          String? language,
      @HiveField(28)
          String visibility});

  @override
  $MastodonApiStatusCopyWith<$Res>? get reblog;
  @override
  $MastodonApiApplicationCopyWith<$Res>? get application;
  @override
  $MastodonApiAccountCopyWith<$Res> get account;
  @override
  $MastodonApiPollCopyWith<$Res>? get poll;
  @override
  $MastodonApiCardCopyWith<$Res>? get card;
}

/// @nodoc
class __$MastodonApiStatusCopyWithImpl<$Res>
    extends _$MastodonApiStatusCopyWithImpl<$Res>
    implements _$MastodonApiStatusCopyWith<$Res> {
  __$MastodonApiStatusCopyWithImpl(
      _MastodonApiStatus _value, $Res Function(_MastodonApiStatus) _then)
      : super(_value, (v) => _then(v as _MastodonApiStatus));

  @override
  _MastodonApiStatus get _value => super._value as _MastodonApiStatus;

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
    Object? language = freezed,
    Object? visibility = freezed,
  }) {
    return _then(_MastodonApiStatus(
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
              as MastodonApiStatus?,
      application: application == freezed
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as MastodonApiApplication?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as MastodonApiAccount,
      mediaAttachments: mediaAttachments == freezed
          ? _value.mediaAttachments
          : mediaAttachments // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMediaAttachment>?,
      mentions: mentions == freezed
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiMention>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTag>?,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiEmoji>?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as MastodonApiPoll?,
      card: card == freezed
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as MastodonApiCard?,
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
class _$_MastodonApiStatus implements _MastodonApiStatus {
  const _$_MastodonApiStatus(
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
      @HiveField(27)
          required this.language,
      @HiveField(28)
          required this.visibility});

  factory _$_MastodonApiStatus.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiStatusFromJson(json);

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
  final MastodonApiStatus? reblog;
  @override
  @HiveField(18)
  final MastodonApiApplication? application;
  @override
  @HiveField(19)
  final MastodonApiAccount account;
  @override
  @HiveField(20)
  @JsonKey(name: 'media_attachments')
  final List<MastodonApiMediaAttachment>? mediaAttachments;
  @override
  @HiveField(21)
  final List<MastodonApiMention>? mentions;
  @override
  @HiveField(22)
  final List<MastodonApiTag>? tags;
  @override
  @HiveField(23)
  final List<MastodonApiEmoji>? emojis;
  @override
  @HiveField(24)
  final MastodonApiPoll? poll;
  @override
  @HiveField(25)
  final MastodonApiCard? card;
  @override
  @HiveField(27)
  final String? language;
  @override
  @HiveField(28)
  final String visibility;

  @override
  String toString() {
    return 'MastodonApiStatus(id: $id, createdAt: $createdAt, inReplyToId: $inReplyToId, inReplyToAccountId: $inReplyToAccountId, sensitive: $sensitive, spoilerText: $spoilerText, uri: $uri, url: $url, repliesCount: $repliesCount, reblogsCount: $reblogsCount, favouritesCount: $favouritesCount, favourited: $favourited, reblogged: $reblogged, muted: $muted, bookmarked: $bookmarked, pinned: $pinned, content: $content, reblog: $reblog, application: $application, account: $account, mediaAttachments: $mediaAttachments, mentions: $mentions, tags: $tags, emojis: $emojis, poll: $poll, card: $card, language: $language, visibility: $visibility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiStatus &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.inReplyToId, inReplyToId) ||
                const DeepCollectionEquality()
                    .equals(other.inReplyToId, inReplyToId)) &&
            (identical(other.inReplyToAccountId, inReplyToAccountId) ||
                const DeepCollectionEquality()
                    .equals(other.inReplyToAccountId, inReplyToAccountId)) &&
            (identical(other.sensitive, sensitive) ||
                const DeepCollectionEquality()
                    .equals(other.sensitive, sensitive)) &&
            (identical(other.spoilerText, spoilerText) ||
                const DeepCollectionEquality()
                    .equals(other.spoilerText, spoilerText)) &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.repliesCount, repliesCount) ||
                const DeepCollectionEquality()
                    .equals(other.repliesCount, repliesCount)) &&
            (identical(other.reblogsCount, reblogsCount) ||
                const DeepCollectionEquality()
                    .equals(other.reblogsCount, reblogsCount)) &&
            (identical(other.favouritesCount, favouritesCount) ||
                const DeepCollectionEquality()
                    .equals(other.favouritesCount, favouritesCount)) &&
            (identical(other.favourited, favourited) ||
                const DeepCollectionEquality()
                    .equals(other.favourited, favourited)) &&
            (identical(other.reblogged, reblogged) ||
                const DeepCollectionEquality()
                    .equals(other.reblogged, reblogged)) &&
            (identical(other.muted, muted) ||
                const DeepCollectionEquality().equals(other.muted, muted)) &&
            (identical(other.bookmarked, bookmarked) ||
                const DeepCollectionEquality()
                    .equals(other.bookmarked, bookmarked)) &&
            (identical(other.pinned, pinned) ||
                const DeepCollectionEquality().equals(other.pinned, pinned)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.reblog, reblog) ||
                const DeepCollectionEquality().equals(other.reblog, reblog)) &&
            (identical(other.application, application) ||
                const DeepCollectionEquality()
                    .equals(other.application, application)) &&
            (identical(other.account, account) ||
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.mediaAttachments, mediaAttachments) ||
                const DeepCollectionEquality()
                    .equals(other.mediaAttachments, mediaAttachments)) &&
            (identical(other.mentions, mentions) ||
                const DeepCollectionEquality()
                    .equals(other.mentions, mentions)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.emojis, emojis) ||
                const DeepCollectionEquality().equals(other.emojis, emojis)) &&
            (identical(other.poll, poll) ||
                const DeepCollectionEquality().equals(other.poll, poll)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality().equals(other.language, language)) &&
            (identical(other.visibility, visibility) || const DeepCollectionEquality().equals(other.visibility, visibility)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(inReplyToId) ^
      const DeepCollectionEquality().hash(inReplyToAccountId) ^
      const DeepCollectionEquality().hash(sensitive) ^
      const DeepCollectionEquality().hash(spoilerText) ^
      const DeepCollectionEquality().hash(uri) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(repliesCount) ^
      const DeepCollectionEquality().hash(reblogsCount) ^
      const DeepCollectionEquality().hash(favouritesCount) ^
      const DeepCollectionEquality().hash(favourited) ^
      const DeepCollectionEquality().hash(reblogged) ^
      const DeepCollectionEquality().hash(muted) ^
      const DeepCollectionEquality().hash(bookmarked) ^
      const DeepCollectionEquality().hash(pinned) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(reblog) ^
      const DeepCollectionEquality().hash(application) ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(mediaAttachments) ^
      const DeepCollectionEquality().hash(mentions) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(emojis) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(card) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(visibility);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiStatusCopyWith<_MastodonApiStatus> get copyWith =>
      __$MastodonApiStatusCopyWithImpl<_MastodonApiStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiStatusToJson(this);
  }
}

abstract class _MastodonApiStatus implements MastodonApiStatus {
  const factory _MastodonApiStatus(
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
          required MastodonApiStatus? reblog,
      @HiveField(18)
          required MastodonApiApplication? application,
      @HiveField(19)
          required MastodonApiAccount account,
      @HiveField(20)
      @JsonKey(name: 'media_attachments')
          required List<MastodonApiMediaAttachment>? mediaAttachments,
      @HiveField(21)
          required List<MastodonApiMention>? mentions,
      @HiveField(22)
          required List<MastodonApiTag>? tags,
      @HiveField(23)
          required List<MastodonApiEmoji>? emojis,
      @HiveField(24)
          required MastodonApiPoll? poll,
      @HiveField(25)
          required MastodonApiCard? card,
      @HiveField(27)
          required String? language,
      @HiveField(28)
          required String visibility}) = _$_MastodonApiStatus;

  factory _MastodonApiStatus.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiStatus.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'in_reply_to_id')
  String? get inReplyToId => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'in_reply_to_account_id')
  String? get inReplyToAccountId => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool get sensitive => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'spoiler_text')
  String? get spoilerText => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  String get uri => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  String? get url => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  @JsonKey(name: 'replies_count')
  int? get repliesCount => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  @JsonKey(name: 'reblogs_count')
  int? get reblogsCount => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  @JsonKey(name: 'favourites_count')
  int? get favouritesCount => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  bool? get favourited => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  bool? get reblogged => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  bool? get muted => throw _privateConstructorUsedError;
  @override
  @HiveField(14)
  bool? get bookmarked => throw _privateConstructorUsedError;
  @override
  @HiveField(15)
  bool? get pinned => throw _privateConstructorUsedError;
  @override
  @HiveField(16)
  String? get content => throw _privateConstructorUsedError;
  @override
  @HiveField(17)
  MastodonApiStatus? get reblog => throw _privateConstructorUsedError;
  @override
  @HiveField(18)
  MastodonApiApplication? get application => throw _privateConstructorUsedError;
  @override
  @HiveField(19)
  MastodonApiAccount get account => throw _privateConstructorUsedError;
  @override
  @HiveField(20)
  @JsonKey(name: 'media_attachments')
  List<MastodonApiMediaAttachment>? get mediaAttachments =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(21)
  List<MastodonApiMention>? get mentions => throw _privateConstructorUsedError;
  @override
  @HiveField(22)
  List<MastodonApiTag>? get tags => throw _privateConstructorUsedError;
  @override
  @HiveField(23)
  List<MastodonApiEmoji>? get emojis => throw _privateConstructorUsedError;
  @override
  @HiveField(24)
  MastodonApiPoll? get poll => throw _privateConstructorUsedError;
  @override
  @HiveField(25)
  MastodonApiCard? get card => throw _privateConstructorUsedError;
  @override
  @HiveField(27)
  String? get language => throw _privateConstructorUsedError;
  @override
  @HiveField(28)
  String get visibility => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiStatusCopyWith<_MastodonApiStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
