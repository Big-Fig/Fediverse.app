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
  final bool pinned;
  final String content;
  final String reblogStatusRemoteId;
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
  final List<PleromaStatusEmojiReaction> pleromaEmojiReactions;
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
      this.bookmarked,
      this.pinned,
      this.content,
      this.reblogStatusRemoteId,
      this.application,
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
      pinned:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}pinned']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      reblogStatusRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}reblog_status_remote_id']),
      application: $DbStatusesTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}application'])),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      mediaAttachments: $DbStatusesTable.$converter2.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachments'])),
      mentions: $DbStatusesTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mentions'])),
      tags: $DbStatusesTable.$converter4.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags'])),
      emojis: $DbStatusesTable.$converter5.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      poll: $DbStatusesTable.$converter6.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}poll'])),
      card: $DbStatusesTable.$converter7.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}card'])),
      language: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
      pleromaContent: $DbStatusesTable.$converter8.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_content'])),
      pleromaConversationId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_conversation_id']),
      pleromaDirectConversationId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_direct_conversation_id']),
      pleromaInReplyToAccountAcct: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_in_reply_to_account_acct']),
      pleromaLocal: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_local']),
      pleromaSpoilerText: $DbStatusesTable.$converter9.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_spoiler_text'])),
      pleromaExpiresAt: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_expires_at']),
      pleromaThreadMuted: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_thread_muted']),
      pleromaEmojiReactions: $DbStatusesTable.$converter10.mapToDart(
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
      pinned: serializer.fromJson<bool>(json['pinned']),
      content: serializer.fromJson<String>(json['content']),
      reblogStatusRemoteId:
          serializer.fromJson<String>(json['reblogStatusRemoteId']),
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
      pleromaEmojiReactions:
          serializer.fromJson<List<PleromaStatusEmojiReaction>>(
              json['pleromaEmojiReactions']),
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
      'pinned': serializer.toJson<bool>(pinned),
      'content': serializer.toJson<String>(content),
      'reblogStatusRemoteId': serializer.toJson<String>(reblogStatusRemoteId),
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
      'pleromaEmojiReactions': serializer
          .toJson<List<PleromaStatusEmojiReaction>>(pleromaEmojiReactions),
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
      reblogStatusRemoteId: reblogStatusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(reblogStatusRemoteId),
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
          bool pinned,
          String content,
          String reblogStatusRemoteId,
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
          List<PleromaStatusEmojiReaction> pleromaEmojiReactions}) =>
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
        reblogStatusRemoteId: reblogStatusRemoteId ?? this.reblogStatusRemoteId,
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
          ..write('pinned: $pinned, ')
          ..write('content: $content, ')
          ..write('reblogStatusRemoteId: $reblogStatusRemoteId, ')
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
                                                                          pinned
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              content.hashCode,
                                                                              $mrjc(reblogStatusRemoteId.hashCode, $mrjc(application.hashCode, $mrjc(accountRemoteId.hashCode, $mrjc(mediaAttachments.hashCode, $mrjc(mentions.hashCode, $mrjc(tags.hashCode, $mrjc(emojis.hashCode, $mrjc(poll.hashCode, $mrjc(card.hashCode, $mrjc(language.hashCode, $mrjc(pleromaContent.hashCode, $mrjc(pleromaConversationId.hashCode, $mrjc(pleromaDirectConversationId.hashCode, $mrjc(pleromaInReplyToAccountAcct.hashCode, $mrjc(pleromaLocal.hashCode, $mrjc(pleromaSpoilerText.hashCode, $mrjc(pleromaExpiresAt.hashCode, $mrjc(pleromaThreadMuted.hashCode, pleromaEmojiReactions.hashCode))))))))))))))))))))))))))))))))))))));
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
          other.reblogStatusRemoteId == this.reblogStatusRemoteId &&
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
  final Value<bool> pinned;
  final Value<String> content;
  final Value<String> reblogStatusRemoteId;
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
  final Value<List<PleromaStatusEmojiReaction>> pleromaEmojiReactions;
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
    this.reblogStatusRemoteId = const Value.absent(),
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
    this.favourited = const Value.absent(),
    this.reblogged = const Value.absent(),
    this.muted = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.pinned = const Value.absent(),
    this.content = const Value.absent(),
    this.reblogStatusRemoteId = const Value.absent(),
    this.application = const Value.absent(),
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
      Value<bool> pinned,
      Value<String> content,
      Value<String> reblogStatusRemoteId,
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
      Value<List<PleromaStatusEmojiReaction>> pleromaEmojiReactions}) {
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
      reblogStatusRemoteId: reblogStatusRemoteId ?? this.reblogStatusRemoteId,
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
    return GeneratedBoolColumn('favourited', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _rebloggedMeta = const VerificationMeta('reblogged');
  GeneratedBoolColumn _reblogged;
  @override
  GeneratedBoolColumn get reblogged => _reblogged ??= _constructReblogged();
  GeneratedBoolColumn _constructReblogged() {
    return GeneratedBoolColumn('reblogged', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _mutedMeta = const VerificationMeta('muted');
  GeneratedBoolColumn _muted;
  @override
  GeneratedBoolColumn get muted => _muted ??= _constructMuted();
  GeneratedBoolColumn _constructMuted() {
    return GeneratedBoolColumn('muted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _bookmarkedMeta = const VerificationMeta('bookmarked');
  GeneratedBoolColumn _bookmarked;
  @override
  GeneratedBoolColumn get bookmarked => _bookmarked ??= _constructBookmarked();
  GeneratedBoolColumn _constructBookmarked() {
    return GeneratedBoolColumn(
      'bookmarked',
      $tableName,
      true,
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
      true,
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

  final VerificationMeta _reblogStatusRemoteIdMeta =
      const VerificationMeta('reblogStatusRemoteId');
  GeneratedTextColumn _reblogStatusRemoteId;
  @override
  GeneratedTextColumn get reblogStatusRemoteId =>
      _reblogStatusRemoteId ??= _constructReblogStatusRemoteId();
  GeneratedTextColumn _constructReblogStatusRemoteId() {
    return GeneratedTextColumn(
      'reblog_status_remote_id',
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
      true,
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
        pinned,
        content,
        reblogStatusRemoteId,
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
    }
    if (d.reblogged.present) {
      context.handle(_rebloggedMeta,
          reblogged.isAcceptableValue(d.reblogged.value, _rebloggedMeta));
    }
    if (d.muted.present) {
      context.handle(
          _mutedMeta, muted.isAcceptableValue(d.muted.value, _mutedMeta));
    }
    if (d.bookmarked.present) {
      context.handle(_bookmarkedMeta,
          bookmarked.isAcceptableValue(d.bookmarked.value, _bookmarkedMeta));
    }
    if (d.pinned.present) {
      context.handle(
          _pinnedMeta, pinned.isAcceptableValue(d.pinned.value, _pinnedMeta));
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    }
    if (d.reblogStatusRemoteId.present) {
      context.handle(
          _reblogStatusRemoteIdMeta,
          reblogStatusRemoteId.isAcceptableValue(
              d.reblogStatusRemoteId.value, _reblogStatusRemoteIdMeta));
    }
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
    if (d.pinned.present) {
      map['pinned'] = Variable<bool, BoolType>(d.pinned.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.reblogStatusRemoteId.present) {
      map['reblog_status_remote_id'] =
          Variable<String, StringType>(d.reblogStatusRemoteId.value);
    }
    if (d.application.present) {
      final converter = $DbStatusesTable.$converter1;
      map['application'] =
          Variable<String, StringType>(converter.mapToSql(d.application.value));
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.mediaAttachments.present) {
      final converter = $DbStatusesTable.$converter2;
      map['media_attachments'] = Variable<String, StringType>(
          converter.mapToSql(d.mediaAttachments.value));
    }
    if (d.mentions.present) {
      final converter = $DbStatusesTable.$converter3;
      map['mentions'] =
          Variable<String, StringType>(converter.mapToSql(d.mentions.value));
    }
    if (d.tags.present) {
      final converter = $DbStatusesTable.$converter4;
      map['tags'] =
          Variable<String, StringType>(converter.mapToSql(d.tags.value));
    }
    if (d.emojis.present) {
      final converter = $DbStatusesTable.$converter5;
      map['emojis'] =
          Variable<String, StringType>(converter.mapToSql(d.emojis.value));
    }
    if (d.poll.present) {
      final converter = $DbStatusesTable.$converter6;
      map['poll'] =
          Variable<String, StringType>(converter.mapToSql(d.poll.value));
    }
    if (d.card.present) {
      final converter = $DbStatusesTable.$converter7;
      map['card'] =
          Variable<String, StringType>(converter.mapToSql(d.card.value));
    }
    if (d.language.present) {
      map['language'] = Variable<String, StringType>(d.language.value);
    }
    if (d.pleromaContent.present) {
      final converter = $DbStatusesTable.$converter8;
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
      final converter = $DbStatusesTable.$converter9;
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
      final converter = $DbStatusesTable.$converter10;
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
  static TypeConverter<PleromaApplication, String> $converter1 =
      PleromaApplicationDatabaseConverter();
  static TypeConverter<List<PleromaMediaAttachment>, String> $converter2 =
      PleromaMediaAttachmentListDatabaseConverter();
  static TypeConverter<List<PleromaMention>, String> $converter3 =
      PleromaMentionListDatabaseConverter();
  static TypeConverter<List<PleromaTag>, String> $converter4 =
      PleromaTagListDatabaseConverter();
  static TypeConverter<List<PleromaEmoji>, String> $converter5 =
      PleromaEmojiListDatabaseConverter();
  static TypeConverter<PleromaPoll, String> $converter6 =
      PleromaPollDatabaseConverter();
  static TypeConverter<PleromaCard, String> $converter7 =
      PleromaCardDatabaseConverter();
  static TypeConverter<PleromaContent, String> $converter8 =
      PleromaContentDatabaseConverter();
  static TypeConverter<PleromaContent, String> $converter9 =
      PleromaContentDatabaseConverter();
  static TypeConverter<List<PleromaStatusEmojiReaction>, String> $converter10 =
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
  final List<PleromaTag> pleromaTags;
  final PleromaAccountRelationship pleromaRelationship;
  final bool pleromaIsAdmin;
  final bool pleromaIsModerator;
  final bool pleromaConfirmationPending;
  final bool pleromaHideFavorites;
  final bool pleromaHideFollowers;
  final bool pleromaHideFollows;
  final bool pleromaHideFollowersCount;
  final bool pleromaHideFollowsCount;
  final bool pleromaDeactivated;
  final bool pleromaAllowFollowingMove;
  final bool pleromaSkipThreadContainment;
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
      this.lastStatusAt,
      this.fields,
      this.emojis,
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
      this.pleromaDeactivated,
      this.pleromaAllowFollowingMove,
      this.pleromaSkipThreadContainment});
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
      pleromaTags: $DbAccountsTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_tags'])),
      pleromaRelationship: $DbAccountsTable.$converter3.mapToDart(
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
      pleromaDeactivated: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_deactivated']),
      pleromaAllowFollowingMove: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_allow_following_move']),
      pleromaSkipThreadContainment: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_skip_thread_containment']),
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
      pleromaTags: serializer.fromJson<List<PleromaTag>>(json['pleromaTags']),
      pleromaRelationship: serializer
          .fromJson<PleromaAccountRelationship>(json['pleromaRelationship']),
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
      pleromaDeactivated: serializer.fromJson<bool>(json['pleromaDeactivated']),
      pleromaAllowFollowingMove:
          serializer.fromJson<bool>(json['pleromaAllowFollowingMove']),
      pleromaSkipThreadContainment:
          serializer.fromJson<bool>(json['pleromaSkipThreadContainment']),
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
      'pleromaTags': serializer.toJson<List<PleromaTag>>(pleromaTags),
      'pleromaRelationship':
          serializer.toJson<PleromaAccountRelationship>(pleromaRelationship),
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
      'pleromaDeactivated': serializer.toJson<bool>(pleromaDeactivated),
      'pleromaAllowFollowingMove':
          serializer.toJson<bool>(pleromaAllowFollowingMove),
      'pleromaSkipThreadContainment':
          serializer.toJson<bool>(pleromaSkipThreadContainment),
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
      pleromaDeactivated: pleromaDeactivated == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaDeactivated),
      pleromaAllowFollowingMove:
          pleromaAllowFollowingMove == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaAllowFollowingMove),
      pleromaSkipThreadContainment:
          pleromaSkipThreadContainment == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaSkipThreadContainment),
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
          List<PleromaTag> pleromaTags,
          PleromaAccountRelationship pleromaRelationship,
          bool pleromaIsAdmin,
          bool pleromaIsModerator,
          bool pleromaConfirmationPending,
          bool pleromaHideFavorites,
          bool pleromaHideFollowers,
          bool pleromaHideFollows,
          bool pleromaHideFollowersCount,
          bool pleromaHideFollowsCount,
          bool pleromaDeactivated,
          bool pleromaAllowFollowingMove,
          bool pleromaSkipThreadContainment}) =>
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
        pleromaDeactivated: pleromaDeactivated ?? this.pleromaDeactivated,
        pleromaAllowFollowingMove:
            pleromaAllowFollowingMove ?? this.pleromaAllowFollowingMove,
        pleromaSkipThreadContainment:
            pleromaSkipThreadContainment ?? this.pleromaSkipThreadContainment,
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
          ..write('pleromaDeactivated: $pleromaDeactivated, ')
          ..write('pleromaAllowFollowingMove: $pleromaAllowFollowingMove, ')
          ..write('pleromaSkipThreadContainment: $pleromaSkipThreadContainment')
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
                                                                              $mrjc(emojis.hashCode, $mrjc(pleromaTags.hashCode, $mrjc(pleromaRelationship.hashCode, $mrjc(pleromaIsAdmin.hashCode, $mrjc(pleromaIsModerator.hashCode, $mrjc(pleromaConfirmationPending.hashCode, $mrjc(pleromaHideFavorites.hashCode, $mrjc(pleromaHideFollowers.hashCode, $mrjc(pleromaHideFollows.hashCode, $mrjc(pleromaHideFollowersCount.hashCode, $mrjc(pleromaHideFollowsCount.hashCode, $mrjc(pleromaDeactivated.hashCode, $mrjc(pleromaAllowFollowingMove.hashCode, pleromaSkipThreadContainment.hashCode)))))))))))))))))))))))))))))))));
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
          other.pleromaDeactivated == this.pleromaDeactivated &&
          other.pleromaAllowFollowingMove == this.pleromaAllowFollowingMove &&
          other.pleromaSkipThreadContainment ==
              this.pleromaSkipThreadContainment);
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
  final Value<List<PleromaTag>> pleromaTags;
  final Value<PleromaAccountRelationship> pleromaRelationship;
  final Value<bool> pleromaIsAdmin;
  final Value<bool> pleromaIsModerator;
  final Value<bool> pleromaConfirmationPending;
  final Value<bool> pleromaHideFavorites;
  final Value<bool> pleromaHideFollowers;
  final Value<bool> pleromaHideFollows;
  final Value<bool> pleromaHideFollowersCount;
  final Value<bool> pleromaHideFollowsCount;
  final Value<bool> pleromaDeactivated;
  final Value<bool> pleromaAllowFollowingMove;
  final Value<bool> pleromaSkipThreadContainment;
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
    this.pleromaDeactivated = const Value.absent(),
    this.pleromaAllowFollowingMove = const Value.absent(),
    this.pleromaSkipThreadContainment = const Value.absent(),
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
    this.lastStatusAt = const Value.absent(),
    this.fields = const Value.absent(),
    this.emojis = const Value.absent(),
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
    this.pleromaDeactivated = const Value.absent(),
    this.pleromaAllowFollowingMove = const Value.absent(),
    this.pleromaSkipThreadContainment = const Value.absent(),
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
        acct = Value(acct);
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
      Value<List<PleromaTag>> pleromaTags,
      Value<PleromaAccountRelationship> pleromaRelationship,
      Value<bool> pleromaIsAdmin,
      Value<bool> pleromaIsModerator,
      Value<bool> pleromaConfirmationPending,
      Value<bool> pleromaHideFavorites,
      Value<bool> pleromaHideFollowers,
      Value<bool> pleromaHideFollows,
      Value<bool> pleromaHideFollowersCount,
      Value<bool> pleromaHideFollowsCount,
      Value<bool> pleromaDeactivated,
      Value<bool> pleromaAllowFollowingMove,
      Value<bool> pleromaSkipThreadContainment}) {
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
      pleromaDeactivated: pleromaDeactivated ?? this.pleromaDeactivated,
      pleromaAllowFollowingMove:
          pleromaAllowFollowingMove ?? this.pleromaAllowFollowingMove,
      pleromaSkipThreadContainment:
          pleromaSkipThreadContainment ?? this.pleromaSkipThreadContainment,
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
      true,
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
        pleromaDeactivated,
        pleromaAllowFollowingMove,
        pleromaSkipThreadContainment
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
    }
    context.handle(_fieldsMeta, const VerificationResult.success());
    context.handle(_emojisMeta, const VerificationResult.success());
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
    if (d.pleromaSkipThreadContainment.present) {
      context.handle(
          _pleromaSkipThreadContainmentMeta,
          pleromaSkipThreadContainment.isAcceptableValue(
              d.pleromaSkipThreadContainment.value,
              _pleromaSkipThreadContainmentMeta));
    }
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
    if (d.pleromaTags.present) {
      final converter = $DbAccountsTable.$converter2;
      map['pleroma_tags'] =
          Variable<String, StringType>(converter.mapToSql(d.pleromaTags.value));
    }
    if (d.pleromaRelationship.present) {
      final converter = $DbAccountsTable.$converter3;
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
    if (d.pleromaDeactivated.present) {
      map['pleroma_deactivated'] =
          Variable<bool, BoolType>(d.pleromaDeactivated.value);
    }
    if (d.pleromaAllowFollowingMove.present) {
      map['pleroma_allow_following_move'] =
          Variable<bool, BoolType>(d.pleromaAllowFollowingMove.value);
    }
    if (d.pleromaSkipThreadContainment.present) {
      map['pleroma_skip_thread_containment'] =
          Variable<bool, BoolType>(d.pleromaSkipThreadContainment.value);
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
  static TypeConverter<List<PleromaTag>, String> $converter2 =
      PleromaTagListDatabaseConverter();
  static TypeConverter<PleromaAccountRelationship, String> $converter3 =
      PleromaAccountRelationshipDatabaseConverter();
}

class DbConversation extends DataClass implements Insertable<DbConversation> {
  final int id;
  final String remoteId;
  final bool unread;
  DbConversation(
      {@required this.id, @required this.remoteId, @required this.unread});
  factory DbConversation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return DbConversation(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      unread:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}unread']),
    );
  }
  factory DbConversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversation(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      unread: serializer.fromJson<bool>(json['unread']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'unread': serializer.toJson<bool>(unread),
    };
  }

  @override
  DbConversationsCompanion createCompanion(bool nullToAbsent) {
    return DbConversationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      unread:
          unread == null && nullToAbsent ? const Value.absent() : Value(unread),
    );
  }

  DbConversation copyWith({int id, String remoteId, bool unread}) =>
      DbConversation(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        unread: unread ?? this.unread,
      );
  @override
  String toString() {
    return (StringBuffer('DbConversation(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('unread: $unread')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(remoteId.hashCode, unread.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbConversation &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.unread == this.unread);
}

class DbConversationsCompanion extends UpdateCompanion<DbConversation> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<bool> unread;
  const DbConversationsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.unread = const Value.absent(),
  });
  DbConversationsCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required bool unread,
  })  : remoteId = Value(remoteId),
        unread = Value(unread);
  DbConversationsCompanion copyWith(
      {Value<int> id, Value<String> remoteId, Value<bool> unread}) {
    return DbConversationsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      unread: unread ?? this.unread,
    );
  }
}

