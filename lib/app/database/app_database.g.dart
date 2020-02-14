// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbStatus extends DataClass implements Insertable<DbStatus> {
  final int id;
  final String remoteId;
  final DateTime createdAt;
  final String inReplyToRemoteId;
  final String inReplyToAccountRemoteId;
  final bool sensitive;
  final String spoilerText;
  final String visibility;
  final String uri;
  final String url;
  final int repliesCount;
  final int reblogsCount;
  final int favouritesCount;
  final bool favourited;
  final bool reblogged;
  final bool muted;
  final bool bookmarked;
  final bool pinned;
  final String content;
  final int reblogLocalId;
  final String application;
  final String account;
  final String mediaAttachments;
  final String mentions;
  final String tags;
  final String emojis;
  final String poll;
  DbStatus(
      {@required this.id,
      @required this.remoteId,
      @required this.createdAt,
      @required this.inReplyToRemoteId,
      @required this.inReplyToAccountRemoteId,
      @required this.sensitive,
      @required this.spoilerText,
      @required this.visibility,
      @required this.uri,
      @required this.url,
      @required this.repliesCount,
      @required this.reblogsCount,
      @required this.favouritesCount,
      @required this.favourited,
      @required this.reblogged,
      @required this.muted,
      @required this.bookmarked,
      @required this.pinned,
      @required this.content,
      @required this.reblogLocalId,
      @required this.application,
      @required this.account,
      @required this.mediaAttachments,
      @required this.mentions,
      @required this.tags,
      @required this.emojis,
      @required this.poll});
  factory DbStatus.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return DbStatus(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      inReplyToRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}in_reply_to_remote_id']),
      inReplyToAccountRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}in_reply_to_account_remote_id']),
      sensitive:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}sensitive']),
      spoilerText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}spoiler_text']),
      visibility: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visibility']),
      uri: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uri']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      repliesCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}replies_count']),
      reblogsCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}reblogs_count']),
      favouritesCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}favourites_count']),
      favourited: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}favourited']),
      reblogged:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}reblogged']),
      muted: boolType.mapFromDatabaseResponse(data['${effectivePrefix}muted']),
      bookmarked: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}bookmarked']),
      pinned:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}pinned']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      reblogLocalId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}reblog_local_id']),
      application: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}application']),
      account:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}account']),
      mediaAttachments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}media_attachments']),
      mentions: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mentions']),
      tags: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags']),
      emojis:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emojis']),
      poll: stringType.mapFromDatabaseResponse(data['${effectivePrefix}poll']),
    );
  }
  factory DbStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatus(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      inReplyToRemoteId: serializer.fromJson<String>(json['inReplyToRemoteId']),
      inReplyToAccountRemoteId:
          serializer.fromJson<String>(json['inReplyToAccountRemoteId']),
      sensitive: serializer.fromJson<bool>(json['sensitive']),
      spoilerText: serializer.fromJson<String>(json['spoilerText']),
      visibility: serializer.fromJson<String>(json['visibility']),
      uri: serializer.fromJson<String>(json['uri']),
      url: serializer.fromJson<String>(json['url']),
      repliesCount: serializer.fromJson<int>(json['repliesCount']),
      reblogsCount: serializer.fromJson<int>(json['reblogsCount']),
      favouritesCount: serializer.fromJson<int>(json['favouritesCount']),
      favourited: serializer.fromJson<bool>(json['favourited']),
      reblogged: serializer.fromJson<bool>(json['reblogged']),
      muted: serializer.fromJson<bool>(json['muted']),
      bookmarked: serializer.fromJson<bool>(json['bookmarked']),
      pinned: serializer.fromJson<bool>(json['pinned']),
      content: serializer.fromJson<String>(json['content']),
      reblogLocalId: serializer.fromJson<int>(json['reblogLocalId']),
      application: serializer.fromJson<String>(json['application']),
      account: serializer.fromJson<String>(json['account']),
      mediaAttachments: serializer.fromJson<String>(json['mediaAttachments']),
      mentions: serializer.fromJson<String>(json['mentions']),
      tags: serializer.fromJson<String>(json['tags']),
      emojis: serializer.fromJson<String>(json['emojis']),
      poll: serializer.fromJson<String>(json['poll']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'inReplyToRemoteId': serializer.toJson<String>(inReplyToRemoteId),
      'inReplyToAccountRemoteId':
          serializer.toJson<String>(inReplyToAccountRemoteId),
      'sensitive': serializer.toJson<bool>(sensitive),
      'spoilerText': serializer.toJson<String>(spoilerText),
      'visibility': serializer.toJson<String>(visibility),
      'uri': serializer.toJson<String>(uri),
      'url': serializer.toJson<String>(url),
      'repliesCount': serializer.toJson<int>(repliesCount),
      'reblogsCount': serializer.toJson<int>(reblogsCount),
      'favouritesCount': serializer.toJson<int>(favouritesCount),
      'favourited': serializer.toJson<bool>(favourited),
      'reblogged': serializer.toJson<bool>(reblogged),
      'muted': serializer.toJson<bool>(muted),
      'bookmarked': serializer.toJson<bool>(bookmarked),
      'pinned': serializer.toJson<bool>(pinned),
      'content': serializer.toJson<String>(content),
      'reblogLocalId': serializer.toJson<int>(reblogLocalId),
      'application': serializer.toJson<String>(application),
      'account': serializer.toJson<String>(account),
      'mediaAttachments': serializer.toJson<String>(mediaAttachments),
      'mentions': serializer.toJson<String>(mentions),
      'tags': serializer.toJson<String>(tags),
      'emojis': serializer.toJson<String>(emojis),
      'poll': serializer.toJson<String>(poll),
    };
  }

  @override
  DbStatusesCompanion createCompanion(bool nullToAbsent) {
    return DbStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      inReplyToRemoteId: inReplyToRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(inReplyToRemoteId),
      inReplyToAccountRemoteId: inReplyToAccountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(inReplyToAccountRemoteId),
      sensitive: sensitive == null && nullToAbsent
          ? const Value.absent()
          : Value(sensitive),
      spoilerText: spoilerText == null && nullToAbsent
          ? const Value.absent()
          : Value(spoilerText),
      visibility: visibility == null && nullToAbsent
          ? const Value.absent()
          : Value(visibility),
      uri: uri == null && nullToAbsent ? const Value.absent() : Value(uri),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      repliesCount: repliesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(repliesCount),
      reblogsCount: reblogsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(reblogsCount),
      favouritesCount: favouritesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(favouritesCount),
      favourited: favourited == null && nullToAbsent
          ? const Value.absent()
          : Value(favourited),
      reblogged: reblogged == null && nullToAbsent
          ? const Value.absent()
          : Value(reblogged),
      muted:
          muted == null && nullToAbsent ? const Value.absent() : Value(muted),
      bookmarked: bookmarked == null && nullToAbsent
          ? const Value.absent()
          : Value(bookmarked),
      pinned:
          pinned == null && nullToAbsent ? const Value.absent() : Value(pinned),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      reblogLocalId: reblogLocalId == null && nullToAbsent
          ? const Value.absent()
          : Value(reblogLocalId),
      application: application == null && nullToAbsent
          ? const Value.absent()
          : Value(application),
      account: account == null && nullToAbsent
          ? const Value.absent()
          : Value(account),
      mediaAttachments: mediaAttachments == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaAttachments),
      mentions: mentions == null && nullToAbsent
          ? const Value.absent()
          : Value(mentions),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      emojis:
          emojis == null && nullToAbsent ? const Value.absent() : Value(emojis),
      poll: poll == null && nullToAbsent ? const Value.absent() : Value(poll),
    );
  }

  DbStatus copyWith(
          {int id,
          String remoteId,
          DateTime createdAt,
          String inReplyToRemoteId,
          String inReplyToAccountRemoteId,
          bool sensitive,
          String spoilerText,
          String visibility,
          String uri,
          String url,
          int repliesCount,
          int reblogsCount,
          int favouritesCount,
          bool favourited,
          bool reblogged,
          bool muted,
          bool bookmarked,
          bool pinned,
          String content,
          int reblogLocalId,
          String application,
          String account,
          String mediaAttachments,
          String mentions,
          String tags,
          String emojis,
          String poll}) =>
      DbStatus(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        createdAt: createdAt ?? this.createdAt,
        inReplyToRemoteId: inReplyToRemoteId ?? this.inReplyToRemoteId,
        inReplyToAccountRemoteId:
            inReplyToAccountRemoteId ?? this.inReplyToAccountRemoteId,
        sensitive: sensitive ?? this.sensitive,
        spoilerText: spoilerText ?? this.spoilerText,
        visibility: visibility ?? this.visibility,
        uri: uri ?? this.uri,
        url: url ?? this.url,
        repliesCount: repliesCount ?? this.repliesCount,
        reblogsCount: reblogsCount ?? this.reblogsCount,
        favouritesCount: favouritesCount ?? this.favouritesCount,
        favourited: favourited ?? this.favourited,
        reblogged: reblogged ?? this.reblogged,
        muted: muted ?? this.muted,
        bookmarked: bookmarked ?? this.bookmarked,
        pinned: pinned ?? this.pinned,
        content: content ?? this.content,
        reblogLocalId: reblogLocalId ?? this.reblogLocalId,
        application: application ?? this.application,
        account: account ?? this.account,
        mediaAttachments: mediaAttachments ?? this.mediaAttachments,
        mentions: mentions ?? this.mentions,
        tags: tags ?? this.tags,
        emojis: emojis ?? this.emojis,
        poll: poll ?? this.poll,
      );
  @override
  String toString() {
    return (StringBuffer('DbStatus(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('inReplyToRemoteId: $inReplyToRemoteId, ')
          ..write('inReplyToAccountRemoteId: $inReplyToAccountRemoteId, ')
          ..write('sensitive: $sensitive, ')
          ..write('spoilerText: $spoilerText, ')
          ..write('visibility: $visibility, ')
          ..write('uri: $uri, ')
          ..write('url: $url, ')
          ..write('repliesCount: $repliesCount, ')
          ..write('reblogsCount: $reblogsCount, ')
          ..write('favouritesCount: $favouritesCount, ')
          ..write('favourited: $favourited, ')
          ..write('reblogged: $reblogged, ')
          ..write('muted: $muted, ')
          ..write('bookmarked: $bookmarked, ')
          ..write('pinned: $pinned, ')
          ..write('content: $content, ')
          ..write('reblogLocalId: $reblogLocalId, ')
          ..write('application: $application, ')
          ..write('account: $account, ')
          ..write('mediaAttachments: $mediaAttachments, ')
          ..write('mentions: $mentions, ')
          ..write('tags: $tags, ')
          ..write('emojis: $emojis, ')
          ..write('poll: $poll')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              createdAt.hashCode,
              $mrjc(
                  inReplyToRemoteId.hashCode,
                  $mrjc(
                      inReplyToAccountRemoteId.hashCode,
                      $mrjc(
                          sensitive.hashCode,
                          $mrjc(
                              spoilerText.hashCode,
                              $mrjc(
                                  visibility.hashCode,
                                  $mrjc(
                                      uri.hashCode,
                                      $mrjc(
                                          url.hashCode,
                                          $mrjc(
                                              repliesCount.hashCode,
                                              $mrjc(
                                                  reblogsCount.hashCode,
                                                  $mrjc(
                                                      favouritesCount.hashCode,
                                                      $mrjc(
                                                          favourited.hashCode,
                                                          $mrjc(
                                                              reblogged
                                                                  .hashCode,
                                                              $mrjc(
                                                                  muted
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      bookmarked
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          pinned
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              content.hashCode,
                                                                              $mrjc(reblogLocalId.hashCode, $mrjc(application.hashCode, $mrjc(account.hashCode, $mrjc(mediaAttachments.hashCode, $mrjc(mentions.hashCode, $mrjc(tags.hashCode, $mrjc(emojis.hashCode, poll.hashCode)))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbStatus &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.createdAt == this.createdAt &&
          other.inReplyToRemoteId == this.inReplyToRemoteId &&
          other.inReplyToAccountRemoteId == this.inReplyToAccountRemoteId &&
          other.sensitive == this.sensitive &&
          other.spoilerText == this.spoilerText &&
          other.visibility == this.visibility &&
          other.uri == this.uri &&
          other.url == this.url &&
          other.repliesCount == this.repliesCount &&
          other.reblogsCount == this.reblogsCount &&
          other.favouritesCount == this.favouritesCount &&
          other.favourited == this.favourited &&
          other.reblogged == this.reblogged &&
          other.muted == this.muted &&
          other.bookmarked == this.bookmarked &&
          other.pinned == this.pinned &&
          other.content == this.content &&
          other.reblogLocalId == this.reblogLocalId &&
          other.application == this.application &&
          other.account == this.account &&
          other.mediaAttachments == this.mediaAttachments &&
          other.mentions == this.mentions &&
          other.tags == this.tags &&
          other.emojis == this.emojis &&
          other.poll == this.poll);
}

class DbStatusesCompanion extends UpdateCompanion<DbStatus> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<DateTime> createdAt;
  final Value<String> inReplyToRemoteId;
  final Value<String> inReplyToAccountRemoteId;
  final Value<bool> sensitive;
  final Value<String> spoilerText;
  final Value<String> visibility;
  final Value<String> uri;
  final Value<String> url;
  final Value<int> repliesCount;
  final Value<int> reblogsCount;
  final Value<int> favouritesCount;
  final Value<bool> favourited;
  final Value<bool> reblogged;
  final Value<bool> muted;
  final Value<bool> bookmarked;
  final Value<bool> pinned;
  final Value<String> content;
  final Value<int> reblogLocalId;
  final Value<String> application;
  final Value<String> account;
  final Value<String> mediaAttachments;
  final Value<String> mentions;
  final Value<String> tags;
  final Value<String> emojis;
  final Value<String> poll;
  const DbStatusesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.inReplyToRemoteId = const Value.absent(),
    this.inReplyToAccountRemoteId = const Value.absent(),
    this.sensitive = const Value.absent(),
    this.spoilerText = const Value.absent(),
    this.visibility = const Value.absent(),
    this.uri = const Value.absent(),
    this.url = const Value.absent(),
    this.repliesCount = const Value.absent(),
    this.reblogsCount = const Value.absent(),
    this.favouritesCount = const Value.absent(),
    this.favourited = const Value.absent(),
    this.reblogged = const Value.absent(),
    this.muted = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.pinned = const Value.absent(),
    this.content = const Value.absent(),
    this.reblogLocalId = const Value.absent(),
    this.application = const Value.absent(),
    this.account = const Value.absent(),
    this.mediaAttachments = const Value.absent(),
    this.mentions = const Value.absent(),
    this.tags = const Value.absent(),
    this.emojis = const Value.absent(),
    this.poll = const Value.absent(),
  });
  DbStatusesCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required DateTime createdAt,
    @required String inReplyToRemoteId,
    @required String inReplyToAccountRemoteId,
    @required bool sensitive,
    @required String spoilerText,
    @required String visibility,
    @required String uri,
    @required String url,
    @required int repliesCount,
    @required int reblogsCount,
    @required int favouritesCount,
    @required bool favourited,
    @required bool reblogged,
    @required bool muted,
    @required bool bookmarked,
    @required bool pinned,
    @required String content,
    @required int reblogLocalId,
    @required String application,
    @required String account,
    @required String mediaAttachments,
    @required String mentions,
    @required String tags,
    @required String emojis,
    @required String poll,
  })  : remoteId = Value(remoteId),
        createdAt = Value(createdAt),
        inReplyToRemoteId = Value(inReplyToRemoteId),
        inReplyToAccountRemoteId = Value(inReplyToAccountRemoteId),
        sensitive = Value(sensitive),
        spoilerText = Value(spoilerText),
        visibility = Value(visibility),
        uri = Value(uri),
        url = Value(url),
        repliesCount = Value(repliesCount),
        reblogsCount = Value(reblogsCount),
        favouritesCount = Value(favouritesCount),
        favourited = Value(favourited),
        reblogged = Value(reblogged),
        muted = Value(muted),
        bookmarked = Value(bookmarked),
        pinned = Value(pinned),
        content = Value(content),
        reblogLocalId = Value(reblogLocalId),
        application = Value(application),
        account = Value(account),
        mediaAttachments = Value(mediaAttachments),
        mentions = Value(mentions),
        tags = Value(tags),
        emojis = Value(emojis),
        poll = Value(poll);
  DbStatusesCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<DateTime> createdAt,
      Value<String> inReplyToRemoteId,
      Value<String> inReplyToAccountRemoteId,
      Value<bool> sensitive,
      Value<String> spoilerText,
      Value<String> visibility,
      Value<String> uri,
      Value<String> url,
      Value<int> repliesCount,
      Value<int> reblogsCount,
      Value<int> favouritesCount,
      Value<bool> favourited,
      Value<bool> reblogged,
      Value<bool> muted,
      Value<bool> bookmarked,
      Value<bool> pinned,
      Value<String> content,
      Value<int> reblogLocalId,
      Value<String> application,
      Value<String> account,
      Value<String> mediaAttachments,
      Value<String> mentions,
      Value<String> tags,
      Value<String> emojis,
      Value<String> poll}) {
    return DbStatusesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
      inReplyToRemoteId: inReplyToRemoteId ?? this.inReplyToRemoteId,
      inReplyToAccountRemoteId:
          inReplyToAccountRemoteId ?? this.inReplyToAccountRemoteId,
      sensitive: sensitive ?? this.sensitive,
      spoilerText: spoilerText ?? this.spoilerText,
      visibility: visibility ?? this.visibility,
      uri: uri ?? this.uri,
      url: url ?? this.url,
      repliesCount: repliesCount ?? this.repliesCount,
      reblogsCount: reblogsCount ?? this.reblogsCount,
      favouritesCount: favouritesCount ?? this.favouritesCount,
      favourited: favourited ?? this.favourited,
      reblogged: reblogged ?? this.reblogged,
      muted: muted ?? this.muted,
      bookmarked: bookmarked ?? this.bookmarked,
      pinned: pinned ?? this.pinned,
      content: content ?? this.content,
      reblogLocalId: reblogLocalId ?? this.reblogLocalId,
      application: application ?? this.application,
      account: account ?? this.account,
      mediaAttachments: mediaAttachments ?? this.mediaAttachments,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      emojis: emojis ?? this.emojis,
      poll: poll ?? this.poll,
    );
  }
}

class $DbStatusesTable extends DbStatuses
    with TableInfo<$DbStatusesTable, DbStatus> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbStatusesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn _remoteId;
  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn(
      'remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inReplyToRemoteIdMeta =
      const VerificationMeta('inReplyToRemoteId');
  GeneratedTextColumn _inReplyToRemoteId;
  @override
  GeneratedTextColumn get inReplyToRemoteId =>
      _inReplyToRemoteId ??= _constructInReplyToRemoteId();
  GeneratedTextColumn _constructInReplyToRemoteId() {
    return GeneratedTextColumn(
      'in_reply_to_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inReplyToAccountRemoteIdMeta =
      const VerificationMeta('inReplyToAccountRemoteId');
  GeneratedTextColumn _inReplyToAccountRemoteId;
  @override
  GeneratedTextColumn get inReplyToAccountRemoteId =>
      _inReplyToAccountRemoteId ??= _constructInReplyToAccountRemoteId();
  GeneratedTextColumn _constructInReplyToAccountRemoteId() {
    return GeneratedTextColumn(
      'in_reply_to_account_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sensitiveMeta = const VerificationMeta('sensitive');
  GeneratedBoolColumn _sensitive;
  @override
  GeneratedBoolColumn get sensitive => _sensitive ??= _constructSensitive();
  GeneratedBoolColumn _constructSensitive() {
    return GeneratedBoolColumn(
      'sensitive',
      $tableName,
      false,
    );
  }

  final VerificationMeta _spoilerTextMeta =
      const VerificationMeta('spoilerText');
  GeneratedTextColumn _spoilerText;
  @override
  GeneratedTextColumn get spoilerText =>
      _spoilerText ??= _constructSpoilerText();
  GeneratedTextColumn _constructSpoilerText() {
    return GeneratedTextColumn(
      'spoiler_text',
      $tableName,
      false,
    );
  }

  final VerificationMeta _visibilityMeta = const VerificationMeta('visibility');
  GeneratedTextColumn _visibility;
  @override
  GeneratedTextColumn get visibility => _visibility ??= _constructVisibility();
  GeneratedTextColumn _constructVisibility() {
    return GeneratedTextColumn(
      'visibility',
      $tableName,
      false,
    );
  }

  final VerificationMeta _uriMeta = const VerificationMeta('uri');
  GeneratedTextColumn _uri;
  @override
  GeneratedTextColumn get uri => _uri ??= _constructUri();
  GeneratedTextColumn _constructUri() {
    return GeneratedTextColumn(
      'uri',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _repliesCountMeta =
      const VerificationMeta('repliesCount');
  GeneratedIntColumn _repliesCount;
  @override
  GeneratedIntColumn get repliesCount =>
      _repliesCount ??= _constructRepliesCount();
  GeneratedIntColumn _constructRepliesCount() {
    return GeneratedIntColumn(
      'replies_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reblogsCountMeta =
      const VerificationMeta('reblogsCount');
  GeneratedIntColumn _reblogsCount;
  @override
  GeneratedIntColumn get reblogsCount =>
      _reblogsCount ??= _constructReblogsCount();
  GeneratedIntColumn _constructReblogsCount() {
    return GeneratedIntColumn(
      'reblogs_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _favouritesCountMeta =
      const VerificationMeta('favouritesCount');
  GeneratedIntColumn _favouritesCount;
  @override
  GeneratedIntColumn get favouritesCount =>
      _favouritesCount ??= _constructFavouritesCount();
  GeneratedIntColumn _constructFavouritesCount() {
    return GeneratedIntColumn(
      'favourites_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _favouritedMeta = const VerificationMeta('favourited');
  GeneratedBoolColumn _favourited;
  @override
  GeneratedBoolColumn get favourited => _favourited ??= _constructFavourited();
  GeneratedBoolColumn _constructFavourited() {
    return GeneratedBoolColumn(
      'favourited',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rebloggedMeta = const VerificationMeta('reblogged');
  GeneratedBoolColumn _reblogged;
  @override
  GeneratedBoolColumn get reblogged => _reblogged ??= _constructReblogged();
  GeneratedBoolColumn _constructReblogged() {
    return GeneratedBoolColumn(
      'reblogged',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mutedMeta = const VerificationMeta('muted');
  GeneratedBoolColumn _muted;
  @override
  GeneratedBoolColumn get muted => _muted ??= _constructMuted();
  GeneratedBoolColumn _constructMuted() {
    return GeneratedBoolColumn(
      'muted',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bookmarkedMeta = const VerificationMeta('bookmarked');
  GeneratedBoolColumn _bookmarked;
  @override
  GeneratedBoolColumn get bookmarked => _bookmarked ??= _constructBookmarked();
  GeneratedBoolColumn _constructBookmarked() {
    return GeneratedBoolColumn(
      'bookmarked',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  GeneratedBoolColumn _pinned;
  @override
  GeneratedBoolColumn get pinned => _pinned ??= _constructPinned();
  GeneratedBoolColumn _constructPinned() {
    return GeneratedBoolColumn(
      'pinned',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reblogLocalIdMeta =
      const VerificationMeta('reblogLocalId');
  GeneratedIntColumn _reblogLocalId;
  @override
  GeneratedIntColumn get reblogLocalId =>
      _reblogLocalId ??= _constructReblogLocalId();
  GeneratedIntColumn _constructReblogLocalId() {
    return GeneratedIntColumn(
      'reblog_local_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _applicationMeta =
      const VerificationMeta('application');
  GeneratedTextColumn _application;
  @override
  GeneratedTextColumn get application =>
      _application ??= _constructApplication();
  GeneratedTextColumn _constructApplication() {
    return GeneratedTextColumn(
      'application',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountMeta = const VerificationMeta('account');
  GeneratedTextColumn _account;
  @override
  GeneratedTextColumn get account => _account ??= _constructAccount();
  GeneratedTextColumn _constructAccount() {
    return GeneratedTextColumn(
      'account',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mediaAttachmentsMeta =
      const VerificationMeta('mediaAttachments');
  GeneratedTextColumn _mediaAttachments;
  @override
  GeneratedTextColumn get mediaAttachments =>
      _mediaAttachments ??= _constructMediaAttachments();
  GeneratedTextColumn _constructMediaAttachments() {
    return GeneratedTextColumn(
      'media_attachments',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mentionsMeta = const VerificationMeta('mentions');
  GeneratedTextColumn _mentions;
  @override
  GeneratedTextColumn get mentions => _mentions ??= _constructMentions();
  GeneratedTextColumn _constructMentions() {
    return GeneratedTextColumn(
      'mentions',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  GeneratedTextColumn _tags;
  @override
  GeneratedTextColumn get tags => _tags ??= _constructTags();
  GeneratedTextColumn _constructTags() {
    return GeneratedTextColumn(
      'tags',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emojisMeta = const VerificationMeta('emojis');
  GeneratedTextColumn _emojis;
  @override
  GeneratedTextColumn get emojis => _emojis ??= _constructEmojis();
  GeneratedTextColumn _constructEmojis() {
    return GeneratedTextColumn(
      'emojis',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pollMeta = const VerificationMeta('poll');
  GeneratedTextColumn _poll;
  @override
  GeneratedTextColumn get poll => _poll ??= _constructPoll();
  GeneratedTextColumn _constructPoll() {
    return GeneratedTextColumn(
      'poll',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        createdAt,
        inReplyToRemoteId,
        inReplyToAccountRemoteId,
        sensitive,
        spoilerText,
        visibility,
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
        reblogLocalId,
        application,
        account,
        mediaAttachments,
        mentions,
        tags,
        emojis,
        poll
      ];
  @override
  $DbStatusesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_statuses';
  @override
  final String actualTableName = 'db_statuses';
  @override
  VerificationContext validateIntegrity(DbStatusesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.remoteId.present) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableValue(d.remoteId.value, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.inReplyToRemoteId.present) {
      context.handle(
          _inReplyToRemoteIdMeta,
          inReplyToRemoteId.isAcceptableValue(
              d.inReplyToRemoteId.value, _inReplyToRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_inReplyToRemoteIdMeta);
    }
    if (d.inReplyToAccountRemoteId.present) {
      context.handle(
          _inReplyToAccountRemoteIdMeta,
          inReplyToAccountRemoteId.isAcceptableValue(
              d.inReplyToAccountRemoteId.value, _inReplyToAccountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_inReplyToAccountRemoteIdMeta);
    }
    if (d.sensitive.present) {
      context.handle(_sensitiveMeta,
          sensitive.isAcceptableValue(d.sensitive.value, _sensitiveMeta));
    } else if (isInserting) {
      context.missing(_sensitiveMeta);
    }
    if (d.spoilerText.present) {
      context.handle(_spoilerTextMeta,
          spoilerText.isAcceptableValue(d.spoilerText.value, _spoilerTextMeta));
    } else if (isInserting) {
      context.missing(_spoilerTextMeta);
    }
    if (d.visibility.present) {
      context.handle(_visibilityMeta,
          visibility.isAcceptableValue(d.visibility.value, _visibilityMeta));
    } else if (isInserting) {
      context.missing(_visibilityMeta);
    }
    if (d.uri.present) {
      context.handle(_uriMeta, uri.isAcceptableValue(d.uri.value, _uriMeta));
    } else if (isInserting) {
      context.missing(_uriMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (d.repliesCount.present) {
      context.handle(
          _repliesCountMeta,
          repliesCount.isAcceptableValue(
              d.repliesCount.value, _repliesCountMeta));
    } else if (isInserting) {
      context.missing(_repliesCountMeta);
    }
    if (d.reblogsCount.present) {
      context.handle(
          _reblogsCountMeta,
          reblogsCount.isAcceptableValue(
              d.reblogsCount.value, _reblogsCountMeta));
    } else if (isInserting) {
      context.missing(_reblogsCountMeta);
    }
    if (d.favouritesCount.present) {
      context.handle(
          _favouritesCountMeta,
          favouritesCount.isAcceptableValue(
              d.favouritesCount.value, _favouritesCountMeta));
    } else if (isInserting) {
      context.missing(_favouritesCountMeta);
    }
    if (d.favourited.present) {
      context.handle(_favouritedMeta,
          favourited.isAcceptableValue(d.favourited.value, _favouritedMeta));
    } else if (isInserting) {
      context.missing(_favouritedMeta);
    }
    if (d.reblogged.present) {
      context.handle(_rebloggedMeta,
          reblogged.isAcceptableValue(d.reblogged.value, _rebloggedMeta));
    } else if (isInserting) {
      context.missing(_rebloggedMeta);
    }
    if (d.muted.present) {
      context.handle(
          _mutedMeta, muted.isAcceptableValue(d.muted.value, _mutedMeta));
    } else if (isInserting) {
      context.missing(_mutedMeta);
    }
    if (d.bookmarked.present) {
      context.handle(_bookmarkedMeta,
          bookmarked.isAcceptableValue(d.bookmarked.value, _bookmarkedMeta));
    } else if (isInserting) {
      context.missing(_bookmarkedMeta);
    }
    if (d.pinned.present) {
      context.handle(
          _pinnedMeta, pinned.isAcceptableValue(d.pinned.value, _pinnedMeta));
    } else if (isInserting) {
      context.missing(_pinnedMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (d.reblogLocalId.present) {
      context.handle(
          _reblogLocalIdMeta,
          reblogLocalId.isAcceptableValue(
              d.reblogLocalId.value, _reblogLocalIdMeta));
    } else if (isInserting) {
      context.missing(_reblogLocalIdMeta);
    }
    if (d.application.present) {
      context.handle(_applicationMeta,
          application.isAcceptableValue(d.application.value, _applicationMeta));
    } else if (isInserting) {
      context.missing(_applicationMeta);
    }
    if (d.account.present) {
      context.handle(_accountMeta,
          account.isAcceptableValue(d.account.value, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (d.mediaAttachments.present) {
      context.handle(
          _mediaAttachmentsMeta,
          mediaAttachments.isAcceptableValue(
              d.mediaAttachments.value, _mediaAttachmentsMeta));
    } else if (isInserting) {
      context.missing(_mediaAttachmentsMeta);
    }
    if (d.mentions.present) {
      context.handle(_mentionsMeta,
          mentions.isAcceptableValue(d.mentions.value, _mentionsMeta));
    } else if (isInserting) {
      context.missing(_mentionsMeta);
    }
    if (d.tags.present) {
      context.handle(
          _tagsMeta, tags.isAcceptableValue(d.tags.value, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (d.emojis.present) {
      context.handle(
          _emojisMeta, emojis.isAcceptableValue(d.emojis.value, _emojisMeta));
    } else if (isInserting) {
      context.missing(_emojisMeta);
    }
    if (d.poll.present) {
      context.handle(
          _pollMeta, poll.isAcceptableValue(d.poll.value, _pollMeta));
    } else if (isInserting) {
      context.missing(_pollMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbStatus map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbStatusesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.inReplyToRemoteId.present) {
      map['in_reply_to_remote_id'] =
          Variable<String, StringType>(d.inReplyToRemoteId.value);
    }
    if (d.inReplyToAccountRemoteId.present) {
      map['in_reply_to_account_remote_id'] =
          Variable<String, StringType>(d.inReplyToAccountRemoteId.value);
    }
    if (d.sensitive.present) {
      map['sensitive'] = Variable<bool, BoolType>(d.sensitive.value);
    }
    if (d.spoilerText.present) {
      map['spoiler_text'] = Variable<String, StringType>(d.spoilerText.value);
    }
    if (d.visibility.present) {
      map['visibility'] = Variable<String, StringType>(d.visibility.value);
    }
    if (d.uri.present) {
      map['uri'] = Variable<String, StringType>(d.uri.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.repliesCount.present) {
      map['replies_count'] = Variable<int, IntType>(d.repliesCount.value);
    }
    if (d.reblogsCount.present) {
      map['reblogs_count'] = Variable<int, IntType>(d.reblogsCount.value);
    }
    if (d.favouritesCount.present) {
      map['favourites_count'] = Variable<int, IntType>(d.favouritesCount.value);
    }
    if (d.favourited.present) {
      map['favourited'] = Variable<bool, BoolType>(d.favourited.value);
    }
    if (d.reblogged.present) {
      map['reblogged'] = Variable<bool, BoolType>(d.reblogged.value);
    }
    if (d.muted.present) {
      map['muted'] = Variable<bool, BoolType>(d.muted.value);
    }
    if (d.bookmarked.present) {
      map['bookmarked'] = Variable<bool, BoolType>(d.bookmarked.value);
    }
    if (d.pinned.present) {
      map['pinned'] = Variable<bool, BoolType>(d.pinned.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.reblogLocalId.present) {
      map['reblog_local_id'] = Variable<int, IntType>(d.reblogLocalId.value);
    }
    if (d.application.present) {
      map['application'] = Variable<String, StringType>(d.application.value);
    }
    if (d.account.present) {
      map['account'] = Variable<String, StringType>(d.account.value);
    }
    if (d.mediaAttachments.present) {
      map['media_attachments'] =
          Variable<String, StringType>(d.mediaAttachments.value);
    }
    if (d.mentions.present) {
      map['mentions'] = Variable<String, StringType>(d.mentions.value);
    }
    if (d.tags.present) {
      map['tags'] = Variable<String, StringType>(d.tags.value);
    }
    if (d.emojis.present) {
      map['emojis'] = Variable<String, StringType>(d.emojis.value);
    }
    if (d.poll.present) {
      map['poll'] = Variable<String, StringType>(d.poll.value);
    }
    return map;
  }

  @override
  $DbStatusesTable createAlias(String alias) {
    return $DbStatusesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbStatusesTable _dbStatuses;
  $DbStatusesTable get dbStatuses => _dbStatuses ??= $DbStatusesTable(this);
  StatusDao _statusDao;
  StatusDao get statusDao => _statusDao ??= StatusDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbStatuses];
}
