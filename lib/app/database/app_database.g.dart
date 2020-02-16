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
  final PleromaAccount account;
  final List<PleromaMediaAttachment> mediaAttachments;
  final List<PleromaMention> mentions;
  final List<PleromaTag> tags;
  final List<PleromaEmoji> emojis;
  final PleromaPoll poll;
  final PleromaCard card;
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
      @required this.content,
      @required this.reblog,
      @required this.application,
      @required this.account,
      @required this.mediaAttachments,
      @required this.mentions,
      @required this.tags,
      @required this.emojis,
      @required this.poll,
      @required this.card,
      @required this.pleromaContent,
      @required this.pleromaConversationId,
      @required this.pleromaDirectConversationId,
      @required this.pleromaInReplyToAccountAcct,
      @required this.pleromaLocal,
      @required this.pleromaSpoilerText,
      @required this.pleromaExpiresAt,
      @required this.pleromaThreadMuted,
      @required this.pleromaEmojiReactions});
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
      account: $DbStatusesTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}account'])),
      mediaAttachments: $DbStatusesTable.$converter4.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachments'])),
      mentions: $DbStatusesTable.$converter5.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mentions'])),
      tags: $DbStatusesTable.$converter6.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags'])),
      emojis: $DbStatusesTable.$converter7.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      poll: $DbStatusesTable.$converter8.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}poll'])),
      card: $DbStatusesTable.$converter9.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}card'])),
      pleromaContent: $DbStatusesTable.$converter10.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_content'])),
      pleromaConversationId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_conversation_id']),
      pleromaDirectConversationId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_direct_conversation_id']),
      pleromaInReplyToAccountAcct: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_in_reply_to_account_acct']),
      pleromaLocal: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_local']),
      pleromaSpoilerText: $DbStatusesTable.$converter11.mapToDart(
          stringType.mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_spoiler_text'])),
      pleromaExpiresAt: dateTimeType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_expires_at']),
      pleromaThreadMuted: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_thread_muted']),
      pleromaEmojiReactions: $DbStatusesTable.$converter12.mapToDart(
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
      account: serializer.fromJson<PleromaAccount>(json['account']),
      mediaAttachments: serializer
          .fromJson<List<PleromaMediaAttachment>>(json['mediaAttachments']),
      mentions: serializer.fromJson<List<PleromaMention>>(json['mentions']),
      tags: serializer.fromJson<List<PleromaTag>>(json['tags']),
      emojis: serializer.fromJson<List<PleromaEmoji>>(json['emojis']),
      poll: serializer.fromJson<PleromaPoll>(json['poll']),
      card: serializer.fromJson<PleromaCard>(json['card']),
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
      'account': serializer.toJson<PleromaAccount>(account),
      'mediaAttachments':
          serializer.toJson<List<PleromaMediaAttachment>>(mediaAttachments),
      'mentions': serializer.toJson<List<PleromaMention>>(mentions),
      'tags': serializer.toJson<List<PleromaTag>>(tags),
      'emojis': serializer.toJson<List<PleromaEmoji>>(emojis),
      'poll': serializer.toJson<PleromaPoll>(poll),
      'card': serializer.toJson<PleromaCard>(card),
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
      card: card == null && nullToAbsent ? const Value.absent() : Value(card),
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
          PleromaAccount account,
          List<PleromaMediaAttachment> mediaAttachments,
          List<PleromaMention> mentions,
          List<PleromaTag> tags,
          List<PleromaEmoji> emojis,
          PleromaPoll poll,
          PleromaCard card,
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
        account: account ?? this.account,
        mediaAttachments: mediaAttachments ?? this.mediaAttachments,
        mentions: mentions ?? this.mentions,
        tags: tags ?? this.tags,
        emojis: emojis ?? this.emojis,
        poll: poll ?? this.poll,
        card: card ?? this.card,
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
          ..write('account: $account, ')
          ..write('mediaAttachments: $mediaAttachments, ')
          ..write('mentions: $mentions, ')
          ..write('tags: $tags, ')
          ..write('emojis: $emojis, ')
          ..write('poll: $poll, ')
          ..write('card: $card, ')
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
                                                                              $mrjc(application.hashCode, $mrjc(account.hashCode, $mrjc(mediaAttachments.hashCode, $mrjc(mentions.hashCode, $mrjc(tags.hashCode, $mrjc(emojis.hashCode, $mrjc(poll.hashCode, $mrjc(card.hashCode, $mrjc(pleromaContent.hashCode, $mrjc(pleromaConversationId.hashCode, $mrjc(pleromaDirectConversationId.hashCode, $mrjc(pleromaInReplyToAccountAcct.hashCode, $mrjc(pleromaLocal.hashCode, $mrjc(pleromaSpoilerText.hashCode, $mrjc(pleromaExpiresAt.hashCode, $mrjc(pleromaThreadMuted.hashCode, pleromaEmojiReactions.hashCode))))))))))))))))))))))))))))))))))));
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
          other.account == this.account &&
          other.mediaAttachments == this.mediaAttachments &&
          other.mentions == this.mentions &&
          other.tags == this.tags &&
          other.emojis == this.emojis &&
          other.poll == this.poll &&
          other.card == this.card &&
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
  final Value<PleromaAccount> account;
  final Value<List<PleromaMediaAttachment>> mediaAttachments;
  final Value<List<PleromaMention>> mentions;
  final Value<List<PleromaTag>> tags;
  final Value<List<PleromaEmoji>> emojis;
  final Value<PleromaPoll> poll;
  final Value<PleromaCard> card;
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
    this.account = const Value.absent(),
    this.mediaAttachments = const Value.absent(),
    this.mentions = const Value.absent(),
    this.tags = const Value.absent(),
    this.emojis = const Value.absent(),
    this.poll = const Value.absent(),
    this.card = const Value.absent(),
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
    @required String inReplyToRemoteId,
    @required String inReplyToAccountRemoteId,
    @required bool sensitive,
    @required String spoilerText,
    @required PleromaVisibility visibility,
    @required String uri,
    @required String url,
    @required int repliesCount,
    @required int reblogsCount,
    @required int favouritesCount,
    @required bool favourited,
    @required bool reblogged,
    @required bool muted,
    @required bool bookmarked,
    @required String content,
    @required PleromaStatus reblog,
    @required PleromaApplication application,
    @required PleromaAccount account,
    @required List<PleromaMediaAttachment> mediaAttachments,
    @required List<PleromaMention> mentions,
    @required List<PleromaTag> tags,
    @required List<PleromaEmoji> emojis,
    @required PleromaPoll poll,
    @required PleromaCard card,
    @required PleromaContent pleromaContent,
    @required int pleromaConversationId,
    @required int pleromaDirectConversationId,
    @required String pleromaInReplyToAccountAcct,
    @required bool pleromaLocal,
    @required PleromaContent pleromaSpoilerText,
    @required DateTime pleromaExpiresAt,
    @required bool pleromaThreadMuted,
    @required List<PleromaEmojiReactions> pleromaEmojiReactions,
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
        content = Value(content),
        reblog = Value(reblog),
        application = Value(application),
        account = Value(account),
        mediaAttachments = Value(mediaAttachments),
        mentions = Value(mentions),
        tags = Value(tags),
        emojis = Value(emojis),
        poll = Value(poll),
        card = Value(card),
        pleromaContent = Value(pleromaContent),
        pleromaConversationId = Value(pleromaConversationId),
        pleromaDirectConversationId = Value(pleromaDirectConversationId),
        pleromaInReplyToAccountAcct = Value(pleromaInReplyToAccountAcct),
        pleromaLocal = Value(pleromaLocal),
        pleromaSpoilerText = Value(pleromaSpoilerText),
        pleromaExpiresAt = Value(pleromaExpiresAt),
        pleromaThreadMuted = Value(pleromaThreadMuted),
        pleromaEmojiReactions = Value(pleromaEmojiReactions);
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
      Value<PleromaAccount> account,
      Value<List<PleromaMediaAttachment>> mediaAttachments,
      Value<List<PleromaMention>> mentions,
      Value<List<PleromaTag>> tags,
      Value<List<PleromaEmoji>> emojis,
      Value<PleromaPoll> poll,
      Value<PleromaCard> card,
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
      account: account ?? this.account,
      mediaAttachments: mediaAttachments ?? this.mediaAttachments,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      emojis: emojis ?? this.emojis,
      poll: poll ?? this.poll,
      card: card ?? this.card,
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
    return GeneratedTextColumn('visibility', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
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

  final VerificationMeta _reblogMeta = const VerificationMeta('reblog');
  GeneratedTextColumn _reblog;
  @override
  GeneratedTextColumn get reblog => _reblog ??= _constructReblog();
  GeneratedTextColumn _constructReblog() {
    return GeneratedTextColumn(
      'reblog',
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

  final VerificationMeta _cardMeta = const VerificationMeta('card');
  GeneratedTextColumn _card;
  @override
  GeneratedTextColumn get card => _card ??= _constructCard();
  GeneratedTextColumn _constructCard() {
    return GeneratedTextColumn(
      'card',
      $tableName,
      false,
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
      false,
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
      false,
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
      false,
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
      false,
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
      false,
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
      false,
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
      false,
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
      false,
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
        content,
        reblog,
        application,
        account,
        mediaAttachments,
        mentions,
        tags,
        emojis,
        poll,
        card,
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
    context.handle(_visibilityMeta, const VerificationResult.success());
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
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    context.handle(_reblogMeta, const VerificationResult.success());
    context.handle(_applicationMeta, const VerificationResult.success());
    context.handle(_accountMeta, const VerificationResult.success());
    context.handle(_mediaAttachmentsMeta, const VerificationResult.success());
    context.handle(_mentionsMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_emojisMeta, const VerificationResult.success());
    context.handle(_pollMeta, const VerificationResult.success());
    context.handle(_cardMeta, const VerificationResult.success());
    context.handle(_pleromaContentMeta, const VerificationResult.success());
    if (d.pleromaConversationId.present) {
      context.handle(
          _pleromaConversationIdMeta,
          pleromaConversationId.isAcceptableValue(
              d.pleromaConversationId.value, _pleromaConversationIdMeta));
    } else if (isInserting) {
      context.missing(_pleromaConversationIdMeta);
    }
    if (d.pleromaDirectConversationId.present) {
      context.handle(
          _pleromaDirectConversationIdMeta,
          pleromaDirectConversationId.isAcceptableValue(
              d.pleromaDirectConversationId.value,
              _pleromaDirectConversationIdMeta));
    } else if (isInserting) {
      context.missing(_pleromaDirectConversationIdMeta);
    }
    if (d.pleromaInReplyToAccountAcct.present) {
      context.handle(
          _pleromaInReplyToAccountAcctMeta,
          pleromaInReplyToAccountAcct.isAcceptableValue(
              d.pleromaInReplyToAccountAcct.value,
              _pleromaInReplyToAccountAcctMeta));
    } else if (isInserting) {
      context.missing(_pleromaInReplyToAccountAcctMeta);
    }
    if (d.pleromaLocal.present) {
      context.handle(
          _pleromaLocalMeta,
          pleromaLocal.isAcceptableValue(
              d.pleromaLocal.value, _pleromaLocalMeta));
    } else if (isInserting) {
      context.missing(_pleromaLocalMeta);
    }
    context.handle(_pleromaSpoilerTextMeta, const VerificationResult.success());
    if (d.pleromaExpiresAt.present) {
      context.handle(
          _pleromaExpiresAtMeta,
          pleromaExpiresAt.isAcceptableValue(
              d.pleromaExpiresAt.value, _pleromaExpiresAtMeta));
    } else if (isInserting) {
      context.missing(_pleromaExpiresAtMeta);
    }
    if (d.pleromaThreadMuted.present) {
      context.handle(
          _pleromaThreadMutedMeta,
          pleromaThreadMuted.isAcceptableValue(
              d.pleromaThreadMuted.value, _pleromaThreadMutedMeta));
    } else if (isInserting) {
      context.missing(_pleromaThreadMutedMeta);
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
    if (d.account.present) {
      final converter = $DbStatusesTable.$converter3;
      map['account'] =
          Variable<String, StringType>(converter.mapToSql(d.account.value));
    }
    if (d.mediaAttachments.present) {
      final converter = $DbStatusesTable.$converter4;
      map['media_attachments'] = Variable<String, StringType>(
          converter.mapToSql(d.mediaAttachments.value));
    }
    if (d.mentions.present) {
      final converter = $DbStatusesTable.$converter5;
      map['mentions'] =
          Variable<String, StringType>(converter.mapToSql(d.mentions.value));
    }
    if (d.tags.present) {
      final converter = $DbStatusesTable.$converter6;
      map['tags'] =
          Variable<String, StringType>(converter.mapToSql(d.tags.value));
    }
    if (d.emojis.present) {
      final converter = $DbStatusesTable.$converter7;
      map['emojis'] =
          Variable<String, StringType>(converter.mapToSql(d.emojis.value));
    }
    if (d.poll.present) {
      final converter = $DbStatusesTable.$converter8;
      map['poll'] =
          Variable<String, StringType>(converter.mapToSql(d.poll.value));
    }
    if (d.card.present) {
      final converter = $DbStatusesTable.$converter9;
      map['card'] =
          Variable<String, StringType>(converter.mapToSql(d.card.value));
    }
    if (d.pleromaContent.present) {
      final converter = $DbStatusesTable.$converter10;
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
      final converter = $DbStatusesTable.$converter11;
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
      final converter = $DbStatusesTable.$converter12;
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
  static TypeConverter<PleromaAccount, String> $converter3 =
      PleromaAccountDatabaseConverter();
  static TypeConverter<List<PleromaMediaAttachment>, String> $converter4 =
      PleromaMediaAttachmentListDatabaseConverter();
  static TypeConverter<List<PleromaMention>, String> $converter5 =
      PleromaMentionListDatabaseConverter();
  static TypeConverter<List<PleromaTag>, String> $converter6 =
      PleromaTagListDatabaseConverter();
  static TypeConverter<List<PleromaEmoji>, String> $converter7 =
      PleromaEmojiListDatabaseConverter();
  static TypeConverter<PleromaPoll, String> $converter8 =
      PleromaPollDatabaseConverter();
  static TypeConverter<PleromaCard, String> $converter9 =
      PleromaCardDatabaseConverter();
  static TypeConverter<PleromaContent, String> $converter10 =
      PleromaContentDatabaseConverter();
  static TypeConverter<PleromaContent, String> $converter11 =
      PleromaContentDatabaseConverter();
  static TypeConverter<List<PleromaEmojiReactions>, String> $converter12 =
      PleromaEmojiReactionsListDatabaseConverter();
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
