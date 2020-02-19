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
  final PleromaVisibility visibility;
  final String uri;
  final String url;
  final int repliesCount;
  final int reblogsCount;
  final int favouritesCount;
  final bool favourited;
  final bool reblogged;
  final bool muted;
  final bool bookmarked;
  final String content;
  final PleromaStatus reblog;
  final PleromaApplication application;
  final String accountRemoteId;
  final List<PleromaMediaAttachment> mediaAttachments;
  final List<PleromaMention> mentions;
  final List<PleromaTag> tags;
  final List<PleromaEmoji> emojis;
  final PleromaPoll poll;
  final PleromaCard card;
  final String language;
  final PleromaContent pleromaContent;
  final int pleromaConversationId;
  final int pleromaDirectConversationId;
  final String pleromaInReplyToAccountAcct;
  final bool pleromaLocal;
  final PleromaContent pleromaSpoilerText;
  final DateTime pleromaExpiresAt;
  final bool pleromaThreadMuted;
  final List<PleromaEmojiReactions> pleromaEmojiReactions;
  DbStatus(
      {@required this.id,
      @required this.remoteId,
      @required this.createdAt,
      this.inReplyToRemoteId,
      this.inReplyToAccountRemoteId,
      @required this.sensitive,
      @required this.spoilerText,
      this.visibility,
      @required this.uri,
      this.url,
      @required this.repliesCount,
      @required this.reblogsCount,
      @required this.favouritesCount,
      @required this.favourited,
      @required this.reblogged,
      @required this.muted,
      @required this.bookmarked,
      this.content,
      this.reblog,
      @required this.application,
      @required this.accountRemoteId,
      this.mediaAttachments,
      this.mentions,
      this.tags,
      this.emojis,
      this.poll,
      this.card,
      this.language,
      this.pleromaContent,
      this.pleromaConversationId,
      this.pleromaDirectConversationId,
      this.pleromaInReplyToAccountAcct,
      this.pleromaLocal,
      this.pleromaSpoilerText,
      this.pleromaExpiresAt,
      this.pleromaThreadMuted,
      this.pleromaEmojiReactions});
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
      visibility: $DbStatusesTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}visibility'])),
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
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      reblog: $DbStatusesTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}reblog'])),
      application: $DbStatusesTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}application'])),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      mediaAttachments: $DbStatusesTable.$converter3.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachments'])),
      mentions: $DbStatusesTable.$converter4.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mentions'])),
      tags: $DbStatusesTable.$converter5.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags'])),
      emojis: $DbStatusesTable.$converter6.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      poll: $DbStatusesTable.$converter7.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}poll'])),
      card: $DbStatusesTable.$converter8.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}card'])),
      language: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
      pleromaContent: $DbStatusesTable.$converter9.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_content'])),
      pleromaConversationId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_conversation_id']),
      pleromaDirectConversationId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_direct_conversation_id']),
      pleromaInReplyToAccountAcct: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_in_reply_to_account_acct']),
      pleromaLocal: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_local']),
      pleromaSpoilerText: $DbStatusesTable.$converter10.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_spoiler_text'])),
      pleromaExpiresAt: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_expires_at']),
      pleromaThreadMuted: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_thread_muted']),
      pleromaEmojiReactions: $DbStatusesTable.$converter11.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_emoji_reactions'])),
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
      visibility: serializer.fromJson<PleromaVisibility>(json['visibility']),
      uri: serializer.fromJson<String>(json['uri']),
      url: serializer.fromJson<String>(json['url']),
      repliesCount: serializer.fromJson<int>(json['repliesCount']),
      reblogsCount: serializer.fromJson<int>(json['reblogsCount']),
      favouritesCount: serializer.fromJson<int>(json['favouritesCount']),
      favourited: serializer.fromJson<bool>(json['favourited']),
      reblogged: serializer.fromJson<bool>(json['reblogged']),
      muted: serializer.fromJson<bool>(json['muted']),
      bookmarked: serializer.fromJson<bool>(json['bookmarked']),
      content: serializer.fromJson<String>(json['content']),
      reblog: serializer.fromJson<PleromaStatus>(json['reblog']),
      application: serializer.fromJson<PleromaApplication>(json['application']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      mediaAttachments: serializer
          .fromJson<List<PleromaMediaAttachment>>(json['mediaAttachments']),
      mentions: serializer.fromJson<List<PleromaMention>>(json['mentions']),
      tags: serializer.fromJson<List<PleromaTag>>(json['tags']),
      emojis: serializer.fromJson<List<PleromaEmoji>>(json['emojis']),
      poll: serializer.fromJson<PleromaPoll>(json['poll']),
      card: serializer.fromJson<PleromaCard>(json['card']),
      language: serializer.fromJson<String>(json['language']),
      pleromaContent:
          serializer.fromJson<PleromaContent>(json['pleromaContent']),
      pleromaConversationId:
          serializer.fromJson<int>(json['pleromaConversationId']),
      pleromaDirectConversationId:
          serializer.fromJson<int>(json['pleromaDirectConversationId']),
      pleromaInReplyToAccountAcct:
          serializer.fromJson<String>(json['pleromaInReplyToAccountAcct']),
      pleromaLocal: serializer.fromJson<bool>(json['pleromaLocal']),
      pleromaSpoilerText:
          serializer.fromJson<PleromaContent>(json['pleromaSpoilerText']),
      pleromaExpiresAt: serializer.fromJson<DateTime>(json['pleromaExpiresAt']),
      pleromaThreadMuted: serializer.fromJson<bool>(json['pleromaThreadMuted']),
      pleromaEmojiReactions: serializer
          .fromJson<List<PleromaEmojiReactions>>(json['pleromaEmojiReactions']),
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
      'visibility': serializer.toJson<PleromaVisibility>(visibility),
      'uri': serializer.toJson<String>(uri),
      'url': serializer.toJson<String>(url),
      'repliesCount': serializer.toJson<int>(repliesCount),
      'reblogsCount': serializer.toJson<int>(reblogsCount),
      'favouritesCount': serializer.toJson<int>(favouritesCount),
      'favourited': serializer.toJson<bool>(favourited),
      'reblogged': serializer.toJson<bool>(reblogged),
      'muted': serializer.toJson<bool>(muted),
      'bookmarked': serializer.toJson<bool>(bookmarked),
      'content': serializer.toJson<String>(content),
      'reblog': serializer.toJson<PleromaStatus>(reblog),
      'application': serializer.toJson<PleromaApplication>(application),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'mediaAttachments':
          serializer.toJson<List<PleromaMediaAttachment>>(mediaAttachments),
      'mentions': serializer.toJson<List<PleromaMention>>(mentions),
      'tags': serializer.toJson<List<PleromaTag>>(tags),
      'emojis': serializer.toJson<List<PleromaEmoji>>(emojis),
      'poll': serializer.toJson<PleromaPoll>(poll),
      'card': serializer.toJson<PleromaCard>(card),
      'language': serializer.toJson<String>(language),
      'pleromaContent': serializer.toJson<PleromaContent>(pleromaContent),
      'pleromaConversationId': serializer.toJson<int>(pleromaConversationId),
      'pleromaDirectConversationId':
          serializer.toJson<int>(pleromaDirectConversationId),
      'pleromaInReplyToAccountAcct':
          serializer.toJson<String>(pleromaInReplyToAccountAcct),
      'pleromaLocal': serializer.toJson<bool>(pleromaLocal),
      'pleromaSpoilerText':
          serializer.toJson<PleromaContent>(pleromaSpoilerText),
      'pleromaExpiresAt': serializer.toJson<DateTime>(pleromaExpiresAt),
      'pleromaThreadMuted': serializer.toJson<bool>(pleromaThreadMuted),
      'pleromaEmojiReactions':
          serializer.toJson<List<PleromaEmojiReactions>>(pleromaEmojiReactions),
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
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      reblog:
          reblog == null && nullToAbsent ? const Value.absent() : Value(reblog),
      application: application == null && nullToAbsent
          ? const Value.absent()
          : Value(application),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
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
      card: card == null && nullToAbsent ? const Value.absent() : Value(card),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      pleromaContent: pleromaContent == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaContent),
      pleromaConversationId: pleromaConversationId == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaConversationId),
      pleromaDirectConversationId:
          pleromaDirectConversationId == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaDirectConversationId),
      pleromaInReplyToAccountAcct:
          pleromaInReplyToAccountAcct == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaInReplyToAccountAcct),
      pleromaLocal: pleromaLocal == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaLocal),
      pleromaSpoilerText: pleromaSpoilerText == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaSpoilerText),
      pleromaExpiresAt: pleromaExpiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaExpiresAt),
      pleromaThreadMuted: pleromaThreadMuted == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaThreadMuted),
      pleromaEmojiReactions: pleromaEmojiReactions == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaEmojiReactions),
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
          PleromaVisibility visibility,
          String uri,
          String url,
          int repliesCount,
          int reblogsCount,
          int favouritesCount,
          bool favourited,
          bool reblogged,
          bool muted,
          bool bookmarked,
          String content,
          PleromaStatus reblog,
          PleromaApplication application,
          String accountRemoteId,
          List<PleromaMediaAttachment> mediaAttachments,
          List<PleromaMention> mentions,
          List<PleromaTag> tags,
          List<PleromaEmoji> emojis,
          PleromaPoll poll,
          PleromaCard card,
          String language,
          PleromaContent pleromaContent,
          int pleromaConversationId,
          int pleromaDirectConversationId,
          String pleromaInReplyToAccountAcct,
          bool pleromaLocal,
          PleromaContent pleromaSpoilerText,
          DateTime pleromaExpiresAt,
          bool pleromaThreadMuted,
          List<PleromaEmojiReactions> pleromaEmojiReactions}) =>
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
        content: content ?? this.content,
        reblog: reblog ?? this.reblog,
        application: application ?? this.application,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        mediaAttachments: mediaAttachments ?? this.mediaAttachments,
        mentions: mentions ?? this.mentions,
        tags: tags ?? this.tags,
        emojis: emojis ?? this.emojis,
        poll: poll ?? this.poll,
        card: card ?? this.card,
        language: language ?? this.language,
        pleromaContent: pleromaContent ?? this.pleromaContent,
        pleromaConversationId:
            pleromaConversationId ?? this.pleromaConversationId,
        pleromaDirectConversationId:
            pleromaDirectConversationId ?? this.pleromaDirectConversationId,
        pleromaInReplyToAccountAcct:
            pleromaInReplyToAccountAcct ?? this.pleromaInReplyToAccountAcct,
        pleromaLocal: pleromaLocal ?? this.pleromaLocal,
        pleromaSpoilerText: pleromaSpoilerText ?? this.pleromaSpoilerText,
        pleromaExpiresAt: pleromaExpiresAt ?? this.pleromaExpiresAt,
        pleromaThreadMuted: pleromaThreadMuted ?? this.pleromaThreadMuted,
        pleromaEmojiReactions:
            pleromaEmojiReactions ?? this.pleromaEmojiReactions,
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
          ..write('content: $content, ')
          ..write('reblog: $reblog, ')
          ..write('application: $application, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('mediaAttachments: $mediaAttachments, ')
          ..write('mentions: $mentions, ')
          ..write('tags: $tags, ')
          ..write('emojis: $emojis, ')
          ..write('poll: $poll, ')
          ..write('card: $card, ')
          ..write('language: $language, ')
          ..write('pleromaContent: $pleromaContent, ')
          ..write('pleromaConversationId: $pleromaConversationId, ')
          ..write('pleromaDirectConversationId: $pleromaDirectConversationId, ')
          ..write('pleromaInReplyToAccountAcct: $pleromaInReplyToAccountAcct, ')
          ..write('pleromaLocal: $pleromaLocal, ')
          ..write('pleromaSpoilerText: $pleromaSpoilerText, ')
          ..write('pleromaExpiresAt: $pleromaExpiresAt, ')
          ..write('pleromaThreadMuted: $pleromaThreadMuted, ')
          ..write('pleromaEmojiReactions: $pleromaEmojiReactions')
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
                                                                          content
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              reblog.hashCode,
                                                                              $mrjc(application.hashCode, $mrjc(accountRemoteId.hashCode, $mrjc(mediaAttachments.hashCode, $mrjc(mentions.hashCode, $mrjc(tags.hashCode, $mrjc(emojis.hashCode, $mrjc(poll.hashCode, $mrjc(card.hashCode, $mrjc(language.hashCode, $mrjc(pleromaContent.hashCode, $mrjc(pleromaConversationId.hashCode, $mrjc(pleromaDirectConversationId.hashCode, $mrjc(pleromaInReplyToAccountAcct.hashCode, $mrjc(pleromaLocal.hashCode, $mrjc(pleromaSpoilerText.hashCode, $mrjc(pleromaExpiresAt.hashCode, $mrjc(pleromaThreadMuted.hashCode, pleromaEmojiReactions.hashCode)))))))))))))))))))))))))))))))))))));
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
          other.content == this.content &&
          other.reblog == this.reblog &&
          other.application == this.application &&
          other.accountRemoteId == this.accountRemoteId &&
          other.mediaAttachments == this.mediaAttachments &&
          other.mentions == this.mentions &&
          other.tags == this.tags &&
          other.emojis == this.emojis &&
          other.poll == this.poll &&
          other.card == this.card &&
          other.language == this.language &&
          other.pleromaContent == this.pleromaContent &&
          other.pleromaConversationId == this.pleromaConversationId &&
          other.pleromaDirectConversationId ==
              this.pleromaDirectConversationId &&
          other.pleromaInReplyToAccountAcct ==
              this.pleromaInReplyToAccountAcct &&
          other.pleromaLocal == this.pleromaLocal &&
          other.pleromaSpoilerText == this.pleromaSpoilerText &&
          other.pleromaExpiresAt == this.pleromaExpiresAt &&
          other.pleromaThreadMuted == this.pleromaThreadMuted &&
          other.pleromaEmojiReactions == this.pleromaEmojiReactions);
}