class $DbConversationsTable extends DbConversations
    with TableInfo<$DbConversationsTable, DbConversation> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbConversationsTable(this._db, [this._alias]);
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

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedBoolColumn _unread;
  @override
  GeneratedBoolColumn get unread => _unread ??= _constructUnread();
  GeneratedBoolColumn _constructUnread() {
    return GeneratedBoolColumn(
      'unread',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, remoteId, unread];
  @override
  $DbConversationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_conversations';
  @override
  final String actualTableName = 'db_conversations';
  @override
  VerificationContext validateIntegrity(DbConversationsCompanion d,
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
    if (d.unread.present) {
      context.handle(
          _unreadMeta, unread.isAcceptableValue(d.unread.value, _unreadMeta));
    } else if (isInserting) {
      context.missing(_unreadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConversation map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbConversation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbConversationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.unread.present) {
      map['unread'] = Variable<bool, BoolType>(d.unread.value);
    }
    return map;
  }

  @override
  $DbConversationsTable createAlias(String alias) {
    return $DbConversationsTable(_db, alias);
  }
}

class DbNotification extends DataClass implements Insertable<DbNotification> {
  final int id;
  final String remoteId;
  final String accountRemoteId;
  final String statusRemoteId;
  final String chatRemoteId;
  final String chatMessageRemoteId;
  final String emoji;
  final PleromaNotificationPleromaPart pleroma;
  final bool unread;
  final String type;
  final DateTime createdAt;
  DbNotification(
      {@required this.id,
      @required this.remoteId,
      @required this.accountRemoteId,
      this.statusRemoteId,
      this.chatRemoteId,
      this.chatMessageRemoteId,
      this.emoji,
      this.pleroma,
      this.unread,
      this.type,
      @required this.createdAt});
  factory DbNotification.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DbNotification(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
      chatRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_remote_id']),
      chatMessageRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}chat_message_remote_id']),
      emoji:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emoji']),
      pleroma: $DbNotificationsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma'])),
      unread:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}unread']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  factory DbNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbNotification(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      chatRemoteId: serializer.fromJson<String>(json['chatRemoteId']),
      chatMessageRemoteId:
          serializer.fromJson<String>(json['chatMessageRemoteId']),
      emoji: serializer.fromJson<String>(json['emoji']),
      pleroma:
          serializer.fromJson<PleromaNotificationPleromaPart>(json['pleroma']),
      unread: serializer.fromJson<bool>(json['unread']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'chatRemoteId': serializer.toJson<String>(chatRemoteId),
      'chatMessageRemoteId': serializer.toJson<String>(chatMessageRemoteId),
      'emoji': serializer.toJson<String>(emoji),
      'pleroma': serializer.toJson<PleromaNotificationPleromaPart>(pleroma),
      'unread': serializer.toJson<bool>(unread),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  @override
  DbNotificationsCompanion createCompanion(bool nullToAbsent) {
    return DbNotificationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
      chatRemoteId: chatRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(chatRemoteId),
      chatMessageRemoteId: chatMessageRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(chatMessageRemoteId),
      emoji:
          emoji == null && nullToAbsent ? const Value.absent() : Value(emoji),
      pleroma: pleroma == null && nullToAbsent
          ? const Value.absent()
          : Value(pleroma),
      unread:
          unread == null && nullToAbsent ? const Value.absent() : Value(unread),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  DbNotification copyWith(
          {int id,
          String remoteId,
          String accountRemoteId,
          String statusRemoteId,
          String chatRemoteId,
          String chatMessageRemoteId,
          String emoji,
          PleromaNotificationPleromaPart pleroma,
          bool unread,
          String type,
          DateTime createdAt}) =>
      DbNotification(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
        chatRemoteId: chatRemoteId ?? this.chatRemoteId,
        chatMessageRemoteId: chatMessageRemoteId ?? this.chatMessageRemoteId,
        emoji: emoji ?? this.emoji,
        pleroma: pleroma ?? this.pleroma,
        unread: unread ?? this.unread,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbNotification(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('chatRemoteId: $chatRemoteId, ')
          ..write('chatMessageRemoteId: $chatMessageRemoteId, ')
          ..write('emoji: $emoji, ')
          ..write('pleroma: $pleroma, ')
          ..write('unread: $unread, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              accountRemoteId.hashCode,
              $mrjc(
                  statusRemoteId.hashCode,
                  $mrjc(
                      chatRemoteId.hashCode,
                      $mrjc(
                          chatMessageRemoteId.hashCode,
                          $mrjc(
                              emoji.hashCode,
                              $mrjc(
                                  pleroma.hashCode,
                                  $mrjc(
                                      unread.hashCode,
                                      $mrjc(type.hashCode,
                                          createdAt.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbNotification &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.accountRemoteId == this.accountRemoteId &&
          other.statusRemoteId == this.statusRemoteId &&
          other.chatRemoteId == this.chatRemoteId &&
          other.chatMessageRemoteId == this.chatMessageRemoteId &&
          other.emoji == this.emoji &&
          other.pleroma == this.pleroma &&
          other.unread == this.unread &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class DbNotificationsCompanion extends UpdateCompanion<DbNotification> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<String> accountRemoteId;
  final Value<String> statusRemoteId;
  final Value<String> chatRemoteId;
  final Value<String> chatMessageRemoteId;
  final Value<String> emoji;
  final Value<PleromaNotificationPleromaPart> pleroma;
  final Value<bool> unread;
  final Value<String> type;
  final Value<DateTime> createdAt;
  const DbNotificationsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.chatMessageRemoteId = const Value.absent(),
    this.emoji = const Value.absent(),
    this.pleroma = const Value.absent(),
    this.unread = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DbNotificationsCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required String accountRemoteId,
    this.statusRemoteId = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.chatMessageRemoteId = const Value.absent(),
    this.emoji = const Value.absent(),
    this.pleroma = const Value.absent(),
    this.unread = const Value.absent(),
    this.type = const Value.absent(),
    @required DateTime createdAt,
  })  : remoteId = Value(remoteId),
        accountRemoteId = Value(accountRemoteId),
        createdAt = Value(createdAt);
  DbNotificationsCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<String> accountRemoteId,
      Value<String> statusRemoteId,
      Value<String> chatRemoteId,
      Value<String> chatMessageRemoteId,
      Value<String> emoji,
      Value<PleromaNotificationPleromaPart> pleroma,
      Value<bool> unread,
      Value<String> type,
      Value<DateTime> createdAt}) {
    return DbNotificationsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      chatRemoteId: chatRemoteId ?? this.chatRemoteId,
      chatMessageRemoteId: chatMessageRemoteId ?? this.chatMessageRemoteId,
      emoji: emoji ?? this.emoji,
      pleroma: pleroma ?? this.pleroma,
      unread: unread ?? this.unread,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class $DbNotificationsTable extends DbNotifications
    with TableInfo<$DbNotificationsTable, DbNotification> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbNotificationsTable(this._db, [this._alias]);
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

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  GeneratedTextColumn _chatRemoteId;
  @override
  GeneratedTextColumn get chatRemoteId =>
      _chatRemoteId ??= _constructChatRemoteId();
  GeneratedTextColumn _constructChatRemoteId() {
    return GeneratedTextColumn(
      'chat_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chatMessageRemoteIdMeta =
      const VerificationMeta('chatMessageRemoteId');
  GeneratedTextColumn _chatMessageRemoteId;
  @override
  GeneratedTextColumn get chatMessageRemoteId =>
      _chatMessageRemoteId ??= _constructChatMessageRemoteId();
  GeneratedTextColumn _constructChatMessageRemoteId() {
    return GeneratedTextColumn(
      'chat_message_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  GeneratedTextColumn _emoji;
  @override
  GeneratedTextColumn get emoji => _emoji ??= _constructEmoji();
  GeneratedTextColumn _constructEmoji() {
    return GeneratedTextColumn(
      'emoji',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaMeta = const VerificationMeta('pleroma');
  GeneratedTextColumn _pleroma;
  @override
  GeneratedTextColumn get pleroma => _pleroma ??= _constructPleroma();
  GeneratedTextColumn _constructPleroma() {
    return GeneratedTextColumn(
      'pleroma',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedBoolColumn _unread;
  @override
  GeneratedBoolColumn get unread => _unread ??= _constructUnread();
  GeneratedBoolColumn _constructUnread() {
    return GeneratedBoolColumn(
      'unread',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      true,
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

  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        accountRemoteId,
        statusRemoteId,
        chatRemoteId,
        chatMessageRemoteId,
        emoji,
        pleroma,
        unread,
        type,
        createdAt
      ];
  @override
  $DbNotificationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_notifications';
  @override
  final String actualTableName = 'db_notifications';
  @override
  VerificationContext validateIntegrity(DbNotificationsCompanion d,
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
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    }
    if (d.chatRemoteId.present) {
      context.handle(
          _chatRemoteIdMeta,
          chatRemoteId.isAcceptableValue(
              d.chatRemoteId.value, _chatRemoteIdMeta));
    }
    if (d.chatMessageRemoteId.present) {
      context.handle(
          _chatMessageRemoteIdMeta,
          chatMessageRemoteId.isAcceptableValue(
              d.chatMessageRemoteId.value, _chatMessageRemoteIdMeta));
    }
    if (d.emoji.present) {
      context.handle(
          _emojiMeta, emoji.isAcceptableValue(d.emoji.value, _emojiMeta));
    }
    context.handle(_pleromaMeta, const VerificationResult.success());
    if (d.unread.present) {
      context.handle(
          _unreadMeta, unread.isAcceptableValue(d.unread.value, _unreadMeta));
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbNotification map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbNotification.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbNotificationsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    if (d.chatRemoteId.present) {
      map['chat_remote_id'] =
          Variable<String, StringType>(d.chatRemoteId.value);
    }
    if (d.chatMessageRemoteId.present) {
      map['chat_message_remote_id'] =
          Variable<String, StringType>(d.chatMessageRemoteId.value);
    }
    if (d.emoji.present) {
      map['emoji'] = Variable<String, StringType>(d.emoji.value);
    }
    if (d.pleroma.present) {
      final converter = $DbNotificationsTable.$converter0;
      map['pleroma'] =
          Variable<String, StringType>(converter.mapToSql(d.pleroma.value));
    }
    if (d.unread.present) {
      map['unread'] = Variable<bool, BoolType>(d.unread.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    return map;
  }

  @override
  $DbNotificationsTable createAlias(String alias) {
    return $DbNotificationsTable(_db, alias);
  }

  static TypeConverter<PleromaNotificationPleromaPart, String> $converter0 =
      PleromaNotificationPleromaPartDatabaseConverter();
}

class DbConversationStatus extends DataClass
    implements Insertable<DbConversationStatus> {
  final int id;
  final String conversationRemoteId;
  final String statusRemoteId;
  DbConversationStatus(
      {@required this.id,
      @required this.conversationRemoteId,
      @required this.statusRemoteId});
  factory DbConversationStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbConversationStatus(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      conversationRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}conversation_remote_id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
    );
  }
  factory DbConversationStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversationStatus(
      id: serializer.fromJson<int>(json['id']),
      conversationRemoteId:
          serializer.fromJson<String>(json['conversationRemoteId']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'conversationRemoteId': serializer.toJson<String>(conversationRemoteId),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
    };
  }

  @override
  DbConversationStatusesCompanion createCompanion(bool nullToAbsent) {
    return DbConversationStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      conversationRemoteId: conversationRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(conversationRemoteId),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
    );
  }

  DbConversationStatus copyWith(
          {int id, String conversationRemoteId, String statusRemoteId}) =>
      DbConversationStatus(
        id: id ?? this.id,
        conversationRemoteId: conversationRemoteId ?? this.conversationRemoteId,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbConversationStatus(')
          ..write('id: $id, ')
          ..write('conversationRemoteId: $conversationRemoteId, ')
          ..write('statusRemoteId: $statusRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(conversationRemoteId.hashCode, statusRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbConversationStatus &&
          other.id == this.id &&
          other.conversationRemoteId == this.conversationRemoteId &&
          other.statusRemoteId == this.statusRemoteId);
}

class DbConversationStatusesCompanion
    extends UpdateCompanion<DbConversationStatus> {
  final Value<int> id;
  final Value<String> conversationRemoteId;
  final Value<String> statusRemoteId;
  const DbConversationStatusesCompanion({
    this.id = const Value.absent(),
    this.conversationRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
  });
  DbConversationStatusesCompanion.insert({
    this.id = const Value.absent(),
    @required String conversationRemoteId,
    @required String statusRemoteId,
  })  : conversationRemoteId = Value(conversationRemoteId),
        statusRemoteId = Value(statusRemoteId);
  DbConversationStatusesCompanion copyWith(
      {Value<int> id,
      Value<String> conversationRemoteId,
      Value<String> statusRemoteId}) {
    return DbConversationStatusesCompanion(
      id: id ?? this.id,
      conversationRemoteId: conversationRemoteId ?? this.conversationRemoteId,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
    );
  }
}

class $DbConversationStatusesTable extends DbConversationStatuses
    with TableInfo<$DbConversationStatusesTable, DbConversationStatus> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbConversationStatusesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _conversationRemoteIdMeta =
      const VerificationMeta('conversationRemoteId');
  GeneratedTextColumn _conversationRemoteId;
  @override
  GeneratedTextColumn get conversationRemoteId =>
      _conversationRemoteId ??= _constructConversationRemoteId();
  GeneratedTextColumn _constructConversationRemoteId() {
    return GeneratedTextColumn(
      'conversation_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, conversationRemoteId, statusRemoteId];
  @override
  $DbConversationStatusesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_conversation_statuses';
  @override
  final String actualTableName = 'db_conversation_statuses';
  @override
  VerificationContext validateIntegrity(DbConversationStatusesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.conversationRemoteId.present) {
      context.handle(
          _conversationRemoteIdMeta,
          conversationRemoteId.isAcceptableValue(
              d.conversationRemoteId.value, _conversationRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_conversationRemoteIdMeta);
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConversationStatus map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbConversationStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbConversationStatusesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.conversationRemoteId.present) {
      map['conversation_remote_id'] =
          Variable<String, StringType>(d.conversationRemoteId.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    return map;
  }

  @override
  $DbConversationStatusesTable createAlias(String alias) {
    return $DbConversationStatusesTable(_db, alias);
  }
}

class DbStatusHashtag extends DataClass implements Insertable<DbStatusHashtag> {
  final int id;
  final String statusRemoteId;
  final String hashtag;
  DbStatusHashtag(
      {@required this.id,
      @required this.statusRemoteId,
      @required this.hashtag});
  factory DbStatusHashtag.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbStatusHashtag(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
      hashtag:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}hashtag']),
    );
  }
  factory DbStatusHashtag.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusHashtag(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      hashtag: serializer.fromJson<String>(json['hashtag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'hashtag': serializer.toJson<String>(hashtag),
    };
  }

  @override
  DbStatusHashtagsCompanion createCompanion(bool nullToAbsent) {
    return DbStatusHashtagsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
      hashtag: hashtag == null && nullToAbsent
          ? const Value.absent()
          : Value(hashtag),
    );
  }

  DbStatusHashtag copyWith({int id, String statusRemoteId, String hashtag}) =>
      DbStatusHashtag(
        id: id ?? this.id,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
        hashtag: hashtag ?? this.hashtag,
      );
  @override
  String toString() {
    return (StringBuffer('DbStatusHashtag(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('hashtag: $hashtag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(statusRemoteId.hashCode, hashtag.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbStatusHashtag &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.hashtag == this.hashtag);
}

class DbStatusHashtagsCompanion extends UpdateCompanion<DbStatusHashtag> {
  final Value<int> id;
  final Value<String> statusRemoteId;
  final Value<String> hashtag;
  const DbStatusHashtagsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.hashtag = const Value.absent(),
  });
  DbStatusHashtagsCompanion.insert({
    this.id = const Value.absent(),
    @required String statusRemoteId,
    @required String hashtag,
  })  : statusRemoteId = Value(statusRemoteId),
        hashtag = Value(hashtag);
  DbStatusHashtagsCompanion copyWith(
      {Value<int> id, Value<String> statusRemoteId, Value<String> hashtag}) {
    return DbStatusHashtagsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      hashtag: hashtag ?? this.hashtag,
    );
  }
}

class $DbStatusHashtagsTable extends DbStatusHashtags
    with TableInfo<$DbStatusHashtagsTable, DbStatusHashtag> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbStatusHashtagsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hashtagMeta = const VerificationMeta('hashtag');
  GeneratedTextColumn _hashtag;
  @override
  GeneratedTextColumn get hashtag => _hashtag ??= _constructHashtag();
  GeneratedTextColumn _constructHashtag() {
    return GeneratedTextColumn(
      'hashtag',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, statusRemoteId, hashtag];
  @override
  $DbStatusHashtagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_status_hashtags';
  @override
  final String actualTableName = 'db_status_hashtags';
  @override
  VerificationContext validateIntegrity(DbStatusHashtagsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (d.hashtag.present) {
      context.handle(_hashtagMeta,
          hashtag.isAcceptableValue(d.hashtag.value, _hashtagMeta));
    } else if (isInserting) {
      context.missing(_hashtagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbStatusHashtag map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusHashtag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbStatusHashtagsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    if (d.hashtag.present) {
      map['hashtag'] = Variable<String, StringType>(d.hashtag.value);
    }
    return map;
  }

  @override
  $DbStatusHashtagsTable createAlias(String alias) {
    return $DbStatusHashtagsTable(_db, alias);
  }
}

class DbStatusList extends DataClass implements Insertable<DbStatusList> {
  final int id;
  final String statusRemoteId;
  final String listRemoteId;
  DbStatusList(
      {@required this.id,
      @required this.statusRemoteId,
      @required this.listRemoteId});
  factory DbStatusList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbStatusList(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
      listRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}list_remote_id']),
    );
  }
  factory DbStatusList.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusList(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      listRemoteId: serializer.fromJson<String>(json['listRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'listRemoteId': serializer.toJson<String>(listRemoteId),
    };
  }

  @override
  DbStatusListsCompanion createCompanion(bool nullToAbsent) {
    return DbStatusListsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
      listRemoteId: listRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(listRemoteId),
    );
  }

  DbStatusList copyWith({int id, String statusRemoteId, String listRemoteId}) =>
      DbStatusList(
        id: id ?? this.id,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
        listRemoteId: listRemoteId ?? this.listRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbStatusList(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('listRemoteId: $listRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(statusRemoteId.hashCode, listRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbStatusList &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.listRemoteId == this.listRemoteId);
}

class DbStatusListsCompanion extends UpdateCompanion<DbStatusList> {
  final Value<int> id;
  final Value<String> statusRemoteId;
  final Value<String> listRemoteId;
  const DbStatusListsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.listRemoteId = const Value.absent(),
  });
  DbStatusListsCompanion.insert({
    this.id = const Value.absent(),
    @required String statusRemoteId,
    @required String listRemoteId,
  })  : statusRemoteId = Value(statusRemoteId),
        listRemoteId = Value(listRemoteId);
  DbStatusListsCompanion copyWith(
      {Value<int> id,
      Value<String> statusRemoteId,
      Value<String> listRemoteId}) {
    return DbStatusListsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      listRemoteId: listRemoteId ?? this.listRemoteId,
    );
  }
}

class $DbStatusListsTable extends DbStatusLists
    with TableInfo<$DbStatusListsTable, DbStatusList> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbStatusListsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _listRemoteIdMeta =
      const VerificationMeta('listRemoteId');
  GeneratedTextColumn _listRemoteId;
  @override
  GeneratedTextColumn get listRemoteId =>
      _listRemoteId ??= _constructListRemoteId();
  GeneratedTextColumn _constructListRemoteId() {
    return GeneratedTextColumn(
      'list_remote_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, statusRemoteId, listRemoteId];
  @override
  $DbStatusListsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_status_lists';
  @override
  final String actualTableName = 'db_status_lists';
  @override
  VerificationContext validateIntegrity(DbStatusListsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (d.listRemoteId.present) {
      context.handle(
          _listRemoteIdMeta,
          listRemoteId.isAcceptableValue(
              d.listRemoteId.value, _listRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_listRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbStatusList map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusList.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbStatusListsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    if (d.listRemoteId.present) {
      map['list_remote_id'] =
          Variable<String, StringType>(d.listRemoteId.value);
    }
    return map;
  }

  @override
  $DbStatusListsTable createAlias(String alias) {
    return $DbStatusListsTable(_db, alias);
  }
}

class DbStatusFavouritedAccount extends DataClass
    implements Insertable<DbStatusFavouritedAccount> {
  final int id;
  final String statusRemoteId;
  final String accountRemoteId;
  DbStatusFavouritedAccount(
      {@required this.id,
      @required this.statusRemoteId,
      @required this.accountRemoteId});
  factory DbStatusFavouritedAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbStatusFavouritedAccount(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
    );
  }
  factory DbStatusFavouritedAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusFavouritedAccount(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
    };
  }

  @override
  DbStatusFavouritedAccountsCompanion createCompanion(bool nullToAbsent) {
    return DbStatusFavouritedAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
    );
  }

  DbStatusFavouritedAccount copyWith(
          {int id, String statusRemoteId, String accountRemoteId}) =>
      DbStatusFavouritedAccount(
        id: id ?? this.id,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbStatusFavouritedAccount(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(statusRemoteId.hashCode, accountRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbStatusFavouritedAccount &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbStatusFavouritedAccountsCompanion
    extends UpdateCompanion<DbStatusFavouritedAccount> {
  final Value<int> id;
  final Value<String> statusRemoteId;
  final Value<String> accountRemoteId;
  const DbStatusFavouritedAccountsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbStatusFavouritedAccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String statusRemoteId,
    @required String accountRemoteId,
  })  : statusRemoteId = Value(statusRemoteId),
        accountRemoteId = Value(accountRemoteId);
  DbStatusFavouritedAccountsCompanion copyWith(
      {Value<int> id,
      Value<String> statusRemoteId,
      Value<String> accountRemoteId}) {
    return DbStatusFavouritedAccountsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }
}

class $DbStatusFavouritedAccountsTable extends DbStatusFavouritedAccounts
    with
        TableInfo<$DbStatusFavouritedAccountsTable, DbStatusFavouritedAccount> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbStatusFavouritedAccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
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

  @override
  List<GeneratedColumn> get $columns => [id, statusRemoteId, accountRemoteId];
  @override
  $DbStatusFavouritedAccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_status_favourited_accounts';
  @override
  final String actualTableName = 'db_status_favourited_accounts';
  @override
  VerificationContext validateIntegrity(DbStatusFavouritedAccountsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbStatusFavouritedAccount map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusFavouritedAccount.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbStatusFavouritedAccountsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    return map;
  }

  @override
  $DbStatusFavouritedAccountsTable createAlias(String alias) {
    return $DbStatusFavouritedAccountsTable(_db, alias);
  }
}

class DbStatusRebloggedAccount extends DataClass
    implements Insertable<DbStatusRebloggedAccount> {
  final int id;
  final String statusRemoteId;
  final String accountRemoteId;
  DbStatusRebloggedAccount(
      {@required this.id,
      @required this.statusRemoteId,
      @required this.accountRemoteId});
  factory DbStatusRebloggedAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbStatusRebloggedAccount(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
    );
  }
  factory DbStatusRebloggedAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusRebloggedAccount(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
    };
  }

  @override
  DbStatusRebloggedAccountsCompanion createCompanion(bool nullToAbsent) {
    return DbStatusRebloggedAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
    );
  }

  DbStatusRebloggedAccount copyWith(
          {int id, String statusRemoteId, String accountRemoteId}) =>
      DbStatusRebloggedAccount(
        id: id ?? this.id,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbStatusRebloggedAccount(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(statusRemoteId.hashCode, accountRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbStatusRebloggedAccount &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbStatusRebloggedAccountsCompanion
    extends UpdateCompanion<DbStatusRebloggedAccount> {
  final Value<int> id;
  final Value<String> statusRemoteId;
  final Value<String> accountRemoteId;
  const DbStatusRebloggedAccountsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbStatusRebloggedAccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String statusRemoteId,
    @required String accountRemoteId,
  })  : statusRemoteId = Value(statusRemoteId),
        accountRemoteId = Value(accountRemoteId);
  DbStatusRebloggedAccountsCompanion copyWith(
      {Value<int> id,
      Value<String> statusRemoteId,
      Value<String> accountRemoteId}) {
    return DbStatusRebloggedAccountsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }
}

class $DbStatusRebloggedAccountsTable extends DbStatusRebloggedAccounts
    with TableInfo<$DbStatusRebloggedAccountsTable, DbStatusRebloggedAccount> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbStatusRebloggedAccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
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

  @override
  List<GeneratedColumn> get $columns => [id, statusRemoteId, accountRemoteId];
  @override
  $DbStatusRebloggedAccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_status_reblogged_accounts';
  @override
  final String actualTableName = 'db_status_reblogged_accounts';
  @override
  VerificationContext validateIntegrity(DbStatusRebloggedAccountsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbStatusRebloggedAccount map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusRebloggedAccount.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbStatusRebloggedAccountsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    return map;
  }

  @override
  $DbStatusRebloggedAccountsTable createAlias(String alias) {
    return $DbStatusRebloggedAccountsTable(_db, alias);
  }
}

class DbAccountFollowing extends DataClass
    implements Insertable<DbAccountFollowing> {
  final int id;
  final String accountRemoteId;
  final String followingAccountRemoteId;
  DbAccountFollowing(
      {@required this.id,
      @required this.accountRemoteId,
      @required this.followingAccountRemoteId});
  factory DbAccountFollowing.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbAccountFollowing(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      followingAccountRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}following_account_remote_id']),
    );
  }
  factory DbAccountFollowing.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccountFollowing(
      id: serializer.fromJson<int>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      followingAccountRemoteId:
          serializer.fromJson<String>(json['followingAccountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'followingAccountRemoteId':
          serializer.toJson<String>(followingAccountRemoteId),
    };
  }

  @override
  DbAccountFollowingsCompanion createCompanion(bool nullToAbsent) {
    return DbAccountFollowingsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
      followingAccountRemoteId: followingAccountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(followingAccountRemoteId),
    );
  }

  DbAccountFollowing copyWith(
          {int id, String accountRemoteId, String followingAccountRemoteId}) =>
      DbAccountFollowing(
        id: id ?? this.id,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        followingAccountRemoteId:
            followingAccountRemoteId ?? this.followingAccountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbAccountFollowing(')
          ..write('id: $id, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('followingAccountRemoteId: $followingAccountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(accountRemoteId.hashCode, followingAccountRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbAccountFollowing &&
          other.id == this.id &&
          other.accountRemoteId == this.accountRemoteId &&
          other.followingAccountRemoteId == this.followingAccountRemoteId);
}

class DbAccountFollowingsCompanion extends UpdateCompanion<DbAccountFollowing> {
  final Value<int> id;
  final Value<String> accountRemoteId;
  final Value<String> followingAccountRemoteId;
  const DbAccountFollowingsCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.followingAccountRemoteId = const Value.absent(),
  });
  DbAccountFollowingsCompanion.insert({
    this.id = const Value.absent(),
    @required String accountRemoteId,
    @required String followingAccountRemoteId,
  })  : accountRemoteId = Value(accountRemoteId),
        followingAccountRemoteId = Value(followingAccountRemoteId);
  DbAccountFollowingsCompanion copyWith(
      {Value<int> id,
      Value<String> accountRemoteId,
      Value<String> followingAccountRemoteId}) {
    return DbAccountFollowingsCompanion(
      id: id ?? this.id,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      followingAccountRemoteId:
          followingAccountRemoteId ?? this.followingAccountRemoteId,
    );
  }
}

class $DbAccountFollowingsTable extends DbAccountFollowings
    with TableInfo<$DbAccountFollowingsTable, DbAccountFollowing> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbAccountFollowingsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
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

  final VerificationMeta _followingAccountRemoteIdMeta =
      const VerificationMeta('followingAccountRemoteId');
  GeneratedTextColumn _followingAccountRemoteId;
  @override
  GeneratedTextColumn get followingAccountRemoteId =>
      _followingAccountRemoteId ??= _constructFollowingAccountRemoteId();
  GeneratedTextColumn _constructFollowingAccountRemoteId() {
    return GeneratedTextColumn(
      'following_account_remote_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, accountRemoteId, followingAccountRemoteId];
  @override
  $DbAccountFollowingsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_account_followings';
  @override
  final String actualTableName = 'db_account_followings';
  @override
  VerificationContext validateIntegrity(DbAccountFollowingsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (d.followingAccountRemoteId.present) {
      context.handle(
          _followingAccountRemoteIdMeta,
          followingAccountRemoteId.isAcceptableValue(
              d.followingAccountRemoteId.value, _followingAccountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_followingAccountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAccountFollowing map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbAccountFollowing.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbAccountFollowingsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.followingAccountRemoteId.present) {
      map['following_account_remote_id'] =
          Variable<String, StringType>(d.followingAccountRemoteId.value);
    }
    return map;
  }

  @override
  $DbAccountFollowingsTable createAlias(String alias) {
    return $DbAccountFollowingsTable(_db, alias);
  }
}

class DbAccountFollower extends DataClass
    implements Insertable<DbAccountFollower> {
  final int id;
  final String accountRemoteId;
  final String followerAccountRemoteId;
  DbAccountFollower(
      {@required this.id,
      @required this.accountRemoteId,
      @required this.followerAccountRemoteId});
  factory DbAccountFollower.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbAccountFollower(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      followerAccountRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}follower_account_remote_id']),
    );
  }
  factory DbAccountFollower.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccountFollower(
      id: serializer.fromJson<int>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      followerAccountRemoteId:
          serializer.fromJson<String>(json['followerAccountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'followerAccountRemoteId':
          serializer.toJson<String>(followerAccountRemoteId),
    };
  }

  @override
  DbAccountFollowersCompanion createCompanion(bool nullToAbsent) {
    return DbAccountFollowersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
      followerAccountRemoteId: followerAccountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(followerAccountRemoteId),
    );
  }

  DbAccountFollower copyWith(
          {int id, String accountRemoteId, String followerAccountRemoteId}) =>
      DbAccountFollower(
        id: id ?? this.id,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        followerAccountRemoteId:
            followerAccountRemoteId ?? this.followerAccountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbAccountFollower(')
          ..write('id: $id, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('followerAccountRemoteId: $followerAccountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(accountRemoteId.hashCode, followerAccountRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbAccountFollower &&
          other.id == this.id &&
          other.accountRemoteId == this.accountRemoteId &&
          other.followerAccountRemoteId == this.followerAccountRemoteId);
}

class DbAccountFollowersCompanion extends UpdateCompanion<DbAccountFollower> {
  final Value<int> id;
  final Value<String> accountRemoteId;
  final Value<String> followerAccountRemoteId;
  const DbAccountFollowersCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.followerAccountRemoteId = const Value.absent(),
  });
  DbAccountFollowersCompanion.insert({
    this.id = const Value.absent(),
    @required String accountRemoteId,
    @required String followerAccountRemoteId,
  })  : accountRemoteId = Value(accountRemoteId),
        followerAccountRemoteId = Value(followerAccountRemoteId);
  DbAccountFollowersCompanion copyWith(
      {Value<int> id,
      Value<String> accountRemoteId,
      Value<String> followerAccountRemoteId}) {
    return DbAccountFollowersCompanion(
      id: id ?? this.id,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      followerAccountRemoteId:
          followerAccountRemoteId ?? this.followerAccountRemoteId,
    );
  }
}

class $DbAccountFollowersTable extends DbAccountFollowers
    with TableInfo<$DbAccountFollowersTable, DbAccountFollower> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbAccountFollowersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
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

  final VerificationMeta _followerAccountRemoteIdMeta =
      const VerificationMeta('followerAccountRemoteId');
  GeneratedTextColumn _followerAccountRemoteId;
  @override
  GeneratedTextColumn get followerAccountRemoteId =>
      _followerAccountRemoteId ??= _constructFollowerAccountRemoteId();
  GeneratedTextColumn _constructFollowerAccountRemoteId() {
    return GeneratedTextColumn(
      'follower_account_remote_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, accountRemoteId, followerAccountRemoteId];
  @override
  $DbAccountFollowersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_account_followers';
  @override
  final String actualTableName = 'db_account_followers';
  @override
  VerificationContext validateIntegrity(DbAccountFollowersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (d.followerAccountRemoteId.present) {
      context.handle(
          _followerAccountRemoteIdMeta,
          followerAccountRemoteId.isAcceptableValue(
              d.followerAccountRemoteId.value, _followerAccountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_followerAccountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAccountFollower map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbAccountFollower.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbAccountFollowersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.followerAccountRemoteId.present) {
      map['follower_account_remote_id'] =
          Variable<String, StringType>(d.followerAccountRemoteId.value);
    }
    return map;
  }

  @override
  $DbAccountFollowersTable createAlias(String alias) {
    return $DbAccountFollowersTable(_db, alias);
  }
}

class DbConversationAccount extends DataClass
    implements Insertable<DbConversationAccount> {
  final int id;
  final String conversationRemoteId;
  final String accountRemoteId;
  DbConversationAccount(
      {@required this.id,
      @required this.conversationRemoteId,
      @required this.accountRemoteId});
  factory DbConversationAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbConversationAccount(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      conversationRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}conversation_remote_id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
    );
  }
  factory DbConversationAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversationAccount(
      id: serializer.fromJson<int>(json['id']),
      conversationRemoteId:
          serializer.fromJson<String>(json['conversationRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'conversationRemoteId': serializer.toJson<String>(conversationRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
    };
  }

  @override
  DbConversationAccountsCompanion createCompanion(bool nullToAbsent) {
    return DbConversationAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      conversationRemoteId: conversationRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(conversationRemoteId),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
    );
  }

  DbConversationAccount copyWith(
          {int id, String conversationRemoteId, String accountRemoteId}) =>
      DbConversationAccount(
        id: id ?? this.id,
        conversationRemoteId: conversationRemoteId ?? this.conversationRemoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbConversationAccount(')
          ..write('id: $id, ')
          ..write('conversationRemoteId: $conversationRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(conversationRemoteId.hashCode, accountRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbConversationAccount &&
          other.id == this.id &&
          other.conversationRemoteId == this.conversationRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbConversationAccountsCompanion
    extends UpdateCompanion<DbConversationAccount> {
  final Value<int> id;
  final Value<String> conversationRemoteId;
  final Value<String> accountRemoteId;
  const DbConversationAccountsCompanion({
    this.id = const Value.absent(),
    this.conversationRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbConversationAccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String conversationRemoteId,
    @required String accountRemoteId,
  })  : conversationRemoteId = Value(conversationRemoteId),
        accountRemoteId = Value(accountRemoteId);
  DbConversationAccountsCompanion copyWith(
      {Value<int> id,
      Value<String> conversationRemoteId,
      Value<String> accountRemoteId}) {
    return DbConversationAccountsCompanion(
      id: id ?? this.id,
      conversationRemoteId: conversationRemoteId ?? this.conversationRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }
}

class $DbConversationAccountsTable extends DbConversationAccounts
    with TableInfo<$DbConversationAccountsTable, DbConversationAccount> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbConversationAccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _conversationRemoteIdMeta =
      const VerificationMeta('conversationRemoteId');
  GeneratedTextColumn _conversationRemoteId;
  @override
  GeneratedTextColumn get conversationRemoteId =>
      _conversationRemoteId ??= _constructConversationRemoteId();
  GeneratedTextColumn _constructConversationRemoteId() {
    return GeneratedTextColumn(
      'conversation_remote_id',
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

  @override
  List<GeneratedColumn> get $columns =>
      [id, conversationRemoteId, accountRemoteId];
  @override
  $DbConversationAccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_conversation_accounts';
  @override
  final String actualTableName = 'db_conversation_accounts';
  @override
  VerificationContext validateIntegrity(DbConversationAccountsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.conversationRemoteId.present) {
      context.handle(
          _conversationRemoteIdMeta,
          conversationRemoteId.isAcceptableValue(
              d.conversationRemoteId.value, _conversationRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_conversationRemoteIdMeta);
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbConversationAccount map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbConversationAccount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbConversationAccountsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.conversationRemoteId.present) {
      map['conversation_remote_id'] =
          Variable<String, StringType>(d.conversationRemoteId.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    return map;
  }

  @override
  $DbConversationAccountsTable createAlias(String alias) {
    return $DbConversationAccountsTable(_db, alias);
  }
}

class DbScheduledStatus extends DataClass
    implements Insertable<DbScheduledStatus> {
  final int id;
  final String remoteId;
  final DateTime scheduledAt;
  final bool canceled;
  final PleromaScheduledStatusParams params;
  final List<PleromaMediaAttachment> mediaAttachments;
  DbScheduledStatus(
      {@required this.id,
      @required this.remoteId,
      @required this.scheduledAt,
      @required this.canceled,
      this.params,
      this.mediaAttachments});
  factory DbScheduledStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return DbScheduledStatus(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      scheduledAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}scheduled_at']),
      canceled:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}canceled']),
      params: $DbScheduledStatusesTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}params'])),
      mediaAttachments: $DbScheduledStatusesTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachments'])),
    );
  }
  factory DbScheduledStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbScheduledStatus(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      canceled: serializer.fromJson<bool>(json['canceled']),
      params: serializer.fromJson<PleromaScheduledStatusParams>(json['params']),
      mediaAttachments: serializer
          .fromJson<List<PleromaMediaAttachment>>(json['mediaAttachments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'canceled': serializer.toJson<bool>(canceled),
      'params': serializer.toJson<PleromaScheduledStatusParams>(params),
      'mediaAttachments':
          serializer.toJson<List<PleromaMediaAttachment>>(mediaAttachments),
    };
  }

  @override
  DbScheduledStatusesCompanion createCompanion(bool nullToAbsent) {
    return DbScheduledStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      scheduledAt: scheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledAt),
      canceled: canceled == null && nullToAbsent
          ? const Value.absent()
          : Value(canceled),
      params:
          params == null && nullToAbsent ? const Value.absent() : Value(params),
      mediaAttachments: mediaAttachments == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaAttachments),
    );
  }

  DbScheduledStatus copyWith(
          {int id,
          String remoteId,
          DateTime scheduledAt,
          bool canceled,
          PleromaScheduledStatusParams params,
          List<PleromaMediaAttachment> mediaAttachments}) =>
      DbScheduledStatus(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        canceled: canceled ?? this.canceled,
        params: params ?? this.params,
        mediaAttachments: mediaAttachments ?? this.mediaAttachments,
      );
  @override
  String toString() {
    return (StringBuffer('DbScheduledStatus(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('canceled: $canceled, ')
          ..write('params: $params, ')
          ..write('mediaAttachments: $mediaAttachments')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              scheduledAt.hashCode,
              $mrjc(canceled.hashCode,
                  $mrjc(params.hashCode, mediaAttachments.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbScheduledStatus &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.scheduledAt == this.scheduledAt &&
          other.canceled == this.canceled &&
          other.params == this.params &&
          other.mediaAttachments == this.mediaAttachments);
}

class DbScheduledStatusesCompanion extends UpdateCompanion<DbScheduledStatus> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<DateTime> scheduledAt;
  final Value<bool> canceled;
  final Value<PleromaScheduledStatusParams> params;
  final Value<List<PleromaMediaAttachment>> mediaAttachments;
  const DbScheduledStatusesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.canceled = const Value.absent(),
    this.params = const Value.absent(),
    this.mediaAttachments = const Value.absent(),
  });
  DbScheduledStatusesCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required DateTime scheduledAt,
    @required bool canceled,
    this.params = const Value.absent(),
    this.mediaAttachments = const Value.absent(),
  })  : remoteId = Value(remoteId),
        scheduledAt = Value(scheduledAt),
        canceled = Value(canceled);
  DbScheduledStatusesCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<DateTime> scheduledAt,
      Value<bool> canceled,
      Value<PleromaScheduledStatusParams> params,
      Value<List<PleromaMediaAttachment>> mediaAttachments}) {
    return DbScheduledStatusesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      canceled: canceled ?? this.canceled,
      params: params ?? this.params,
      mediaAttachments: mediaAttachments ?? this.mediaAttachments,
    );
  }
}

class $DbScheduledStatusesTable extends DbScheduledStatuses
    with TableInfo<$DbScheduledStatusesTable, DbScheduledStatus> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbScheduledStatusesTable(this._db, [this._alias]);
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

  final VerificationMeta _scheduledAtMeta =
      const VerificationMeta('scheduledAt');
  GeneratedDateTimeColumn _scheduledAt;
  @override
  GeneratedDateTimeColumn get scheduledAt =>
      _scheduledAt ??= _constructScheduledAt();
  GeneratedDateTimeColumn _constructScheduledAt() {
    return GeneratedDateTimeColumn(
      'scheduled_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _canceledMeta = const VerificationMeta('canceled');
  GeneratedBoolColumn _canceled;
  @override
  GeneratedBoolColumn get canceled => _canceled ??= _constructCanceled();
  GeneratedBoolColumn _constructCanceled() {
    return GeneratedBoolColumn(
      'canceled',
      $tableName,
      false,
    );
  }

  final VerificationMeta _paramsMeta = const VerificationMeta('params');
  GeneratedTextColumn _params;
  @override
  GeneratedTextColumn get params => _params ??= _constructParams();
  GeneratedTextColumn _constructParams() {
    return GeneratedTextColumn(
      'params',
      $tableName,
      true,
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

  @override
  List<GeneratedColumn> get $columns =>
      [id, remoteId, scheduledAt, canceled, params, mediaAttachments];
  @override
  $DbScheduledStatusesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_scheduled_statuses';
  @override
  final String actualTableName = 'db_scheduled_statuses';
  @override
  VerificationContext validateIntegrity(DbScheduledStatusesCompanion d,
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
    if (d.scheduledAt.present) {
      context.handle(_scheduledAtMeta,
          scheduledAt.isAcceptableValue(d.scheduledAt.value, _scheduledAtMeta));
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (d.canceled.present) {
      context.handle(_canceledMeta,
          canceled.isAcceptableValue(d.canceled.value, _canceledMeta));
    } else if (isInserting) {
      context.missing(_canceledMeta);
    }
    context.handle(_paramsMeta, const VerificationResult.success());
    context.handle(_mediaAttachmentsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbScheduledStatus map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbScheduledStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbScheduledStatusesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.scheduledAt.present) {
      map['scheduled_at'] =
          Variable<DateTime, DateTimeType>(d.scheduledAt.value);
    }
    if (d.canceled.present) {
      map['canceled'] = Variable<bool, BoolType>(d.canceled.value);
    }
    if (d.params.present) {
      final converter = $DbScheduledStatusesTable.$converter0;
      map['params'] =
          Variable<String, StringType>(converter.mapToSql(d.params.value));
    }
    if (d.mediaAttachments.present) {
      final converter = $DbScheduledStatusesTable.$converter1;
      map['media_attachments'] = Variable<String, StringType>(
          converter.mapToSql(d.mediaAttachments.value));
    }
    return map;
  }

  @override
  $DbScheduledStatusesTable createAlias(String alias) {
    return $DbScheduledStatusesTable(_db, alias);
  }

  static TypeConverter<PleromaScheduledStatusParams, String> $converter0 =
      PleromaScheduledStatusParamsDatabaseConverter();
  static TypeConverter<List<PleromaMediaAttachment>, String> $converter1 =
      PleromaMediaAttachmentListDatabaseConverter();
}

class DbChat extends DataClass implements Insertable<DbChat> {
  final int id;
  final String remoteId;
  final int unread;
  final DateTime updatedAt;
  final String accountRemoteId;
  DbChat(
      {@required this.id,
      @required this.remoteId,
      @required this.unread,
      this.updatedAt,
      @required this.accountRemoteId});
  factory DbChat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DbChat(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      unread: intType.mapFromDatabaseResponse(data['${effectivePrefix}unread']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
    );
  }
  factory DbChat.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbChat(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      unread: serializer.fromJson<int>(json['unread']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'unread': serializer.toJson<int>(unread),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
    };
  }

  @override
  DbChatsCompanion createCompanion(bool nullToAbsent) {
    return DbChatsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      unread:
          unread == null && nullToAbsent ? const Value.absent() : Value(unread),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
    );
  }

  DbChat copyWith(
          {int id,
          String remoteId,
          int unread,
          DateTime updatedAt,
          String accountRemoteId}) =>
      DbChat(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        unread: unread ?? this.unread,
        updatedAt: updatedAt ?? this.updatedAt,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbChat(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('unread: $unread, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(unread.hashCode,
              $mrjc(updatedAt.hashCode, accountRemoteId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbChat &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.unread == this.unread &&
          other.updatedAt == this.updatedAt &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbChatsCompanion extends UpdateCompanion<DbChat> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<int> unread;
  final Value<DateTime> updatedAt;
  final Value<String> accountRemoteId;
  const DbChatsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.unread = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbChatsCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required int unread,
    this.updatedAt = const Value.absent(),
    @required String accountRemoteId,
  })  : remoteId = Value(remoteId),
        unread = Value(unread),
        accountRemoteId = Value(accountRemoteId);
  DbChatsCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<int> unread,
      Value<DateTime> updatedAt,
      Value<String> accountRemoteId}) {
    return DbChatsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      unread: unread ?? this.unread,
      updatedAt: updatedAt ?? this.updatedAt,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }
}

class $DbChatsTable extends DbChats with TableInfo<$DbChatsTable, DbChat> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbChatsTable(this._db, [this._alias]);
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

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedIntColumn _unread;
  @override
  GeneratedIntColumn get unread => _unread ??= _constructUnread();
  GeneratedIntColumn _constructUnread() {
    return GeneratedIntColumn(
      'unread',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
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

  @override
  List<GeneratedColumn> get $columns =>
      [id, remoteId, unread, updatedAt, accountRemoteId];
  @override
  $DbChatsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_chats';
  @override
  final String actualTableName = 'db_chats';
  @override
  VerificationContext validateIntegrity(DbChatsCompanion d,
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
    if (d.unread.present) {
      context.handle(
          _unreadMeta, unread.isAcceptableValue(d.unread.value, _unreadMeta));
    } else if (isInserting) {
      context.missing(_unreadMeta);
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbChat map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbChat.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbChatsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.unread.present) {
      map['unread'] = Variable<int, IntType>(d.unread.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<DateTime, DateTimeType>(d.updatedAt.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    return map;
  }

  @override
  $DbChatsTable createAlias(String alias) {
    return $DbChatsTable(_db, alias);
  }
}

class DbChatMessage extends DataClass implements Insertable<DbChatMessage> {
  final int id;
  final String remoteId;
  final String chatRemoteId;
  final String accountRemoteId;
  final String content;
  final DateTime createdAt;
  final List<PleromaEmoji> emojis;
  final PleromaMediaAttachment mediaAttachment;
  DbChatMessage(
      {@required this.id,
      @required this.remoteId,
      @required this.chatRemoteId,
      @required this.accountRemoteId,
      this.content,
      @required this.createdAt,
      this.emojis,
      this.mediaAttachment});
  factory DbChatMessage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DbChatMessage(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      chatRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_remote_id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      emojis: $DbChatMessagesTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      mediaAttachment: $DbChatMessagesTable.$converter1.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}media_attachment'])),
    );
  }
  factory DbChatMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbChatMessage(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      chatRemoteId: serializer.fromJson<String>(json['chatRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      emojis: serializer.fromJson<List<PleromaEmoji>>(json['emojis']),
      mediaAttachment:
          serializer.fromJson<PleromaMediaAttachment>(json['mediaAttachment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'chatRemoteId': serializer.toJson<String>(chatRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'emojis': serializer.toJson<List<PleromaEmoji>>(emojis),
      'mediaAttachment':
          serializer.toJson<PleromaMediaAttachment>(mediaAttachment),
    };
  }

  @override
  DbChatMessagesCompanion createCompanion(bool nullToAbsent) {
    return DbChatMessagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      chatRemoteId: chatRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(chatRemoteId),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      emojis:
          emojis == null && nullToAbsent ? const Value.absent() : Value(emojis),
      mediaAttachment: mediaAttachment == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaAttachment),
    );
  }

  DbChatMessage copyWith(
          {int id,
          String remoteId,
          String chatRemoteId,
          String accountRemoteId,
          String content,
          DateTime createdAt,
          List<PleromaEmoji> emojis,
          PleromaMediaAttachment mediaAttachment}) =>
      DbChatMessage(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        chatRemoteId: chatRemoteId ?? this.chatRemoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        emojis: emojis ?? this.emojis,
        mediaAttachment: mediaAttachment ?? this.mediaAttachment,
      );
  @override
  String toString() {
    return (StringBuffer('DbChatMessage(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('chatRemoteId: $chatRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('emojis: $emojis, ')
          ..write('mediaAttachment: $mediaAttachment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              chatRemoteId.hashCode,
              $mrjc(
                  accountRemoteId.hashCode,
                  $mrjc(
                      content.hashCode,
                      $mrjc(
                          createdAt.hashCode,
                          $mrjc(
                              emojis.hashCode, mediaAttachment.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbChatMessage &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.chatRemoteId == this.chatRemoteId &&
          other.accountRemoteId == this.accountRemoteId &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.emojis == this.emojis &&
          other.mediaAttachment == this.mediaAttachment);
}

class DbChatMessagesCompanion extends UpdateCompanion<DbChatMessage> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<String> chatRemoteId;
  final Value<String> accountRemoteId;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<List<PleromaEmoji>> emojis;
  final Value<PleromaMediaAttachment> mediaAttachment;
  const DbChatMessagesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.emojis = const Value.absent(),
    this.mediaAttachment = const Value.absent(),
  });
  DbChatMessagesCompanion.insert({
    this.id = const Value.absent(),
    @required String remoteId,
    @required String chatRemoteId,
    @required String accountRemoteId,
    this.content = const Value.absent(),
    @required DateTime createdAt,
    this.emojis = const Value.absent(),
    this.mediaAttachment = const Value.absent(),
  })  : remoteId = Value(remoteId),
        chatRemoteId = Value(chatRemoteId),
        accountRemoteId = Value(accountRemoteId),
        createdAt = Value(createdAt);
  DbChatMessagesCompanion copyWith(
      {Value<int> id,
      Value<String> remoteId,
      Value<String> chatRemoteId,
      Value<String> accountRemoteId,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<List<PleromaEmoji>> emojis,
      Value<PleromaMediaAttachment> mediaAttachment}) {
    return DbChatMessagesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      chatRemoteId: chatRemoteId ?? this.chatRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      emojis: emojis ?? this.emojis,
      mediaAttachment: mediaAttachment ?? this.mediaAttachment,
    );
  }
}

class $DbChatMessagesTable extends DbChatMessages
    with TableInfo<$DbChatMessagesTable, DbChatMessage> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbChatMessagesTable(this._db, [this._alias]);
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

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  GeneratedTextColumn _chatRemoteId;
  @override
  GeneratedTextColumn get chatRemoteId =>
      _chatRemoteId ??= _constructChatRemoteId();
  GeneratedTextColumn _constructChatRemoteId() {
    return GeneratedTextColumn(
      'chat_remote_id',
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

  final VerificationMeta _mediaAttachmentMeta =
      const VerificationMeta('mediaAttachment');
  GeneratedTextColumn _mediaAttachment;
  @override
  GeneratedTextColumn get mediaAttachment =>
      _mediaAttachment ??= _constructMediaAttachment();
  GeneratedTextColumn _constructMediaAttachment() {
    return GeneratedTextColumn(
      'media_attachment',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        chatRemoteId,
        accountRemoteId,
        content,
        createdAt,
        emojis,
        mediaAttachment
      ];
  @override
  $DbChatMessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_chat_messages';
  @override
  final String actualTableName = 'db_chat_messages';
  @override
  VerificationContext validateIntegrity(DbChatMessagesCompanion d,
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
    if (d.chatRemoteId.present) {
      context.handle(
          _chatRemoteIdMeta,
          chatRemoteId.isAcceptableValue(
              d.chatRemoteId.value, _chatRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_chatRemoteIdMeta);
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    context.handle(_emojisMeta, const VerificationResult.success());
    context.handle(_mediaAttachmentMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbChatMessage map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbChatMessage.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbChatMessagesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.remoteId.present) {
      map['remote_id'] = Variable<String, StringType>(d.remoteId.value);
    }
    if (d.chatRemoteId.present) {
      map['chat_remote_id'] =
          Variable<String, StringType>(d.chatRemoteId.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.emojis.present) {
      final converter = $DbChatMessagesTable.$converter0;
      map['emojis'] =
          Variable<String, StringType>(converter.mapToSql(d.emojis.value));
    }
    if (d.mediaAttachment.present) {
      final converter = $DbChatMessagesTable.$converter1;
      map['media_attachment'] = Variable<String, StringType>(
          converter.mapToSql(d.mediaAttachment.value));
    }
    return map;
  }

  @override
  $DbChatMessagesTable createAlias(String alias) {
    return $DbChatMessagesTable(_db, alias);
  }

  static TypeConverter<List<PleromaEmoji>, String> $converter0 =
      PleromaEmojiListDatabaseConverter();
  static TypeConverter<PleromaMediaAttachment, String> $converter1 =
      PleromaMediaAttachmentDatabaseConverter();
}

class DbChatAccount extends DataClass implements Insertable<DbChatAccount> {
  final int id;
  final String chatRemoteId;
  final String accountRemoteId;
  DbChatAccount(
      {@required this.id,
      @required this.chatRemoteId,
      @required this.accountRemoteId});
  factory DbChatAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbChatAccount(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chatRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_remote_id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
    );
  }
  factory DbChatAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbChatAccount(
      id: serializer.fromJson<int>(json['id']),
      chatRemoteId: serializer.fromJson<String>(json['chatRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatRemoteId': serializer.toJson<String>(chatRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
    };
  }

  @override
  DbChatAccountsCompanion createCompanion(bool nullToAbsent) {
    return DbChatAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chatRemoteId: chatRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(chatRemoteId),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
    );
  }

  DbChatAccount copyWith(
          {int id, String chatRemoteId, String accountRemoteId}) =>
      DbChatAccount(
        id: id ?? this.id,
        chatRemoteId: chatRemoteId ?? this.chatRemoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbChatAccount(')
          ..write('id: $id, ')
          ..write('chatRemoteId: $chatRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(chatRemoteId.hashCode, accountRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbChatAccount &&
          other.id == this.id &&
          other.chatRemoteId == this.chatRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbChatAccountsCompanion extends UpdateCompanion<DbChatAccount> {
  final Value<int> id;
  final Value<String> chatRemoteId;
  final Value<String> accountRemoteId;
  const DbChatAccountsCompanion({
    this.id = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbChatAccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String chatRemoteId,
    @required String accountRemoteId,
  })  : chatRemoteId = Value(chatRemoteId),
        accountRemoteId = Value(accountRemoteId);
  DbChatAccountsCompanion copyWith(
      {Value<int> id,
      Value<String> chatRemoteId,
      Value<String> accountRemoteId}) {
    return DbChatAccountsCompanion(
      id: id ?? this.id,
      chatRemoteId: chatRemoteId ?? this.chatRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }
}

class $DbChatAccountsTable extends DbChatAccounts
    with TableInfo<$DbChatAccountsTable, DbChatAccount> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbChatAccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  GeneratedTextColumn _chatRemoteId;
  @override
  GeneratedTextColumn get chatRemoteId =>
      _chatRemoteId ??= _constructChatRemoteId();
  GeneratedTextColumn _constructChatRemoteId() {
    return GeneratedTextColumn(
      'chat_remote_id',
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

  @override
  List<GeneratedColumn> get $columns => [id, chatRemoteId, accountRemoteId];
  @override
  $DbChatAccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_chat_accounts';
  @override
  final String actualTableName = 'db_chat_accounts';
  @override
  VerificationContext validateIntegrity(DbChatAccountsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.chatRemoteId.present) {
      context.handle(
          _chatRemoteIdMeta,
          chatRemoteId.isAcceptableValue(
              d.chatRemoteId.value, _chatRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_chatRemoteIdMeta);
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbChatAccount map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbChatAccount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbChatAccountsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.chatRemoteId.present) {
      map['chat_remote_id'] =
          Variable<String, StringType>(d.chatRemoteId.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    return map;
  }

  @override
  $DbChatAccountsTable createAlias(String alias) {
    return $DbChatAccountsTable(_db, alias);
  }
}

class DbHomeTimelineStatus extends DataClass
    implements Insertable<DbHomeTimelineStatus> {
  final int id;
  final String accountRemoteId;
  final String statusRemoteId;
  DbHomeTimelineStatus(
      {@required this.id,
      @required this.accountRemoteId,
      @required this.statusRemoteId});
  factory DbHomeTimelineStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbHomeTimelineStatus(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      accountRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      statusRemoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
    );
  }
  factory DbHomeTimelineStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbHomeTimelineStatus(
      id: serializer.fromJson<int>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
    };
  }

  @override
  DbHomeTimelineStatusesCompanion createCompanion(bool nullToAbsent) {
    return DbHomeTimelineStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      accountRemoteId: accountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountRemoteId),
      statusRemoteId: statusRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(statusRemoteId),
    );
  }

  DbHomeTimelineStatus copyWith(
          {int id, String accountRemoteId, String statusRemoteId}) =>
      DbHomeTimelineStatus(
        id: id ?? this.id,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      );
  @override
  String toString() {
    return (StringBuffer('DbHomeTimelineStatus(')
          ..write('id: $id, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('statusRemoteId: $statusRemoteId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(accountRemoteId.hashCode, statusRemoteId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbHomeTimelineStatus &&
          other.id == this.id &&
          other.accountRemoteId == this.accountRemoteId &&
          other.statusRemoteId == this.statusRemoteId);
}

class DbHomeTimelineStatusesCompanion
    extends UpdateCompanion<DbHomeTimelineStatus> {
  final Value<int> id;
  final Value<String> accountRemoteId;
  final Value<String> statusRemoteId;
  const DbHomeTimelineStatusesCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
  });
  DbHomeTimelineStatusesCompanion.insert({
    this.id = const Value.absent(),
    @required String accountRemoteId,
    @required String statusRemoteId,
  })  : accountRemoteId = Value(accountRemoteId),
        statusRemoteId = Value(statusRemoteId);
  DbHomeTimelineStatusesCompanion copyWith(
      {Value<int> id,
      Value<String> accountRemoteId,
      Value<String> statusRemoteId}) {
    return DbHomeTimelineStatusesCompanion(
      id: id ?? this.id,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
    );
  }
}

class $DbHomeTimelineStatusesTable extends DbHomeTimelineStatuses
    with TableInfo<$DbHomeTimelineStatusesTable, DbHomeTimelineStatus> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbHomeTimelineStatusesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  GeneratedTextColumn _accountRemoteId;
  @override
  GeneratedTextColumn get accountRemoteId =>
      _accountRemoteId ??= _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn('account_remote_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn _statusRemoteId;
  @override
  GeneratedTextColumn get statusRemoteId =>
      _statusRemoteId ??= _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn('status_remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [id, accountRemoteId, statusRemoteId];
  @override
  $DbHomeTimelineStatusesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_home_timeline_statuses';
  @override
  final String actualTableName = 'db_home_timeline_statuses';
  @override
  VerificationContext validateIntegrity(DbHomeTimelineStatusesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.accountRemoteId.present) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableValue(
              d.accountRemoteId.value, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (d.statusRemoteId.present) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableValue(
              d.statusRemoteId.value, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbHomeTimelineStatus map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbHomeTimelineStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DbHomeTimelineStatusesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.accountRemoteId.present) {
      map['account_remote_id'] =
          Variable<String, StringType>(d.accountRemoteId.value);
    }
    if (d.statusRemoteId.present) {
      map['status_remote_id'] =
          Variable<String, StringType>(d.statusRemoteId.value);
    }
    return map;
  }

  @override
  $DbHomeTimelineStatusesTable createAlias(String alias) {
    return $DbHomeTimelineStatusesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbStatusesTable _dbStatuses;
  $DbStatusesTable get dbStatuses => _dbStatuses ??= $DbStatusesTable(this);
  Index _dbStatusRemoteIdIndex;
  Index get dbStatusRemoteIdIndex => _dbStatusRemoteIdIndex ??= Index(
      'db_status_remote_id_index',
      'CREATE UNIQUE INDEX db_status_remote_id_index ON db_statuses (remote_id);');
  $DbAccountsTable _dbAccounts;
  $DbAccountsTable get dbAccounts => _dbAccounts ??= $DbAccountsTable(this);
  Index _dbAccountRemoteIdIndex;
  Index get dbAccountRemoteIdIndex => _dbAccountRemoteIdIndex ??= Index(
      'db_account_remote_id_index',
      'CREATE UNIQUE INDEX db_account_remote_id_index ON db_accounts (remote_id);');
  $DbConversationsTable _dbConversations;
  $DbConversationsTable get dbConversations =>
      _dbConversations ??= $DbConversationsTable(this);
  Index _dbConversationRemoteIdIndex;
  Index get dbConversationRemoteIdIndex => _dbConversationRemoteIdIndex ??= Index(
      'db_conversation_remote_id_index',
      'CREATE UNIQUE INDEX db_conversation_remote_id_index ON db_conversations (remote_id);');
  $DbNotificationsTable _dbNotifications;
  $DbNotificationsTable get dbNotifications =>
      _dbNotifications ??= $DbNotificationsTable(this);
  Index _dbNotificationRemoteIdIndex;
  Index get dbNotificationRemoteIdIndex => _dbNotificationRemoteIdIndex ??= Index(
      'db_notification_remote_id_index',
      'CREATE UNIQUE INDEX db_notification_remote_id_index ON db_notifications (remote_id);');
  $DbConversationStatusesTable _dbConversationStatuses;
  $DbConversationStatusesTable get dbConversationStatuses =>
      _dbConversationStatuses ??= $DbConversationStatusesTable(this);
  Index _dbConversationStatusesIndex;
  Index get dbConversationStatusesIndex => _dbConversationStatusesIndex ??= Index(
      'db_conversation_statuses_index',
      'CREATE UNIQUE INDEX db_conversation_statuses_index ON db_conversation_statuses(status_remote_id, conversation_remote_id);');
  $DbStatusHashtagsTable _dbStatusHashtags;
  $DbStatusHashtagsTable get dbStatusHashtags =>
      _dbStatusHashtags ??= $DbStatusHashtagsTable(this);
  Index _dbStatusHashtagsIndex;
  Index get dbStatusHashtagsIndex => _dbStatusHashtagsIndex ??= Index(
      'db_status_hashtags_index',
      'CREATE UNIQUE INDEX db_status_hashtags_index ON db_status_hashtags(status_remote_id, hashtag);');
  $DbStatusListsTable _dbStatusLists;
  $DbStatusListsTable get dbStatusLists =>
      _dbStatusLists ??= $DbStatusListsTable(this);
  Index _dbStatusListsIndex;
  Index get dbStatusListsIndex => _dbStatusListsIndex ??= Index(
      'db_status_lists_index',
      'CREATE UNIQUE INDEX db_status_lists_index ON db_status_lists(status_remote_id, list_remote_id);');
  $DbStatusFavouritedAccountsTable _dbStatusFavouritedAccounts;
  $DbStatusFavouritedAccountsTable get dbStatusFavouritedAccounts =>
      _dbStatusFavouritedAccounts ??= $DbStatusFavouritedAccountsTable(this);
  Index _dbStatusFavouritedAccountsIndex;
  Index get dbStatusFavouritedAccountsIndex =>
      _dbStatusFavouritedAccountsIndex ??= Index(
          'db_status_favourited_accounts_index',
          'CREATE UNIQUE INDEX db_status_favourited_accounts_index ON db_status_favourited_accounts(status_remote_id, account_remote_id);');
  $DbStatusRebloggedAccountsTable _dbStatusRebloggedAccounts;
  $DbStatusRebloggedAccountsTable get dbStatusRebloggedAccounts =>
      _dbStatusRebloggedAccounts ??= $DbStatusRebloggedAccountsTable(this);
  Index _dbStatusRebloggedAccountsIndex;
  Index get dbStatusRebloggedAccountsIndex =>
      _dbStatusRebloggedAccountsIndex ??= Index(
          'db_status_reblogged_accounts_index',
          'CREATE UNIQUE INDEX db_status_reblogged_accounts_index ON db_status_reblogged_accounts(status_remote_id, account_remote_id);');
  $DbAccountFollowingsTable _dbAccountFollowings;
  $DbAccountFollowingsTable get dbAccountFollowings =>
      _dbAccountFollowings ??= $DbAccountFollowingsTable(this);
  Index _dbAccountFollowingsIndex;
  Index get dbAccountFollowingsIndex => _dbAccountFollowingsIndex ??= Index(
      'db_account_followings_index',
      'CREATE UNIQUE INDEX db_account_followings_index ON db_account_followings(account_remote_id, following_account_remote_id);');
  $DbAccountFollowersTable _dbAccountFollowers;
  $DbAccountFollowersTable get dbAccountFollowers =>
      _dbAccountFollowers ??= $DbAccountFollowersTable(this);
  Index _dbAccountFollowersIndex;
  Index get dbAccountFollowersIndex => _dbAccountFollowersIndex ??= Index(
      'db_account_followers_index',
      'CREATE UNIQUE INDEX db_account_followers_index ON db_account_followers(account_remote_id, follower_account_remote_id);');
  $DbConversationAccountsTable _dbConversationAccounts;
  $DbConversationAccountsTable get dbConversationAccounts =>
      _dbConversationAccounts ??= $DbConversationAccountsTable(this);
  Index _dbConversationAccountsIndex;
  Index get dbConversationAccountsIndex => _dbConversationAccountsIndex ??= Index(
      'db_conversation_accounts_index',
      'CREATE UNIQUE INDEX db_conversation_accounts_index ON db_conversation_accounts(conversation_remote_id, account_remote_id);');
  $DbScheduledStatusesTable _dbScheduledStatuses;
  $DbScheduledStatusesTable get dbScheduledStatuses =>
      _dbScheduledStatuses ??= $DbScheduledStatusesTable(this);
  Index _dbScheduledStatusRemoteIdIndex;
  Index get dbScheduledStatusRemoteIdIndex =>
      _dbScheduledStatusRemoteIdIndex ??= Index(
          'db_scheduled_status_remote_id_index',
          'CREATE UNIQUE INDEX db_scheduled_status_remote_id_index ON db_scheduled_statuses (remote_id);');
  $DbChatsTable _dbChats;
  $DbChatsTable get dbChats => _dbChats ??= $DbChatsTable(this);
  Index _dbChatRemoteIdIndex;
  Index get dbChatRemoteIdIndex => _dbChatRemoteIdIndex ??= Index(
      'db_chat_remote_id_index',
      'CREATE UNIQUE INDEX db_chat_remote_id_index ON db_chats (remote_id);');
  $DbChatMessagesTable _dbChatMessages;
  $DbChatMessagesTable get dbChatMessages =>
      _dbChatMessages ??= $DbChatMessagesTable(this);
  Index _dbChatMessagesRemoteIdIndex;
  Index get dbChatMessagesRemoteIdIndex => _dbChatMessagesRemoteIdIndex ??= Index(
      'db_chat_messages_remote_id_index',
      'CREATE UNIQUE INDEX db_chat_messages_remote_id_index ON db_chat_messages(remote_id);');
  Index _dbChatMessagesChatRemoteIdIndex;
  Index get dbChatMessagesChatRemoteIdIndex =>
      _dbChatMessagesChatRemoteIdIndex ??= Index(
          'db_chat_messages_chat_remote_id_index',
          'CREATE INDEX db_chat_messages_chat_remote_id_index ON db_chat_messages(chat_remote_id);');
  $DbChatAccountsTable _dbChatAccounts;
  $DbChatAccountsTable get dbChatAccounts =>
      _dbChatAccounts ??= $DbChatAccountsTable(this);
  Index _dbChatAccountsIndex;
  Index get dbChatAccountsIndex => _dbChatAccountsIndex ??= Index(
      'db_chat_accounts_index',
      'CREATE UNIQUE INDEX db_chat_accounts_index ON db_chat_accounts(chat_remote_id, account_remote_id);');
  $DbHomeTimelineStatusesTable _dbHomeTimelineStatuses;
  $DbHomeTimelineStatusesTable get dbHomeTimelineStatuses =>
      _dbHomeTimelineStatuses ??= $DbHomeTimelineStatusesTable(this);
  StatusDao _statusDao;
  StatusDao get statusDao => _statusDao ??= StatusDao(this as AppDatabase);
  StatusHashtagsDao _statusHashtagsDao;
  StatusHashtagsDao get statusHashtagsDao =>
      _statusHashtagsDao ??= StatusHashtagsDao(this as AppDatabase);
  StatusListsDao _statusListsDao;
  StatusListsDao get statusListsDao =>
      _statusListsDao ??= StatusListsDao(this as AppDatabase);
  AccountDao _accountDao;
  AccountDao get accountDao => _accountDao ??= AccountDao(this as AppDatabase);
  AccountFollowingsDao _accountFollowingsDao;
  AccountFollowingsDao get accountFollowingsDao =>
      _accountFollowingsDao ??= AccountFollowingsDao(this as AppDatabase);
  AccountFollowersDao _accountFollowersDao;
  AccountFollowersDao get accountFollowersDao =>
      _accountFollowersDao ??= AccountFollowersDao(this as AppDatabase);
  ConversationDao _conversationDao;
  ConversationDao get conversationDao =>
      _conversationDao ??= ConversationDao(this as AppDatabase);
  ConversationAccountsDao _conversationAccountsDao;
  ConversationAccountsDao get conversationAccountsDao =>
      _conversationAccountsDao ??= ConversationAccountsDao(this as AppDatabase);
  ConversationStatusesDao _conversationStatusesDao;
  ConversationStatusesDao get conversationStatusesDao =>
      _conversationStatusesDao ??= ConversationStatusesDao(this as AppDatabase);
  StatusFavouritedAccountsDao _statusFavouritedAccountsDao;
  StatusFavouritedAccountsDao get statusFavouritedAccountsDao =>
      _statusFavouritedAccountsDao ??=
          StatusFavouritedAccountsDao(this as AppDatabase);
  StatusRebloggedAccountsDao _statusRebloggedAccountsDao;
  StatusRebloggedAccountsDao get statusRebloggedAccountsDao =>
      _statusRebloggedAccountsDao ??=
          StatusRebloggedAccountsDao(this as AppDatabase);
  NotificationDao _notificationDao;
  NotificationDao get notificationDao =>
      _notificationDao ??= NotificationDao(this as AppDatabase);
  ScheduledStatusDao _scheduledStatusDao;
  ScheduledStatusDao get scheduledStatusDao =>
      _scheduledStatusDao ??= ScheduledStatusDao(this as AppDatabase);
  ChatDao _chatDao;
  ChatDao get chatDao => _chatDao ??= ChatDao(this as AppDatabase);
  ChatAccountsDao _chatAccountsDao;
  ChatAccountsDao get chatAccountsDao =>
      _chatAccountsDao ??= ChatAccountsDao(this as AppDatabase);
  ChatMessageDao _chatMessageDao;
  ChatMessageDao get chatMessageDao =>
      _chatMessageDao ??= ChatMessageDao(this as AppDatabase);
  HomeTimelineStatusesDao _homeTimelineStatusesDao;
  HomeTimelineStatusesDao get homeTimelineStatusesDao =>
      _homeTimelineStatusesDao ??= HomeTimelineStatusesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dbStatuses,
        dbStatusRemoteIdIndex,
        dbAccounts,
        dbAccountRemoteIdIndex,
        dbConversations,
        dbConversationRemoteIdIndex,
        dbNotifications,
        dbNotificationRemoteIdIndex,
        dbConversationStatuses,
        dbConversationStatusesIndex,
        dbStatusHashtags,
        dbStatusHashtagsIndex,
        dbStatusLists,
        dbStatusListsIndex,
        dbStatusFavouritedAccounts,
        dbStatusFavouritedAccountsIndex,
        dbStatusRebloggedAccounts,
        dbStatusRebloggedAccountsIndex,
        dbAccountFollowings,
        dbAccountFollowingsIndex,
        dbAccountFollowers,
        dbAccountFollowersIndex,
        dbConversationAccounts,
        dbConversationAccountsIndex,
        dbScheduledStatuses,
        dbScheduledStatusRemoteIdIndex,
        dbChats,
        dbChatRemoteIdIndex,
        dbChatMessages,
        dbChatMessagesRemoteIdIndex,
        dbChatMessagesChatRemoteIdIndex,
        dbChatAccounts,
        dbChatAccountsIndex,
        dbHomeTimelineStatuses
      ];
}