class DbStatusesCompanion extends UpdateCompanion<DbStatus> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<DateTime> createdAt;
  final Value<String> inReplyToRemoteId;
  final Value<String> inReplyToAccountRemoteId;
  final Value<bool> sensitive;
  final Value<String> spoilerText;
  final Value<PleromaVisibility> visibility;
  final Value<String> uri;
  final Value<String> url;
  final Value<int> repliesCount;
  final Value<int> reblogsCount;
  final Value<int> favouritesCount;
  final Value<bool> favourited;
  final Value<bool> reblogged;
  final Value<bool> muted;
  final Value<bool> bookmarked;
  final Value<String> content;
  final Value<PleromaStatus> reblog;
  final Value<PleromaApplication> application;
  final Value<String> accountRemoteId;
  final Value<List<PleromaMediaAttachment>> mediaAttachments;
  final Value<List<PleromaMention>> mentions;
  final Value<List<PleromaTag>> tags;
  final Value<List<PleromaEmoji>> emojis;
  final Value<PleromaPoll> poll;
  final Value<PleromaCard> card;
  final Value<String> language;
  final Value<PleromaContent> pleromaContent;
  final Value<int> pleromaConversationId;
  final Value<int> pleromaDirectConversationId;
  final Value<String> pleromaInReplyToAccountAcct;
  final Value<bool> pleromaLocal;
  final Value<PleromaContent> pleromaSpoilerText;
  final Value<DateTime> pleromaExpiresAt;
  final Value<bool> pleromaThreadMuted;
  final Value<List<PleromaEmojiReactions>> pleromaEmojiReactions;
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
    this.content = const Value.absent(),
    this.reblog = const Value.absent(),
    this.application = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.mediaAttachments = const Value.absent(),
    this.mentions = const Value.absent(),
    this.tags = const Value.absent(),
    this.emojis = const Value.absent(),
    this.poll = const Value.absent(),
    this.card = const Value.absent(),
    this.language = const Value.absent(),
    this.pleromaContent = const Value.absent(),
    this.pleromaConversationId = const Value.absent(),
    this.pleromaDirectConversationId = const Value.absent(),
    this.pleromaInReplyToAccountAcct = const Value.absent(),
    this.pleromaLocal = const Value.absent(),
    this.pleromaSpoilerText = const Value.absent(),
    this.pleromaExpiresAt = const Value.absent(),
    this.pleromaThreadMuted = const Value.absent(),
    this.pleromaEmojiReactions = const Value.absent(),
  });
  DbStatusesCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required DateTime createdAt,
    this.inReplyToRemoteId = const Value.absent(),
    this.inReplyToAccountRemoteId = const Value.absent(),
    @required bool sensitive,
    @required String spoilerText,
    this.visibility = const Value.absent(),
    @required String uri,
    this.url = const Value.absent(),
    @required int repliesCount,
    @required int reblogsCount,
    @required int favouritesCount,
    @required bool favourited,
    @required bool reblogged,
    @required bool muted,
    @required bool bookmarked,
    this.content = const Value.absent(),
    this.reblog = const Value.absent(),
    @required PleromaApplication application,
    @required String accountRemoteId,
    this.mediaAttachments = const Value.absent(),
    this.mentions = const Value.absent(),
    this.tags = const Value.absent(),
    this.emojis = const Value.absent(),
    this.poll = const Value.absent(),
    this.card = const Value.absent(),
    this.language = const Value.absent(),
    this.pleromaContent = const Value.absent(),
    this.pleromaConversationId = const Value.absent(),
    this.pleromaDirectConversationId = const Value.absent(),
    this.pleromaInReplyToAccountAcct = const Value.absent(),
    this.pleromaLocal = const Value.absent(),
    this.pleromaSpoilerText = const Value.absent(),
    this.pleromaExpiresAt = const Value.absent(),
    this.pleromaThreadMuted = const Value.absent(),
    this.pleromaEmojiReactions = const Value.absent(),
  })  : remoteId = Value(remoteId),
        createdAt = Value(createdAt),
        sensitive = Value(sensitive),
        spoilerText = Value(spoilerText),
        uri = Value(uri),
        repliesCount = Value(repliesCount),
        reblogsCount = Value(reblogsCount),
        favouritesCount = Value(favouritesCount),
        favourited = Value(favourited),
        reblogged = Value(reblogged),
        muted = Value(muted),
        bookmarked = Value(bookmarked),
        application = Value(application),
        accountRemoteId = Value(accountRemoteId);
  DbStatusesCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<DateTime> createdAt,
      Value<String> inReplyToRemoteId,
      Value<String> inReplyToAccountRemoteId,
      Value<bool> sensitive,
      Value<String> spoilerText,
      Value<PleromaVisibility> visibility,
      Value<String> uri,
      Value<String> url,
      Value<int> repliesCount,
      Value<int> reblogsCount,
      Value<int> favouritesCount,
      Value<bool> favourited,
      Value<bool> reblogged,
      Value<bool> muted,
      Value<bool> bookmarked,
      Value<String> content,
      Value<PleromaStatus> reblog,
      Value<PleromaApplication> application,
      Value<String> accountRemoteId,
      Value<List<PleromaMediaAttachment>> mediaAttachments,
      Value<List<PleromaMention>> mentions,
      Value<List<PleromaTag>> tags,
      Value<List<PleromaEmoji>> emojis,
      Value<PleromaPoll> poll,
      Value<PleromaCard> card,
      Value<String> language,
      Value<PleromaContent> pleromaContent,
      Value<int> pleromaConversationId,
      Value<int> pleromaDirectConversationId,
      Value<String> pleromaInReplyToAccountAcct,
      Value<bool> pleromaLocal,
      Value<PleromaContent> pleromaSpoilerText,
      Value<DateTime> pleromaExpiresAt,
      Value<bool> pleromaThreadMuted,
      Value<List<PleromaEmojiReactions>> pleromaEmojiReactions}) {
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
      content: content ?? this.content,
      reblog: reblog ?? this.reblog,
      application: application ?? this.application,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      mediaAttachments: mediaAttachments ?? this.mediaAttachments,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      emojis: emojis ?? this.emojis,
      poll: poll ?? this.poll,
      card: card ?? this.card,
      language: language ?? this.language,
      pleromaContent: pleromaContent ?? this.pleromaContent,
      pleromaConversationId:
          pleromaConversationId ?? this.pleromaConversationId,
      pleromaDirectConversationId:
          pleromaDirectConversationId ?? this.pleromaDirectConversationId,
      pleromaInReplyToAccountAcct:
          pleromaInReplyToAccountAcct ?? this.pleromaInReplyToAccountAcct,
      pleromaLocal: pleromaLocal ?? this.pleromaLocal,
      pleromaSpoilerText: pleromaSpoilerText ?? this.pleromaSpoilerText,
      pleromaExpiresAt: pleromaExpiresAt ?? this.pleromaExpiresAt,
      pleromaThreadMuted: pleromaThreadMuted ?? this.pleromaThreadMuted,
      pleromaEmojiReactions:
          pleromaEmojiReactions ?? this.pleromaEmojiReactions,
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
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
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
      true,
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
      true,
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
      true,
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
      true,
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

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _reblogMeta = const VerificationMeta('reblog');
  GeneratedTextColumn _reblog;
  @override
  GeneratedTextColumn get reblog => _reblog ??= _constructReblog();
  GeneratedTextColumn _constructReblog() {
    return GeneratedTextColumn(
      'reblog',
      $tableName,
      true,
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

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  GeneratedTextColumn _accountRemoteId;
  @override
  GeneratedTextColumn get accountRemoteId =>
      _accountRemoteId ??= _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn(
      'account_remote_id',
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
      true,
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
      true,
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
      true,
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
      true,
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
      true,
    );
  }

  final VerificationMeta _cardMeta = const VerificationMeta('card');
  GeneratedTextColumn _card;
  @override
  GeneratedTextColumn get card => _card ??= _constructCard();
  GeneratedTextColumn _constructCard() {
    return GeneratedTextColumn(
      'card',
      $tableName,
      true,
    );
  }

  final VerificationMeta _languageMeta = const VerificationMeta('language');
  GeneratedTextColumn _language;
  @override
  GeneratedTextColumn get language => _language ??= _constructLanguage();
  GeneratedTextColumn _constructLanguage() {
    return GeneratedTextColumn(
      'language',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaContentMeta =
      const VerificationMeta('pleromaContent');
  GeneratedTextColumn _pleromaContent;
  @override
  GeneratedTextColumn get pleromaContent =>
      _pleromaContent ??= _constructPleromaContent();
  GeneratedTextColumn _constructPleromaContent() {
    return GeneratedTextColumn(
      'pleroma_content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaConversationIdMeta =
      const VerificationMeta('pleromaConversationId');
  GeneratedIntColumn _pleromaConversationId;
  @override
  GeneratedIntColumn get pleromaConversationId =>
      _pleromaConversationId ??= _constructPleromaConversationId();
  GeneratedIntColumn _constructPleromaConversationId() {
    return GeneratedIntColumn(
      'pleroma_conversation_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaDirectConversationIdMeta =
      const VerificationMeta('pleromaDirectConversationId');
  GeneratedIntColumn _pleromaDirectConversationId;
  @override
  GeneratedIntColumn get pleromaDirectConversationId =>
      _pleromaDirectConversationId ??= _constructPleromaDirectConversationId();
  GeneratedIntColumn _constructPleromaDirectConversationId() {
    return GeneratedIntColumn(
      'pleroma_direct_conversation_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaInReplyToAccountAcctMeta =
      const VerificationMeta('pleromaInReplyToAccountAcct');
  GeneratedTextColumn _pleromaInReplyToAccountAcct;
  @override
  GeneratedTextColumn get pleromaInReplyToAccountAcct =>
      _pleromaInReplyToAccountAcct ??= _constructPleromaInReplyToAccountAcct();
  GeneratedTextColumn _constructPleromaInReplyToAccountAcct() {
    return GeneratedTextColumn(
      'pleroma_in_reply_to_account_acct',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaLocalMeta =
      const VerificationMeta('pleromaLocal');
  GeneratedBoolColumn _pleromaLocal;
  @override
  GeneratedBoolColumn get pleromaLocal =>
      _pleromaLocal ??= _constructPleromaLocal();
  GeneratedBoolColumn _constructPleromaLocal() {
    return GeneratedBoolColumn(
      'pleroma_local',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaSpoilerTextMeta =
      const VerificationMeta('pleromaSpoilerText');
  GeneratedTextColumn _pleromaSpoilerText;
  @override
  GeneratedTextColumn get pleromaSpoilerText =>
      _pleromaSpoilerText ??= _constructPleromaSpoilerText();
  GeneratedTextColumn _constructPleromaSpoilerText() {
    return GeneratedTextColumn(
      'pleroma_spoiler_text',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaExpiresAtMeta =
      const VerificationMeta('pleromaExpiresAt');
  GeneratedDateTimeColumn _pleromaExpiresAt;
  @override
  GeneratedDateTimeColumn get pleromaExpiresAt =>
      _pleromaExpiresAt ??= _constructPleromaExpiresAt();
  GeneratedDateTimeColumn _constructPleromaExpiresAt() {
    return GeneratedDateTimeColumn(
      'pleroma_expires_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaThreadMutedMeta =
      const VerificationMeta('pleromaThreadMuted');
  GeneratedBoolColumn _pleromaThreadMuted;
  @override
  GeneratedBoolColumn get pleromaThreadMuted =>
      _pleromaThreadMuted ??= _constructPleromaThreadMuted();
  GeneratedBoolColumn _constructPleromaThreadMuted() {
    return GeneratedBoolColumn(
      'pleroma_thread_muted',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaEmojiReactionsMeta =
      const VerificationMeta('pleromaEmojiReactions');
  GeneratedTextColumn _pleromaEmojiReactions;
  @override
  GeneratedTextColumn get pleromaEmojiReactions =>
      _pleromaEmojiReactions ??= _constructPleromaEmojiReactions();
  GeneratedTextColumn _constructPleromaEmojiReactions() {
    return GeneratedTextColumn(
      'pleroma_emoji_reactions',
      $tableName,
      true,
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
        content,
        reblog,
        application,
        accountRemoteId,
        mediaAttachments,
        mentions,
        tags,
        emojis,
        poll,
        card,
        language,
        pleromaContent,
        pleromaConversationId,
        pleromaDirectConversationId,
        pleromaInReplyToAccountAcct,
        pleromaLocal,
        pleromaSpoilerText,
        pleromaExpiresAt,
        pleromaThreadMuted,
        pleromaEmojiReactions
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
    }
    if (d.inReplyToAccountRemoteId.present) {
      context.handle(
          _inReplyToAccountRemoteIdMeta,
          inReplyToAccountRemoteId.isAcceptableValue(
              d.inReplyToAccountRemoteId.value, _inReplyToAccountRemoteIdMeta));
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
    context.handle(_visibilityMeta, const VerificationResult.success());
    if (d.uri.present) {
      context.handle(_uriMeta, uri.isAcceptableValue(d.uri.value, _uriMeta));
    } else if (isInserting) {
      context.missing(_uriMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
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
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    }
    context.handle(_reblogMeta, const VerificationResult.success());
    context.handle(_applicationMeta, const VerificationResult.success());
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    context.handle(_mediaAttachmentsMeta, const VerificationResult.success());
    context.handle(_mentionsMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_emojisMeta, const VerificationResult.success());
    context.handle(_pollMeta, const VerificationResult.success());
    context.handle(_cardMeta, const VerificationResult.success());
    if (d.language.present) {
      context.handle(_languageMeta,
          language.isAcceptableValue(d.language.value, _languageMeta));
    }
    context.handle(_pleromaContentMeta, const VerificationResult.success());
    if (d.pleromaConversationId.present) {
      context.handle(
          _pleromaConversationIdMeta,
          pleromaConversationId.isAcceptableValue(
              d.pleromaConversationId.value, _pleromaConversationIdMeta));
    }
    if (d.pleromaDirectConversationId.present) {
      context.handle(
          _pleromaDirectConversationIdMeta,
          pleromaDirectConversationId.isAcceptableValue(
              d.pleromaDirectConversationId.value,
              _pleromaDirectConversationIdMeta));
    }
    if (d.pleromaInReplyToAccountAcct.present) {
      context.handle(
          _pleromaInReplyToAccountAcctMeta,
          pleromaInReplyToAccountAcct.isAcceptableValue(
              d.pleromaInReplyToAccountAcct.value,
              _pleromaInReplyToAccountAcctMeta));
    }
    if (d.pleromaLocal.present) {
      context.handle(
          _pleromaLocalMeta,
          pleromaLocal.isAcceptableValue(
              d.pleromaLocal.value, _pleromaLocalMeta));
    }
    context.handle(_pleromaSpoilerTextMeta, const VerificationResult.success());
    if (d.pleromaExpiresAt.present) {
      context.handle(
          _pleromaExpiresAtMeta,
          pleromaExpiresAt.isAcceptableValue(
              d.pleromaExpiresAt.value, _pleromaExpiresAtMeta));
    }
    if (d.pleromaThreadMuted.present) {
      context.handle(
          _pleromaThreadMutedMeta,
          pleromaThreadMuted.isAcceptableValue(
              d.pleromaThreadMuted.value, _pleromaThreadMutedMeta));
    }
    context.handle(
        _pleromaEmojiReactionsMeta, const VerificationResult.success());
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
      final converter = $DbStatusesTable.$converter0;
      map['visibility'] =
          Variable<String, StringType>(converter.mapToSql(d.visibility.value));
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
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.reblog.present) {
      final converter = $DbStatusesTable.$converter1;
      map['reblog'] =
          Variable<String, StringType>(converter.mapToSql(d.reblog.value));
    }
    if (d.application.present) {
      final converter = $DbStatusesTable.$converter2;
      map['application'] =
          Variable<String, StringType>(converter.mapToSql(d.application.value));
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.mediaAttachments.present) {
      final converter = $DbStatusesTable.$converter3;
      map['media_attachments'] = Variable<String, StringType>(
          converter.mapToSql(d.mediaAttachments.value));
    }
    if (d.mentions.present) {
      final converter = $DbStatusesTable.$converter4;
      map['mentions'] =
          Variable<String, StringType>(converter.mapToSql(d.mentions.value));
    }
    if (d.tags.present) {
      final converter = $DbStatusesTable.$converter5;
      map['tags'] =
          Variable<String, StringType>(converter.mapToSql(d.tags.value));
    }
    if (d.emojis.present) {
      final converter = $DbStatusesTable.$converter6;
      map['emojis'] =
          Variable<String, StringType>(converter.mapToSql(d.emojis.value));
    }
    if (d.poll.present) {
      final converter = $DbStatusesTable.$converter7;
      map['poll'] =
          Variable<String, StringType>(converter.mapToSql(d.poll.value));
    }
    if (d.card.present) {
      final converter = $DbStatusesTable.$converter8;
      map['card'] =
          Variable<String, StringType>(converter.mapToSql(d.card.value));
    }
    if (d.language.present) {
      map['language'] = Variable<String, StringType>(d.language.value);
    }
    if (d.pleromaContent.present) {
      final converter = $DbStatusesTable.$converter9;
      map['pleroma_content'] = Variable<String, StringType>(
          converter.mapToSql(d.pleromaContent.value));
    }
    if (d.pleromaConversationId.present) {
      map['pleroma_conversation_id'] =
          Variable<int, IntType>(d.pleromaConversationId.value);
    }
    if (d.pleromaDirectConversationId.present) {
      map['pleroma_direct_conversation_id'] =
          Variable<int, IntType>(d.pleromaDirectConversationId.value);
    }
    if (d.pleromaInReplyToAccountAcct.present) {
      map['pleroma_in_reply_to_account_acct'] =
          Variable<String, StringType>(d.pleromaInReplyToAccountAcct.value);
    }
    if (d.pleromaLocal.present) {
      map['pleroma_local'] = Variable<bool, BoolType>(d.pleromaLocal.value);
    }
    if (d.pleromaSpoilerText.present) {
      final converter = $DbStatusesTable.$converter10;
      map['pleroma_spoiler_text'] = Variable<String, StringType>(
          converter.mapToSql(d.pleromaSpoilerText.value));
    }
    if (d.pleromaExpiresAt.present) {
      map['pleroma_expires_at'] =
          Variable<DateTime, DateTimeType>(d.pleromaExpiresAt.value);
    }
    if (d.pleromaThreadMuted.present) {
      map['pleroma_thread_muted'] =
          Variable<bool, BoolType>(d.pleromaThreadMuted.value);
    }
    if (d.pleromaEmojiReactions.present) {
      final converter = $DbStatusesTable.$converter11;
      map['pleroma_emoji_reactions'] = Variable<String, StringType>(
          converter.mapToSql(d.pleromaEmojiReactions.value));
    }
    return map;
  }

  @override
  $DbStatusesTable createAlias(String alias) {
    return $DbStatusesTable(_db, alias);
  }

  static TypeConverter<PleromaVisibility, String> $converter0 =
      PleromaVisibilityDatabaseConverter();
  static TypeConverter<PleromaStatus, String> $converter1 =
      PleromaStatusDatabaseConverter();
  static TypeConverter<PleromaApplication, String> $converter2 =
      PleromaApplicationDatabaseConverter();
  static TypeConverter<List<PleromaMediaAttachment>, String> $converter3 =
      PleromaMediaAttachmentListDatabaseConverter();
  static TypeConverter<List<PleromaMention>, String> $converter4 =
      PleromaMentionListDatabaseConverter();
  static TypeConverter<List<PleromaTag>, String> $converter5 =
      PleromaTagListDatabaseConverter();
  static TypeConverter<List<PleromaEmoji>, String> $converter6 =
      PleromaEmojiListDatabaseConverter();
  static TypeConverter<PleromaPoll, String> $converter7 =
      PleromaPollDatabaseConverter();
  static TypeConverter<PleromaCard, String> $converter8 =
      PleromaCardDatabaseConverter();
  static TypeConverter<PleromaContent, String> $converter9 =
      PleromaContentDatabaseConverter();
  static TypeConverter<PleromaContent, String> $converter10 =
      PleromaContentDatabaseConverter();
  static TypeConverter<List<PleromaEmojiReactions>, String> $converter11 =
      PleromaEmojiReactionsListDatabaseConverter();
}

class DbAccount extends DataClass implements Insertable<DbAccount> {
  final int id;
  final String remoteId;
  final String username;
  final String url;
  final String note;
  final bool locked;
  final String headerStatic;
  final String header;
  final int followingCount;
  final int followersCount;
  final int statusesCount;
  final String displayName;
  final DateTime createdAt;
  final bool bot;
  final String avatarStatic;
  final String avatar;
  final String acct;
  final DateTime lastStatusAt;
  final List<PleromaField> fields;
  final List<PleromaEmoji> emojis;
  final PleromaSource source;
  final List<PleromaTag> pleromaTags;
  final PleromaRelationship pleromaRelationship;
  final bool pleromaIsAdmin;
  final bool pleromaIsModerator;
  final bool pleromaConfirmationPending;
  final bool pleromaHideFavorites;
  final bool pleromaHideFollowers;
  final bool pleromaHideFollows;
  final bool pleromaHideFollowersCount;
  final bool pleromaHideFollowsCount;
  final String pleromaChatToken;
  final bool pleromaDeactivated;
  final bool pleromaAllowFollowingMove;
  final int pleromaUnreadConversationCount;
  final bool pleromaSkipThreadContainment;
  final PleromaAccountPleromaPartNotificationsSettings
      pleromaNotificationSettings;
  DbAccount(
      {@required this.id,
      @required this.remoteId,
      @required this.username,
      @required this.url,
      @required this.note,
      @required this.locked,
      @required this.headerStatic,
      @required this.header,
      @required this.followingCount,
      @required this.followersCount,
      @required this.statusesCount,
      @required this.displayName,
      @required this.createdAt,
      this.bot,
      @required this.avatarStatic,
      @required this.avatar,
      @required this.acct,
      @required this.lastStatusAt,
      this.fields,
      this.emojis,
      this.source,
      this.pleromaTags,
      this.pleromaRelationship,
      this.pleromaIsAdmin,
      this.pleromaIsModerator,
      this.pleromaConfirmationPending,
      this.pleromaHideFavorites,
      this.pleromaHideFollowers,
      this.pleromaHideFollows,
      this.pleromaHideFollowersCount,
      this.pleromaHideFollowsCount,
      this.pleromaChatToken,
      this.pleromaDeactivated,
      this.pleromaAllowFollowingMove,
      this.pleromaUnreadConversationCount,
      this.pleromaSkipThreadContainment,
      this.pleromaNotificationSettings});
  factory DbAccount.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DbAccount(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      locked:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}locked']),
      headerStatic: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}header_static']),
      header:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}header']),
      followingCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}following_count']),
      followersCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}followers_count']),
      statusesCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}statuses_count']),
      displayName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}display_name']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      bot: boolType.mapFromDatabaseResponse(data['${effectivePrefix}bot']),
      avatarStatic: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar_static']),
      avatar:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      acct: stringType.mapFromDatabaseResponse(data['${effectivePrefix}acct']),
      lastStatusAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_status_at']),
      fields: $DbAccountsTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}fields'])),
      emojis: $DbAccountsTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      source: $DbAccountsTable.$converter2.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}source'])),
      pleromaTags: $DbAccountsTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_tags'])),
      pleromaRelationship: $DbAccountsTable.$converter4.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_relationship'])),
      pleromaIsAdmin: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_is_admin']),
      pleromaIsModerator: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_is_moderator']),
      pleromaConfirmationPending: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_confirmation_pending']),
      pleromaHideFavorites: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_favorites']),
      pleromaHideFollowers: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_followers']),
      pleromaHideFollows: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_follows']),
      pleromaHideFollowersCount: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_followers_count']),
      pleromaHideFollowsCount: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_follows_count']),
      pleromaChatToken: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_chat_token']),
      pleromaDeactivated: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_deactivated']),
      pleromaAllowFollowingMove: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_allow_following_move']),
      pleromaUnreadConversationCount: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_unread_conversation_count']),
      pleromaSkipThreadContainment: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_skip_thread_containment']),
      pleromaNotificationSettings: $DbAccountsTable.$converter5.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_notification_settings'])),
    );
  }
  factory DbAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccount(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      username: serializer.fromJson<String>(json['username']),
      url: serializer.fromJson<String>(json['url']),
      note: serializer.fromJson<String>(json['note']),
      locked: serializer.fromJson<bool>(json['locked']),
      headerStatic: serializer.fromJson<String>(json['headerStatic']),
      header: serializer.fromJson<String>(json['header']),
      followingCount: serializer.fromJson<int>(json['followingCount']),
      followersCount: serializer.fromJson<int>(json['followersCount']),
      statusesCount: serializer.fromJson<int>(json['statusesCount']),
      displayName: serializer.fromJson<String>(json['displayName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      bot: serializer.fromJson<bool>(json['bot']),
      avatarStatic: serializer.fromJson<String>(json['avatarStatic']),
      avatar: serializer.fromJson<String>(json['avatar']),
      acct: serializer.fromJson<String>(json['acct']),
      lastStatusAt: serializer.fromJson<DateTime>(json['lastStatusAt']),
      fields: serializer.fromJson<List<PleromaField>>(json['fields']),
      emojis: serializer.fromJson<List<PleromaEmoji>>(json['emojis']),
      source: serializer.fromJson<PleromaSource>(json['source']),
      pleromaTags: serializer.fromJson<List<PleromaTag>>(json['pleromaTags']),
      pleromaRelationship:
          serializer.fromJson<PleromaRelationship>(json['pleromaRelationship']),
      pleromaIsAdmin: serializer.fromJson<bool>(json['pleromaIsAdmin']),
      pleromaIsModerator: serializer.fromJson<bool>(json['pleromaIsModerator']),
      pleromaConfirmationPending:
          serializer.fromJson<bool>(json['pleromaConfirmationPending']),
      pleromaHideFavorites:
          serializer.fromJson<bool>(json['pleromaHideFavorites']),
      pleromaHideFollowers:
          serializer.fromJson<bool>(json['pleromaHideFollowers']),
      pleromaHideFollows: serializer.fromJson<bool>(json['pleromaHideFollows']),
      pleromaHideFollowersCount:
          serializer.fromJson<bool>(json['pleromaHideFollowersCount']),
      pleromaHideFollowsCount:
          serializer.fromJson<bool>(json['pleromaHideFollowsCount']),
      pleromaChatToken: serializer.fromJson<String>(json['pleromaChatToken']),
      pleromaDeactivated: serializer.fromJson<bool>(json['pleromaDeactivated']),
      pleromaAllowFollowingMove:
          serializer.fromJson<bool>(json['pleromaAllowFollowingMove']),
      pleromaUnreadConversationCount:
          serializer.fromJson<int>(json['pleromaUnreadConversationCount']),
      pleromaSkipThreadContainment:
          serializer.fromJson<bool>(json['pleromaSkipThreadContainment']),
      pleromaNotificationSettings:
          serializer.fromJson<PleromaAccountPleromaPartNotificationsSettings>(
              json['pleromaNotificationSettings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'username': serializer.toJson<String>(username),
      'url': serializer.toJson<String>(url),
      'note': serializer.toJson<String>(note),
      'locked': serializer.toJson<bool>(locked),
      'headerStatic': serializer.toJson<String>(headerStatic),
      'header': serializer.toJson<String>(header),
      'followingCount': serializer.toJson<int>(followingCount),
      'followersCount': serializer.toJson<int>(followersCount),
      'statusesCount': serializer.toJson<int>(statusesCount),
      'displayName': serializer.toJson<String>(displayName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'bot': serializer.toJson<bool>(bot),
      'avatarStatic': serializer.toJson<String>(avatarStatic),
      'avatar': serializer.toJson<String>(avatar),
      'acct': serializer.toJson<String>(acct),
      'lastStatusAt': serializer.toJson<DateTime>(lastStatusAt),
      'fields': serializer.toJson<List<PleromaField>>(fields),
      'emojis': serializer.toJson<List<PleromaEmoji>>(emojis),
      'source': serializer.toJson<PleromaSource>(source),
      'pleromaTags': serializer.toJson<List<PleromaTag>>(pleromaTags),
      'pleromaRelationship':
          serializer.toJson<PleromaRelationship>(pleromaRelationship),
      'pleromaIsAdmin': serializer.toJson<bool>(pleromaIsAdmin),
      'pleromaIsModerator': serializer.toJson<bool>(pleromaIsModerator),
      'pleromaConfirmationPending':
          serializer.toJson<bool>(pleromaConfirmationPending),
      'pleromaHideFavorites': serializer.toJson<bool>(pleromaHideFavorites),
      'pleromaHideFollowers': serializer.toJson<bool>(pleromaHideFollowers),
      'pleromaHideFollows': serializer.toJson<bool>(pleromaHideFollows),
      'pleromaHideFollowersCount':
          serializer.toJson<bool>(pleromaHideFollowersCount),
      'pleromaHideFollowsCount':
          serializer.toJson<bool>(pleromaHideFollowsCount),
      'pleromaChatToken': serializer.toJson<String>(pleromaChatToken),
      'pleromaDeactivated': serializer.toJson<bool>(pleromaDeactivated),
      'pleromaAllowFollowingMove':
          serializer.toJson<bool>(pleromaAllowFollowingMove),
      'pleromaUnreadConversationCount':
          serializer.toJson<int>(pleromaUnreadConversationCount),
      'pleromaSkipThreadContainment':
          serializer.toJson<bool>(pleromaSkipThreadContainment),
      'pleromaNotificationSettings':
          serializer.toJson<PleromaAccountPleromaPartNotificationsSettings>(
              pleromaNotificationSettings),
    };
  }

  @override
  DbAccountsCompanion createCompanion(bool nullToAbsent) {
    return DbAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      locked:
          locked == null && nullToAbsent ? const Value.absent() : Value(locked),
      headerStatic: headerStatic == null && nullToAbsent
          ? const Value.absent()
          : Value(headerStatic),
      header:
          header == null && nullToAbsent ? const Value.absent() : Value(header),
      followingCount: followingCount == null && nullToAbsent
          ? const Value.absent()
          : Value(followingCount),
      followersCount: followersCount == null && nullToAbsent
          ? const Value.absent()
          : Value(followersCount),
      statusesCount: statusesCount == null && nullToAbsent
          ? const Value.absent()
          : Value(statusesCount),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      bot: bot == null && nullToAbsent ? const Value.absent() : Value(bot),
      avatarStatic: avatarStatic == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarStatic),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      acct: acct == null && nullToAbsent ? const Value.absent() : Value(acct),
      lastStatusAt: lastStatusAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStatusAt),
      fields:
          fields == null && nullToAbsent ? const Value.absent() : Value(fields),
      emojis:
          emojis == null && nullToAbsent ? const Value.absent() : Value(emojis),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      pleromaTags: pleromaTags == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaTags),
      pleromaRelationship: pleromaRelationship == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaRelationship),
      pleromaIsAdmin: pleromaIsAdmin == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaIsAdmin),
      pleromaIsModerator: pleromaIsModerator == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaIsModerator),
      pleromaConfirmationPending:
          pleromaConfirmationPending == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaConfirmationPending),
      pleromaHideFavorites: pleromaHideFavorites == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaHideFavorites),
      pleromaHideFollowers: pleromaHideFollowers == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaHideFollowers),
      pleromaHideFollows: pleromaHideFollows == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaHideFollows),
      pleromaHideFollowersCount:
          pleromaHideFollowersCount == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaHideFollowersCount),
      pleromaHideFollowsCount: pleromaHideFollowsCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaHideFollowsCount),
      pleromaChatToken: pleromaChatToken == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaChatToken),
      pleromaDeactivated: pleromaDeactivated == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaDeactivated),
      pleromaAllowFollowingMove:
          pleromaAllowFollowingMove == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaAllowFollowingMove),
      pleromaUnreadConversationCount:
          pleromaUnreadConversationCount == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaUnreadConversationCount),
      pleromaSkipThreadContainment:
          pleromaSkipThreadContainment == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaSkipThreadContainment),
      pleromaNotificationSettings:
          pleromaNotificationSettings == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaNotificationSettings),
    );
  }

  DbAccount copyWith(
          {int id,
          String remoteId,
          String username,
          String url,
          String note,
          bool locked,
          String headerStatic,
          String header,
          int followingCount,
          int followersCount,
          int statusesCount,
          String displayName,
          DateTime createdAt,
          bool bot,
          String avatarStatic,
          String avatar,
          String acct,
          DateTime lastStatusAt,
          List<PleromaField> fields,
          List<PleromaEmoji> emojis,
          PleromaSource source,
          List<PleromaTag> pleromaTags,
          PleromaRelationship pleromaRelationship,
          bool pleromaIsAdmin,
          bool pleromaIsModerator,
          bool pleromaConfirmationPending,
          bool pleromaHideFavorites,
          bool pleromaHideFollowers,
          bool pleromaHideFollows,
          bool pleromaHideFollowersCount,
          bool pleromaHideFollowsCount,
          String pleromaChatToken,
          bool pleromaDeactivated,
          bool pleromaAllowFollowingMove,
          int pleromaUnreadConversationCount,
          bool pleromaSkipThreadContainment,
          PleromaAccountPleromaPartNotificationsSettings
              pleromaNotificationSettings}) =>
      DbAccount(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        username: username ?? this.username,
        url: url ?? this.url,
        note: note ?? this.note,
        locked: locked ?? this.locked,
        headerStatic: headerStatic ?? this.headerStatic,
        header: header ?? this.header,
        followingCount: followingCount ?? this.followingCount,
        followersCount: followersCount ?? this.followersCount,
        statusesCount: statusesCount ?? this.statusesCount,
        displayName: displayName ?? this.displayName,
        createdAt: createdAt ?? this.createdAt,
        bot: bot ?? this.bot,
        avatarStatic: avatarStatic ?? this.avatarStatic,
        avatar: avatar ?? this.avatar,
        acct: acct ?? this.acct,
        lastStatusAt: lastStatusAt ?? this.lastStatusAt,
        fields: fields ?? this.fields,
        emojis: emojis ?? this.emojis,
        source: source ?? this.source,
        pleromaTags: pleromaTags ?? this.pleromaTags,
        pleromaRelationship: pleromaRelationship ?? this.pleromaRelationship,
        pleromaIsAdmin: pleromaIsAdmin ?? this.pleromaIsAdmin,
        pleromaIsModerator: pleromaIsModerator ?? this.pleromaIsModerator,
        pleromaConfirmationPending:
            pleromaConfirmationPending ?? this.pleromaConfirmationPending,
        pleromaHideFavorites: pleromaHideFavorites ?? this.pleromaHideFavorites,
        pleromaHideFollowers: pleromaHideFollowers ?? this.pleromaHideFollowers,
        pleromaHideFollows: pleromaHideFollows ?? this.pleromaHideFollows,
        pleromaHideFollowersCount:
            pleromaHideFollowersCount ?? this.pleromaHideFollowersCount,
        pleromaHideFollowsCount:
            pleromaHideFollowsCount ?? this.pleromaHideFollowsCount,
        pleromaChatToken: pleromaChatToken ?? this.pleromaChatToken,
        pleromaDeactivated: pleromaDeactivated ?? this.pleromaDeactivated,
        pleromaAllowFollowingMove:
            pleromaAllowFollowingMove ?? this.pleromaAllowFollowingMove,
        pleromaUnreadConversationCount: pleromaUnreadConversationCount ??
            this.pleromaUnreadConversationCount,
        pleromaSkipThreadContainment:
            pleromaSkipThreadContainment ?? this.pleromaSkipThreadContainment,
        pleromaNotificationSettings:
            pleromaNotificationSettings ?? this.pleromaNotificationSettings,
      );
  @override
  String toString() {
    return (StringBuffer('DbAccount(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('username: $username, ')
          ..write('url: $url, ')
          ..write('note: $note, ')
          ..write('locked: $locked, ')
          ..write('headerStatic: $headerStatic, ')
          ..write('header: $header, ')
          ..write('followingCount: $followingCount, ')
          ..write('followersCount: $followersCount, ')
          ..write('statusesCount: $statusesCount, ')
          ..write('displayName: $displayName, ')
          ..write('createdAt: $createdAt, ')
          ..write('bot: $bot, ')
          ..write('avatarStatic: $avatarStatic, ')
          ..write('avatar: $avatar, ')
          ..write('acct: $acct, ')
          ..write('lastStatusAt: $lastStatusAt, ')
          ..write('fields: $fields, ')
          ..write('emojis: $emojis, ')
          ..write('source: $source, ')
          ..write('pleromaTags: $pleromaTags, ')
          ..write('pleromaRelationship: $pleromaRelationship, ')
          ..write('pleromaIsAdmin: $pleromaIsAdmin, ')
          ..write('pleromaIsModerator: $pleromaIsModerator, ')
          ..write('pleromaConfirmationPending: $pleromaConfirmationPending, ')
          ..write('pleromaHideFavorites: $pleromaHideFavorites, ')
          ..write('pleromaHideFollowers: $pleromaHideFollowers, ')
          ..write('pleromaHideFollows: $pleromaHideFollows, ')
          ..write('pleromaHideFollowersCount: $pleromaHideFollowersCount, ')
          ..write('pleromaHideFollowsCount: $pleromaHideFollowsCount, ')
          ..write('pleromaChatToken: $pleromaChatToken, ')
          ..write('pleromaDeactivated: $pleromaDeactivated, ')
          ..write('pleromaAllowFollowingMove: $pleromaAllowFollowingMove, ')
          ..write(
              'pleromaUnreadConversationCount: $pleromaUnreadConversationCount, ')
          ..write(
              'pleromaSkipThreadContainment: $pleromaSkipThreadContainment, ')
          ..write('pleromaNotificationSettings: $pleromaNotificationSettings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              username.hashCode,
              $mrjc(
                  url.hashCode,
                  $mrjc(
                      note.hashCode,
                      $mrjc(
                          locked.hashCode,
                          $mrjc(
                              headerStatic.hashCode,
                              $mrjc(
                                  header.hashCode,
                                  $mrjc(
                                      followingCount.hashCode,
                                      $mrjc(
                                          followersCount.hashCode,
                                          $mrjc(
                                              statusesCount.hashCode,
                                              $mrjc(
                                                  displayName.hashCode,
                                                  $mrjc(
                                                      createdAt.hashCode,
                                                      $mrjc(
                                                          bot.hashCode,
                                                          $mrjc(
                                                              avatarStatic
                                                                  .hashCode,
                                                              $mrjc(
                                                                  avatar
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      acct
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          lastStatusAt
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              fields.hashCode,
                                                                              $mrjc(emojis.hashCode, $mrjc(source.hashCode, $mrjc(pleromaTags.hashCode, $mrjc(pleromaRelationship.hashCode, $mrjc(pleromaIsAdmin.hashCode, $mrjc(pleromaIsModerator.hashCode, $mrjc(pleromaConfirmationPending.hashCode, $mrjc(pleromaHideFavorites.hashCode, $mrjc(pleromaHideFollowers.hashCode, $mrjc(pleromaHideFollows.hashCode, $mrjc(pleromaHideFollowersCount.hashCode, $mrjc(pleromaHideFollowsCount.hashCode, $mrjc(pleromaChatToken.hashCode, $mrjc(pleromaDeactivated.hashCode, $mrjc(pleromaAllowFollowingMove.hashCode, $mrjc(pleromaUnreadConversationCount.hashCode, $mrjc(pleromaSkipThreadContainment.hashCode, pleromaNotificationSettings.hashCode)))))))))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbAccount &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.username == this.username &&
          other.url == this.url &&
          other.note == this.note &&
          other.locked == this.locked &&
          other.headerStatic == this.headerStatic &&
          other.header == this.header &&
          other.followingCount == this.followingCount &&
          other.followersCount == this.followersCount &&
          other.statusesCount == this.statusesCount &&
          other.displayName == this.displayName &&
          other.createdAt == this.createdAt &&
          other.bot == this.bot &&
          other.avatarStatic == this.avatarStatic &&
          other.avatar == this.avatar &&
          other.acct == this.acct &&
          other.lastStatusAt == this.lastStatusAt &&
          other.fields == this.fields &&
          other.emojis == this.emojis &&
          other.source == this.source &&
          other.pleromaTags == this.pleromaTags &&
          other.pleromaRelationship == this.pleromaRelationship &&
          other.pleromaIsAdmin == this.pleromaIsAdmin &&
          other.pleromaIsModerator == this.pleromaIsModerator &&
          other.pleromaConfirmationPending == this.pleromaConfirmationPending &&
          other.pleromaHideFavorites == this.pleromaHideFavorites &&
          other.pleromaHideFollowers == this.pleromaHideFollowers &&
          other.pleromaHideFollows == this.pleromaHideFollows &&
          other.pleromaHideFollowersCount == this.pleromaHideFollowersCount &&
          other.pleromaHideFollowsCount == this.pleromaHideFollowsCount &&
          other.pleromaChatToken == this.pleromaChatToken &&
          other.pleromaDeactivated == this.pleromaDeactivated &&
          other.pleromaAllowFollowingMove == this.pleromaAllowFollowingMove &&
          other.pleromaUnreadConversationCount ==
              this.pleromaUnreadConversationCount &&
          other.pleromaSkipThreadContainment ==
              this.pleromaSkipThreadContainment &&
          other.pleromaNotificationSettings ==
              this.pleromaNotificationSettings);
}

class DbAccountsCompanion extends UpdateCompanion<DbAccount> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<String> username;
  final Value<String> url;
  final Value<String> note;
  final Value<bool> locked;
  final Value<String> headerStatic;
  final Value<String> header;
  final Value<int> followingCount;
  final Value<int> followersCount;
  final Value<int> statusesCount;
  final Value<String> displayName;
  final Value<DateTime> createdAt;
  final Value<bool> bot;
  final Value<String> avatarStatic;
  final Value<String> avatar;
  final Value<String> acct;
  final Value<DateTime> lastStatusAt;
  final Value<List<PleromaField>> fields;
  final Value<List<PleromaEmoji>> emojis;
  final Value<PleromaSource> source;
  final Value<List<PleromaTag>> pleromaTags;
  final Value<PleromaRelationship> pleromaRelationship;
  final Value<bool> pleromaIsAdmin;
  final Value<bool> pleromaIsModerator;
  final Value<bool> pleromaConfirmationPending;
  final Value<bool> pleromaHideFavorites;
  final Value<bool> pleromaHideFollowers;
  final Value<bool> pleromaHideFollows;
  final Value<bool> pleromaHideFollowersCount;
  final Value<bool> pleromaHideFollowsCount;
  final Value<String> pleromaChatToken;
  final Value<bool> pleromaDeactivated;
  final Value<bool> pleromaAllowFollowingMove;
  final Value<int> pleromaUnreadConversationCount;
  final Value<bool> pleromaSkipThreadContainment;
  final Value<PleromaAccountPleromaPartNotificationsSettings>
      pleromaNotificationSettings;
  const DbAccountsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.username = const Value.absent(),
    this.url = const Value.absent(),
    this.note = const Value.absent(),
    this.locked = const Value.absent(),
    this.headerStatic = const Value.absent(),
    this.header = const Value.absent(),
    this.followingCount = const Value.absent(),
    this.followersCount = const Value.absent(),
    this.statusesCount = const Value.absent(),
    this.displayName = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.bot = const Value.absent(),
    this.avatarStatic = const Value.absent(),
    this.avatar = const Value.absent(),
    this.acct = const Value.absent(),
    this.lastStatusAt = const Value.absent(),
    this.fields = const Value.absent(),
    this.emojis = const Value.absent(),
    this.source = const Value.absent(),
    this.pleromaTags = const Value.absent(),
    this.pleromaRelationship = const Value.absent(),
    this.pleromaIsAdmin = const Value.absent(),
    this.pleromaIsModerator = const Value.absent(),
    this.pleromaConfirmationPending = const Value.absent(),
    this.pleromaHideFavorites = const Value.absent(),
    this.pleromaHideFollowers = const Value.absent(),
    this.pleromaHideFollows = const Value.absent(),
    this.pleromaHideFollowersCount = const Value.absent(),
    this.pleromaHideFollowsCount = const Value.absent(),
    this.pleromaChatToken = const Value.absent(),
    this.pleromaDeactivated = const Value.absent(),
    this.pleromaAllowFollowingMove = const Value.absent(),
    this.pleromaUnreadConversationCount = const Value.absent(),
    this.pleromaSkipThreadContainment = const Value.absent(),
    this.pleromaNotificationSettings = const Value.absent(),
  });
  DbAccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required String username,
    @required String url,
    @required String note,
    @required bool locked,
    @required String headerStatic,
    @required String header,
    @required int followingCount,
    @required int followersCount,
    @required int statusesCount,
    @required String displayName,
    @required DateTime createdAt,
    this.bot = const Value.absent(),
    @required String avatarStatic,
    @required String avatar,
    @required String acct,
    @required DateTime lastStatusAt,
    this.fields = const Value.absent(),
    this.emojis = const Value.absent(),
    this.source = const Value.absent(),
    this.pleromaTags = const Value.absent(),
    this.pleromaRelationship = const Value.absent(),
    this.pleromaIsAdmin = const Value.absent(),
    this.pleromaIsModerator = const Value.absent(),
    this.pleromaConfirmationPending = const Value.absent(),
    this.pleromaHideFavorites = const Value.absent(),
    this.pleromaHideFollowers = const Value.absent(),
    this.pleromaHideFollows = const Value.absent(),
    this.pleromaHideFollowersCount = const Value.absent(),
    this.pleromaHideFollowsCount = const Value.absent(),
    this.pleromaChatToken = const Value.absent(),
    this.pleromaDeactivated = const Value.absent(),
    this.pleromaAllowFollowingMove = const Value.absent(),
    this.pleromaUnreadConversationCount = const Value.absent(),
    this.pleromaSkipThreadContainment = const Value.absent(),
    this.pleromaNotificationSettings = const Value.absent(),
  })  : remoteId = Value(remoteId),
        username = Value(username),
        url = Value(url),
        note = Value(note),
        locked = Value(locked),
        headerStatic = Value(headerStatic),
        header = Value(header),
        followingCount = Value(followingCount),
        followersCount = Value(followersCount),
        statusesCount = Value(statusesCount),
        displayName = Value(displayName),
        createdAt = Value(createdAt),
        avatarStatic = Value(avatarStatic),
        avatar = Value(avatar),
        acct = Value(acct),
        lastStatusAt = Value(lastStatusAt);
  DbAccountsCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<String> username,
      Value<String> url,
      Value<String> note,
      Value<bool> locked,
      Value<String> headerStatic,
      Value<String> header,
      Value<int> followingCount,
      Value<int> followersCount,
      Value<int> statusesCount,
      Value<String> displayName,
      Value<DateTime> createdAt,
      Value<bool> bot,
      Value<String> avatarStatic,
      Value<String> avatar,
      Value<String> acct,
      Value<DateTime> lastStatusAt,
      Value<List<PleromaField>> fields,
      Value<List<PleromaEmoji>> emojis,
      Value<PleromaSource> source,
      Value<List<PleromaTag>> pleromaTags,
      Value<PleromaRelationship> pleromaRelationship,
      Value<bool> pleromaIsAdmin,
      Value<bool> pleromaIsModerator,
      Value<bool> pleromaConfirmationPending,
      Value<bool> pleromaHideFavorites,
      Value<bool> pleromaHideFollowers,
      Value<bool> pleromaHideFollows,
      Value<bool> pleromaHideFollowersCount,
      Value<bool> pleromaHideFollowsCount,
      Value<String> pleromaChatToken,
      Value<bool> pleromaDeactivated,
      Value<bool> pleromaAllowFollowingMove,
      Value<int> pleromaUnreadConversationCount,
      Value<bool> pleromaSkipThreadContainment,
      Value<PleromaAccountPleromaPartNotificationsSettings>
          pleromaNotificationSettings}) {
    return DbAccountsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      username: username ?? this.username,
      url: url ?? this.url,
      note: note ?? this.note,
      locked: locked ?? this.locked,
      headerStatic: headerStatic ?? this.headerStatic,
      header: header ?? this.header,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
      statusesCount: statusesCount ?? this.statusesCount,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt ?? this.createdAt,
      bot: bot ?? this.bot,
      avatarStatic: avatarStatic ?? this.avatarStatic,
      avatar: avatar ?? this.avatar,
      acct: acct ?? this.acct,
      lastStatusAt: lastStatusAt ?? this.lastStatusAt,
      fields: fields ?? this.fields,
      emojis: emojis ?? this.emojis,
      source: source ?? this.source,
      pleromaTags: pleromaTags ?? this.pleromaTags,
      pleromaRelationship: pleromaRelationship ?? this.pleromaRelationship,
      pleromaIsAdmin: pleromaIsAdmin ?? this.pleromaIsAdmin,
      pleromaIsModerator: pleromaIsModerator ?? this.pleromaIsModerator,
      pleromaConfirmationPending:
          pleromaConfirmationPending ?? this.pleromaConfirmationPending,
      pleromaHideFavorites: pleromaHideFavorites ?? this.pleromaHideFavorites,
      pleromaHideFollowers: pleromaHideFollowers ?? this.pleromaHideFollowers,
      pleromaHideFollows: pleromaHideFollows ?? this.pleromaHideFollows,
      pleromaHideFollowersCount:
          pleromaHideFollowersCount ?? this.pleromaHideFollowersCount,
      pleromaHideFollowsCount:
          pleromaHideFollowsCount ?? this.pleromaHideFollowsCount,
      pleromaChatToken: pleromaChatToken ?? this.pleromaChatToken,
      pleromaDeactivated: pleromaDeactivated ?? this.pleromaDeactivated,
      pleromaAllowFollowingMove:
          pleromaAllowFollowingMove ?? this.pleromaAllowFollowingMove,
      pleromaUnreadConversationCount:
          pleromaUnreadConversationCount ?? this.pleromaUnreadConversationCount,
      pleromaSkipThreadContainment:
          pleromaSkipThreadContainment ?? this.pleromaSkipThreadContainment,
      pleromaNotificationSettings:
          pleromaNotificationSettings ?? this.pleromaNotificationSettings,
    );
  }
}

class $DbAccountsTable extends DbAccounts
    with TableInfo<$DbAccountsTable, DbAccount> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbAccountsTable(this._db, [this._alias]);
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
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
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

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lockedMeta = const VerificationMeta('locked');
  GeneratedBoolColumn _locked;
  @override
  GeneratedBoolColumn get locked => _locked ??= _constructLocked();
  GeneratedBoolColumn _constructLocked() {
    return GeneratedBoolColumn(
      'locked',
      $tableName,
      false,
    );
  }

  final VerificationMeta _headerStaticMeta =
      const VerificationMeta('headerStatic');
  GeneratedTextColumn _headerStatic;
  @override
  GeneratedTextColumn get headerStatic =>
      _headerStatic ??= _constructHeaderStatic();
  GeneratedTextColumn _constructHeaderStatic() {
    return GeneratedTextColumn(
      'header_static',
      $tableName,
      false,
    );
  }

  final VerificationMeta _headerMeta = const VerificationMeta('header');
  GeneratedTextColumn _header;
  @override
  GeneratedTextColumn get header => _header ??= _constructHeader();
  GeneratedTextColumn _constructHeader() {
    return GeneratedTextColumn(
      'header',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followingCountMeta =
      const VerificationMeta('followingCount');
  GeneratedIntColumn _followingCount;
  @override
  GeneratedIntColumn get followingCount =>
      _followingCount ??= _constructFollowingCount();
  GeneratedIntColumn _constructFollowingCount() {
    return GeneratedIntColumn(
      'following_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followersCountMeta =
      const VerificationMeta('followersCount');
  GeneratedIntColumn _followersCount;
  @override
  GeneratedIntColumn get followersCount =>
      _followersCount ??= _constructFollowersCount();
  GeneratedIntColumn _constructFollowersCount() {
    return GeneratedIntColumn(
      'followers_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusesCountMeta =
      const VerificationMeta('statusesCount');
  GeneratedIntColumn _statusesCount;
  @override
  GeneratedIntColumn get statusesCount =>
      _statusesCount ??= _constructStatusesCount();
  GeneratedIntColumn _constructStatusesCount() {
    return GeneratedIntColumn(
      'statuses_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  GeneratedTextColumn _displayName;
  @override
  GeneratedTextColumn get displayName =>
      _displayName ??= _constructDisplayName();
  GeneratedTextColumn _constructDisplayName() {
    return GeneratedTextColumn(
      'display_name',
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

  final VerificationMeta _botMeta = const VerificationMeta('bot');
  GeneratedBoolColumn _bot;
  @override
  GeneratedBoolColumn get bot => _bot ??= _constructBot();
  GeneratedBoolColumn _constructBot() {
    return GeneratedBoolColumn(
      'bot',
      $tableName,
      true,
    );
  }

  final VerificationMeta _avatarStaticMeta =
      const VerificationMeta('avatarStatic');
  GeneratedTextColumn _avatarStatic;
  @override
  GeneratedTextColumn get avatarStatic =>
      _avatarStatic ??= _constructAvatarStatic();
  GeneratedTextColumn _constructAvatarStatic() {
    return GeneratedTextColumn(
      'avatar_static',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedTextColumn _avatar;
  @override
  GeneratedTextColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedTextColumn _constructAvatar() {
    return GeneratedTextColumn(
      'avatar',
      $tableName,
      false,
    );
  }

  final VerificationMeta _acctMeta = const VerificationMeta('acct');
  GeneratedTextColumn _acct;
  @override
  GeneratedTextColumn get acct => _acct ??= _constructAcct();
  GeneratedTextColumn _constructAcct() {
    return GeneratedTextColumn(
      'acct',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastStatusAtMeta =
      const VerificationMeta('lastStatusAt');
  GeneratedDateTimeColumn _lastStatusAt;
  @override
  GeneratedDateTimeColumn get lastStatusAt =>
      _lastStatusAt ??= _constructLastStatusAt();
  GeneratedDateTimeColumn _constructLastStatusAt() {
    return GeneratedDateTimeColumn(
      'last_status_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fieldsMeta = const VerificationMeta('fields');
  GeneratedTextColumn _fields;
  @override
  GeneratedTextColumn get fields => _fields ??= _constructFields();
  GeneratedTextColumn _constructFields() {
    return GeneratedTextColumn(
      'fields',
      $tableName,
      true,
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
      true,
    );
  }

  final VerificationMeta _sourceMeta = const VerificationMeta('source');
  GeneratedTextColumn _source;
  @override
  GeneratedTextColumn get source => _source ??= _constructSource();
  GeneratedTextColumn _constructSource() {
    return GeneratedTextColumn(
      'source',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaTagsMeta =
      const VerificationMeta('pleromaTags');
  GeneratedTextColumn _pleromaTags;
  @override
  GeneratedTextColumn get pleromaTags =>
      _pleromaTags ??= _constructPleromaTags();
  GeneratedTextColumn _constructPleromaTags() {
    return GeneratedTextColumn(
      'pleroma_tags',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaRelationshipMeta =
      const VerificationMeta('pleromaRelationship');
  GeneratedTextColumn _pleromaRelationship;
  @override
  GeneratedTextColumn get pleromaRelationship =>
      _pleromaRelationship ??= _constructPleromaRelationship();
  GeneratedTextColumn _constructPleromaRelationship() {
    return GeneratedTextColumn(
      'pleroma_relationship',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaIsAdminMeta =
      const VerificationMeta('pleromaIsAdmin');
  GeneratedBoolColumn _pleromaIsAdmin;
  @override
  GeneratedBoolColumn get pleromaIsAdmin =>
      _pleromaIsAdmin ??= _constructPleromaIsAdmin();
  GeneratedBoolColumn _constructPleromaIsAdmin() {
    return GeneratedBoolColumn(
      'pleroma_is_admin',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaIsModeratorMeta =
      const VerificationMeta('pleromaIsModerator');
  GeneratedBoolColumn _pleromaIsModerator;
  @override
  GeneratedBoolColumn get pleromaIsModerator =>
      _pleromaIsModerator ??= _constructPleromaIsModerator();
  GeneratedBoolColumn _constructPleromaIsModerator() {
    return GeneratedBoolColumn(
      'pleroma_is_moderator',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaConfirmationPendingMeta =
      const VerificationMeta('pleromaConfirmationPending');
  GeneratedBoolColumn _pleromaConfirmationPending;
  @override
  GeneratedBoolColumn get pleromaConfirmationPending =>
      _pleromaConfirmationPending ??= _constructPleromaConfirmationPending();
  GeneratedBoolColumn _constructPleromaConfirmationPending() {
    return GeneratedBoolColumn(
      'pleroma_confirmation_pending',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFavoritesMeta =
      const VerificationMeta('pleromaHideFavorites');
  GeneratedBoolColumn _pleromaHideFavorites;
  @override
  GeneratedBoolColumn get pleromaHideFavorites =>
      _pleromaHideFavorites ??= _constructPleromaHideFavorites();
  GeneratedBoolColumn _constructPleromaHideFavorites() {
    return GeneratedBoolColumn(
      'pleroma_hide_favorites',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowersMeta =
      const VerificationMeta('pleromaHideFollowers');
  GeneratedBoolColumn _pleromaHideFollowers;
  @override
  GeneratedBoolColumn get pleromaHideFollowers =>
      _pleromaHideFollowers ??= _constructPleromaHideFollowers();
  GeneratedBoolColumn _constructPleromaHideFollowers() {
    return GeneratedBoolColumn(
      'pleroma_hide_followers',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowsMeta =
      const VerificationMeta('pleromaHideFollows');
  GeneratedBoolColumn _pleromaHideFollows;
  @override
  GeneratedBoolColumn get pleromaHideFollows =>
      _pleromaHideFollows ??= _constructPleromaHideFollows();
  GeneratedBoolColumn _constructPleromaHideFollows() {
    return GeneratedBoolColumn(
      'pleroma_hide_follows',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowersCountMeta =
      const VerificationMeta('pleromaHideFollowersCount');
  GeneratedBoolColumn _pleromaHideFollowersCount;
  @override
  GeneratedBoolColumn get pleromaHideFollowersCount =>
      _pleromaHideFollowersCount ??= _constructPleromaHideFollowersCount();
  GeneratedBoolColumn _constructPleromaHideFollowersCount() {
    return GeneratedBoolColumn(
      'pleroma_hide_followers_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowsCountMeta =
      const VerificationMeta('pleromaHideFollowsCount');
  GeneratedBoolColumn _pleromaHideFollowsCount;
  @override
  GeneratedBoolColumn get pleromaHideFollowsCount =>
      _pleromaHideFollowsCount ??= _constructPleromaHideFollowsCount();
  GeneratedBoolColumn _constructPleromaHideFollowsCount() {
    return GeneratedBoolColumn(
      'pleroma_hide_follows_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaChatTokenMeta =
      const VerificationMeta('pleromaChatToken');
  GeneratedTextColumn _pleromaChatToken;
  @override
  GeneratedTextColumn get pleromaChatToken =>
      _pleromaChatToken ??= _constructPleromaChatToken();
  GeneratedTextColumn _constructPleromaChatToken() {
    return GeneratedTextColumn(
      'pleroma_chat_token',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaDeactivatedMeta =
      const VerificationMeta('pleromaDeactivated');
  GeneratedBoolColumn _pleromaDeactivated;
  @override
  GeneratedBoolColumn get pleromaDeactivated =>
      _pleromaDeactivated ??= _constructPleromaDeactivated();
  GeneratedBoolColumn _constructPleromaDeactivated() {
    return GeneratedBoolColumn(
      'pleroma_deactivated',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaAllowFollowingMoveMeta =
      const VerificationMeta('pleromaAllowFollowingMove');
  GeneratedBoolColumn _pleromaAllowFollowingMove;
  @override
  GeneratedBoolColumn get pleromaAllowFollowingMove =>
      _pleromaAllowFollowingMove ??= _constructPleromaAllowFollowingMove();
  GeneratedBoolColumn _constructPleromaAllowFollowingMove() {
    return GeneratedBoolColumn(
      'pleroma_allow_following_move',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaUnreadConversationCountMeta =
      const VerificationMeta('pleromaUnreadConversationCount');
  GeneratedIntColumn _pleromaUnreadConversationCount;
  @override
  GeneratedIntColumn get pleromaUnreadConversationCount =>
      _pleromaUnreadConversationCount ??=
          _constructPleromaUnreadConversationCount();
  GeneratedIntColumn _constructPleromaUnreadConversationCount() {
    return GeneratedIntColumn(
      'pleroma_unread_conversation_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaSkipThreadContainmentMeta =
      const VerificationMeta('pleromaSkipThreadContainment');
  GeneratedBoolColumn _pleromaSkipThreadContainment;
  @override
  GeneratedBoolColumn get pleromaSkipThreadContainment =>
      _pleromaSkipThreadContainment ??=
          _constructPleromaSkipThreadContainment();
  GeneratedBoolColumn _constructPleromaSkipThreadContainment() {
    return GeneratedBoolColumn(
      'pleroma_skip_thread_containment',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaNotificationSettingsMeta =
      const VerificationMeta('pleromaNotificationSettings');
  GeneratedTextColumn _pleromaNotificationSettings;
  @override
  GeneratedTextColumn get pleromaNotificationSettings =>
      _pleromaNotificationSettings ??= _constructPleromaNotificationSettings();
  GeneratedTextColumn _constructPleromaNotificationSettings() {
    return GeneratedTextColumn(
      'pleroma_notification_settings',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        username,
        url,
        note,
        locked,
        headerStatic,
        header,
        followingCount,
        followersCount,
        statusesCount,
        displayName,
        createdAt,
        bot,
        avatarStatic,
        avatar,
        acct,
        lastStatusAt,
        fields,
        emojis,
        source,
        pleromaTags,
        pleromaRelationship,
        pleromaIsAdmin,
        pleromaIsModerator,
        pleromaConfirmationPending,
        pleromaHideFavorites,
        pleromaHideFollowers,
        pleromaHideFollows,
        pleromaHideFollowersCount,
        pleromaHideFollowsCount,
        pleromaChatToken,
        pleromaDeactivated,
        pleromaAllowFollowingMove,
        pleromaUnreadConversationCount,
        pleromaSkipThreadContainment,
        pleromaNotificationSettings
      ];
  @override
  $DbAccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_accounts';
  @override
  final String actualTableName = 'db_accounts';
  @override
  VerificationContext validateIntegrity(DbAccountsCompanion d,
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
    if (d.username.present) {
      context.handle(_usernameMeta,
          username.isAcceptableValue(d.username.value, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (d.note.present) {
      context.handle(
          _noteMeta, note.isAcceptableValue(d.note.value, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (d.locked.present) {
      context.handle(
          _lockedMeta, locked.isAcceptableValue(d.locked.value, _lockedMeta));
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (d.headerStatic.present) {
      context.handle(
          _headerStaticMeta,
          headerStatic.isAcceptableValue(
              d.headerStatic.value, _headerStaticMeta));
    } else if (isInserting) {
      context.missing(_headerStaticMeta);
    }
    if (d.header.present) {
      context.handle(
          _headerMeta, header.isAcceptableValue(d.header.value, _headerMeta));
    } else if (isInserting) {
      context.missing(_headerMeta);
    }
    if (d.followingCount.present) {
      context.handle(
          _followingCountMeta,
          followingCount.isAcceptableValue(
              d.followingCount.value, _followingCountMeta));
    } else if (isInserting) {
      context.missing(_followingCountMeta);
    }
    if (d.followersCount.present) {
      context.handle(
          _followersCountMeta,
          followersCount.isAcceptableValue(
              d.followersCount.value, _followersCountMeta));
    } else if (isInserting) {
      context.missing(_followersCountMeta);
    }
    if (d.statusesCount.present) {
      context.handle(
          _statusesCountMeta,
          statusesCount.isAcceptableValue(
              d.statusesCount.value, _statusesCountMeta));
    } else if (isInserting) {
      context.missing(_statusesCountMeta);
    }
    if (d.displayName.present) {
      context.handle(_displayNameMeta,
          displayName.isAcceptableValue(d.displayName.value, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.bot.present) {
      context.handle(_botMeta, bot.isAcceptableValue(d.bot.value, _botMeta));
    }
    if (d.avatarStatic.present) {
      context.handle(
          _avatarStaticMeta,
          avatarStatic.isAcceptableValue(
              d.avatarStatic.value, _avatarStaticMeta));
    } else if (isInserting) {
      context.missing(_avatarStaticMeta);
    }
    if (d.avatar.present) {
      context.handle(
          _avatarMeta, avatar.isAcceptableValue(d.avatar.value, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (d.acct.present) {
      context.handle(
          _acctMeta, acct.isAcceptableValue(d.acct.value, _acctMeta));
    } else if (isInserting) {
      context.missing(_acctMeta);
    }
    if (d.lastStatusAt.present) {
      context.handle(
          _lastStatusAtMeta,
          lastStatusAt.isAcceptableValue(
              d.lastStatusAt.value, _lastStatusAtMeta));
    } else if (isInserting) {
      context.missing(_lastStatusAtMeta);
    }
    context.handle(_fieldsMeta, const VerificationResult.success());
    context.handle(_emojisMeta, const VerificationResult.success());
    context.handle(_sourceMeta, const VerificationResult.success());
    context.handle(_pleromaTagsMeta, const VerificationResult.success());
    context.handle(
        _pleromaRelationshipMeta, const VerificationResult.success());
    if (d.pleromaIsAdmin.present) {
      context.handle(
          _pleromaIsAdminMeta,
          pleromaIsAdmin.isAcceptableValue(
              d.pleromaIsAdmin.value, _pleromaIsAdminMeta));
    }
    if (d.pleromaIsModerator.present) {
      context.handle(
          _pleromaIsModeratorMeta,
          pleromaIsModerator.isAcceptableValue(
              d.pleromaIsModerator.value, _pleromaIsModeratorMeta));
    }
    if (d.pleromaConfirmationPending.present) {
      context.handle(
          _pleromaConfirmationPendingMeta,
          pleromaConfirmationPending.isAcceptableValue(
              d.pleromaConfirmationPending.value,
              _pleromaConfirmationPendingMeta));
    }
    if (d.pleromaHideFavorites.present) {
      context.handle(
          _pleromaHideFavoritesMeta,
          pleromaHideFavorites.isAcceptableValue(
              d.pleromaHideFavorites.value, _pleromaHideFavoritesMeta));
    }
    if (d.pleromaHideFollowers.present) {
      context.handle(
          _pleromaHideFollowersMeta,
          pleromaHideFollowers.isAcceptableValue(
              d.pleromaHideFollowers.value, _pleromaHideFollowersMeta));
    }
    if (d.pleromaHideFollows.present) {
      context.handle(
          _pleromaHideFollowsMeta,
          pleromaHideFollows.isAcceptableValue(
              d.pleromaHideFollows.value, _pleromaHideFollowsMeta));
    }
    if (d.pleromaHideFollowersCount.present) {
      context.handle(
          _pleromaHideFollowersCountMeta,
          pleromaHideFollowersCount.isAcceptableValue(
              d.pleromaHideFollowersCount.value,
              _pleromaHideFollowersCountMeta));
    }
    if (d.pleromaHideFollowsCount.present) {
      context.handle(
          _pleromaHideFollowsCountMeta,
          pleromaHideFollowsCount.isAcceptableValue(
              d.pleromaHideFollowsCount.value, _pleromaHideFollowsCountMeta));
    }
    if (d.pleromaChatToken.present) {
      context.handle(
          _pleromaChatTokenMeta,
          pleromaChatToken.isAcceptableValue(
              d.pleromaChatToken.value, _pleromaChatTokenMeta));
    }
    if (d.pleromaDeactivated.present) {
      context.handle(
          _pleromaDeactivatedMeta,
          pleromaDeactivated.isAcceptableValue(
              d.pleromaDeactivated.value, _pleromaDeactivatedMeta));
    }
    if (d.pleromaAllowFollowingMove.present) {
      context.handle(
          _pleromaAllowFollowingMoveMeta,
          pleromaAllowFollowingMove.isAcceptableValue(
              d.pleromaAllowFollowingMove.value,
              _pleromaAllowFollowingMoveMeta));
    }
    if (d.pleromaUnreadConversationCount.present) {
      context.handle(
          _pleromaUnreadConversationCountMeta,
          pleromaUnreadConversationCount.isAcceptableValue(
              d.pleromaUnreadConversationCount.value,
              _pleromaUnreadConversationCountMeta));
    }
    if (d.pleromaSkipThreadContainment.present) {
      context.handle(
          _pleromaSkipThreadContainmentMeta,
          pleromaSkipThreadContainment.isAcceptableValue(
              d.pleromaSkipThreadContainment.value,
              _pleromaSkipThreadContainmentMeta));
    }
    context.handle(
        _pleromaNotificationSettingsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAccount map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbAccount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbAccountsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.username.present) {
      map['username'] = Variable<String, StringType>(d.username.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.note.present) {
      map['note'] = Variable<String, StringType>(d.note.value);
    }
    if (d.locked.present) {
      map['locked'] = Variable<bool, BoolType>(d.locked.value);
    }
    if (d.headerStatic.present) {
      map['header_static'] = Variable<String, StringType>(d.headerStatic.value);
    }
    if (d.header.present) {
      map['header'] = Variable<String, StringType>(d.header.value);
    }
    if (d.followingCount.present) {
      map['following_count'] = Variable<int, IntType>(d.followingCount.value);
    }
    if (d.followersCount.present) {
      map['followers_count'] = Variable<int, IntType>(d.followersCount.value);
    }
    if (d.statusesCount.present) {
      map['statuses_count'] = Variable<int, IntType>(d.statusesCount.value);
    }
    if (d.displayName.present) {
      map['display_name'] = Variable<String, StringType>(d.displayName.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.bot.present) {
      map['bot'] = Variable<bool, BoolType>(d.bot.value);
    }
    if (d.avatarStatic.present) {
      map['avatar_static'] = Variable<String, StringType>(d.avatarStatic.value);
    }
    if (d.avatar.present) {
      map['avatar'] = Variable<String, StringType>(d.avatar.value);
    }
    if (d.acct.present) {
      map['acct'] = Variable<String, StringType>(d.acct.value);
    }
    if (d.lastStatusAt.present) {
      map['last_status_at'] =
          Variable<DateTime, DateTimeType>(d.lastStatusAt.value);
    }
    if (d.fields.present) {
      final converter = $DbAccountsTable.$converter0;
      map['fields'] =
          Variable<String, StringType>(converter.mapToSql(d.fields.value));
    }
    if (d.emojis.present) {
      final converter = $DbAccountsTable.$converter1;
      map['emojis'] =
          Variable<String, StringType>(converter.mapToSql(d.emojis.value));
    }
    if (d.source.present) {
      final converter = $DbAccountsTable.$converter2;
      map['source'] =
          Variable<String, StringType>(converter.mapToSql(d.source.value));
    }
    if (d.pleromaTags.present) {
      final converter = $DbAccountsTable.$converter3;
      map['pleroma_tags'] =
          Variable<String, StringType>(converter.mapToSql(d.pleromaTags.value));
    }
    if (d.pleromaRelationship.present) {
      final converter = $DbAccountsTable.$converter4;
      map['pleroma_relationship'] = Variable<String, StringType>(
          converter.mapToSql(d.pleromaRelationship.value));
    }
    if (d.pleromaIsAdmin.present) {
      map['pleroma_is_admin'] =
          Variable<bool, BoolType>(d.pleromaIsAdmin.value);
    }
    if (d.pleromaIsModerator.present) {
      map['pleroma_is_moderator'] =
          Variable<bool, BoolType>(d.pleromaIsModerator.value);
    }
    if (d.pleromaConfirmationPending.present) {
      map['pleroma_confirmation_pending'] =
          Variable<bool, BoolType>(d.pleromaConfirmationPending.value);
    }
    if (d.pleromaHideFavorites.present) {
      map['pleroma_hide_favorites'] =
          Variable<bool, BoolType>(d.pleromaHideFavorites.value);
    }
    if (d.pleromaHideFollowers.present) {
      map['pleroma_hide_followers'] =
          Variable<bool, BoolType>(d.pleromaHideFollowers.value);
    }
    if (d.pleromaHideFollows.present) {
      map['pleroma_hide_follows'] =
          Variable<bool, BoolType>(d.pleromaHideFollows.value);
    }
    if (d.pleromaHideFollowersCount.present) {
      map['pleroma_hide_followers_count'] =
          Variable<bool, BoolType>(d.pleromaHideFollowersCount.value);
    }
    if (d.pleromaHideFollowsCount.present) {
      map['pleroma_hide_follows_count'] =
          Variable<bool, BoolType>(d.pleromaHideFollowsCount.value);
    }
    if (d.pleromaChatToken.present) {
      map['pleroma_chat_token'] =
          Variable<String, StringType>(d.pleromaChatToken.value);
    }
    if (d.pleromaDeactivated.present) {
      map['pleroma_deactivated'] =
          Variable<bool, BoolType>(d.pleromaDeactivated.value);
    }
    if (d.pleromaAllowFollowingMove.present) {
      map['pleroma_allow_following_move'] =
          Variable<bool, BoolType>(d.pleromaAllowFollowingMove.value);
    }
    if (d.pleromaUnreadConversationCount.present) {
      map['pleroma_unread_conversation_count'] =
          Variable<int, IntType>(d.pleromaUnreadConversationCount.value);
    }
    if (d.pleromaSkipThreadContainment.present) {
      map['pleroma_skip_thread_containment'] =
          Variable<bool, BoolType>(d.pleromaSkipThreadContainment.value);
    }
    if (d.pleromaNotificationSettings.present) {
      final converter = $DbAccountsTable.$converter5;
      map['pleroma_notification_settings'] = Variable<String, StringType>(
          converter.mapToSql(d.pleromaNotificationSettings.value));
    }
    return map;
  }

  @override
  $DbAccountsTable createAlias(String alias) {
    return $DbAccountsTable(_db, alias);
  }

  static TypeConverter<List<PleromaField>, String> $converter0 =
      PleromaFieldListDatabaseConverter();
  static TypeConverter<List<PleromaEmoji>, String> $converter1 =
      PleromaEmojiListDatabaseConverter();
  static TypeConverter<PleromaSource, String> $converter2 =
      PleromaSourceDatabaseConverter();
  static TypeConverter<List<PleromaTag>, String> $converter3 =
      PleromaTagListDatabaseConverter();
  static TypeConverter<PleromaRelationship, String> $converter4 =
      PleromaRelationshipDatabaseConverter();
  static TypeConverter<PleromaAccountPleromaPartNotificationsSettings, String>
      $converter5 =
      PleromaAccountPleromaPartNotificationsSettingsDatabaseConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbStatusesTable _dbStatuses;
  $DbStatusesTable get dbStatuses => _dbStatuses ??= $DbStatusesTable(this);
  $DbAccountsTable _dbAccounts;
  $DbAccountsTable get dbAccounts => _dbAccounts ??= $DbAccountsTable(this);
  StatusDao _statusDao;
  StatusDao get statusDao => _statusDao ??= StatusDao(this as AppDatabase);
  AccountDao _accountDao;
  AccountDao get accountDao => _accountDao ??= AccountDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbStatuses, dbAccounts];
}
