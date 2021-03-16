// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbStatus extends DataClass implements Insertable<DbStatus> {
  final int? id;
  final String remoteId;
  final DateTime createdAt;
  final String? inReplyToRemoteId;
  final String? inReplyToAccountRemoteId;
  final bool sensitive;
  final String? spoilerText;
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
  final String? content;
  final String? reblogStatusRemoteId;
  final PleromaApplication? application;
  final String? accountRemoteId;
  final List<PleromaMediaAttachment>? mediaAttachments;
  final List<PleromaMention>? mentions;
  final List<PleromaTag>? tags;
  final List<PleromaEmoji>? emojis;
  final PleromaPoll? poll;
  final PleromaCard? card;
  final String? language;
  final PleromaContent? pleromaContent;
  final int? pleromaConversationId;
  final int? pleromaDirectConversationId;
  final String? pleromaInReplyToAccountAcct;
  final bool? pleromaLocal;
  final PleromaContent? pleromaSpoilerText;
  final DateTime? pleromaExpiresAt;
  final bool? pleromaThreadMuted;
  final List<PleromaStatusEmojiReaction>? pleromaEmojiReactions;
  final bool? deleted;
  final bool? hiddenLocallyOnDevice;
  final PendingState? pendingState;
  final String? oldPendingRemoteId;
  final String? wasSentWithIdempotencyKey;

  DbStatus(
      {required this.id,
      required this.remoteId,
      required this.createdAt,
      required this.inReplyToRemoteId,
      required this.inReplyToAccountRemoteId,
      required this.sensitive,
      required this.spoilerText,
      required this.visibility,
      required this.uri,
      required this.url,
      required this.repliesCount,
      required this.reblogsCount,
      required this.favouritesCount,
      required this.favourited,
      required this.reblogged,
      required this.muted,
      required this.bookmarked,
      required this.pinned,
      required this.content,
      required this.reblogStatusRemoteId,
      required this.application,
      required this.accountRemoteId,
      required this.mediaAttachments,
      required this.mentions,
      required this.tags,
      required this.emojis,
      required this.poll,
      required this.card,
      required this.language,
      required this.pleromaContent,
      required this.pleromaConversationId,
      required this.pleromaDirectConversationId,
      required this.pleromaInReplyToAccountAcct,
      required this.pleromaLocal,
      required this.pleromaSpoilerText,
      required this.pleromaExpiresAt,
      required this.pleromaThreadMuted,
      required this.pleromaEmojiReactions,
      required this.deleted,
      required this.hiddenLocallyOnDevice,
      required this.pendingState,
      required this.oldPendingRemoteId,
      required this.wasSentWithIdempotencyKey});

  factory DbStatus.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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
      deleted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
      hiddenLocallyOnDevice: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}hidden_locally_on_device']),
      pendingState: $DbStatusesTable.$converter11.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pending_state'])),
      oldPendingRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}old_pending_remote_id']),
      wasSentWithIdempotencyKey: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}was_sent_with_idempotency_key']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || inReplyToRemoteId != null) {
      map['in_reply_to_remote_id'] = Variable<String?>(inReplyToRemoteId);
    }
    if (!nullToAbsent || inReplyToAccountRemoteId != null) {
      map['in_reply_to_account_remote_id'] =
          Variable<String?>(inReplyToAccountRemoteId);
    }
    if (!nullToAbsent || sensitive != null) {
      map['sensitive'] = Variable<bool?>(sensitive);
    }
    if (!nullToAbsent || spoilerText != null) {
      map['spoiler_text'] = Variable<String?>(spoilerText);
    }
    if (!nullToAbsent || visibility != null) {
      final converter = $DbStatusesTable.$converter0;
      map['visibility'] = Variable<String?>(converter.mapToSql(visibility));
    }
    if (!nullToAbsent || uri != null) {
      map['uri'] = Variable<String?>(uri);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String?>(url);
    }
    if (!nullToAbsent || repliesCount != null) {
      map['replies_count'] = Variable<int?>(repliesCount);
    }
    if (!nullToAbsent || reblogsCount != null) {
      map['reblogs_count'] = Variable<int?>(reblogsCount);
    }
    if (!nullToAbsent || favouritesCount != null) {
      map['favourites_count'] = Variable<int?>(favouritesCount);
    }
    if (!nullToAbsent || favourited != null) {
      map['favourited'] = Variable<bool?>(favourited);
    }
    if (!nullToAbsent || reblogged != null) {
      map['reblogged'] = Variable<bool?>(reblogged);
    }
    if (!nullToAbsent || muted != null) {
      map['muted'] = Variable<bool?>(muted);
    }
    if (!nullToAbsent || bookmarked != null) {
      map['bookmarked'] = Variable<bool?>(bookmarked);
    }
    if (!nullToAbsent || pinned != null) {
      map['pinned'] = Variable<bool?>(pinned);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    if (!nullToAbsent || reblogStatusRemoteId != null) {
      map['reblog_status_remote_id'] = Variable<String?>(reblogStatusRemoteId);
    }
    if (!nullToAbsent || application != null) {
      final converter = $DbStatusesTable.$converter1;
      map['application'] = Variable<String?>(converter.mapToSql(application));
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    if (!nullToAbsent || mediaAttachments != null) {
      final converter = $DbStatusesTable.$converter2;
      map['media_attachments'] =
          Variable<String?>(converter.mapToSql(mediaAttachments));
    }
    if (!nullToAbsent || mentions != null) {
      final converter = $DbStatusesTable.$converter3;
      map['mentions'] = Variable<String?>(converter.mapToSql(mentions));
    }
    if (!nullToAbsent || tags != null) {
      final converter = $DbStatusesTable.$converter4;
      map['tags'] = Variable<String?>(converter.mapToSql(tags));
    }
    if (!nullToAbsent || emojis != null) {
      final converter = $DbStatusesTable.$converter5;
      map['emojis'] = Variable<String?>(converter.mapToSql(emojis));
    }
    if (!nullToAbsent || poll != null) {
      final converter = $DbStatusesTable.$converter6;
      map['poll'] = Variable<String?>(converter.mapToSql(poll));
    }
    if (!nullToAbsent || card != null) {
      final converter = $DbStatusesTable.$converter7;
      map['card'] = Variable<String?>(converter.mapToSql(card));
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String?>(language);
    }
    if (!nullToAbsent || pleromaContent != null) {
      final converter = $DbStatusesTable.$converter8;
      map['pleroma_content'] =
          Variable<String?>(converter.mapToSql(pleromaContent));
    }
    if (!nullToAbsent || pleromaConversationId != null) {
      map['pleroma_conversation_id'] = Variable<int?>(pleromaConversationId);
    }
    if (!nullToAbsent || pleromaDirectConversationId != null) {
      map['pleroma_direct_conversation_id'] =
          Variable<int?>(pleromaDirectConversationId);
    }
    if (!nullToAbsent || pleromaInReplyToAccountAcct != null) {
      map['pleroma_in_reply_to_account_acct'] =
          Variable<String?>(pleromaInReplyToAccountAcct);
    }
    if (!nullToAbsent || pleromaLocal != null) {
      map['pleroma_local'] = Variable<bool?>(pleromaLocal);
    }
    if (!nullToAbsent || pleromaSpoilerText != null) {
      final converter = $DbStatusesTable.$converter9;
      map['pleroma_spoiler_text'] =
          Variable<String?>(converter.mapToSql(pleromaSpoilerText));
    }
    if (!nullToAbsent || pleromaExpiresAt != null) {
      map['pleroma_expires_at'] = Variable<DateTime?>(pleromaExpiresAt);
    }
    if (!nullToAbsent || pleromaThreadMuted != null) {
      map['pleroma_thread_muted'] = Variable<bool?>(pleromaThreadMuted);
    }
    if (!nullToAbsent || pleromaEmojiReactions != null) {
      final TypeConverter<List<PleromaStatusEmojiReaction?>, String> converter =
          $DbStatusesTable.$converter10;
      map['pleroma_emoji_reactions'] =
          Variable<String?>(converter.mapToSql(pleromaEmojiReactions));
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool?>(deleted);
    }
    if (!nullToAbsent || hiddenLocallyOnDevice != null) {
      map['hidden_locally_on_device'] = Variable<bool?>(hiddenLocallyOnDevice);
    }
    if (!nullToAbsent || pendingState != null) {
      final converter = $DbStatusesTable.$converter11;
      map['pending_state'] =
          Variable<String?>(converter.mapToSql(pendingState));
    }
    if (!nullToAbsent || oldPendingRemoteId != null) {
      map['old_pending_remote_id'] = Variable<String?>(oldPendingRemoteId);
    }
    if (!nullToAbsent || wasSentWithIdempotencyKey != null) {
      map['was_sent_with_idempotency_key'] =
          Variable<String?>(wasSentWithIdempotencyKey);
    }
    return map;
  }

  DbStatusesCompanion toCompanion(bool nullToAbsent) {
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
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
      hiddenLocallyOnDevice: hiddenLocallyOnDevice == null && nullToAbsent
          ? const Value.absent()
          : Value(hiddenLocallyOnDevice),
      pendingState: pendingState == null && nullToAbsent
          ? const Value.absent()
          : Value(pendingState),
      oldPendingRemoteId: oldPendingRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(oldPendingRemoteId),
      wasSentWithIdempotencyKey:
          wasSentWithIdempotencyKey == null && nullToAbsent
              ? const Value.absent()
              : Value(wasSentWithIdempotencyKey),
    );
  }

  factory DbStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
      deleted: serializer.fromJson<bool>(json['deleted']),
      hiddenLocallyOnDevice:
          serializer.fromJson<bool>(json['hiddenLocallyOnDevice']),
      pendingState: serializer.fromJson<PendingState>(json['pendingState']),
      oldPendingRemoteId:
          serializer.fromJson<String>(json['oldPendingRemoteId']),
      wasSentWithIdempotencyKey:
          serializer.fromJson<String>(json['wasSentWithIdempotencyKey']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'inReplyToRemoteId': serializer.toJson<String?>(inReplyToRemoteId),
      'inReplyToAccountRemoteId':
          serializer.toJson<String?>(inReplyToAccountRemoteId),
      'sensitive': serializer.toJson<bool?>(sensitive),
      'spoilerText': serializer.toJson<String?>(spoilerText),
      'visibility': serializer.toJson<PleromaVisibility?>(visibility),
      'uri': serializer.toJson<String?>(uri),
      'url': serializer.toJson<String?>(url),
      'repliesCount': serializer.toJson<int?>(repliesCount),
      'reblogsCount': serializer.toJson<int?>(reblogsCount),
      'favouritesCount': serializer.toJson<int?>(favouritesCount),
      'favourited': serializer.toJson<bool?>(favourited),
      'reblogged': serializer.toJson<bool?>(reblogged),
      'muted': serializer.toJson<bool?>(muted),
      'bookmarked': serializer.toJson<bool?>(bookmarked),
      'pinned': serializer.toJson<bool?>(pinned),
      'content': serializer.toJson<String?>(content),
      'reblogStatusRemoteId': serializer.toJson<String?>(reblogStatusRemoteId),
      'application': serializer.toJson<PleromaApplication?>(application),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'mediaAttachments':
          serializer.toJson<List<PleromaMediaAttachment>?>(mediaAttachments),
      'mentions': serializer.toJson<List<PleromaMention>?>(mentions),
      'tags': serializer.toJson<List<PleromaTag>?>(tags),
      'emojis': serializer.toJson<List<PleromaEmoji>?>(emojis),
      'poll': serializer.toJson<PleromaPoll?>(poll),
      'card': serializer.toJson<PleromaCard?>(card),
      'language': serializer.toJson<String?>(language),
      'pleromaContent': serializer.toJson<PleromaContent?>(pleromaContent),
      'pleromaConversationId': serializer.toJson<int?>(pleromaConversationId),
      'pleromaDirectConversationId':
          serializer.toJson<int?>(pleromaDirectConversationId),
      'pleromaInReplyToAccountAcct':
          serializer.toJson<String?>(pleromaInReplyToAccountAcct),
      'pleromaLocal': serializer.toJson<bool?>(pleromaLocal),
      'pleromaSpoilerText':
          serializer.toJson<PleromaContent?>(pleromaSpoilerText),
      'pleromaExpiresAt': serializer.toJson<DateTime?>(pleromaExpiresAt),
      'pleromaThreadMuted': serializer.toJson<bool?>(pleromaThreadMuted),
      'pleromaEmojiReactions': serializer
          .toJson<List<PleromaStatusEmojiReaction?>?>(pleromaEmojiReactions),
      'deleted': serializer.toJson<bool?>(deleted),
      'hiddenLocallyOnDevice': serializer.toJson<bool?>(hiddenLocallyOnDevice),
      'pendingState': serializer.toJson<PendingState?>(pendingState),
      'oldPendingRemoteId': serializer.toJson<String?>(oldPendingRemoteId),
      'wasSentWithIdempotencyKey':
          serializer.toJson<String?>(wasSentWithIdempotencyKey),
    };
  }

  DbStatus copyWith(
          {int? id,
          String? remoteId,
          DateTime? createdAt,
          String? inReplyToRemoteId,
          String? inReplyToAccountRemoteId,
          bool? sensitive,
          String? spoilerText,
          PleromaVisibility? visibility,
          String? uri,
          String? url,
          int? repliesCount,
          int? reblogsCount,
          int? favouritesCount,
          bool? favourited,
          bool? reblogged,
          bool? muted,
          bool? bookmarked,
          bool? pinned,
          String? content,
          String? reblogStatusRemoteId,
          PleromaApplication? application,
          String? accountRemoteId,
          List<PleromaMediaAttachment>? mediaAttachments,
          List<PleromaMention>? mentions,
          List<PleromaTag>? tags,
          List<PleromaEmoji>? emojis,
          PleromaPoll? poll,
          PleromaCard? card,
          String? language,
          PleromaContent? pleromaContent,
          int? pleromaConversationId,
          int? pleromaDirectConversationId,
          String? pleromaInReplyToAccountAcct,
          bool? pleromaLocal,
          PleromaContent? pleromaSpoilerText,
          DateTime? pleromaExpiresAt,
          bool? pleromaThreadMuted,
          List<PleromaStatusEmojiReaction?>? pleromaEmojiReactions,
          bool? deleted,
          bool? hiddenLocallyOnDevice,
          PendingState? pendingState,
          String? oldPendingRemoteId,
          String? wasSentWithIdempotencyKey}) =>
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
        deleted: deleted ?? this.deleted,
        hiddenLocallyOnDevice:
            hiddenLocallyOnDevice ?? this.hiddenLocallyOnDevice,
        pendingState: pendingState ?? this.pendingState,
        oldPendingRemoteId: oldPendingRemoteId ?? this.oldPendingRemoteId,
        wasSentWithIdempotencyKey:
            wasSentWithIdempotencyKey ?? this.wasSentWithIdempotencyKey,
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
          ..write('pleromaEmojiReactions: $pleromaEmojiReactions, ')
          ..write('deleted: $deleted, ')
          ..write('hiddenLocallyOnDevice: $hiddenLocallyOnDevice, ')
          ..write('pendingState: $pendingState, ')
          ..write('oldPendingRemoteId: $oldPendingRemoteId, ')
          ..write('wasSentWithIdempotencyKey: $wasSentWithIdempotencyKey')
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
                                                                              $mrjc(reblogStatusRemoteId.hashCode, $mrjc(application.hashCode, $mrjc(accountRemoteId.hashCode, $mrjc(mediaAttachments.hashCode, $mrjc(mentions.hashCode, $mrjc(tags.hashCode, $mrjc(emojis.hashCode, $mrjc(poll.hashCode, $mrjc(card.hashCode, $mrjc(language.hashCode, $mrjc(pleromaContent.hashCode, $mrjc(pleromaConversationId.hashCode, $mrjc(pleromaDirectConversationId.hashCode, $mrjc(pleromaInReplyToAccountAcct.hashCode, $mrjc(pleromaLocal.hashCode, $mrjc(pleromaSpoilerText.hashCode, $mrjc(pleromaExpiresAt.hashCode, $mrjc(pleromaThreadMuted.hashCode, $mrjc(pleromaEmojiReactions.hashCode, $mrjc(deleted.hashCode, $mrjc(hiddenLocallyOnDevice.hashCode, $mrjc(pendingState.hashCode, $mrjc(oldPendingRemoteId.hashCode, wasSentWithIdempotencyKey.hashCode)))))))))))))))))))))))))))))))))))))))))));

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
          other.pleromaEmojiReactions == this.pleromaEmojiReactions &&
          other.deleted == this.deleted &&
          other.hiddenLocallyOnDevice == this.hiddenLocallyOnDevice &&
          other.pendingState == this.pendingState &&
          other.oldPendingRemoteId == this.oldPendingRemoteId &&
          other.wasSentWithIdempotencyKey == this.wasSentWithIdempotencyKey);
}

class DbStatusesCompanion extends UpdateCompanion<DbStatus> {
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<DateTime?> createdAt;
  final Value<String?> inReplyToRemoteId;
  final Value<String?> inReplyToAccountRemoteId;
  final Value<bool?> sensitive;
  final Value<String?> spoilerText;
  final Value<PleromaVisibility?> visibility;
  final Value<String?> uri;
  final Value<String?> url;
  final Value<int?> repliesCount;
  final Value<int?> reblogsCount;
  final Value<int?> favouritesCount;
  final Value<bool?> favourited;
  final Value<bool?> reblogged;
  final Value<bool?> muted;
  final Value<bool?> bookmarked;
  final Value<bool?> pinned;
  final Value<String?> content;
  final Value<String?> reblogStatusRemoteId;
  final Value<PleromaApplication?> application;
  final Value<String?> accountRemoteId;
  final Value<List<PleromaMediaAttachment>?> mediaAttachments;
  final Value<List<PleromaMention>?> mentions;
  final Value<List<PleromaTag>?> tags;
  final Value<List<PleromaEmoji>?> emojis;
  final Value<PleromaPoll?> poll;
  final Value<PleromaCard?> card;
  final Value<String?> language;
  final Value<PleromaContent?> pleromaContent;
  final Value<int?> pleromaConversationId;
  final Value<int?> pleromaDirectConversationId;
  final Value<String?> pleromaInReplyToAccountAcct;
  final Value<bool?> pleromaLocal;
  final Value<PleromaContent?> pleromaSpoilerText;
  final Value<DateTime?> pleromaExpiresAt;
  final Value<bool?> pleromaThreadMuted;
  final Value<List<PleromaStatusEmojiReaction?>?> pleromaEmojiReactions;
  final Value<bool?> deleted;
  final Value<bool?> hiddenLocallyOnDevice;
  final Value<PendingState?> pendingState;
  final Value<String?> oldPendingRemoteId;
  final Value<String?> wasSentWithIdempotencyKey;

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
    this.deleted = const Value.absent(),
    this.hiddenLocallyOnDevice = const Value.absent(),
    this.pendingState = const Value.absent(),
    this.oldPendingRemoteId = const Value.absent(),
    this.wasSentWithIdempotencyKey = const Value.absent(),
  });

  DbStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required DateTime createdAt,
    this.inReplyToRemoteId = const Value.absent(),
    this.inReplyToAccountRemoteId = const Value.absent(),
    required bool sensitive,
    required String spoilerText,
    this.visibility = const Value.absent(),
    required String uri,
    this.url = const Value.absent(),
    required int repliesCount,
    required int reblogsCount,
    required int favouritesCount,
    this.favourited = const Value.absent(),
    this.reblogged = const Value.absent(),
    this.muted = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.pinned = const Value.absent(),
    this.content = const Value.absent(),
    this.reblogStatusRemoteId = const Value.absent(),
    this.application = const Value.absent(),
    required String accountRemoteId,
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
    this.deleted = const Value.absent(),
    this.hiddenLocallyOnDevice = const Value.absent(),
    this.pendingState = const Value.absent(),
    this.oldPendingRemoteId = const Value.absent(),
    this.wasSentWithIdempotencyKey = const Value.absent(),
  })  : remoteId = Value(remoteId),
        createdAt = Value(createdAt),
        sensitive = Value(sensitive),
        spoilerText = Value(spoilerText),
        uri = Value(uri),
        repliesCount = Value(repliesCount),
        reblogsCount = Value(reblogsCount),
        favouritesCount = Value(favouritesCount),
        accountRemoteId = Value(accountRemoteId);

  static Insertable<DbStatus> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<String>? inReplyToRemoteId,
    Expression<String>? inReplyToAccountRemoteId,
    Expression<bool>? sensitive,
    Expression<String>? spoilerText,
    Expression<String>? visibility,
    Expression<String>? uri,
    Expression<String>? url,
    Expression<int>? repliesCount,
    Expression<int>? reblogsCount,
    Expression<int>? favouritesCount,
    Expression<bool>? favourited,
    Expression<bool>? reblogged,
    Expression<bool>? muted,
    Expression<bool>? bookmarked,
    Expression<bool>? pinned,
    Expression<String>? content,
    Expression<String>? reblogStatusRemoteId,
    Expression<String>? application,
    Expression<String>? accountRemoteId,
    Expression<String>? mediaAttachments,
    Expression<String>? mentions,
    Expression<String>? tags,
    Expression<String>? emojis,
    Expression<String>? poll,
    Expression<String>? card,
    Expression<String>? language,
    Expression<String>? pleromaContent,
    Expression<int>? pleromaConversationId,
    Expression<int>? pleromaDirectConversationId,
    Expression<String>? pleromaInReplyToAccountAcct,
    Expression<bool>? pleromaLocal,
    Expression<String>? pleromaSpoilerText,
    Expression<DateTime>? pleromaExpiresAt,
    Expression<bool>? pleromaThreadMuted,
    Expression<String>? pleromaEmojiReactions,
    Expression<bool>? deleted,
    Expression<bool>? hiddenLocallyOnDevice,
    Expression<String>? pendingState,
    Expression<String>? oldPendingRemoteId,
    Expression<String>? wasSentWithIdempotencyKey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
      if (inReplyToRemoteId != null) 'in_reply_to_remote_id': inReplyToRemoteId,
      if (inReplyToAccountRemoteId != null)
        'in_reply_to_account_remote_id': inReplyToAccountRemoteId,
      if (sensitive != null) 'sensitive': sensitive,
      if (spoilerText != null) 'spoiler_text': spoilerText,
      if (visibility != null) 'visibility': visibility,
      if (uri != null) 'uri': uri,
      if (url != null) 'url': url,
      if (repliesCount != null) 'replies_count': repliesCount,
      if (reblogsCount != null) 'reblogs_count': reblogsCount,
      if (favouritesCount != null) 'favourites_count': favouritesCount,
      if (favourited != null) 'favourited': favourited,
      if (reblogged != null) 'reblogged': reblogged,
      if (muted != null) 'muted': muted,
      if (bookmarked != null) 'bookmarked': bookmarked,
      if (pinned != null) 'pinned': pinned,
      if (content != null) 'content': content,
      if (reblogStatusRemoteId != null)
        'reblog_status_remote_id': reblogStatusRemoteId,
      if (application != null) 'application': application,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
      if (mediaAttachments != null) 'media_attachments': mediaAttachments,
      if (mentions != null) 'mentions': mentions,
      if (tags != null) 'tags': tags,
      if (emojis != null) 'emojis': emojis,
      if (poll != null) 'poll': poll,
      if (card != null) 'card': card,
      if (language != null) 'language': language,
      if (pleromaContent != null) 'pleroma_content': pleromaContent,
      if (pleromaConversationId != null)
        'pleroma_conversation_id': pleromaConversationId,
      if (pleromaDirectConversationId != null)
        'pleroma_direct_conversation_id': pleromaDirectConversationId,
      if (pleromaInReplyToAccountAcct != null)
        'pleroma_in_reply_to_account_acct': pleromaInReplyToAccountAcct,
      if (pleromaLocal != null) 'pleroma_local': pleromaLocal,
      if (pleromaSpoilerText != null)
        'pleroma_spoiler_text': pleromaSpoilerText,
      if (pleromaExpiresAt != null) 'pleroma_expires_at': pleromaExpiresAt,
      if (pleromaThreadMuted != null)
        'pleroma_thread_muted': pleromaThreadMuted,
      if (pleromaEmojiReactions != null)
        'pleroma_emoji_reactions': pleromaEmojiReactions,
      if (deleted != null) 'deleted': deleted,
      if (hiddenLocallyOnDevice != null)
        'hidden_locally_on_device': hiddenLocallyOnDevice,
      if (pendingState != null) 'pending_state': pendingState,
      if (oldPendingRemoteId != null)
        'old_pending_remote_id': oldPendingRemoteId,
      if (wasSentWithIdempotencyKey != null)
        'was_sent_with_idempotency_key': wasSentWithIdempotencyKey,
    });
  }

  DbStatusesCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<DateTime>? createdAt,
      Value<String>? inReplyToRemoteId,
      Value<String>? inReplyToAccountRemoteId,
      Value<bool>? sensitive,
      Value<String>? spoilerText,
      Value<PleromaVisibility>? visibility,
      Value<String>? uri,
      Value<String>? url,
      Value<int>? repliesCount,
      Value<int>? reblogsCount,
      Value<int>? favouritesCount,
      Value<bool>? favourited,
      Value<bool>? reblogged,
      Value<bool>? muted,
      Value<bool>? bookmarked,
      Value<bool>? pinned,
      Value<String>? content,
      Value<String>? reblogStatusRemoteId,
      Value<PleromaApplication>? application,
      Value<String>? accountRemoteId,
      Value<List<PleromaMediaAttachment>>? mediaAttachments,
      Value<List<PleromaMention>>? mentions,
      Value<List<PleromaTag>>? tags,
      Value<List<PleromaEmoji>>? emojis,
      Value<PleromaPoll>? poll,
      Value<PleromaCard>? card,
      Value<String>? language,
      Value<PleromaContent>? pleromaContent,
      Value<int>? pleromaConversationId,
      Value<int>? pleromaDirectConversationId,
      Value<String>? pleromaInReplyToAccountAcct,
      Value<bool>? pleromaLocal,
      Value<PleromaContent>? pleromaSpoilerText,
      Value<DateTime>? pleromaExpiresAt,
      Value<bool>? pleromaThreadMuted,
      Value<List<PleromaStatusEmojiReaction>>? pleromaEmojiReactions,
      Value<bool>? deleted,
      Value<bool>? hiddenLocallyOnDevice,
      Value<PendingState>? pendingState,
      Value<String>? oldPendingRemoteId,
      Value<String>? wasSentWithIdempotencyKey}) {
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
      deleted: deleted ?? this.deleted,
      hiddenLocallyOnDevice:
          hiddenLocallyOnDevice ?? this.hiddenLocallyOnDevice,
      pendingState: pendingState ?? this.pendingState,
      oldPendingRemoteId: oldPendingRemoteId ?? this.oldPendingRemoteId,
      wasSentWithIdempotencyKey:
          wasSentWithIdempotencyKey ?? this.wasSentWithIdempotencyKey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (inReplyToRemoteId.present) {
      map['in_reply_to_remote_id'] = Variable<String?>(inReplyToRemoteId.value);
    }
    if (inReplyToAccountRemoteId.present) {
      map['in_reply_to_account_remote_id'] =
          Variable<String?>(inReplyToAccountRemoteId.value);
    }
    if (sensitive.present) {
      map['sensitive'] = Variable<bool?>(sensitive.value);
    }
    if (spoilerText.present) {
      map['spoiler_text'] = Variable<String?>(spoilerText.value);
    }
    if (visibility.present) {
      final converter = $DbStatusesTable.$converter0;
      map['visibility'] =
          Variable<String?>(converter.mapToSql(visibility.value));
    }
    if (uri.present) {
      map['uri'] = Variable<String?>(uri.value);
    }
    if (url.present) {
      map['url'] = Variable<String?>(url.value);
    }
    if (repliesCount.present) {
      map['replies_count'] = Variable<int?>(repliesCount.value);
    }
    if (reblogsCount.present) {
      map['reblogs_count'] = Variable<int?>(reblogsCount.value);
    }
    if (favouritesCount.present) {
      map['favourites_count'] = Variable<int?>(favouritesCount.value);
    }
    if (favourited.present) {
      map['favourited'] = Variable<bool?>(favourited.value);
    }
    if (reblogged.present) {
      map['reblogged'] = Variable<bool?>(reblogged.value);
    }
    if (muted.present) {
      map['muted'] = Variable<bool?>(muted.value);
    }
    if (bookmarked.present) {
      map['bookmarked'] = Variable<bool?>(bookmarked.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool?>(pinned.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (reblogStatusRemoteId.present) {
      map['reblog_status_remote_id'] =
          Variable<String?>(reblogStatusRemoteId.value);
    }
    if (application.present) {
      final converter = $DbStatusesTable.$converter1;
      map['application'] =
          Variable<String?>(converter.mapToSql(application.value));
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    if (mediaAttachments.present) {
      final converter = $DbStatusesTable.$converter2;
      map['media_attachments'] =
          Variable<String?>(converter.mapToSql(mediaAttachments.value));
    }
    if (mentions.present) {
      final converter = $DbStatusesTable.$converter3;
      map['mentions'] = Variable<String?>(converter.mapToSql(mentions.value));
    }
    if (tags.present) {
      final converter = $DbStatusesTable.$converter4;
      map['tags'] = Variable<String?>(converter.mapToSql(tags.value));
    }
    if (emojis.present) {
      final converter = $DbStatusesTable.$converter5;
      map['emojis'] = Variable<String?>(converter.mapToSql(emojis.value));
    }
    if (poll.present) {
      final converter = $DbStatusesTable.$converter6;
      map['poll'] = Variable<String?>(converter.mapToSql(poll.value));
    }
    if (card.present) {
      final converter = $DbStatusesTable.$converter7;
      map['card'] = Variable<String?>(converter.mapToSql(card.value));
    }
    if (language.present) {
      map['language'] = Variable<String?>(language.value);
    }
    if (pleromaContent.present) {
      final converter = $DbStatusesTable.$converter8;
      map['pleroma_content'] =
          Variable<String?>(converter.mapToSql(pleromaContent.value));
    }
    if (pleromaConversationId.present) {
      map['pleroma_conversation_id'] =
          Variable<int?>(pleromaConversationId.value);
    }
    if (pleromaDirectConversationId.present) {
      map['pleroma_direct_conversation_id'] =
          Variable<int?>(pleromaDirectConversationId.value);
    }
    if (pleromaInReplyToAccountAcct.present) {
      map['pleroma_in_reply_to_account_acct'] =
          Variable<String?>(pleromaInReplyToAccountAcct.value);
    }
    if (pleromaLocal.present) {
      map['pleroma_local'] = Variable<bool?>(pleromaLocal.value);
    }
    if (pleromaSpoilerText.present) {
      final converter = $DbStatusesTable.$converter9;
      map['pleroma_spoiler_text'] =
          Variable<String?>(converter.mapToSql(pleromaSpoilerText.value));
    }
    if (pleromaExpiresAt.present) {
      map['pleroma_expires_at'] = Variable<DateTime?>(pleromaExpiresAt.value);
    }
    if (pleromaThreadMuted.present) {
      map['pleroma_thread_muted'] = Variable<bool?>(pleromaThreadMuted.value);
    }
    if (pleromaEmojiReactions.present) {
      final TypeConverter<List<PleromaStatusEmojiReaction?>, String> converter =
          $DbStatusesTable.$converter10;
      map['pleroma_emoji_reactions'] =
          Variable<String?>(converter.mapToSql(pleromaEmojiReactions.value));
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool?>(deleted.value);
    }
    if (hiddenLocallyOnDevice.present) {
      map['hidden_locally_on_device'] =
          Variable<bool?>(hiddenLocallyOnDevice.value);
    }
    if (pendingState.present) {
      final converter = $DbStatusesTable.$converter11;
      map['pending_state'] =
          Variable<String?>(converter.mapToSql(pendingState.value));
    }
    if (oldPendingRemoteId.present) {
      map['old_pending_remote_id'] =
          Variable<String?>(oldPendingRemoteId.value);
    }
    if (wasSentWithIdempotencyKey.present) {
      map['was_sent_with_idempotency_key'] =
          Variable<String?>(wasSentWithIdempotencyKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbStatusesCompanion(')
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
          ..write('pleromaEmojiReactions: $pleromaEmojiReactions, ')
          ..write('deleted: $deleted, ')
          ..write('hiddenLocallyOnDevice: $hiddenLocallyOnDevice, ')
          ..write('pendingState: $pendingState, ')
          ..write('oldPendingRemoteId: $oldPendingRemoteId, ')
          ..write('wasSentWithIdempotencyKey: $wasSentWithIdempotencyKey')
          ..write(')'))
        .toString();
  }
}

class $DbStatusesTable extends DbStatuses
    with TableInfo<$DbStatusesTable, DbStatus> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbStatusesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn? _createdAt;

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
  GeneratedTextColumn? _inReplyToRemoteId;

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
  GeneratedTextColumn? _inReplyToAccountRemoteId;

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
  GeneratedBoolColumn? _sensitive;

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
  GeneratedTextColumn? _spoilerText;

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
  GeneratedTextColumn? _visibility;

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
  GeneratedTextColumn? _uri;

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
  GeneratedTextColumn? _url;

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
  GeneratedIntColumn? _repliesCount;

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
  GeneratedIntColumn? _reblogsCount;

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
  GeneratedIntColumn? _favouritesCount;

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
  GeneratedBoolColumn? _favourited;

  @override
  GeneratedBoolColumn get favourited => _favourited ??= _constructFavourited();

  GeneratedBoolColumn _constructFavourited() {
    return GeneratedBoolColumn('favourited', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _rebloggedMeta = const VerificationMeta('reblogged');
  GeneratedBoolColumn? _reblogged;

  @override
  GeneratedBoolColumn get reblogged => _reblogged ??= _constructReblogged();

  GeneratedBoolColumn _constructReblogged() {
    return GeneratedBoolColumn('reblogged', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _mutedMeta = const VerificationMeta('muted');
  GeneratedBoolColumn? _muted;

  @override
  GeneratedBoolColumn get muted => _muted ??= _constructMuted();

  GeneratedBoolColumn _constructMuted() {
    return GeneratedBoolColumn('muted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _bookmarkedMeta = const VerificationMeta('bookmarked');
  GeneratedBoolColumn? _bookmarked;

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
  GeneratedBoolColumn? _pinned;

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
  GeneratedTextColumn? _content;

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
  GeneratedTextColumn? _reblogStatusRemoteId;

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
  GeneratedTextColumn? _application;

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
  GeneratedTextColumn? _accountRemoteId;

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
  GeneratedTextColumn? _mediaAttachments;

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
  GeneratedTextColumn? _mentions;

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
  GeneratedTextColumn? _tags;

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
  GeneratedTextColumn? _emojis;

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
  GeneratedTextColumn? _poll;

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
  GeneratedTextColumn? _card;

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
  GeneratedTextColumn? _language;

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
  GeneratedTextColumn? _pleromaContent;

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
  GeneratedIntColumn? _pleromaConversationId;

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
  GeneratedIntColumn? _pleromaDirectConversationId;

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
  GeneratedTextColumn? _pleromaInReplyToAccountAcct;

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
  GeneratedBoolColumn? _pleromaLocal;

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
  GeneratedTextColumn? _pleromaSpoilerText;

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
  GeneratedDateTimeColumn? _pleromaExpiresAt;

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
  GeneratedBoolColumn? _pleromaThreadMuted;

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
  GeneratedTextColumn? _pleromaEmojiReactions;

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

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  GeneratedBoolColumn? _deleted;

  @override
  GeneratedBoolColumn get deleted => _deleted ??= _constructDeleted();

  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn(
      'deleted',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hiddenLocallyOnDeviceMeta =
      const VerificationMeta('hiddenLocallyOnDevice');
  GeneratedBoolColumn? _hiddenLocallyOnDevice;

  @override
  GeneratedBoolColumn get hiddenLocallyOnDevice =>
      _hiddenLocallyOnDevice ??= _constructHiddenLocallyOnDevice();

  GeneratedBoolColumn _constructHiddenLocallyOnDevice() {
    return GeneratedBoolColumn(
      'hidden_locally_on_device',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pendingStateMeta =
      const VerificationMeta('pendingState');
  GeneratedTextColumn? _pendingState;

  @override
  GeneratedTextColumn get pendingState =>
      _pendingState ??= _constructPendingState();

  GeneratedTextColumn _constructPendingState() {
    return GeneratedTextColumn(
      'pending_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _oldPendingRemoteIdMeta =
      const VerificationMeta('oldPendingRemoteId');
  GeneratedTextColumn? _oldPendingRemoteId;

  @override
  GeneratedTextColumn get oldPendingRemoteId =>
      _oldPendingRemoteId ??= _constructOldPendingRemoteId();

  GeneratedTextColumn _constructOldPendingRemoteId() {
    return GeneratedTextColumn(
      'old_pending_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _wasSentWithIdempotencyKeyMeta =
      const VerificationMeta('wasSentWithIdempotencyKey');
  GeneratedTextColumn? _wasSentWithIdempotencyKey;

  @override
  GeneratedTextColumn get wasSentWithIdempotencyKey =>
      _wasSentWithIdempotencyKey ??= _constructWasSentWithIdempotencyKey();

  GeneratedTextColumn _constructWasSentWithIdempotencyKey() {
    return GeneratedTextColumn(
      'was_sent_with_idempotency_key',
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
        pleromaEmojiReactions,
        deleted,
        hiddenLocallyOnDevice,
        pendingState,
        oldPendingRemoteId,
        wasSentWithIdempotencyKey
      ];

  @override
  $DbStatusesTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_statuses';
  @override
  final String actualTableName = 'db_statuses';

  @override
  VerificationContext validateIntegrity(Insertable<DbStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('in_reply_to_remote_id')) {
      context.handle(
          _inReplyToRemoteIdMeta,
          inReplyToRemoteId.isAcceptableOrUnknown(
              data['in_reply_to_remote_id']!, _inReplyToRemoteIdMeta));
    }
    if (data.containsKey('in_reply_to_account_remote_id')) {
      context.handle(
          _inReplyToAccountRemoteIdMeta,
          inReplyToAccountRemoteId.isAcceptableOrUnknown(
              data['in_reply_to_account_remote_id']!,
              _inReplyToAccountRemoteIdMeta));
    }
    if (data.containsKey('sensitive')) {
      context.handle(_sensitiveMeta,
          sensitive.isAcceptableOrUnknown(data['sensitive']!, _sensitiveMeta));
    } else if (isInserting) {
      context.missing(_sensitiveMeta);
    }
    if (data.containsKey('spoiler_text')) {
      context.handle(
          _spoilerTextMeta,
          spoilerText.isAcceptableOrUnknown(
              data['spoiler_text']!, _spoilerTextMeta));
    } else if (isInserting) {
      context.missing(_spoilerTextMeta);
    }
    context.handle(_visibilityMeta, const VerificationResult.success());
    if (data.containsKey('uri')) {
      context.handle(
          _uriMeta, uri.isAcceptableOrUnknown(data['uri']!, _uriMeta));
    } else if (isInserting) {
      context.missing(_uriMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    if (data.containsKey('replies_count')) {
      context.handle(
          _repliesCountMeta,
          repliesCount.isAcceptableOrUnknown(
              data['replies_count']!, _repliesCountMeta));
    } else if (isInserting) {
      context.missing(_repliesCountMeta);
    }
    if (data.containsKey('reblogs_count')) {
      context.handle(
          _reblogsCountMeta,
          reblogsCount.isAcceptableOrUnknown(
              data['reblogs_count']!, _reblogsCountMeta));
    } else if (isInserting) {
      context.missing(_reblogsCountMeta);
    }
    if (data.containsKey('favourites_count')) {
      context.handle(
          _favouritesCountMeta,
          favouritesCount.isAcceptableOrUnknown(
              data['favourites_count']!, _favouritesCountMeta));
    } else if (isInserting) {
      context.missing(_favouritesCountMeta);
    }
    if (data.containsKey('favourited')) {
      context.handle(
          _favouritedMeta,
          favourited.isAcceptableOrUnknown(
              data['favourited']!, _favouritedMeta));
    }
    if (data.containsKey('reblogged')) {
      context.handle(_rebloggedMeta,
          reblogged.isAcceptableOrUnknown(data['reblogged']!, _rebloggedMeta));
    }
    if (data.containsKey('muted')) {
      context.handle(
          _mutedMeta, muted.isAcceptableOrUnknown(data['muted']!, _mutedMeta));
    }
    if (data.containsKey('bookmarked')) {
      context.handle(
          _bookmarkedMeta,
          bookmarked.isAcceptableOrUnknown(
              data['bookmarked']!, _bookmarkedMeta));
    }
    if (data.containsKey('pinned')) {
      context.handle(_pinnedMeta,
          pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('reblog_status_remote_id')) {
      context.handle(
          _reblogStatusRemoteIdMeta,
          reblogStatusRemoteId.isAcceptableOrUnknown(
              data['reblog_status_remote_id']!, _reblogStatusRemoteIdMeta));
    }
    context.handle(_applicationMeta, const VerificationResult.success());
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    context.handle(_mediaAttachmentsMeta, const VerificationResult.success());
    context.handle(_mentionsMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_emojisMeta, const VerificationResult.success());
    context.handle(_pollMeta, const VerificationResult.success());
    context.handle(_cardMeta, const VerificationResult.success());
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    context.handle(_pleromaContentMeta, const VerificationResult.success());
    if (data.containsKey('pleroma_conversation_id')) {
      context.handle(
          _pleromaConversationIdMeta,
          pleromaConversationId.isAcceptableOrUnknown(
              data['pleroma_conversation_id']!, _pleromaConversationIdMeta));
    }
    if (data.containsKey('pleroma_direct_conversation_id')) {
      context.handle(
          _pleromaDirectConversationIdMeta,
          pleromaDirectConversationId.isAcceptableOrUnknown(
              data['pleroma_direct_conversation_id']!,
              _pleromaDirectConversationIdMeta));
    }
    if (data.containsKey('pleroma_in_reply_to_account_acct')) {
      context.handle(
          _pleromaInReplyToAccountAcctMeta,
          pleromaInReplyToAccountAcct.isAcceptableOrUnknown(
              data['pleroma_in_reply_to_account_acct']!,
              _pleromaInReplyToAccountAcctMeta));
    }
    if (data.containsKey('pleroma_local')) {
      context.handle(
          _pleromaLocalMeta,
          pleromaLocal.isAcceptableOrUnknown(
              data['pleroma_local']!, _pleromaLocalMeta));
    }
    context.handle(_pleromaSpoilerTextMeta, const VerificationResult.success());
    if (data.containsKey('pleroma_expires_at')) {
      context.handle(
          _pleromaExpiresAtMeta,
          pleromaExpiresAt.isAcceptableOrUnknown(
              data['pleroma_expires_at']!, _pleromaExpiresAtMeta));
    }
    if (data.containsKey('pleroma_thread_muted')) {
      context.handle(
          _pleromaThreadMutedMeta,
          pleromaThreadMuted.isAcceptableOrUnknown(
              data['pleroma_thread_muted']!, _pleromaThreadMutedMeta));
    }
    context.handle(
        _pleromaEmojiReactionsMeta, const VerificationResult.success());
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('hidden_locally_on_device')) {
      context.handle(
          _hiddenLocallyOnDeviceMeta,
          hiddenLocallyOnDevice.isAcceptableOrUnknown(
              data['hidden_locally_on_device']!, _hiddenLocallyOnDeviceMeta));
    }
    context.handle(_pendingStateMeta, const VerificationResult.success());
    if (data.containsKey('old_pending_remote_id')) {
      context.handle(
          _oldPendingRemoteIdMeta,
          oldPendingRemoteId.isAcceptableOrUnknown(
              data['old_pending_remote_id']!, _oldPendingRemoteIdMeta));
    }
    if (data.containsKey('was_sent_with_idempotency_key')) {
      context.handle(
          _wasSentWithIdempotencyKeyMeta,
          wasSentWithIdempotencyKey.isAcceptableOrUnknown(
              data['was_sent_with_idempotency_key']!,
              _wasSentWithIdempotencyKeyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatus.fromData(data, _db, prefix: effectivePrefix);
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
  static TypeConverter<PendingState, String> $converter11 =
      PendingStateDatabaseConverter();
}

class DbAccount extends DataClass implements Insertable<DbAccount> {
  final int? id;
  final String remoteId;
  final String username;
  final String url;
  final String? note;
  final bool locked;
  final String headerStatic;
  final String header;
  final int followingCount;
  final int followersCount;
  final int statusesCount;
  final String? displayName;
  final DateTime createdAt;
  final bool bot;
  final String avatarStatic;
  final String avatar;
  final String acct;
  final DateTime? lastStatusAt;
  final List<PleromaField>? fields;
  final List<PleromaEmoji>? emojis;
  final String? pleromaBackgroundImage;
  final List<PleromaTag>? pleromaTags;
  final PleromaAccountRelationship? pleromaRelationship;
  final bool? pleromaIsAdmin;
  final bool? pleromaIsModerator;
  final bool? pleromaConfirmationPending;
  final bool? pleromaHideFavorites;
  final bool? pleromaHideFollowers;
  final bool? pleromaHideFollows;
  final bool? pleromaHideFollowersCount;
  final bool? pleromaHideFollowsCount;
  final bool? pleromaDeactivated;
  final bool? pleromaAllowFollowingMove;
  final bool? pleromaSkipThreadContainment;
  final bool? pleromaAcceptsChatMessages;

  DbAccount({
    required this.id,
    required this.remoteId,
    required this.username,
    required this.url,
    required this.note,
    required this.locked,
    required this.headerStatic,
    required this.header,
    required this.followingCount,
    required this.followersCount,
    required this.statusesCount,
    required this.displayName,
    required this.createdAt,
    required this.bot,
    required this.avatarStatic,
    required this.avatar,
    required this.acct,
    required this.lastStatusAt,
    required this.fields,
    required this.emojis,
    required this.pleromaBackgroundImage,
    required this.pleromaTags,
    required this.pleromaRelationship,
    required this.pleromaIsAdmin,
    required this.pleromaIsModerator,
    required this.pleromaConfirmationPending,
    required this.pleromaHideFavorites,
    required this.pleromaHideFollowers,
    required this.pleromaHideFollows,
    required this.pleromaHideFollowersCount,
    required this.pleromaHideFollowsCount,
    required this.pleromaDeactivated,
    required this.pleromaAllowFollowingMove,
    required this.pleromaSkipThreadContainment,
    required this.pleromaAcceptsChatMessages,
  });

  factory DbAccount.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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
      pleromaBackgroundImage: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_background_image']),
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
      pleromaAcceptsChatMessages: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_accepts_chat_messages']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String?>(username);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String?>(url);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String?>(note);
    }
    if (!nullToAbsent || locked != null) {
      map['locked'] = Variable<bool?>(locked);
    }
    if (!nullToAbsent || headerStatic != null) {
      map['header_static'] = Variable<String?>(headerStatic);
    }
    if (!nullToAbsent || header != null) {
      map['header'] = Variable<String?>(header);
    }
    if (!nullToAbsent || followingCount != null) {
      map['following_count'] = Variable<int?>(followingCount);
    }
    if (!nullToAbsent || followersCount != null) {
      map['followers_count'] = Variable<int?>(followersCount);
    }
    if (!nullToAbsent || statusesCount != null) {
      map['statuses_count'] = Variable<int?>(statusesCount);
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String?>(displayName);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || bot != null) {
      map['bot'] = Variable<bool?>(bot);
    }
    if (!nullToAbsent || avatarStatic != null) {
      map['avatar_static'] = Variable<String?>(avatarStatic);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String?>(avatar);
    }
    if (!nullToAbsent || acct != null) {
      map['acct'] = Variable<String?>(acct);
    }
    if (!nullToAbsent || lastStatusAt != null) {
      map['last_status_at'] = Variable<DateTime?>(lastStatusAt);
    }
    if (!nullToAbsent || fields != null) {
      final converter = $DbAccountsTable.$converter0;
      map['fields'] = Variable<String?>(converter.mapToSql(fields));
    }
    if (!nullToAbsent || emojis != null) {
      final converter = $DbAccountsTable.$converter1;
      map['emojis'] = Variable<String?>(converter.mapToSql(emojis));
    }
    if (!nullToAbsent || pleromaBackgroundImage != null) {
      map['pleroma_background_image'] =
          Variable<String?>(pleromaBackgroundImage);
    }
    if (!nullToAbsent || pleromaTags != null) {
      final converter = $DbAccountsTable.$converter2;
      map['pleroma_tags'] = Variable<String?>(converter.mapToSql(pleromaTags));
    }
    if (!nullToAbsent || pleromaRelationship != null) {
      final converter = $DbAccountsTable.$converter3;
      map['pleroma_relationship'] =
          Variable<String?>(converter.mapToSql(pleromaRelationship));
    }
    if (!nullToAbsent || pleromaIsAdmin != null) {
      map['pleroma_is_admin'] = Variable<bool?>(pleromaIsAdmin);
    }
    if (!nullToAbsent || pleromaIsModerator != null) {
      map['pleroma_is_moderator'] = Variable<bool?>(pleromaIsModerator);
    }
    if (!nullToAbsent || pleromaConfirmationPending != null) {
      map['pleroma_confirmation_pending'] =
          Variable<bool?>(pleromaConfirmationPending);
    }
    if (!nullToAbsent || pleromaHideFavorites != null) {
      map['pleroma_hide_favorites'] = Variable<bool?>(pleromaHideFavorites);
    }
    if (!nullToAbsent || pleromaHideFollowers != null) {
      map['pleroma_hide_followers'] = Variable<bool?>(pleromaHideFollowers);
    }
    if (!nullToAbsent || pleromaHideFollows != null) {
      map['pleroma_hide_follows'] = Variable<bool?>(pleromaHideFollows);
    }
    if (!nullToAbsent || pleromaHideFollowersCount != null) {
      map['pleroma_hide_followers_count'] =
          Variable<bool?>(pleromaHideFollowersCount);
    }
    if (!nullToAbsent || pleromaHideFollowsCount != null) {
      map['pleroma_hide_follows_count'] =
          Variable<bool?>(pleromaHideFollowsCount);
    }
    if (!nullToAbsent || pleromaDeactivated != null) {
      map['pleroma_deactivated'] = Variable<bool?>(pleromaDeactivated);
    }
    if (!nullToAbsent || pleromaAllowFollowingMove != null) {
      map['pleroma_allow_following_move'] =
          Variable<bool?>(pleromaAllowFollowingMove);
    }
    if (!nullToAbsent || pleromaSkipThreadContainment != null) {
      map['pleroma_skip_thread_containment'] =
          Variable<bool?>(pleromaSkipThreadContainment);
    }
    if (!nullToAbsent || pleromaAcceptsChatMessages != null) {
      map['pleroma_accepts_chat_messages'] =
          Variable<bool?>(pleromaAcceptsChatMessages);
    }
    return map;
  }

  DbAccountsCompanion toCompanion(bool nullToAbsent) {
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
      pleromaBackgroundImage: pleromaBackgroundImage == null && nullToAbsent
          ? const Value.absent()
          : Value(pleromaBackgroundImage),
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
      pleromaAcceptsChatMessages:
          pleromaAcceptsChatMessages == null && nullToAbsent
              ? const Value.absent()
              : Value(pleromaAcceptsChatMessages),
    );
  }

  factory DbAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
      pleromaBackgroundImage:
          serializer.fromJson<String>(json['pleromaBackgroundImage']),
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
      pleromaAcceptsChatMessages:
          serializer.fromJson<bool>(json['pleromaAcceptsChatMessages']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'username': serializer.toJson<String?>(username),
      'url': serializer.toJson<String?>(url),
      'note': serializer.toJson<String?>(note),
      'locked': serializer.toJson<bool?>(locked),
      'headerStatic': serializer.toJson<String?>(headerStatic),
      'header': serializer.toJson<String?>(header),
      'followingCount': serializer.toJson<int?>(followingCount),
      'followersCount': serializer.toJson<int?>(followersCount),
      'statusesCount': serializer.toJson<int?>(statusesCount),
      'displayName': serializer.toJson<String?>(displayName),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'bot': serializer.toJson<bool?>(bot),
      'avatarStatic': serializer.toJson<String?>(avatarStatic),
      'avatar': serializer.toJson<String?>(avatar),
      'acct': serializer.toJson<String?>(acct),
      'lastStatusAt': serializer.toJson<DateTime?>(lastStatusAt),
      'fields': serializer.toJson<List<PleromaField>?>(fields),
      'emojis': serializer.toJson<List<PleromaEmoji>?>(emojis),
      'pleromaBackgroundImage':
          serializer.toJson<String?>(pleromaBackgroundImage),
      'pleromaTags': serializer.toJson<List<PleromaTag>?>(pleromaTags),
      'pleromaRelationship':
          serializer.toJson<PleromaAccountRelationship?>(pleromaRelationship),
      'pleromaIsAdmin': serializer.toJson<bool?>(pleromaIsAdmin),
      'pleromaIsModerator': serializer.toJson<bool?>(pleromaIsModerator),
      'pleromaConfirmationPending':
          serializer.toJson<bool?>(pleromaConfirmationPending),
      'pleromaHideFavorites': serializer.toJson<bool?>(pleromaHideFavorites),
      'pleromaHideFollowers': serializer.toJson<bool?>(pleromaHideFollowers),
      'pleromaHideFollows': serializer.toJson<bool?>(pleromaHideFollows),
      'pleromaHideFollowersCount':
          serializer.toJson<bool?>(pleromaHideFollowersCount),
      'pleromaHideFollowsCount':
          serializer.toJson<bool?>(pleromaHideFollowsCount),
      'pleromaDeactivated': serializer.toJson<bool?>(pleromaDeactivated),
      'pleromaAllowFollowingMove':
          serializer.toJson<bool?>(pleromaAllowFollowingMove),
      'pleromaSkipThreadContainment':
          serializer.toJson<bool?>(pleromaSkipThreadContainment),
      'pleromaAcceptsChatMessages':
          serializer.toJson<bool?>(pleromaAcceptsChatMessages),
    };
  }

  DbAccount copyWith(
          {int? id,
          String? remoteId,
          String? username,
          String? url,
          String? note,
          bool? locked,
          String? headerStatic,
          String? header,
          int? followingCount,
          int? followersCount,
          int? statusesCount,
          String? displayName,
          DateTime? createdAt,
          bool? bot,
          String? avatarStatic,
          String? avatar,
          String? acct,
          DateTime? lastStatusAt,
          List<PleromaField>? fields,
          List<PleromaEmoji>? emojis,
          String? pleromaBackgroundImage,
          List<PleromaTag>? pleromaTags,
          PleromaAccountRelationship? pleromaRelationship,
          bool? pleromaIsAdmin,
          bool? pleromaIsModerator,
          bool? pleromaConfirmationPending,
          bool? pleromaHideFavorites,
          bool? pleromaHideFollowers,
          bool? pleromaHideFollows,
          bool? pleromaHideFollowersCount,
          bool? pleromaHideFollowsCount,
          bool? pleromaDeactivated,
          bool? pleromaAllowFollowingMove,
          bool? pleromaSkipThreadContainment,
          bool? pleromaAcceptsChatMessages}) =>
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
        pleromaBackgroundImage:
            pleromaBackgroundImage ?? this.pleromaBackgroundImage,
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
        pleromaAcceptsChatMessages:
            pleromaAcceptsChatMessages ?? this.pleromaAcceptsChatMessages,
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
          ..write('pleromaBackgroundImage: $pleromaBackgroundImage, ')
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
          ..write(
              'pleromaSkipThreadContainment: $pleromaSkipThreadContainment, ')
          ..write('pleromaAcceptsChatMessages: $pleromaAcceptsChatMessages')
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
                                                                              $mrjc(emojis.hashCode, $mrjc(pleromaBackgroundImage.hashCode, $mrjc(pleromaTags.hashCode, $mrjc(pleromaRelationship.hashCode, $mrjc(pleromaIsAdmin.hashCode, $mrjc(pleromaIsModerator.hashCode, $mrjc(pleromaConfirmationPending.hashCode, $mrjc(pleromaHideFavorites.hashCode, $mrjc(pleromaHideFollowers.hashCode, $mrjc(pleromaHideFollows.hashCode, $mrjc(pleromaHideFollowersCount.hashCode, $mrjc(pleromaHideFollowsCount.hashCode, $mrjc(pleromaDeactivated.hashCode, $mrjc(pleromaAllowFollowingMove.hashCode, $mrjc(pleromaSkipThreadContainment.hashCode, pleromaAcceptsChatMessages.hashCode)))))))))))))))))))))))))))))))))));

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
          other.pleromaBackgroundImage == this.pleromaBackgroundImage &&
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
              this.pleromaSkipThreadContainment &&
          other.pleromaAcceptsChatMessages == this.pleromaAcceptsChatMessages);
}

class DbAccountsCompanion extends UpdateCompanion<DbAccount> {
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<String?> username;
  final Value<String?> url;
  final Value<String?> note;
  final Value<bool?> locked;
  final Value<String?> headerStatic;
  final Value<String?> header;
  final Value<int?> followingCount;
  final Value<int?> followersCount;
  final Value<int?> statusesCount;
  final Value<String?> displayName;
  final Value<DateTime?> createdAt;
  final Value<bool?> bot;
  final Value<String?> avatarStatic;
  final Value<String?> avatar;
  final Value<String?> acct;
  final Value<DateTime?> lastStatusAt;
  final Value<List<PleromaField>?> fields;
  final Value<List<PleromaEmoji>?> emojis;
  final Value<String?> pleromaBackgroundImage;
  final Value<List<PleromaTag>?> pleromaTags;
  final Value<PleromaAccountRelationship?> pleromaRelationship;
  final Value<bool?> pleromaIsAdmin;
  final Value<bool?> pleromaIsModerator;
  final Value<bool?> pleromaConfirmationPending;
  final Value<bool?> pleromaHideFavorites;
  final Value<bool?> pleromaHideFollowers;
  final Value<bool?> pleromaHideFollows;
  final Value<bool?> pleromaHideFollowersCount;
  final Value<bool?> pleromaHideFollowsCount;
  final Value<bool?> pleromaDeactivated;
  final Value<bool?> pleromaAllowFollowingMove;
  final Value<bool?> pleromaSkipThreadContainment;
  final Value<bool?> pleromaAcceptsChatMessages;

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
    this.pleromaBackgroundImage = const Value.absent(),
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
    this.pleromaAcceptsChatMessages = const Value.absent(),
  });

  DbAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String username,
    required String url,
    required String note,
    required bool locked,
    required String headerStatic,
    required String header,
    required int followingCount,
    required int followersCount,
    required int statusesCount,
    required String displayName,
    required DateTime createdAt,
    this.bot = const Value.absent(),
    required String avatarStatic,
    required String avatar,
    required String acct,
    this.lastStatusAt = const Value.absent(),
    this.fields = const Value.absent(),
    this.emojis = const Value.absent(),
    this.pleromaBackgroundImage = const Value.absent(),
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
    this.pleromaAcceptsChatMessages = const Value.absent(),
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

  static Insertable<DbAccount> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? username,
    Expression<String>? url,
    Expression<String>? note,
    Expression<bool>? locked,
    Expression<String>? headerStatic,
    Expression<String>? header,
    Expression<int>? followingCount,
    Expression<int>? followersCount,
    Expression<int>? statusesCount,
    Expression<String>? displayName,
    Expression<DateTime>? createdAt,
    Expression<bool>? bot,
    Expression<String>? avatarStatic,
    Expression<String>? avatar,
    Expression<String>? acct,
    Expression<DateTime>? lastStatusAt,
    Expression<String>? fields,
    Expression<String>? emojis,
    Expression<String>? pleromaBackgroundImage,
    Expression<String>? pleromaTags,
    Expression<String>? pleromaRelationship,
    Expression<bool>? pleromaIsAdmin,
    Expression<bool>? pleromaIsModerator,
    Expression<bool>? pleromaConfirmationPending,
    Expression<bool>? pleromaHideFavorites,
    Expression<bool>? pleromaHideFollowers,
    Expression<bool>? pleromaHideFollows,
    Expression<bool>? pleromaHideFollowersCount,
    Expression<bool>? pleromaHideFollowsCount,
    Expression<bool>? pleromaDeactivated,
    Expression<bool>? pleromaAllowFollowingMove,
    Expression<bool>? pleromaSkipThreadContainment,
    Expression<bool>? pleromaAcceptsChatMessages,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (username != null) 'username': username,
      if (url != null) 'url': url,
      if (note != null) 'note': note,
      if (locked != null) 'locked': locked,
      if (headerStatic != null) 'header_static': headerStatic,
      if (header != null) 'header': header,
      if (followingCount != null) 'following_count': followingCount,
      if (followersCount != null) 'followers_count': followersCount,
      if (statusesCount != null) 'statuses_count': statusesCount,
      if (displayName != null) 'display_name': displayName,
      if (createdAt != null) 'created_at': createdAt,
      if (bot != null) 'bot': bot,
      if (avatarStatic != null) 'avatar_static': avatarStatic,
      if (avatar != null) 'avatar': avatar,
      if (acct != null) 'acct': acct,
      if (lastStatusAt != null) 'last_status_at': lastStatusAt,
      if (fields != null) 'fields': fields,
      if (emojis != null) 'emojis': emojis,
      if (pleromaBackgroundImage != null)
        'pleroma_background_image': pleromaBackgroundImage,
      if (pleromaTags != null) 'pleroma_tags': pleromaTags,
      if (pleromaRelationship != null)
        'pleroma_relationship': pleromaRelationship,
      if (pleromaIsAdmin != null) 'pleroma_is_admin': pleromaIsAdmin,
      if (pleromaIsModerator != null)
        'pleroma_is_moderator': pleromaIsModerator,
      if (pleromaConfirmationPending != null)
        'pleroma_confirmation_pending': pleromaConfirmationPending,
      if (pleromaHideFavorites != null)
        'pleroma_hide_favorites': pleromaHideFavorites,
      if (pleromaHideFollowers != null)
        'pleroma_hide_followers': pleromaHideFollowers,
      if (pleromaHideFollows != null)
        'pleroma_hide_follows': pleromaHideFollows,
      if (pleromaHideFollowersCount != null)
        'pleroma_hide_followers_count': pleromaHideFollowersCount,
      if (pleromaHideFollowsCount != null)
        'pleroma_hide_follows_count': pleromaHideFollowsCount,
      if (pleromaDeactivated != null) 'pleroma_deactivated': pleromaDeactivated,
      if (pleromaAllowFollowingMove != null)
        'pleroma_allow_following_move': pleromaAllowFollowingMove,
      if (pleromaSkipThreadContainment != null)
        'pleroma_skip_thread_containment': pleromaSkipThreadContainment,
      if (pleromaAcceptsChatMessages != null)
        'pleroma_accepts_chat_messages': pleromaAcceptsChatMessages,
    });
  }

  DbAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? username,
      Value<String>? url,
      Value<String>? note,
      Value<bool>? locked,
      Value<String>? headerStatic,
      Value<String>? header,
      Value<int>? followingCount,
      Value<int>? followersCount,
      Value<int>? statusesCount,
      Value<String>? displayName,
      Value<DateTime>? createdAt,
      Value<bool>? bot,
      Value<String>? avatarStatic,
      Value<String>? avatar,
      Value<String>? acct,
      Value<DateTime>? lastStatusAt,
      Value<List<PleromaField>>? fields,
      Value<List<PleromaEmoji>>? emojis,
      Value<String>? pleromaBackgroundImage,
      Value<List<PleromaTag>>? pleromaTags,
      Value<PleromaAccountRelationship>? pleromaRelationship,
      Value<bool>? pleromaIsAdmin,
      Value<bool>? pleromaIsModerator,
      Value<bool>? pleromaConfirmationPending,
      Value<bool>? pleromaHideFavorites,
      Value<bool>? pleromaHideFollowers,
      Value<bool>? pleromaHideFollows,
      Value<bool>? pleromaHideFollowersCount,
      Value<bool>? pleromaHideFollowsCount,
      Value<bool>? pleromaDeactivated,
      Value<bool>? pleromaAllowFollowingMove,
      Value<bool>? pleromaSkipThreadContainment,
      Value<bool>? pleromaAcceptsChatMessages}) {
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
      pleromaBackgroundImage:
          pleromaBackgroundImage ?? this.pleromaBackgroundImage,
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
      pleromaAcceptsChatMessages:
          pleromaAcceptsChatMessages ?? this.pleromaAcceptsChatMessages,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (username.present) {
      map['username'] = Variable<String?>(username.value);
    }
    if (url.present) {
      map['url'] = Variable<String?>(url.value);
    }
    if (note.present) {
      map['note'] = Variable<String?>(note.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool?>(locked.value);
    }
    if (headerStatic.present) {
      map['header_static'] = Variable<String?>(headerStatic.value);
    }
    if (header.present) {
      map['header'] = Variable<String?>(header.value);
    }
    if (followingCount.present) {
      map['following_count'] = Variable<int?>(followingCount.value);
    }
    if (followersCount.present) {
      map['followers_count'] = Variable<int?>(followersCount.value);
    }
    if (statusesCount.present) {
      map['statuses_count'] = Variable<int?>(statusesCount.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String?>(displayName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (bot.present) {
      map['bot'] = Variable<bool?>(bot.value);
    }
    if (avatarStatic.present) {
      map['avatar_static'] = Variable<String?>(avatarStatic.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String?>(avatar.value);
    }
    if (acct.present) {
      map['acct'] = Variable<String?>(acct.value);
    }
    if (lastStatusAt.present) {
      map['last_status_at'] = Variable<DateTime?>(lastStatusAt.value);
    }
    if (fields.present) {
      final converter = $DbAccountsTable.$converter0;
      map['fields'] = Variable<String?>(converter.mapToSql(fields.value));
    }
    if (emojis.present) {
      final converter = $DbAccountsTable.$converter1;
      map['emojis'] = Variable<String?>(converter.mapToSql(emojis.value));
    }
    if (pleromaBackgroundImage.present) {
      map['pleroma_background_image'] =
          Variable<String?>(pleromaBackgroundImage.value);
    }
    if (pleromaTags.present) {
      final converter = $DbAccountsTable.$converter2;
      map['pleroma_tags'] =
          Variable<String?>(converter.mapToSql(pleromaTags.value));
    }
    if (pleromaRelationship.present) {
      final converter = $DbAccountsTable.$converter3;
      map['pleroma_relationship'] =
          Variable<String?>(converter.mapToSql(pleromaRelationship.value));
    }
    if (pleromaIsAdmin.present) {
      map['pleroma_is_admin'] = Variable<bool?>(pleromaIsAdmin.value);
    }
    if (pleromaIsModerator.present) {
      map['pleroma_is_moderator'] = Variable<bool?>(pleromaIsModerator.value);
    }
    if (pleromaConfirmationPending.present) {
      map['pleroma_confirmation_pending'] =
          Variable<bool?>(pleromaConfirmationPending.value);
    }
    if (pleromaHideFavorites.present) {
      map['pleroma_hide_favorites'] =
          Variable<bool?>(pleromaHideFavorites.value);
    }
    if (pleromaHideFollowers.present) {
      map['pleroma_hide_followers'] =
          Variable<bool?>(pleromaHideFollowers.value);
    }
    if (pleromaHideFollows.present) {
      map['pleroma_hide_follows'] = Variable<bool?>(pleromaHideFollows.value);
    }
    if (pleromaHideFollowersCount.present) {
      map['pleroma_hide_followers_count'] =
          Variable<bool?>(pleromaHideFollowersCount.value);
    }
    if (pleromaHideFollowsCount.present) {
      map['pleroma_hide_follows_count'] =
          Variable<bool?>(pleromaHideFollowsCount.value);
    }
    if (pleromaDeactivated.present) {
      map['pleroma_deactivated'] = Variable<bool?>(pleromaDeactivated.value);
    }
    if (pleromaAllowFollowingMove.present) {
      map['pleroma_allow_following_move'] =
          Variable<bool?>(pleromaAllowFollowingMove.value);
    }
    if (pleromaSkipThreadContainment.present) {
      map['pleroma_skip_thread_containment'] =
          Variable<bool?>(pleromaSkipThreadContainment.value);
    }
    if (pleromaAcceptsChatMessages.present) {
      map['pleroma_accepts_chat_messages'] =
          Variable<bool?>(pleromaAcceptsChatMessages.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAccountsCompanion(')
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
          ..write('pleromaBackgroundImage: $pleromaBackgroundImage, ')
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
          ..write(
              'pleromaSkipThreadContainment: $pleromaSkipThreadContainment, ')
          ..write('pleromaAcceptsChatMessages: $pleromaAcceptsChatMessages')
          ..write(')'))
        .toString();
  }
}

class $DbAccountsTable extends DbAccounts
    with TableInfo<$DbAccountsTable, DbAccount> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbAccountsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn? _username;

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
  GeneratedTextColumn? _url;

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
  GeneratedTextColumn? _note;

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
  GeneratedBoolColumn? _locked;

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
  GeneratedTextColumn? _headerStatic;

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
  GeneratedTextColumn? _header;

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
  GeneratedIntColumn? _followingCount;

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
  GeneratedIntColumn? _followersCount;

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
  GeneratedIntColumn? _statusesCount;

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
  GeneratedTextColumn? _displayName;

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
  GeneratedDateTimeColumn? _createdAt;

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
  GeneratedBoolColumn? _bot;

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
  GeneratedTextColumn? _avatarStatic;

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
  GeneratedTextColumn? _avatar;

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
  GeneratedTextColumn? _acct;

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
  GeneratedDateTimeColumn? _lastStatusAt;

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
  GeneratedTextColumn? _fields;

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
  GeneratedTextColumn? _emojis;

  @override
  GeneratedTextColumn get emojis => _emojis ??= _constructEmojis();

  GeneratedTextColumn _constructEmojis() {
    return GeneratedTextColumn(
      'emojis',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaBackgroundImageMeta =
      const VerificationMeta('pleromaBackgroundImage');
  GeneratedTextColumn? _pleromaBackgroundImage;

  @override
  GeneratedTextColumn get pleromaBackgroundImage =>
      _pleromaBackgroundImage ??= _constructPleromaBackgroundImage();

  GeneratedTextColumn _constructPleromaBackgroundImage() {
    return GeneratedTextColumn(
      'pleroma_background_image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaTagsMeta =
      const VerificationMeta('pleromaTags');
  GeneratedTextColumn? _pleromaTags;

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
  GeneratedTextColumn? _pleromaRelationship;

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
  GeneratedBoolColumn? _pleromaIsAdmin;

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
  GeneratedBoolColumn? _pleromaIsModerator;

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
  GeneratedBoolColumn? _pleromaConfirmationPending;

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
  GeneratedBoolColumn? _pleromaHideFavorites;

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
  GeneratedBoolColumn? _pleromaHideFollowers;

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
  GeneratedBoolColumn? _pleromaHideFollows;

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
  GeneratedBoolColumn? _pleromaHideFollowersCount;

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
  GeneratedBoolColumn? _pleromaHideFollowsCount;

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
  GeneratedBoolColumn? _pleromaDeactivated;

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
  GeneratedBoolColumn? _pleromaAllowFollowingMove;

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
  GeneratedBoolColumn? _pleromaSkipThreadContainment;

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

  final VerificationMeta _pleromaAcceptsChatMessagesMeta =
      const VerificationMeta('pleromaAcceptsChatMessages');
  GeneratedBoolColumn? _pleromaAcceptsChatMessages;

  @override
  GeneratedBoolColumn get pleromaAcceptsChatMessages =>
      _pleromaAcceptsChatMessages ??= _constructPleromaAcceptsChatMessages();

  GeneratedBoolColumn _constructPleromaAcceptsChatMessages() {
    return GeneratedBoolColumn(
      'pleroma_accepts_chat_messages',
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
        pleromaBackgroundImage,
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
        pleromaSkipThreadContainment,
        pleromaAcceptsChatMessages
      ];

  @override
  $DbAccountsTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_accounts';
  @override
  final String actualTableName = 'db_accounts';

  @override
  VerificationContext validateIntegrity(Insertable<DbAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('locked')) {
      context.handle(_lockedMeta,
          locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta));
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('header_static')) {
      context.handle(
          _headerStaticMeta,
          headerStatic.isAcceptableOrUnknown(
              data['header_static']!, _headerStaticMeta));
    } else if (isInserting) {
      context.missing(_headerStaticMeta);
    }
    if (data.containsKey('header')) {
      context.handle(_headerMeta,
          header.isAcceptableOrUnknown(data['header']!, _headerMeta));
    } else if (isInserting) {
      context.missing(_headerMeta);
    }
    if (data.containsKey('following_count')) {
      context.handle(
          _followingCountMeta,
          followingCount.isAcceptableOrUnknown(
              data['following_count']!, _followingCountMeta));
    } else if (isInserting) {
      context.missing(_followingCountMeta);
    }
    if (data.containsKey('followers_count')) {
      context.handle(
          _followersCountMeta,
          followersCount.isAcceptableOrUnknown(
              data['followers_count']!, _followersCountMeta));
    } else if (isInserting) {
      context.missing(_followersCountMeta);
    }
    if (data.containsKey('statuses_count')) {
      context.handle(
          _statusesCountMeta,
          statusesCount.isAcceptableOrUnknown(
              data['statuses_count']!, _statusesCountMeta));
    } else if (isInserting) {
      context.missing(_statusesCountMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('bot')) {
      context.handle(
          _botMeta, bot.isAcceptableOrUnknown(data['bot']!, _botMeta));
    }
    if (data.containsKey('avatar_static')) {
      context.handle(
          _avatarStaticMeta,
          avatarStatic.isAcceptableOrUnknown(
              data['avatar_static']!, _avatarStaticMeta));
    } else if (isInserting) {
      context.missing(_avatarStaticMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('acct')) {
      context.handle(
          _acctMeta, acct.isAcceptableOrUnknown(data['acct']!, _acctMeta));
    } else if (isInserting) {
      context.missing(_acctMeta);
    }
    if (data.containsKey('last_status_at')) {
      context.handle(
          _lastStatusAtMeta,
          lastStatusAt.isAcceptableOrUnknown(
              data['last_status_at']!, _lastStatusAtMeta));
    }
    context.handle(_fieldsMeta, const VerificationResult.success());
    context.handle(_emojisMeta, const VerificationResult.success());
    if (data.containsKey('pleroma_background_image')) {
      context.handle(
          _pleromaBackgroundImageMeta,
          pleromaBackgroundImage.isAcceptableOrUnknown(
              data['pleroma_background_image']!, _pleromaBackgroundImageMeta));
    }
    context.handle(_pleromaTagsMeta, const VerificationResult.success());
    context.handle(
        _pleromaRelationshipMeta, const VerificationResult.success());
    if (data.containsKey('pleroma_is_admin')) {
      context.handle(
          _pleromaIsAdminMeta,
          pleromaIsAdmin.isAcceptableOrUnknown(
              data['pleroma_is_admin']!, _pleromaIsAdminMeta));
    }
    if (data.containsKey('pleroma_is_moderator')) {
      context.handle(
          _pleromaIsModeratorMeta,
          pleromaIsModerator.isAcceptableOrUnknown(
              data['pleroma_is_moderator']!, _pleromaIsModeratorMeta));
    }
    if (data.containsKey('pleroma_confirmation_pending')) {
      context.handle(
          _pleromaConfirmationPendingMeta,
          pleromaConfirmationPending.isAcceptableOrUnknown(
              data['pleroma_confirmation_pending']!,
              _pleromaConfirmationPendingMeta));
    }
    if (data.containsKey('pleroma_hide_favorites')) {
      context.handle(
          _pleromaHideFavoritesMeta,
          pleromaHideFavorites.isAcceptableOrUnknown(
              data['pleroma_hide_favorites']!, _pleromaHideFavoritesMeta));
    }
    if (data.containsKey('pleroma_hide_followers')) {
      context.handle(
          _pleromaHideFollowersMeta,
          pleromaHideFollowers.isAcceptableOrUnknown(
              data['pleroma_hide_followers']!, _pleromaHideFollowersMeta));
    }
    if (data.containsKey('pleroma_hide_follows')) {
      context.handle(
          _pleromaHideFollowsMeta,
          pleromaHideFollows.isAcceptableOrUnknown(
              data['pleroma_hide_follows']!, _pleromaHideFollowsMeta));
    }
    if (data.containsKey('pleroma_hide_followers_count')) {
      context.handle(
          _pleromaHideFollowersCountMeta,
          pleromaHideFollowersCount.isAcceptableOrUnknown(
              data['pleroma_hide_followers_count']!,
              _pleromaHideFollowersCountMeta));
    }
    if (data.containsKey('pleroma_hide_follows_count')) {
      context.handle(
          _pleromaHideFollowsCountMeta,
          pleromaHideFollowsCount.isAcceptableOrUnknown(
              data['pleroma_hide_follows_count']!,
              _pleromaHideFollowsCountMeta));
    }
    if (data.containsKey('pleroma_deactivated')) {
      context.handle(
          _pleromaDeactivatedMeta,
          pleromaDeactivated.isAcceptableOrUnknown(
              data['pleroma_deactivated']!, _pleromaDeactivatedMeta));
    }
    if (data.containsKey('pleroma_allow_following_move')) {
      context.handle(
          _pleromaAllowFollowingMoveMeta,
          pleromaAllowFollowingMove.isAcceptableOrUnknown(
              data['pleroma_allow_following_move']!,
              _pleromaAllowFollowingMoveMeta));
    }
    if (data.containsKey('pleroma_skip_thread_containment')) {
      context.handle(
          _pleromaSkipThreadContainmentMeta,
          pleromaSkipThreadContainment.isAcceptableOrUnknown(
              data['pleroma_skip_thread_containment']!,
              _pleromaSkipThreadContainmentMeta));
    }
    if (data.containsKey('pleroma_accepts_chat_messages')) {
      context.handle(
          _pleromaAcceptsChatMessagesMeta,
          pleromaAcceptsChatMessages.isAcceptableOrUnknown(
              data['pleroma_accepts_chat_messages']!,
              _pleromaAcceptsChatMessagesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbAccount.fromData(data, _db, prefix: effectivePrefix);
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
  final int? id;
  final String remoteId;
  final bool? unread;
  final DateTime? updatedAt;

  DbConversation(
      {required this.id,
      required this.remoteId,
      required this.unread,
      this.updatedAt});

  factory DbConversation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DbConversation(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      unread:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}unread']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || unread != null) {
      map['unread'] = Variable<bool?>(unread);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    return map;
  }

  DbConversationsCompanion toCompanion(bool nullToAbsent) {
    return DbConversationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      unread:
          unread == null && nullToAbsent ? const Value.absent() : Value(unread),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbConversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversation(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      unread: serializer.fromJson<bool>(json['unread']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'unread': serializer.toJson<bool?>(unread),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  DbConversation copyWith(
          {int? id, String? remoteId, bool? unread, DateTime? updatedAt}) =>
      DbConversation(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        unread: unread ?? this.unread,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  String toString() {
    return (StringBuffer('DbConversation(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('unread: $unread, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(remoteId.hashCode, $mrjc(unread.hashCode, updatedAt.hashCode))));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbConversation &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.unread == this.unread &&
          other.updatedAt == this.updatedAt);
}

class DbConversationsCompanion extends UpdateCompanion<DbConversation> {
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<bool?> unread;
  final Value<DateTime?> updatedAt;

  const DbConversationsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.unread = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  DbConversationsCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required bool unread,
    this.updatedAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        unread = Value(unread);

  static Insertable<DbConversation> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<bool>? unread,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (unread != null) 'unread': unread,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbConversationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<bool>? unread,
      Value<DateTime>? updatedAt}) {
    return DbConversationsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      unread: unread ?? this.unread,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (unread.present) {
      map['unread'] = Variable<bool?>(unread.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime?>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConversationsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('unread: $unread, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbConversationsTable extends DbConversations
    with TableInfo<$DbConversationsTable, DbConversation> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbConversationsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedBoolColumn? _unread;

  @override
  GeneratedBoolColumn get unread => _unread ??= _constructUnread();

  GeneratedBoolColumn _constructUnread() {
    return GeneratedBoolColumn(
      'unread',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn? _updatedAt;

  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();

  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, remoteId, unread, updatedAt];

  @override
  $DbConversationsTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_conversations';
  @override
  final String actualTableName = 'db_conversations';

  @override
  VerificationContext validateIntegrity(Insertable<DbConversation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('unread')) {
      context.handle(_unreadMeta,
          unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta));
    } else if (isInserting) {
      context.missing(_unreadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbConversation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbConversation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbConversationsTable createAlias(String alias) {
    return $DbConversationsTable(_db, alias);
  }
}

class DbNotification extends DataClass implements Insertable<DbNotification> {
  final int? id;
  final String remoteId;
  final String? accountRemoteId;
  final String? statusRemoteId;
  final String? chatRemoteId;
  final String? chatMessageRemoteId;
  final String? emoji;
  final PleromaNotificationPleromaPart? pleroma;
  final PleromaAccountReport? report;
  final PleromaChatMessage? chatMessage;
  final PleromaAccount? target;
  final bool? unread;
  final String type;
  final DateTime createdAt;
  final bool? dismissed;

  DbNotification({
    required this.id,
    required this.remoteId,
    required this.accountRemoteId,
    required this.statusRemoteId,
    required this.chatRemoteId,
    required this.chatMessageRemoteId,
    required this.emoji,
    required this.pleroma,
    required this.report,
    required this.chatMessage,
    required this.target,
    required this.unread,
    required this.type,
    required this.createdAt,
    required this.dismissed,
  });

  factory DbNotification.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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
      report: $DbNotificationsTable.$converter1.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}report'])),
      chatMessage: $DbNotificationsTable.$converter2.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_message'])),
      target: $DbNotificationsTable.$converter3.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}target'])),
      unread:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}unread']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      dismissed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}dismissed']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    if (!nullToAbsent || chatRemoteId != null) {
      map['chat_remote_id'] = Variable<String?>(chatRemoteId);
    }
    if (!nullToAbsent || chatMessageRemoteId != null) {
      map['chat_message_remote_id'] = Variable<String?>(chatMessageRemoteId);
    }
    if (!nullToAbsent || emoji != null) {
      map['emoji'] = Variable<String?>(emoji);
    }
    if (!nullToAbsent || pleroma != null) {
      final converter = $DbNotificationsTable.$converter0;
      map['pleroma'] = Variable<String?>(converter.mapToSql(pleroma));
    }
    if (!nullToAbsent || report != null) {
      final converter = $DbNotificationsTable.$converter1;
      map['report'] = Variable<String?>(converter.mapToSql(report));
    }
    if (!nullToAbsent || chatMessage != null) {
      final converter = $DbNotificationsTable.$converter2;
      map['chat_message'] = Variable<String?>(converter.mapToSql(chatMessage));
    }
    if (!nullToAbsent || target != null) {
      final converter = $DbNotificationsTable.$converter3;
      map['target'] = Variable<String?>(converter.mapToSql(target));
    }
    if (!nullToAbsent || unread != null) {
      map['unread'] = Variable<bool?>(unread);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String?>(type);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || dismissed != null) {
      map['dismissed'] = Variable<bool?>(dismissed);
    }
    return map;
  }

  DbNotificationsCompanion toCompanion(bool nullToAbsent) {
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
      report:
          report == null && nullToAbsent ? const Value.absent() : Value(report),
      chatMessage: chatMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(chatMessage),
      target:
          target == null && nullToAbsent ? const Value.absent() : Value(target),
      unread:
          unread == null && nullToAbsent ? const Value.absent() : Value(unread),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      dismissed: dismissed == null && nullToAbsent
          ? const Value.absent()
          : Value(dismissed),
    );
  }

  factory DbNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
      report: serializer.fromJson<PleromaAccountReport>(json['report']),
      chatMessage: serializer.fromJson<PleromaChatMessage>(json['chatMessage']),
      target: serializer.fromJson<PleromaAccount>(json['target']),
      unread: serializer.fromJson<bool>(json['unread']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      dismissed: serializer.fromJson<bool>(json['dismissed']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
      'chatRemoteId': serializer.toJson<String?>(chatRemoteId),
      'chatMessageRemoteId': serializer.toJson<String?>(chatMessageRemoteId),
      'emoji': serializer.toJson<String?>(emoji),
      'pleroma': serializer.toJson<PleromaNotificationPleromaPart?>(pleroma),
      'report': serializer.toJson<PleromaAccountReport?>(report),
      'chatMessage': serializer.toJson<PleromaChatMessage?>(chatMessage),
      'target': serializer.toJson<PleromaAccount?>(target),
      'unread': serializer.toJson<bool?>(unread),
      'type': serializer.toJson<String?>(type),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'dismissed': serializer.toJson<bool?>(dismissed),
    };
  }

  DbNotification copyWith(
          {int? id,
          String? remoteId,
          String? accountRemoteId,
          String? statusRemoteId,
          String? chatRemoteId,
          String? chatMessageRemoteId,
          String? emoji,
          PleromaNotificationPleromaPart? pleroma,
          PleromaAccountReport? report,
          PleromaChatMessage? chatMessage,
          PleromaAccount? target,
          bool? unread,
          String? type,
          DateTime? createdAt,
          bool? dismissed}) =>
      DbNotification(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        statusRemoteId: statusRemoteId ?? this.statusRemoteId,
        chatRemoteId: chatRemoteId ?? this.chatRemoteId,
        chatMessageRemoteId: chatMessageRemoteId ?? this.chatMessageRemoteId,
        emoji: emoji ?? this.emoji,
        pleroma: pleroma ?? this.pleroma,
        report: report ?? this.report,
        chatMessage: chatMessage ?? this.chatMessage,
        target: target ?? this.target,
        unread: unread ?? this.unread,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        dismissed: dismissed ?? this.dismissed,
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
          ..write('report: $report, ')
          ..write('chatMessage: $chatMessage, ')
          ..write('target: $target, ')
          ..write('unread: $unread, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('dismissed: $dismissed')
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
                                      report.hashCode,
                                      $mrjc(
                                          chatMessage.hashCode,
                                          $mrjc(
                                              target.hashCode,
                                              $mrjc(
                                                  unread.hashCode,
                                                  $mrjc(
                                                      type.hashCode,
                                                      $mrjc(
                                                          createdAt.hashCode,
                                                          dismissed
                                                              .hashCode)))))))))))))));

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
          other.report == this.report &&
          other.chatMessage == this.chatMessage &&
          other.target == this.target &&
          other.unread == this.unread &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.dismissed == this.dismissed);
}

class DbNotificationsCompanion extends UpdateCompanion<DbNotification> {
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<String?> accountRemoteId;
  final Value<String?> statusRemoteId;
  final Value<String?> chatRemoteId;
  final Value<String?> chatMessageRemoteId;
  final Value<String?> emoji;
  final Value<PleromaNotificationPleromaPart?> pleroma;
  final Value<PleromaAccountReport?> report;
  final Value<PleromaChatMessage?> chatMessage;
  final Value<PleromaAccount?> target;
  final Value<bool?> unread;
  final Value<String?> type;
  final Value<DateTime?> createdAt;
  final Value<bool?> dismissed;

  const DbNotificationsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.chatMessageRemoteId = const Value.absent(),
    this.emoji = const Value.absent(),
    this.pleroma = const Value.absent(),
    this.report = const Value.absent(),
    this.chatMessage = const Value.absent(),
    this.target = const Value.absent(),
    this.unread = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.dismissed = const Value.absent(),
  });

  DbNotificationsCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String accountRemoteId,
    this.statusRemoteId = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.chatMessageRemoteId = const Value.absent(),
    this.emoji = const Value.absent(),
    this.pleroma = const Value.absent(),
    this.report = const Value.absent(),
    this.chatMessage = const Value.absent(),
    this.target = const Value.absent(),
    this.unread = const Value.absent(),
    this.type = const Value.absent(),
    required DateTime createdAt,
    this.dismissed = const Value.absent(),
  })  : remoteId = Value(remoteId),
        accountRemoteId = Value(accountRemoteId),
        createdAt = Value(createdAt);

  static Insertable<DbNotification> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? accountRemoteId,
    Expression<String>? statusRemoteId,
    Expression<String>? chatRemoteId,
    Expression<String>? chatMessageRemoteId,
    Expression<String>? emoji,
    Expression<String>? pleroma,
    Expression<String>? report,
    Expression<String>? chatMessage,
    Expression<String>? target,
    Expression<bool>? unread,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<bool>? dismissed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
      if (chatRemoteId != null) 'chat_remote_id': chatRemoteId,
      if (chatMessageRemoteId != null)
        'chat_message_remote_id': chatMessageRemoteId,
      if (emoji != null) 'emoji': emoji,
      if (pleroma != null) 'pleroma': pleroma,
      if (report != null) 'report': report,
      if (chatMessage != null) 'chat_message': chatMessage,
      if (target != null) 'target': target,
      if (unread != null) 'unread': unread,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (dismissed != null) 'dismissed': dismissed,
    });
  }

  DbNotificationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? accountRemoteId,
      Value<String>? statusRemoteId,
      Value<String>? chatRemoteId,
      Value<String>? chatMessageRemoteId,
      Value<String>? emoji,
      Value<PleromaNotificationPleromaPart>? pleroma,
      Value<PleromaAccountReport>? report,
      Value<PleromaChatMessage>? chatMessage,
      Value<PleromaAccount>? target,
      Value<bool>? unread,
      Value<String>? type,
      Value<DateTime>? createdAt,
      Value<bool>? dismissed}) {
    return DbNotificationsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      chatRemoteId: chatRemoteId ?? this.chatRemoteId,
      chatMessageRemoteId: chatMessageRemoteId ?? this.chatMessageRemoteId,
      emoji: emoji ?? this.emoji,
      pleroma: pleroma ?? this.pleroma,
      report: report ?? this.report,
      chatMessage: chatMessage ?? this.chatMessage,
      target: target ?? this.target,
      unread: unread ?? this.unread,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      dismissed: dismissed ?? this.dismissed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    if (chatRemoteId.present) {
      map['chat_remote_id'] = Variable<String?>(chatRemoteId.value);
    }
    if (chatMessageRemoteId.present) {
      map['chat_message_remote_id'] =
          Variable<String?>(chatMessageRemoteId.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String?>(emoji.value);
    }
    if (pleroma.present) {
      final converter = $DbNotificationsTable.$converter0;
      map['pleroma'] = Variable<String?>(converter.mapToSql(pleroma.value));
    }
    if (report.present) {
      final converter = $DbNotificationsTable.$converter1;
      map['report'] = Variable<String?>(converter.mapToSql(report.value));
    }
    if (chatMessage.present) {
      final converter = $DbNotificationsTable.$converter2;
      map['chat_message'] =
          Variable<String?>(converter.mapToSql(chatMessage.value));
    }
    if (target.present) {
      final converter = $DbNotificationsTable.$converter3;
      map['target'] = Variable<String?>(converter.mapToSql(target.value));
    }
    if (unread.present) {
      map['unread'] = Variable<bool?>(unread.value);
    }
    if (type.present) {
      map['type'] = Variable<String?>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (dismissed.present) {
      map['dismissed'] = Variable<bool?>(dismissed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbNotificationsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('chatRemoteId: $chatRemoteId, ')
          ..write('chatMessageRemoteId: $chatMessageRemoteId, ')
          ..write('emoji: $emoji, ')
          ..write('pleroma: $pleroma, ')
          ..write('report: $report, ')
          ..write('chatMessage: $chatMessage, ')
          ..write('target: $target, ')
          ..write('unread: $unread, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('dismissed: $dismissed')
          ..write(')'))
        .toString();
  }
}

class $DbNotificationsTable extends DbNotifications
    with TableInfo<$DbNotificationsTable, DbNotification> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbNotificationsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  GeneratedTextColumn? _accountRemoteId;

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
  GeneratedTextColumn? _statusRemoteId;

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
  GeneratedTextColumn? _chatRemoteId;

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
  GeneratedTextColumn? _chatMessageRemoteId;

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
  GeneratedTextColumn? _emoji;

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
  GeneratedTextColumn? _pleroma;

  @override
  GeneratedTextColumn get pleroma => _pleroma ??= _constructPleroma();

  GeneratedTextColumn _constructPleroma() {
    return GeneratedTextColumn(
      'pleroma',
      $tableName,
      true,
    );
  }

  final VerificationMeta _reportMeta = const VerificationMeta('report');
  GeneratedTextColumn? _report;

  @override
  GeneratedTextColumn get report => _report ??= _constructReport();

  GeneratedTextColumn _constructReport() {
    return GeneratedTextColumn(
      'report',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chatMessageMeta =
      const VerificationMeta('chatMessage');
  GeneratedTextColumn? _chatMessage;

  @override
  GeneratedTextColumn get chatMessage =>
      _chatMessage ??= _constructChatMessage();

  GeneratedTextColumn _constructChatMessage() {
    return GeneratedTextColumn(
      'chat_message',
      $tableName,
      true,
    );
  }

  final VerificationMeta _targetMeta = const VerificationMeta('target');
  GeneratedTextColumn? _target;

  @override
  GeneratedTextColumn get target => _target ??= _constructTarget();

  GeneratedTextColumn _constructTarget() {
    return GeneratedTextColumn(
      'target',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedBoolColumn? _unread;

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
  GeneratedTextColumn? _type;

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
  GeneratedDateTimeColumn? _createdAt;

  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();

  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dismissedMeta = const VerificationMeta('dismissed');
  GeneratedBoolColumn? _dismissed;

  @override
  GeneratedBoolColumn get dismissed => _dismissed ??= _constructDismissed();

  GeneratedBoolColumn _constructDismissed() {
    return GeneratedBoolColumn(
      'dismissed',
      $tableName,
      true,
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
        report,
        chatMessage,
        target,
        unread,
        type,
        createdAt,
        dismissed
      ];

  @override
  $DbNotificationsTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_notifications';
  @override
  final String actualTableName = 'db_notifications';

  @override
  VerificationContext validateIntegrity(Insertable<DbNotification> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    }
    if (data.containsKey('chat_remote_id')) {
      context.handle(
          _chatRemoteIdMeta,
          chatRemoteId.isAcceptableOrUnknown(
              data['chat_remote_id']!, _chatRemoteIdMeta));
    }
    if (data.containsKey('chat_message_remote_id')) {
      context.handle(
          _chatMessageRemoteIdMeta,
          chatMessageRemoteId.isAcceptableOrUnknown(
              data['chat_message_remote_id']!, _chatMessageRemoteIdMeta));
    }
    if (data.containsKey('emoji')) {
      context.handle(
          _emojiMeta, emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta));
    }
    context.handle(_pleromaMeta, const VerificationResult.success());
    context.handle(_reportMeta, const VerificationResult.success());
    context.handle(_chatMessageMeta, const VerificationResult.success());
    context.handle(_targetMeta, const VerificationResult.success());
    if (data.containsKey('unread')) {
      context.handle(_unreadMeta,
          unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('dismissed')) {
      context.handle(_dismissedMeta,
          dismissed.isAcceptableOrUnknown(data['dismissed']!, _dismissedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbNotification.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbNotificationsTable createAlias(String alias) {
    return $DbNotificationsTable(_db, alias);
  }

  static TypeConverter<PleromaNotificationPleromaPart, String> $converter0 =
      PleromaNotificationPleromaPartDatabaseConverter();
  static TypeConverter<PleromaAccountReport, String> $converter1 =
      PleromaAccountReportDatabaseConverter();
  static TypeConverter<PleromaChatMessage, String> $converter2 =
      PleromaChatMessageDatabaseConverter();
  static TypeConverter<PleromaAccount, String> $converter3 =
      PleromaAccountDatabaseConverter();
}

class DbConversationStatus extends DataClass
    implements Insertable<DbConversationStatus> {
  final int? id;
  final String? conversationRemoteId;
  final String? statusRemoteId;

  DbConversationStatus(
      {required this.id,
      required this.conversationRemoteId,
      required this.statusRemoteId});

  factory DbConversationStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || conversationRemoteId != null) {
      map['conversation_remote_id'] = Variable<String?>(conversationRemoteId);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    return map;
  }

  DbConversationStatusesCompanion toCompanion(bool nullToAbsent) {
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

  factory DbConversationStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversationStatus(
      id: serializer.fromJson<int>(json['id']),
      conversationRemoteId:
          serializer.fromJson<String>(json['conversationRemoteId']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'conversationRemoteId': serializer.toJson<String?>(conversationRemoteId),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
    };
  }

  DbConversationStatus copyWith(
          {int? id, String? conversationRemoteId, String? statusRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> conversationRemoteId;
  final Value<String?> statusRemoteId;

  const DbConversationStatusesCompanion({
    this.id = const Value.absent(),
    this.conversationRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
  });

  DbConversationStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String conversationRemoteId,
    required String statusRemoteId,
  })   : conversationRemoteId = Value(conversationRemoteId),
        statusRemoteId = Value(statusRemoteId);

  static Insertable<DbConversationStatus> custom({
    Expression<int>? id,
    Expression<String>? conversationRemoteId,
    Expression<String>? statusRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (conversationRemoteId != null)
        'conversation_remote_id': conversationRemoteId,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
    });
  }

  DbConversationStatusesCompanion copyWith(
      {Value<int>? id,
      Value<String>? conversationRemoteId,
      Value<String>? statusRemoteId}) {
    return DbConversationStatusesCompanion(
      id: id ?? this.id,
      conversationRemoteId: conversationRemoteId ?? this.conversationRemoteId,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (conversationRemoteId.present) {
      map['conversation_remote_id'] =
          Variable<String?>(conversationRemoteId.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConversationStatusesCompanion(')
          ..write('id: $id, ')
          ..write('conversationRemoteId: $conversationRemoteId, ')
          ..write('statusRemoteId: $statusRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbConversationStatusesTable extends DbConversationStatuses
    with TableInfo<$DbConversationStatusesTable, DbConversationStatus> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbConversationStatusesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _conversationRemoteIdMeta =
      const VerificationMeta('conversationRemoteId');
  GeneratedTextColumn? _conversationRemoteId;

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
  GeneratedTextColumn? _statusRemoteId;

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
  VerificationContext validateIntegrity(
      Insertable<DbConversationStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('conversation_remote_id')) {
      context.handle(
          _conversationRemoteIdMeta,
          conversationRemoteId.isAcceptableOrUnknown(
              data['conversation_remote_id']!, _conversationRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_conversationRemoteIdMeta);
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbConversationStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbConversationStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbConversationStatusesTable createAlias(String alias) {
    return $DbConversationStatusesTable(_db, alias);
  }
}

class DbStatusHashtag extends DataClass implements Insertable<DbStatusHashtag> {
  final int? id;
  final String? statusRemoteId;
  final String? hashtag;

  DbStatusHashtag(
      {required this.id, required this.statusRemoteId, required this.hashtag});

  factory DbStatusHashtag.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    if (!nullToAbsent || hashtag != null) {
      map['hashtag'] = Variable<String?>(hashtag);
    }
    return map;
  }

  DbStatusHashtagsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbStatusHashtag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusHashtag(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      hashtag: serializer.fromJson<String>(json['hashtag']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
      'hashtag': serializer.toJson<String?>(hashtag),
    };
  }

  DbStatusHashtag copyWith(
          {int? id, String? statusRemoteId, String? hashtag}) =>
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
  final Value<int?> id;
  final Value<String?> statusRemoteId;
  final Value<String?> hashtag;

  const DbStatusHashtagsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.hashtag = const Value.absent(),
  });

  DbStatusHashtagsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String hashtag,
  })   : statusRemoteId = Value(statusRemoteId),
        hashtag = Value(hashtag);

  static Insertable<DbStatusHashtag> custom({
    Expression<int>? id,
    Expression<String>? statusRemoteId,
    Expression<String>? hashtag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
      if (hashtag != null) 'hashtag': hashtag,
    });
  }

  DbStatusHashtagsCompanion copyWith(
      {Value<int>? id, Value<String>? statusRemoteId, Value<String>? hashtag}) {
    return DbStatusHashtagsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      hashtag: hashtag ?? this.hashtag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    if (hashtag.present) {
      map['hashtag'] = Variable<String?>(hashtag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbStatusHashtagsCompanion(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('hashtag: $hashtag')
          ..write(')'))
        .toString();
  }
}

class $DbStatusHashtagsTable extends DbStatusHashtags
    with TableInfo<$DbStatusHashtagsTable, DbStatusHashtag> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbStatusHashtagsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn? _statusRemoteId;

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
  GeneratedTextColumn? _hashtag;

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
  VerificationContext validateIntegrity(Insertable<DbStatusHashtag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (data.containsKey('hashtag')) {
      context.handle(_hashtagMeta,
          hashtag.isAcceptableOrUnknown(data['hashtag']!, _hashtagMeta));
    } else if (isInserting) {
      context.missing(_hashtagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbStatusHashtag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusHashtag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbStatusHashtagsTable createAlias(String alias) {
    return $DbStatusHashtagsTable(_db, alias);
  }
}

class DbStatusList extends DataClass implements Insertable<DbStatusList> {
  final int? id;
  final String? statusRemoteId;
  final String? listRemoteId;

  DbStatusList(
      {required this.id,
      required this.statusRemoteId,
      required this.listRemoteId});

  factory DbStatusList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    if (!nullToAbsent || listRemoteId != null) {
      map['list_remote_id'] = Variable<String?>(listRemoteId);
    }
    return map;
  }

  DbStatusListsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbStatusList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusList(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      listRemoteId: serializer.fromJson<String>(json['listRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
      'listRemoteId': serializer.toJson<String?>(listRemoteId),
    };
  }

  DbStatusList copyWith(
          {int? id, String? statusRemoteId, String? listRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> statusRemoteId;
  final Value<String?> listRemoteId;

  const DbStatusListsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.listRemoteId = const Value.absent(),
  });

  DbStatusListsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String listRemoteId,
  })   : statusRemoteId = Value(statusRemoteId),
        listRemoteId = Value(listRemoteId);

  static Insertable<DbStatusList> custom({
    Expression<int>? id,
    Expression<String>? statusRemoteId,
    Expression<String>? listRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
      if (listRemoteId != null) 'list_remote_id': listRemoteId,
    });
  }

  DbStatusListsCompanion copyWith(
      {Value<int>? id,
      Value<String>? statusRemoteId,
      Value<String>? listRemoteId}) {
    return DbStatusListsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      listRemoteId: listRemoteId ?? this.listRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    if (listRemoteId.present) {
      map['list_remote_id'] = Variable<String?>(listRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbStatusListsCompanion(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('listRemoteId: $listRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbStatusListsTable extends DbStatusLists
    with TableInfo<$DbStatusListsTable, DbStatusList> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbStatusListsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn? _statusRemoteId;

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
  GeneratedTextColumn? _listRemoteId;

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
  VerificationContext validateIntegrity(Insertable<DbStatusList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (data.containsKey('list_remote_id')) {
      context.handle(
          _listRemoteIdMeta,
          listRemoteId.isAcceptableOrUnknown(
              data['list_remote_id']!, _listRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_listRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbStatusList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusList.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbStatusListsTable createAlias(String alias) {
    return $DbStatusListsTable(_db, alias);
  }
}

class DbStatusFavouritedAccount extends DataClass
    implements Insertable<DbStatusFavouritedAccount> {
  final int? id;
  final String? statusRemoteId;
  final String? accountRemoteId;

  DbStatusFavouritedAccount(
      {required this.id,
      required this.statusRemoteId,
      required this.accountRemoteId});

  factory DbStatusFavouritedAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    return map;
  }

  DbStatusFavouritedAccountsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbStatusFavouritedAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusFavouritedAccount(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
    };
  }

  DbStatusFavouritedAccount copyWith(
          {int? id, String? statusRemoteId, String? accountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> statusRemoteId;
  final Value<String?> accountRemoteId;

  const DbStatusFavouritedAccountsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });

  DbStatusFavouritedAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String accountRemoteId,
  })   : statusRemoteId = Value(statusRemoteId),
        accountRemoteId = Value(accountRemoteId);

  static Insertable<DbStatusFavouritedAccount> custom({
    Expression<int>? id,
    Expression<String>? statusRemoteId,
    Expression<String>? accountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
    });
  }

  DbStatusFavouritedAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? statusRemoteId,
      Value<String>? accountRemoteId}) {
    return DbStatusFavouritedAccountsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbStatusFavouritedAccountsCompanion(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbStatusFavouritedAccountsTable extends DbStatusFavouritedAccounts
    with
        TableInfo<$DbStatusFavouritedAccountsTable, DbStatusFavouritedAccount> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbStatusFavouritedAccountsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn? _statusRemoteId;

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
  GeneratedTextColumn? _accountRemoteId;

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
  VerificationContext validateIntegrity(
      Insertable<DbStatusFavouritedAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbStatusFavouritedAccount map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusFavouritedAccount.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $DbStatusFavouritedAccountsTable createAlias(String alias) {
    return $DbStatusFavouritedAccountsTable(_db, alias);
  }
}

class DbStatusRebloggedAccount extends DataClass
    implements Insertable<DbStatusRebloggedAccount> {
  final int? id;
  final String? statusRemoteId;
  final String? accountRemoteId;

  DbStatusRebloggedAccount(
      {required this.id,
      required this.statusRemoteId,
      required this.accountRemoteId});

  factory DbStatusRebloggedAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    return map;
  }

  DbStatusRebloggedAccountsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbStatusRebloggedAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusRebloggedAccount(
      id: serializer.fromJson<int>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
    };
  }

  DbStatusRebloggedAccount copyWith(
          {int? id, String? statusRemoteId, String? accountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> statusRemoteId;
  final Value<String?> accountRemoteId;

  const DbStatusRebloggedAccountsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });

  DbStatusRebloggedAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String accountRemoteId,
  })   : statusRemoteId = Value(statusRemoteId),
        accountRemoteId = Value(accountRemoteId);

  static Insertable<DbStatusRebloggedAccount> custom({
    Expression<int>? id,
    Expression<String>? statusRemoteId,
    Expression<String>? accountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
    });
  }

  DbStatusRebloggedAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? statusRemoteId,
      Value<String>? accountRemoteId}) {
    return DbStatusRebloggedAccountsCompanion(
      id: id ?? this.id,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbStatusRebloggedAccountsCompanion(')
          ..write('id: $id, ')
          ..write('statusRemoteId: $statusRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbStatusRebloggedAccountsTable extends DbStatusRebloggedAccounts
    with TableInfo<$DbStatusRebloggedAccountsTable, DbStatusRebloggedAccount> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbStatusRebloggedAccountsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn? _statusRemoteId;

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
  GeneratedTextColumn? _accountRemoteId;

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
  VerificationContext validateIntegrity(
      Insertable<DbStatusRebloggedAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbStatusRebloggedAccount map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbStatusRebloggedAccount.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  $DbStatusRebloggedAccountsTable createAlias(String alias) {
    return $DbStatusRebloggedAccountsTable(_db, alias);
  }
}

class DbAccountFollowing extends DataClass
    implements Insertable<DbAccountFollowing> {
  final int? id;
  final String? accountRemoteId;
  final String? followingAccountRemoteId;

  DbAccountFollowing(
      {required this.id,
      required this.accountRemoteId,
      required this.followingAccountRemoteId});

  factory DbAccountFollowing.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    if (!nullToAbsent || followingAccountRemoteId != null) {
      map['following_account_remote_id'] =
          Variable<String?>(followingAccountRemoteId);
    }
    return map;
  }

  DbAccountFollowingsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbAccountFollowing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccountFollowing(
      id: serializer.fromJson<int>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      followingAccountRemoteId:
          serializer.fromJson<String>(json['followingAccountRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'followingAccountRemoteId':
          serializer.toJson<String?>(followingAccountRemoteId),
    };
  }

  DbAccountFollowing copyWith(
          {int? id,
          String? accountRemoteId,
          String? followingAccountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> accountRemoteId;
  final Value<String?> followingAccountRemoteId;

  const DbAccountFollowingsCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.followingAccountRemoteId = const Value.absent(),
  });

  DbAccountFollowingsCompanion.insert({
    this.id = const Value.absent(),
    required String accountRemoteId,
    required String followingAccountRemoteId,
  })   : accountRemoteId = Value(accountRemoteId),
        followingAccountRemoteId = Value(followingAccountRemoteId);

  static Insertable<DbAccountFollowing> custom({
    Expression<int>? id,
    Expression<String>? accountRemoteId,
    Expression<String>? followingAccountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
      if (followingAccountRemoteId != null)
        'following_account_remote_id': followingAccountRemoteId,
    });
  }

  DbAccountFollowingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountRemoteId,
      Value<String>? followingAccountRemoteId}) {
    return DbAccountFollowingsCompanion(
      id: id ?? this.id,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      followingAccountRemoteId:
          followingAccountRemoteId ?? this.followingAccountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    if (followingAccountRemoteId.present) {
      map['following_account_remote_id'] =
          Variable<String?>(followingAccountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAccountFollowingsCompanion(')
          ..write('id: $id, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('followingAccountRemoteId: $followingAccountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbAccountFollowingsTable extends DbAccountFollowings
    with TableInfo<$DbAccountFollowingsTable, DbAccountFollowing> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbAccountFollowingsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  GeneratedTextColumn? _accountRemoteId;

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
  GeneratedTextColumn? _followingAccountRemoteId;

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
  VerificationContext validateIntegrity(Insertable<DbAccountFollowing> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (data.containsKey('following_account_remote_id')) {
      context.handle(
          _followingAccountRemoteIdMeta,
          followingAccountRemoteId.isAcceptableOrUnknown(
              data['following_account_remote_id']!,
              _followingAccountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_followingAccountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbAccountFollowing map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbAccountFollowing.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbAccountFollowingsTable createAlias(String alias) {
    return $DbAccountFollowingsTable(_db, alias);
  }
}

class DbAccountFollower extends DataClass
    implements Insertable<DbAccountFollower> {
  final int? id;
  final String? accountRemoteId;
  final String? followerAccountRemoteId;

  DbAccountFollower(
      {required this.id,
      required this.accountRemoteId,
      required this.followerAccountRemoteId});

  factory DbAccountFollower.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    if (!nullToAbsent || followerAccountRemoteId != null) {
      map['follower_account_remote_id'] =
          Variable<String?>(followerAccountRemoteId);
    }
    return map;
  }

  DbAccountFollowersCompanion toCompanion(bool nullToAbsent) {
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

  factory DbAccountFollower.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccountFollower(
      id: serializer.fromJson<int>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      followerAccountRemoteId:
          serializer.fromJson<String>(json['followerAccountRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'followerAccountRemoteId':
          serializer.toJson<String?>(followerAccountRemoteId),
    };
  }

  DbAccountFollower copyWith(
          {int? id,
          String? accountRemoteId,
          String? followerAccountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> accountRemoteId;
  final Value<String?> followerAccountRemoteId;

  const DbAccountFollowersCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.followerAccountRemoteId = const Value.absent(),
  });

  DbAccountFollowersCompanion.insert({
    this.id = const Value.absent(),
    required String accountRemoteId,
    required String followerAccountRemoteId,
  })   : accountRemoteId = Value(accountRemoteId),
        followerAccountRemoteId = Value(followerAccountRemoteId);

  static Insertable<DbAccountFollower> custom({
    Expression<int>? id,
    Expression<String>? accountRemoteId,
    Expression<String>? followerAccountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
      if (followerAccountRemoteId != null)
        'follower_account_remote_id': followerAccountRemoteId,
    });
  }

  DbAccountFollowersCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountRemoteId,
      Value<String>? followerAccountRemoteId}) {
    return DbAccountFollowersCompanion(
      id: id ?? this.id,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      followerAccountRemoteId:
          followerAccountRemoteId ?? this.followerAccountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    if (followerAccountRemoteId.present) {
      map['follower_account_remote_id'] =
          Variable<String?>(followerAccountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAccountFollowersCompanion(')
          ..write('id: $id, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('followerAccountRemoteId: $followerAccountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbAccountFollowersTable extends DbAccountFollowers
    with TableInfo<$DbAccountFollowersTable, DbAccountFollower> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbAccountFollowersTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  GeneratedTextColumn? _accountRemoteId;

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
  GeneratedTextColumn? _followerAccountRemoteId;

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
  VerificationContext validateIntegrity(Insertable<DbAccountFollower> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (data.containsKey('follower_account_remote_id')) {
      context.handle(
          _followerAccountRemoteIdMeta,
          followerAccountRemoteId.isAcceptableOrUnknown(
              data['follower_account_remote_id']!,
              _followerAccountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_followerAccountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbAccountFollower map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbAccountFollower.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbAccountFollowersTable createAlias(String alias) {
    return $DbAccountFollowersTable(_db, alias);
  }
}

class DbConversationAccount extends DataClass
    implements Insertable<DbConversationAccount> {
  final int? id;
  final String? conversationRemoteId;
  final String? accountRemoteId;

  DbConversationAccount(
      {required this.id,
      required this.conversationRemoteId,
      required this.accountRemoteId});

  factory DbConversationAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || conversationRemoteId != null) {
      map['conversation_remote_id'] = Variable<String?>(conversationRemoteId);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    return map;
  }

  DbConversationAccountsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbConversationAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversationAccount(
      id: serializer.fromJson<int>(json['id']),
      conversationRemoteId:
          serializer.fromJson<String>(json['conversationRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'conversationRemoteId': serializer.toJson<String?>(conversationRemoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
    };
  }

  DbConversationAccount copyWith(
          {int? id, String? conversationRemoteId, String? accountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> conversationRemoteId;
  final Value<String?> accountRemoteId;

  const DbConversationAccountsCompanion({
    this.id = const Value.absent(),
    this.conversationRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });

  DbConversationAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String conversationRemoteId,
    required String accountRemoteId,
  })   : conversationRemoteId = Value(conversationRemoteId),
        accountRemoteId = Value(accountRemoteId);

  static Insertable<DbConversationAccount> custom({
    Expression<int>? id,
    Expression<String>? conversationRemoteId,
    Expression<String>? accountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (conversationRemoteId != null)
        'conversation_remote_id': conversationRemoteId,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
    });
  }

  DbConversationAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? conversationRemoteId,
      Value<String>? accountRemoteId}) {
    return DbConversationAccountsCompanion(
      id: id ?? this.id,
      conversationRemoteId: conversationRemoteId ?? this.conversationRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (conversationRemoteId.present) {
      map['conversation_remote_id'] =
          Variable<String?>(conversationRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbConversationAccountsCompanion(')
          ..write('id: $id, ')
          ..write('conversationRemoteId: $conversationRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbConversationAccountsTable extends DbConversationAccounts
    with TableInfo<$DbConversationAccountsTable, DbConversationAccount> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbConversationAccountsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _conversationRemoteIdMeta =
      const VerificationMeta('conversationRemoteId');
  GeneratedTextColumn? _conversationRemoteId;

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
  GeneratedTextColumn? _accountRemoteId;

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
  VerificationContext validateIntegrity(
      Insertable<DbConversationAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('conversation_remote_id')) {
      context.handle(
          _conversationRemoteIdMeta,
          conversationRemoteId.isAcceptableOrUnknown(
              data['conversation_remote_id']!, _conversationRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_conversationRemoteIdMeta);
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbConversationAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbConversationAccount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbConversationAccountsTable createAlias(String alias) {
    return $DbConversationAccountsTable(_db, alias);
  }
}

class DbScheduledStatus extends DataClass
    implements Insertable<DbScheduledStatus> {
  final int? id;
  final String? remoteId;
  final DateTime scheduledAt;
  final bool? canceled;
  final PleromaScheduledStatusParams params;
  final List<PleromaMediaAttachment>? mediaAttachments;

  DbScheduledStatus({
    required this.id,
    required this.remoteId,
    required this.scheduledAt,
    required this.canceled,
    required this.params,
    required this.mediaAttachments,
  });

  factory DbScheduledStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || scheduledAt != null) {
      map['scheduled_at'] = Variable<DateTime?>(scheduledAt);
    }
    if (!nullToAbsent || canceled != null) {
      map['canceled'] = Variable<bool?>(canceled);
    }
    if (!nullToAbsent || params != null) {
      final converter = $DbScheduledStatusesTable.$converter0;
      map['params'] = Variable<String?>(converter.mapToSql(params));
    }
    if (!nullToAbsent || mediaAttachments != null) {
      final converter = $DbScheduledStatusesTable.$converter1;
      map['media_attachments'] =
          Variable<String?>(converter.mapToSql(mediaAttachments));
    }
    return map;
  }

  DbScheduledStatusesCompanion toCompanion(bool nullToAbsent) {
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

  factory DbScheduledStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'scheduledAt': serializer.toJson<DateTime?>(scheduledAt),
      'canceled': serializer.toJson<bool?>(canceled),
      'params': serializer.toJson<PleromaScheduledStatusParams?>(params),
      'mediaAttachments':
          serializer.toJson<List<PleromaMediaAttachment>?>(mediaAttachments),
    };
  }

  DbScheduledStatus copyWith(
          {int? id,
          String? remoteId,
          DateTime? scheduledAt,
          bool? canceled,
          PleromaScheduledStatusParams? params,
          List<PleromaMediaAttachment>? mediaAttachments}) =>
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
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<DateTime?> scheduledAt;
  final Value<bool?> canceled;
  final Value<PleromaScheduledStatusParams?> params;
  final Value<List<PleromaMediaAttachment>?> mediaAttachments;

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
    required String remoteId,
    required DateTime scheduledAt,
    required bool canceled,
    this.params = const Value.absent(),
    this.mediaAttachments = const Value.absent(),
  })  : remoteId = Value(remoteId),
        scheduledAt = Value(scheduledAt),
        canceled = Value(canceled);

  static Insertable<DbScheduledStatus> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<DateTime>? scheduledAt,
    Expression<bool>? canceled,
    Expression<String>? params,
    Expression<String>? mediaAttachments,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (canceled != null) 'canceled': canceled,
      if (params != null) 'params': params,
      if (mediaAttachments != null) 'media_attachments': mediaAttachments,
    });
  }

  DbScheduledStatusesCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<DateTime>? scheduledAt,
      Value<bool>? canceled,
      Value<PleromaScheduledStatusParams>? params,
      Value<List<PleromaMediaAttachment>>? mediaAttachments}) {
    return DbScheduledStatusesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      canceled: canceled ?? this.canceled,
      params: params ?? this.params,
      mediaAttachments: mediaAttachments ?? this.mediaAttachments,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime?>(scheduledAt.value);
    }
    if (canceled.present) {
      map['canceled'] = Variable<bool?>(canceled.value);
    }
    if (params.present) {
      final converter = $DbScheduledStatusesTable.$converter0;
      map['params'] = Variable<String?>(converter.mapToSql(params.value));
    }
    if (mediaAttachments.present) {
      final converter = $DbScheduledStatusesTable.$converter1;
      map['media_attachments'] =
          Variable<String?>(converter.mapToSql(mediaAttachments.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbScheduledStatusesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('canceled: $canceled, ')
          ..write('params: $params, ')
          ..write('mediaAttachments: $mediaAttachments')
          ..write(')'))
        .toString();
  }
}

class $DbScheduledStatusesTable extends DbScheduledStatuses
    with TableInfo<$DbScheduledStatusesTable, DbScheduledStatus> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbScheduledStatusesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _scheduledAtMeta =
      const VerificationMeta('scheduledAt');
  GeneratedDateTimeColumn? _scheduledAt;

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
  GeneratedBoolColumn? _canceled;

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
  GeneratedTextColumn? _params;

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
  GeneratedTextColumn? _mediaAttachments;

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
  VerificationContext validateIntegrity(Insertable<DbScheduledStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
          _scheduledAtMeta,
          scheduledAt.isAcceptableOrUnknown(
              data['scheduled_at']!, _scheduledAtMeta));
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('canceled')) {
      context.handle(_canceledMeta,
          canceled.isAcceptableOrUnknown(data['canceled']!, _canceledMeta));
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
  DbScheduledStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbScheduledStatus.fromData(data, _db, prefix: effectivePrefix);
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
  final int? id;
  final String remoteId;
  final int? unread;
  final DateTime? updatedAt;
  final String accountRemoteId;

  DbChat({
    required this.id,
    required this.remoteId,
    required this.unread,
    this.updatedAt,
    required this.accountRemoteId,
  });

  factory DbChat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || unread != null) {
      map['unread'] = Variable<int?>(unread);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    return map;
  }

  DbChatsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbChat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'unread': serializer.toJson<int?>(unread),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
    };
  }

  DbChat copyWith(
          {int? id,
          String? remoteId,
          int? unread,
          DateTime? updatedAt,
          String? accountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<int?> unread;
  final Value<DateTime?> updatedAt;
  final Value<String?> accountRemoteId;

  const DbChatsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.unread = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });

  DbChatsCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required int unread,
    this.updatedAt = const Value.absent(),
    required String accountRemoteId,
  })   : remoteId = Value(remoteId),
        unread = Value(unread),
        accountRemoteId = Value(accountRemoteId);

  static Insertable<DbChat> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<int>? unread,
    Expression<DateTime>? updatedAt,
    Expression<String>? accountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (unread != null) 'unread': unread,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
    });
  }

  DbChatsCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<int>? unread,
      Value<DateTime>? updatedAt,
      Value<String>? accountRemoteId}) {
    return DbChatsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      unread: unread ?? this.unread,
      updatedAt: updatedAt ?? this.updatedAt,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (unread.present) {
      map['unread'] = Variable<int?>(unread.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime?>(updatedAt.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbChatsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('unread: $unread, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbChatsTable extends DbChats with TableInfo<$DbChatsTable, DbChat> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbChatsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  GeneratedIntColumn? _unread;

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
  GeneratedDateTimeColumn? _updatedAt;

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
  GeneratedTextColumn? _accountRemoteId;

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
  VerificationContext validateIntegrity(Insertable<DbChat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('unread')) {
      context.handle(_unreadMeta,
          unread.isAcceptableOrUnknown(data['unread']!, _unreadMeta));
    } else if (isInserting) {
      context.missing(_unreadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbChat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbChat.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbChatsTable createAlias(String alias) {
    return $DbChatsTable(_db, alias);
  }
}

class DbChatMessage extends DataClass implements Insertable<DbChatMessage> {
  final int? id;
  final String remoteId;
  final String chatRemoteId;
  final String accountRemoteId;
  final String? content;
  final DateTime createdAt;
  final List<PleromaEmoji>? emojis;
  final PleromaMediaAttachment? mediaAttachment;
  final PleromaCard? card;
  final PendingState? pendingState;
  final bool deleted;
  final bool hiddenLocallyOnDevice;
  final String? oldPendingRemoteId;
  final String? wasSentWithIdempotencyKey;

  DbChatMessage({
    required this.id,
    required this.remoteId,
    required this.chatRemoteId,
    required this.accountRemoteId,
    required this.content,
    required this.createdAt,
    required this.emojis,
    required this.mediaAttachment,
    required this.card,
    required this.pendingState,
    required this.deleted,
    required this.hiddenLocallyOnDevice,
    required this.oldPendingRemoteId,
    required this.wasSentWithIdempotencyKey,
  });

  factory DbChatMessage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
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
      card: $DbChatMessagesTable.$converter2.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}card'])),
      pendingState: $DbChatMessagesTable.$converter3.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pending_state'])),
      deleted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
      hiddenLocallyOnDevice: boolType.mapFromDatabaseResponse(
          data['${effectivePrefix}hidden_locally_on_device']),
      oldPendingRemoteId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}old_pending_remote_id']),
      wasSentWithIdempotencyKey: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}was_sent_with_idempotency_key']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || chatRemoteId != null) {
      map['chat_remote_id'] = Variable<String?>(chatRemoteId);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    if (!nullToAbsent || emojis != null) {
      final converter = $DbChatMessagesTable.$converter0;
      map['emojis'] = Variable<String?>(converter.mapToSql(emojis));
    }
    if (!nullToAbsent || mediaAttachment != null) {
      final converter = $DbChatMessagesTable.$converter1;
      map['media_attachment'] =
          Variable<String?>(converter.mapToSql(mediaAttachment));
    }
    if (!nullToAbsent || card != null) {
      final converter = $DbChatMessagesTable.$converter2;
      map['card'] = Variable<String?>(converter.mapToSql(card));
    }
    if (!nullToAbsent || pendingState != null) {
      final converter = $DbChatMessagesTable.$converter3;
      map['pending_state'] =
          Variable<String?>(converter.mapToSql(pendingState));
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool?>(deleted);
    }
    if (!nullToAbsent || hiddenLocallyOnDevice != null) {
      map['hidden_locally_on_device'] = Variable<bool?>(hiddenLocallyOnDevice);
    }
    if (!nullToAbsent || oldPendingRemoteId != null) {
      map['old_pending_remote_id'] = Variable<String?>(oldPendingRemoteId);
    }
    if (!nullToAbsent || wasSentWithIdempotencyKey != null) {
      map['was_sent_with_idempotency_key'] =
          Variable<String?>(wasSentWithIdempotencyKey);
    }
    return map;
  }

  DbChatMessagesCompanion toCompanion(bool nullToAbsent) {
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
      card: card == null && nullToAbsent ? const Value.absent() : Value(card),
      pendingState: pendingState == null && nullToAbsent
          ? const Value.absent()
          : Value(pendingState),
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
      hiddenLocallyOnDevice: hiddenLocallyOnDevice == null && nullToAbsent
          ? const Value.absent()
          : Value(hiddenLocallyOnDevice),
      oldPendingRemoteId: oldPendingRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(oldPendingRemoteId),
      wasSentWithIdempotencyKey:
          wasSentWithIdempotencyKey == null && nullToAbsent
              ? const Value.absent()
              : Value(wasSentWithIdempotencyKey),
    );
  }

  factory DbChatMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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
      card: serializer.fromJson<PleromaCard>(json['card']),
      pendingState: serializer.fromJson<PendingState>(json['pendingState']),
      deleted: serializer.fromJson<bool>(json['deleted']),
      hiddenLocallyOnDevice:
          serializer.fromJson<bool>(json['hiddenLocallyOnDevice']),
      oldPendingRemoteId:
          serializer.fromJson<String>(json['oldPendingRemoteId']),
      wasSentWithIdempotencyKey:
          serializer.fromJson<String>(json['wasSentWithIdempotencyKey']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'chatRemoteId': serializer.toJson<String?>(chatRemoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'emojis': serializer.toJson<List<PleromaEmoji>?>(emojis),
      'mediaAttachment':
          serializer.toJson<PleromaMediaAttachment?>(mediaAttachment),
      'card': serializer.toJson<PleromaCard?>(card),
      'pendingState': serializer.toJson<PendingState?>(pendingState),
      'deleted': serializer.toJson<bool?>(deleted),
      'hiddenLocallyOnDevice': serializer.toJson<bool?>(hiddenLocallyOnDevice),
      'oldPendingRemoteId': serializer.toJson<String?>(oldPendingRemoteId),
      'wasSentWithIdempotencyKey':
          serializer.toJson<String?>(wasSentWithIdempotencyKey),
    };
  }

  DbChatMessage copyWith(
          {int? id,
          String? remoteId,
          String? chatRemoteId,
          String? accountRemoteId,
          String? content,
          DateTime? createdAt,
          List<PleromaEmoji>? emojis,
          PleromaMediaAttachment? mediaAttachment,
          PleromaCard? card,
          PendingState? pendingState,
          bool? deleted,
          bool? hiddenLocallyOnDevice,
          String? oldPendingRemoteId,
          String? wasSentWithIdempotencyKey}) =>
      DbChatMessage(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        chatRemoteId: chatRemoteId ?? this.chatRemoteId,
        accountRemoteId: accountRemoteId ?? this.accountRemoteId,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        emojis: emojis ?? this.emojis,
        mediaAttachment: mediaAttachment ?? this.mediaAttachment,
        card: card ?? this.card,
        pendingState: pendingState ?? this.pendingState,
        deleted: deleted ?? this.deleted,
        hiddenLocallyOnDevice:
            hiddenLocallyOnDevice ?? this.hiddenLocallyOnDevice,
        oldPendingRemoteId: oldPendingRemoteId ?? this.oldPendingRemoteId,
        wasSentWithIdempotencyKey:
            wasSentWithIdempotencyKey ?? this.wasSentWithIdempotencyKey,
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
          ..write('mediaAttachment: $mediaAttachment, ')
          ..write('card: $card, ')
          ..write('pendingState: $pendingState, ')
          ..write('deleted: $deleted, ')
          ..write('hiddenLocallyOnDevice: $hiddenLocallyOnDevice, ')
          ..write('oldPendingRemoteId: $oldPendingRemoteId, ')
          ..write('wasSentWithIdempotencyKey: $wasSentWithIdempotencyKey')
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
                              emojis.hashCode,
                              $mrjc(
                                  mediaAttachment.hashCode,
                                  $mrjc(
                                      card.hashCode,
                                      $mrjc(
                                          pendingState.hashCode,
                                          $mrjc(
                                              deleted.hashCode,
                                              $mrjc(
                                                  hiddenLocallyOnDevice
                                                      .hashCode,
                                                  $mrjc(
                                                      oldPendingRemoteId
                                                          .hashCode,
                                                      wasSentWithIdempotencyKey
                                                          .hashCode))))))))))))));

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
          other.mediaAttachment == this.mediaAttachment &&
          other.card == this.card &&
          other.pendingState == this.pendingState &&
          other.deleted == this.deleted &&
          other.hiddenLocallyOnDevice == this.hiddenLocallyOnDevice &&
          other.oldPendingRemoteId == this.oldPendingRemoteId &&
          other.wasSentWithIdempotencyKey == this.wasSentWithIdempotencyKey);
}

class DbChatMessagesCompanion extends UpdateCompanion<DbChatMessage> {
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<String?> chatRemoteId;
  final Value<String?> accountRemoteId;
  final Value<String?> content;
  final Value<DateTime?> createdAt;
  final Value<List<PleromaEmoji>?> emojis;
  final Value<PleromaMediaAttachment?> mediaAttachment;
  final Value<PleromaCard?> card;
  final Value<PendingState?> pendingState;
  final Value<bool?> deleted;
  final Value<bool?> hiddenLocallyOnDevice;
  final Value<String?> oldPendingRemoteId;
  final Value<String?> wasSentWithIdempotencyKey;

  const DbChatMessagesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.emojis = const Value.absent(),
    this.mediaAttachment = const Value.absent(),
    this.card = const Value.absent(),
    this.pendingState = const Value.absent(),
    this.deleted = const Value.absent(),
    this.hiddenLocallyOnDevice = const Value.absent(),
    this.oldPendingRemoteId = const Value.absent(),
    this.wasSentWithIdempotencyKey = const Value.absent(),
  });

  DbChatMessagesCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String chatRemoteId,
    required String accountRemoteId,
    this.content = const Value.absent(),
    required DateTime createdAt,
    this.emojis = const Value.absent(),
    this.mediaAttachment = const Value.absent(),
    this.card = const Value.absent(),
    this.pendingState = const Value.absent(),
    this.deleted = const Value.absent(),
    this.hiddenLocallyOnDevice = const Value.absent(),
    this.oldPendingRemoteId = const Value.absent(),
    this.wasSentWithIdempotencyKey = const Value.absent(),
  })  : remoteId = Value(remoteId),
        chatRemoteId = Value(chatRemoteId),
        accountRemoteId = Value(accountRemoteId),
        createdAt = Value(createdAt);

  static Insertable<DbChatMessage> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? chatRemoteId,
    Expression<String>? accountRemoteId,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<String>? emojis,
    Expression<String>? mediaAttachment,
    Expression<String>? card,
    Expression<String>? pendingState,
    Expression<bool>? deleted,
    Expression<bool>? hiddenLocallyOnDevice,
    Expression<String>? oldPendingRemoteId,
    Expression<String>? wasSentWithIdempotencyKey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (chatRemoteId != null) 'chat_remote_id': chatRemoteId,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (emojis != null) 'emojis': emojis,
      if (mediaAttachment != null) 'media_attachment': mediaAttachment,
      if (card != null) 'card': card,
      if (pendingState != null) 'pending_state': pendingState,
      if (deleted != null) 'deleted': deleted,
      if (hiddenLocallyOnDevice != null)
        'hidden_locally_on_device': hiddenLocallyOnDevice,
      if (oldPendingRemoteId != null)
        'old_pending_remote_id': oldPendingRemoteId,
      if (wasSentWithIdempotencyKey != null)
        'was_sent_with_idempotency_key': wasSentWithIdempotencyKey,
    });
  }

  DbChatMessagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? chatRemoteId,
      Value<String>? accountRemoteId,
      Value<String>? content,
      Value<DateTime>? createdAt,
      Value<List<PleromaEmoji>>? emojis,
      Value<PleromaMediaAttachment>? mediaAttachment,
      Value<PleromaCard>? card,
      Value<PendingState>? pendingState,
      Value<bool>? deleted,
      Value<bool>? hiddenLocallyOnDevice,
      Value<String>? oldPendingRemoteId,
      Value<String>? wasSentWithIdempotencyKey}) {
    return DbChatMessagesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      chatRemoteId: chatRemoteId ?? this.chatRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      emojis: emojis ?? this.emojis,
      mediaAttachment: mediaAttachment ?? this.mediaAttachment,
      card: card ?? this.card,
      pendingState: pendingState ?? this.pendingState,
      deleted: deleted ?? this.deleted,
      hiddenLocallyOnDevice:
          hiddenLocallyOnDevice ?? this.hiddenLocallyOnDevice,
      oldPendingRemoteId: oldPendingRemoteId ?? this.oldPendingRemoteId,
      wasSentWithIdempotencyKey:
          wasSentWithIdempotencyKey ?? this.wasSentWithIdempotencyKey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (chatRemoteId.present) {
      map['chat_remote_id'] = Variable<String?>(chatRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (emojis.present) {
      final converter = $DbChatMessagesTable.$converter0;
      map['emojis'] = Variable<String?>(converter.mapToSql(emojis.value));
    }
    if (mediaAttachment.present) {
      final converter = $DbChatMessagesTable.$converter1;
      map['media_attachment'] =
          Variable<String?>(converter.mapToSql(mediaAttachment.value));
    }
    if (card.present) {
      final converter = $DbChatMessagesTable.$converter2;
      map['card'] = Variable<String?>(converter.mapToSql(card.value));
    }
    if (pendingState.present) {
      final converter = $DbChatMessagesTable.$converter3;
      map['pending_state'] =
          Variable<String?>(converter.mapToSql(pendingState.value));
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool?>(deleted.value);
    }
    if (hiddenLocallyOnDevice.present) {
      map['hidden_locally_on_device'] =
          Variable<bool?>(hiddenLocallyOnDevice.value);
    }
    if (oldPendingRemoteId.present) {
      map['old_pending_remote_id'] =
          Variable<String?>(oldPendingRemoteId.value);
    }
    if (wasSentWithIdempotencyKey.present) {
      map['was_sent_with_idempotency_key'] =
          Variable<String?>(wasSentWithIdempotencyKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbChatMessagesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('chatRemoteId: $chatRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('emojis: $emojis, ')
          ..write('mediaAttachment: $mediaAttachment, ')
          ..write('card: $card, ')
          ..write('pendingState: $pendingState, ')
          ..write('deleted: $deleted, ')
          ..write('hiddenLocallyOnDevice: $hiddenLocallyOnDevice, ')
          ..write('oldPendingRemoteId: $oldPendingRemoteId, ')
          ..write('wasSentWithIdempotencyKey: $wasSentWithIdempotencyKey')
          ..write(')'))
        .toString();
  }
}

class $DbChatMessagesTable extends DbChatMessages
    with TableInfo<$DbChatMessagesTable, DbChatMessage> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbChatMessagesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  GeneratedTextColumn? _chatRemoteId;

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
  GeneratedTextColumn? _accountRemoteId;

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
  GeneratedTextColumn? _content;

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
  GeneratedDateTimeColumn? _createdAt;

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
  GeneratedTextColumn? _emojis;

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
  GeneratedTextColumn? _mediaAttachment;

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

  final VerificationMeta _cardMeta = const VerificationMeta('card');
  GeneratedTextColumn? _card;

  @override
  GeneratedTextColumn get card => _card ??= _constructCard();

  GeneratedTextColumn _constructCard() {
    return GeneratedTextColumn(
      'card',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pendingStateMeta =
      const VerificationMeta('pendingState');
  GeneratedTextColumn? _pendingState;

  @override
  GeneratedTextColumn get pendingState =>
      _pendingState ??= _constructPendingState();

  GeneratedTextColumn _constructPendingState() {
    return GeneratedTextColumn(
      'pending_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  GeneratedBoolColumn? _deleted;

  @override
  GeneratedBoolColumn get deleted => _deleted ??= _constructDeleted();

  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn(
      'deleted',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hiddenLocallyOnDeviceMeta =
      const VerificationMeta('hiddenLocallyOnDevice');
  GeneratedBoolColumn? _hiddenLocallyOnDevice;

  @override
  GeneratedBoolColumn get hiddenLocallyOnDevice =>
      _hiddenLocallyOnDevice ??= _constructHiddenLocallyOnDevice();

  GeneratedBoolColumn _constructHiddenLocallyOnDevice() {
    return GeneratedBoolColumn(
      'hidden_locally_on_device',
      $tableName,
      true,
    );
  }

  final VerificationMeta _oldPendingRemoteIdMeta =
      const VerificationMeta('oldPendingRemoteId');
  GeneratedTextColumn? _oldPendingRemoteId;

  @override
  GeneratedTextColumn get oldPendingRemoteId =>
      _oldPendingRemoteId ??= _constructOldPendingRemoteId();

  GeneratedTextColumn _constructOldPendingRemoteId() {
    return GeneratedTextColumn(
      'old_pending_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _wasSentWithIdempotencyKeyMeta =
      const VerificationMeta('wasSentWithIdempotencyKey');
  GeneratedTextColumn? _wasSentWithIdempotencyKey;

  @override
  GeneratedTextColumn get wasSentWithIdempotencyKey =>
      _wasSentWithIdempotencyKey ??= _constructWasSentWithIdempotencyKey();

  GeneratedTextColumn _constructWasSentWithIdempotencyKey() {
    return GeneratedTextColumn(
      'was_sent_with_idempotency_key',
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
        mediaAttachment,
        card,
        pendingState,
        deleted,
        hiddenLocallyOnDevice,
        oldPendingRemoteId,
        wasSentWithIdempotencyKey
      ];

  @override
  $DbChatMessagesTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_chat_messages';
  @override
  final String actualTableName = 'db_chat_messages';

  @override
  VerificationContext validateIntegrity(Insertable<DbChatMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('chat_remote_id')) {
      context.handle(
          _chatRemoteIdMeta,
          chatRemoteId.isAcceptableOrUnknown(
              data['chat_remote_id']!, _chatRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_chatRemoteIdMeta);
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    context.handle(_emojisMeta, const VerificationResult.success());
    context.handle(_mediaAttachmentMeta, const VerificationResult.success());
    context.handle(_cardMeta, const VerificationResult.success());
    context.handle(_pendingStateMeta, const VerificationResult.success());
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('hidden_locally_on_device')) {
      context.handle(
          _hiddenLocallyOnDeviceMeta,
          hiddenLocallyOnDevice.isAcceptableOrUnknown(
              data['hidden_locally_on_device']!, _hiddenLocallyOnDeviceMeta));
    }
    if (data.containsKey('old_pending_remote_id')) {
      context.handle(
          _oldPendingRemoteIdMeta,
          oldPendingRemoteId.isAcceptableOrUnknown(
              data['old_pending_remote_id']!, _oldPendingRemoteIdMeta));
    }
    if (data.containsKey('was_sent_with_idempotency_key')) {
      context.handle(
          _wasSentWithIdempotencyKeyMeta,
          wasSentWithIdempotencyKey.isAcceptableOrUnknown(
              data['was_sent_with_idempotency_key']!,
              _wasSentWithIdempotencyKeyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbChatMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbChatMessage.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbChatMessagesTable createAlias(String alias) {
    return $DbChatMessagesTable(_db, alias);
  }

  static TypeConverter<List<PleromaEmoji>, String> $converter0 =
      PleromaEmojiListDatabaseConverter();
  static TypeConverter<PleromaMediaAttachment, String> $converter1 =
      PleromaMediaAttachmentDatabaseConverter();
  static TypeConverter<PleromaCard, String> $converter2 =
      PleromaCardDatabaseConverter();
  static TypeConverter<PendingState, String> $converter3 =
      PendingStateDatabaseConverter();
}

class DbChatAccount extends DataClass implements Insertable<DbChatAccount> {
  final int? id;
  final String? chatRemoteId;
  final String? accountRemoteId;

  DbChatAccount(
      {required this.id,
      required this.chatRemoteId,
      required this.accountRemoteId});

  factory DbChatAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || chatRemoteId != null) {
      map['chat_remote_id'] = Variable<String?>(chatRemoteId);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    return map;
  }

  DbChatAccountsCompanion toCompanion(bool nullToAbsent) {
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

  factory DbChatAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbChatAccount(
      id: serializer.fromJson<int>(json['id']),
      chatRemoteId: serializer.fromJson<String>(json['chatRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'chatRemoteId': serializer.toJson<String?>(chatRemoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
    };
  }

  DbChatAccount copyWith(
          {int? id, String? chatRemoteId, String? accountRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> chatRemoteId;
  final Value<String?> accountRemoteId;

  const DbChatAccountsCompanion({
    this.id = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });

  DbChatAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String chatRemoteId,
    required String accountRemoteId,
  })   : chatRemoteId = Value(chatRemoteId),
        accountRemoteId = Value(accountRemoteId);

  static Insertable<DbChatAccount> custom({
    Expression<int>? id,
    Expression<String>? chatRemoteId,
    Expression<String>? accountRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatRemoteId != null) 'chat_remote_id': chatRemoteId,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
    });
  }

  DbChatAccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? chatRemoteId,
      Value<String>? accountRemoteId}) {
    return DbChatAccountsCompanion(
      id: id ?? this.id,
      chatRemoteId: chatRemoteId ?? this.chatRemoteId,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (chatRemoteId.present) {
      map['chat_remote_id'] = Variable<String?>(chatRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbChatAccountsCompanion(')
          ..write('id: $id, ')
          ..write('chatRemoteId: $chatRemoteId, ')
          ..write('accountRemoteId: $accountRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbChatAccountsTable extends DbChatAccounts
    with TableInfo<$DbChatAccountsTable, DbChatAccount> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbChatAccountsTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  GeneratedTextColumn? _chatRemoteId;

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
  GeneratedTextColumn? _accountRemoteId;

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
  VerificationContext validateIntegrity(Insertable<DbChatAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_remote_id')) {
      context.handle(
          _chatRemoteIdMeta,
          chatRemoteId.isAcceptableOrUnknown(
              data['chat_remote_id']!, _chatRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_chatRemoteIdMeta);
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbChatAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbChatAccount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbChatAccountsTable createAlias(String alias) {
    return $DbChatAccountsTable(_db, alias);
  }
}

class DbFilter extends DataClass implements Insertable<DbFilter> {
  final int? id;
  final String remoteId;
  final String phrase;
  final List<String> context;
  final bool irreversible;
  final bool wholeWord;
  final DateTime? expiresAt;

  DbFilter({
    required this.id,
    required this.remoteId,
    required this.phrase,
    required this.context,
    required this.irreversible,
    required this.wholeWord,
    required this.expiresAt,
  });

  factory DbFilter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return DbFilter(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id']),
      phrase:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phrase']),
      context: $DbFiltersTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}context'])),
      irreversible: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}irreversible']),
      wholeWord: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}whole_word']),
      expiresAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}expires_at']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String?>(remoteId);
    }
    if (!nullToAbsent || phrase != null) {
      map['phrase'] = Variable<String?>(phrase);
    }
    if (!nullToAbsent || context != null) {
      final TypeConverter<List<String?>, String> converter =
          $DbFiltersTable.$converter0;
      map['context'] = Variable<String?>(converter.mapToSql(context));
    }
    if (!nullToAbsent || irreversible != null) {
      map['irreversible'] = Variable<bool?>(irreversible);
    }
    if (!nullToAbsent || wholeWord != null) {
      map['whole_word'] = Variable<bool?>(wholeWord);
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime?>(expiresAt);
    }
    return map;
  }

  DbFiltersCompanion toCompanion(bool nullToAbsent) {
    return DbFiltersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      phrase:
          phrase == null && nullToAbsent ? const Value.absent() : Value(phrase),
      context: context == null && nullToAbsent
          ? const Value.absent()
          : Value(context),
      irreversible: irreversible == null && nullToAbsent
          ? const Value.absent()
          : Value(irreversible),
      wholeWord: wholeWord == null && nullToAbsent
          ? const Value.absent()
          : Value(wholeWord),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
    );
  }

  factory DbFilter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbFilter(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      phrase: serializer.fromJson<String>(json['phrase']),
      context: serializer.fromJson<List<String>>(json['context']),
      irreversible: serializer.fromJson<bool>(json['irreversible']),
      wholeWord: serializer.fromJson<bool>(json['wholeWord']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'phrase': serializer.toJson<String?>(phrase),
      'context': serializer.toJson<List<String?>?>(context),
      'irreversible': serializer.toJson<bool?>(irreversible),
      'wholeWord': serializer.toJson<bool?>(wholeWord),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
    };
  }

  DbFilter copyWith(
          {int? id,
          String? remoteId,
          String? phrase,
          List<String?>? context,
          bool? irreversible,
          bool? wholeWord,
          DateTime? expiresAt}) =>
      DbFilter(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        phrase: phrase ?? this.phrase,
        context: context ?? this.context,
        irreversible: irreversible ?? this.irreversible,
        wholeWord: wholeWord ?? this.wholeWord,
        expiresAt: expiresAt ?? this.expiresAt,
      );

  @override
  String toString() {
    return (StringBuffer('DbFilter(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('phrase: $phrase, ')
          ..write('context: $context, ')
          ..write('irreversible: $irreversible, ')
          ..write('wholeWord: $wholeWord, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              phrase.hashCode,
              $mrjc(
                  context.hashCode,
                  $mrjc(irreversible.hashCode,
                      $mrjc(wholeWord.hashCode, expiresAt.hashCode)))))));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbFilter &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.phrase == this.phrase &&
          other.context == this.context &&
          other.irreversible == this.irreversible &&
          other.wholeWord == this.wholeWord &&
          other.expiresAt == this.expiresAt);
}

class DbFiltersCompanion extends UpdateCompanion<DbFilter> {
  final Value<int?> id;
  final Value<String?> remoteId;
  final Value<String?> phrase;
  final Value<List<String?>?> context;
  final Value<bool?> irreversible;
  final Value<bool?> wholeWord;
  final Value<DateTime?> expiresAt;

  const DbFiltersCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.phrase = const Value.absent(),
    this.context = const Value.absent(),
    this.irreversible = const Value.absent(),
    this.wholeWord = const Value.absent(),
    this.expiresAt = const Value.absent(),
  });

  DbFiltersCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String phrase,
    this.context = const Value.absent(),
    this.irreversible = const Value.absent(),
    this.wholeWord = const Value.absent(),
    this.expiresAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        phrase = Value(phrase);

  static Insertable<DbFilter> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? phrase,
    Expression<String>? context,
    Expression<bool>? irreversible,
    Expression<bool>? wholeWord,
    Expression<DateTime>? expiresAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (phrase != null) 'phrase': phrase,
      if (context != null) 'context': context,
      if (irreversible != null) 'irreversible': irreversible,
      if (wholeWord != null) 'whole_word': wholeWord,
      if (expiresAt != null) 'expires_at': expiresAt,
    });
  }

  DbFiltersCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? phrase,
      Value<List<String>>? context,
      Value<bool>? irreversible,
      Value<bool>? wholeWord,
      Value<DateTime>? expiresAt}) {
    return DbFiltersCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      phrase: phrase ?? this.phrase,
      context: context ?? this.context,
      irreversible: irreversible ?? this.irreversible,
      wholeWord: wholeWord ?? this.wholeWord,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String?>(remoteId.value);
    }
    if (phrase.present) {
      map['phrase'] = Variable<String?>(phrase.value);
    }
    if (context.present) {
      final TypeConverter<List<String?>, String> converter =
          $DbFiltersTable.$converter0;
      map['context'] = Variable<String?>(converter.mapToSql(context.value));
    }
    if (irreversible.present) {
      map['irreversible'] = Variable<bool?>(irreversible.value);
    }
    if (wholeWord.present) {
      map['whole_word'] = Variable<bool?>(wholeWord.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime?>(expiresAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbFiltersCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('phrase: $phrase, ')
          ..write('context: $context, ')
          ..write('irreversible: $irreversible, ')
          ..write('wholeWord: $wholeWord, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }
}

class $DbFiltersTable extends DbFilters
    with TableInfo<$DbFiltersTable, DbFilter> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbFiltersTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  GeneratedTextColumn? _remoteId;

  @override
  GeneratedTextColumn get remoteId => _remoteId ??= _constructRemoteId();

  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _phraseMeta = const VerificationMeta('phrase');
  GeneratedTextColumn? _phrase;

  @override
  GeneratedTextColumn get phrase => _phrase ??= _constructPhrase();

  GeneratedTextColumn _constructPhrase() {
    return GeneratedTextColumn(
      'phrase',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contextMeta = const VerificationMeta('context');
  GeneratedTextColumn? _context;

  @override
  GeneratedTextColumn get context => _context ??= _constructContext();

  GeneratedTextColumn _constructContext() {
    return GeneratedTextColumn(
      'context',
      $tableName,
      true,
    );
  }

  final VerificationMeta _irreversibleMeta =
      const VerificationMeta('irreversible');
  GeneratedBoolColumn? _irreversible;

  @override
  GeneratedBoolColumn get irreversible =>
      _irreversible ??= _constructIrreversible();

  GeneratedBoolColumn _constructIrreversible() {
    return GeneratedBoolColumn(
      'irreversible',
      $tableName,
      true,
    );
  }

  final VerificationMeta _wholeWordMeta = const VerificationMeta('wholeWord');
  GeneratedBoolColumn? _wholeWord;

  @override
  GeneratedBoolColumn get wholeWord => _wholeWord ??= _constructWholeWord();

  GeneratedBoolColumn _constructWholeWord() {
    return GeneratedBoolColumn(
      'whole_word',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expiresAtMeta = const VerificationMeta('expiresAt');
  GeneratedDateTimeColumn? _expiresAt;

  @override
  GeneratedDateTimeColumn get expiresAt => _expiresAt ??= _constructExpiresAt();

  GeneratedDateTimeColumn _constructExpiresAt() {
    return GeneratedDateTimeColumn(
      'expires_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, remoteId, phrase, context, irreversible, wholeWord, expiresAt];

  @override
  $DbFiltersTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_filters';
  @override
  final String actualTableName = 'db_filters';

  @override
  VerificationContext validateIntegrity(Insertable<DbFilter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('phrase')) {
      context.handle(_phraseMeta,
          phrase.isAcceptableOrUnknown(data['phrase']!, _phraseMeta));
    } else if (isInserting) {
      context.missing(_phraseMeta);
    }
    context.handle(_contextMeta, const VerificationResult.success());
    if (data.containsKey('irreversible')) {
      context.handle(
          _irreversibleMeta,
          irreversible.isAcceptableOrUnknown(
              data['irreversible']!, _irreversibleMeta));
    }
    if (data.containsKey('whole_word')) {
      context.handle(_wholeWordMeta,
          wholeWord.isAcceptableOrUnknown(data['whole_word']!, _wholeWordMeta));
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbFilter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbFilter.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbFiltersTable createAlias(String alias) {
    return $DbFiltersTable(_db, alias);
  }

  static TypeConverter<List<String>, String> $converter0 =
      StringListDatabaseConverter();
}

class DbHomeTimelineStatus extends DataClass
    implements Insertable<DbHomeTimelineStatus> {
  final int? id;
  final String? accountRemoteId;
  final String? statusRemoteId;

  DbHomeTimelineStatus(
      {required this.id,
      required this.accountRemoteId,
      required this.statusRemoteId});

  factory DbHomeTimelineStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || accountRemoteId != null) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId);
    }
    if (!nullToAbsent || statusRemoteId != null) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId);
    }
    return map;
  }

  DbHomeTimelineStatusesCompanion toCompanion(bool nullToAbsent) {
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

  factory DbHomeTimelineStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbHomeTimelineStatus(
      id: serializer.fromJson<int>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
    };
  }

  DbHomeTimelineStatus copyWith(
          {int? id, String? accountRemoteId, String? statusRemoteId}) =>
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
  final Value<int?> id;
  final Value<String?> accountRemoteId;
  final Value<String?> statusRemoteId;

  const DbHomeTimelineStatusesCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
  });

  DbHomeTimelineStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String accountRemoteId,
    required String statusRemoteId,
  })   : accountRemoteId = Value(accountRemoteId),
        statusRemoteId = Value(statusRemoteId);

  static Insertable<DbHomeTimelineStatus> custom({
    Expression<int>? id,
    Expression<String>? accountRemoteId,
    Expression<String>? statusRemoteId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountRemoteId != null) 'account_remote_id': accountRemoteId,
      if (statusRemoteId != null) 'status_remote_id': statusRemoteId,
    });
  }

  DbHomeTimelineStatusesCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountRemoteId,
      Value<String>? statusRemoteId}) {
    return DbHomeTimelineStatusesCompanion(
      id: id ?? this.id,
      accountRemoteId: accountRemoteId ?? this.accountRemoteId,
      statusRemoteId: statusRemoteId ?? this.statusRemoteId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String?>(accountRemoteId.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String?>(statusRemoteId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbHomeTimelineStatusesCompanion(')
          ..write('id: $id, ')
          ..write('accountRemoteId: $accountRemoteId, ')
          ..write('statusRemoteId: $statusRemoteId')
          ..write(')'))
        .toString();
  }
}

class $DbHomeTimelineStatusesTable extends DbHomeTimelineStatuses
    with TableInfo<$DbHomeTimelineStatusesTable, DbHomeTimelineStatus> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbHomeTimelineStatusesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  GeneratedTextColumn? _accountRemoteId;

  @override
  GeneratedTextColumn get accountRemoteId =>
      _accountRemoteId ??= _constructAccountRemoteId();

  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn('account_remote_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  GeneratedTextColumn? _statusRemoteId;

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
  VerificationContext validateIntegrity(
      Insertable<DbHomeTimelineStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_remote_id')) {
      context.handle(
          _accountRemoteIdMeta,
          accountRemoteId.isAcceptableOrUnknown(
              data['account_remote_id']!, _accountRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_accountRemoteIdMeta);
    }
    if (data.containsKey('status_remote_id')) {
      context.handle(
          _statusRemoteIdMeta,
          statusRemoteId.isAcceptableOrUnknown(
              data['status_remote_id']!, _statusRemoteIdMeta));
    } else if (isInserting) {
      context.missing(_statusRemoteIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbHomeTimelineStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbHomeTimelineStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbHomeTimelineStatusesTable createAlias(String alias) {
    return $DbHomeTimelineStatusesTable(_db, alias);
  }
}

class DbDraftStatus extends DataClass implements Insertable<DbDraftStatus> {
  final int? id;
  final DateTime updatedAt;
  final PostStatusData data;

  DbDraftStatus({
    required this.id,
    required this.updatedAt,
    required this.data,
  });

  factory DbDraftStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return DbDraftStatus(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      data: $DbDraftStatusesTable.$converter0.mapToDart(
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}data'])),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    if (!nullToAbsent || data != null) {
      final converter = $DbDraftStatusesTable.$converter0;
      map['data'] = Variable<String?>(converter.mapToSql(data));
    }
    return map;
  }

  DbDraftStatusesCompanion toCompanion(bool nullToAbsent) {
    return DbDraftStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
    );
  }

  factory DbDraftStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbDraftStatus(
      id: serializer.fromJson<int>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      data: serializer.fromJson<PostStatusData>(json['data']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'data': serializer.toJson<PostStatusData?>(data),
    };
  }

  DbDraftStatus copyWith(
          {int? id, DateTime? updatedAt, PostStatusData? data}) =>
      DbDraftStatus(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        data: data ?? this.data,
      );

  @override
  String toString() {
    return (StringBuffer('DbDraftStatus(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(updatedAt.hashCode, data.hashCode)));

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DbDraftStatus &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.data == this.data);
}

class DbDraftStatusesCompanion extends UpdateCompanion<DbDraftStatus> {
  final Value<int?> id;
  final Value<DateTime?> updatedAt;
  final Value<PostStatusData?> data;

  const DbDraftStatusesCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.data = const Value.absent(),
  });

  DbDraftStatusesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime updatedAt,
    required PostStatusData data,
  })   : updatedAt = Value(updatedAt),
        data = Value(data);

  static Insertable<DbDraftStatus> custom({
    Expression<int>? id,
    Expression<DateTime>? updatedAt,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (data != null) 'data': data,
    });
  }

  DbDraftStatusesCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? updatedAt,
      Value<PostStatusData>? data}) {
    return DbDraftStatusesCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime?>(updatedAt.value);
    }
    if (data.present) {
      final converter = $DbDraftStatusesTable.$converter0;
      map['data'] = Variable<String?>(converter.mapToSql(data.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbDraftStatusesCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $DbDraftStatusesTable extends DbDraftStatuses
    with TableInfo<$DbDraftStatusesTable, DbDraftStatus> {
  final GeneratedDatabase _db;
  final String? _alias;

  $DbDraftStatusesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn? _id;

  @override
  GeneratedIntColumn get id => _id ??= _constructId();

  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn? _updatedAt;

  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();

  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dataMeta = const VerificationMeta('data');
  GeneratedTextColumn? _data;

  @override
  GeneratedTextColumn get data => _data ??= _constructData();

  GeneratedTextColumn _constructData() {
    return GeneratedTextColumn(
      'data',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, updatedAt, data];

  @override
  $DbDraftStatusesTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'db_draft_statuses';
  @override
  final String actualTableName = 'db_draft_statuses';

  @override
  VerificationContext validateIntegrity(Insertable<DbDraftStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    context.handle(_dataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  DbDraftStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DbDraftStatus.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DbDraftStatusesTable createAlias(String alias) {
    return $DbDraftStatusesTable(_db, alias);
  }

  static TypeConverter<PostStatusData, String> $converter0 =
      PostStatusDataDatabaseConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbStatusesTable? _dbStatuses;

  $DbStatusesTable get dbStatuses => _dbStatuses ??= $DbStatusesTable(this);
  Index? _dbStatusRemoteIdIndex;

  Index get dbStatusRemoteIdIndex => _dbStatusRemoteIdIndex ??= Index(
      'db_status_remote_id_index',
      'CREATE UNIQUE INDEX db_status_remote_id_index ON db_statuses (remote_id);');
  $DbAccountsTable? _dbAccounts;

  $DbAccountsTable get dbAccounts => _dbAccounts ??= $DbAccountsTable(this);
  Index? _dbAccountRemoteIdIndex;

  Index get dbAccountRemoteIdIndex => _dbAccountRemoteIdIndex ??= Index(
      'db_account_remote_id_index',
      'CREATE UNIQUE INDEX db_account_remote_id_index ON db_accounts (remote_id);');
  $DbConversationsTable? _dbConversations;

  $DbConversationsTable get dbConversations =>
      _dbConversations ??= $DbConversationsTable(this);
  Index? _dbConversationRemoteIdIndex;

  Index get dbConversationRemoteIdIndex => _dbConversationRemoteIdIndex ??= Index(
      'db_conversation_remote_id_index',
      'CREATE UNIQUE INDEX db_conversation_remote_id_index ON db_conversations (remote_id);');
  $DbNotificationsTable? _dbNotifications;

  $DbNotificationsTable get dbNotifications =>
      _dbNotifications ??= $DbNotificationsTable(this);
  Index? _dbNotificationRemoteIdIndex;

  Index get dbNotificationRemoteIdIndex => _dbNotificationRemoteIdIndex ??= Index(
      'db_notification_remote_id_index',
      'CREATE UNIQUE INDEX db_notification_remote_id_index ON db_notifications (remote_id);');
  $DbConversationStatusesTable? _dbConversationStatuses;

  $DbConversationStatusesTable get dbConversationStatuses =>
      _dbConversationStatuses ??= $DbConversationStatusesTable(this);
  Index? _dbConversationStatusesIndex;

  Index get dbConversationStatusesIndex => _dbConversationStatusesIndex ??= Index(
      'db_conversation_statuses_index',
      'CREATE UNIQUE INDEX db_conversation_statuses_index ON db_conversation_statuses(status_remote_id, conversation_remote_id);');
  $DbStatusHashtagsTable? _dbStatusHashtags;

  $DbStatusHashtagsTable get dbStatusHashtags =>
      _dbStatusHashtags ??= $DbStatusHashtagsTable(this);
  Index? _dbStatusHashtagsIndex;

  Index get dbStatusHashtagsIndex => _dbStatusHashtagsIndex ??= Index(
      'db_status_hashtags_index',
      'CREATE UNIQUE INDEX db_status_hashtags_index ON db_status_hashtags(status_remote_id, hashtag);');
  $DbStatusListsTable? _dbStatusLists;

  $DbStatusListsTable get dbStatusLists =>
      _dbStatusLists ??= $DbStatusListsTable(this);
  Index? _dbStatusListsIndex;

  Index get dbStatusListsIndex => _dbStatusListsIndex ??= Index(
      'db_status_lists_index',
      'CREATE UNIQUE INDEX db_status_lists_index ON db_status_lists(status_remote_id, list_remote_id);');
  $DbStatusFavouritedAccountsTable? _dbStatusFavouritedAccounts;

  $DbStatusFavouritedAccountsTable get dbStatusFavouritedAccounts =>
      _dbStatusFavouritedAccounts ??= $DbStatusFavouritedAccountsTable(this);
  Index? _dbStatusFavouritedAccountsIndex;

  Index get dbStatusFavouritedAccountsIndex =>
      _dbStatusFavouritedAccountsIndex ??= Index(
          'db_status_favourited_accounts_index',
          'CREATE UNIQUE INDEX db_status_favourited_accounts_index ON db_status_favourited_accounts(status_remote_id, account_remote_id);');
  $DbStatusRebloggedAccountsTable? _dbStatusRebloggedAccounts;

  $DbStatusRebloggedAccountsTable get dbStatusRebloggedAccounts =>
      _dbStatusRebloggedAccounts ??= $DbStatusRebloggedAccountsTable(this);
  Index? _dbStatusRebloggedAccountsIndex;

  Index get dbStatusRebloggedAccountsIndex =>
      _dbStatusRebloggedAccountsIndex ??= Index(
          'db_status_reblogged_accounts_index',
          'CREATE UNIQUE INDEX db_status_reblogged_accounts_index ON db_status_reblogged_accounts(status_remote_id, account_remote_id);');
  $DbAccountFollowingsTable? _dbAccountFollowings;

  $DbAccountFollowingsTable get dbAccountFollowings =>
      _dbAccountFollowings ??= $DbAccountFollowingsTable(this);
  Index? _dbAccountFollowingsIndex;

  Index get dbAccountFollowingsIndex => _dbAccountFollowingsIndex ??= Index(
      'db_account_followings_index',
      'CREATE UNIQUE INDEX db_account_followings_index ON db_account_followings(account_remote_id, following_account_remote_id);');
  $DbAccountFollowersTable? _dbAccountFollowers;

  $DbAccountFollowersTable get dbAccountFollowers =>
      _dbAccountFollowers ??= $DbAccountFollowersTable(this);
  Index? _dbAccountFollowersIndex;

  Index get dbAccountFollowersIndex => _dbAccountFollowersIndex ??= Index(
      'db_account_followers_index',
      'CREATE UNIQUE INDEX db_account_followers_index ON db_account_followers(account_remote_id, follower_account_remote_id);');
  $DbConversationAccountsTable? _dbConversationAccounts;

  $DbConversationAccountsTable get dbConversationAccounts =>
      _dbConversationAccounts ??= $DbConversationAccountsTable(this);
  Index? _dbConversationAccountsIndex;

  Index get dbConversationAccountsIndex => _dbConversationAccountsIndex ??= Index(
      'db_conversation_accounts_index',
      'CREATE UNIQUE INDEX db_conversation_accounts_index ON db_conversation_accounts(conversation_remote_id, account_remote_id);');
  $DbScheduledStatusesTable? _dbScheduledStatuses;

  $DbScheduledStatusesTable get dbScheduledStatuses =>
      _dbScheduledStatuses ??= $DbScheduledStatusesTable(this);
  Index? _dbScheduledStatusRemoteIdIndex;

  Index get dbScheduledStatusRemoteIdIndex =>
      _dbScheduledStatusRemoteIdIndex ??= Index(
          'db_scheduled_status_remote_id_index',
          'CREATE UNIQUE INDEX db_scheduled_status_remote_id_index ON db_scheduled_statuses (remote_id);');
  $DbChatsTable? _dbChats;

  $DbChatsTable get dbChats => _dbChats ??= $DbChatsTable(this);
  Index? _dbChatRemoteIdIndex;

  Index get dbChatRemoteIdIndex => _dbChatRemoteIdIndex ??= Index(
      'db_chat_remote_id_index',
      'CREATE UNIQUE INDEX db_chat_remote_id_index ON db_chats (remote_id);');
  $DbChatMessagesTable? _dbChatMessages;

  $DbChatMessagesTable get dbChatMessages =>
      _dbChatMessages ??= $DbChatMessagesTable(this);
  Index? _dbChatMessagesRemoteIdIndex;

  Index get dbChatMessagesRemoteIdIndex => _dbChatMessagesRemoteIdIndex ??= Index(
      'db_chat_messages_remote_id_index',
      'CREATE UNIQUE INDEX db_chat_messages_remote_id_index ON db_chat_messages(remote_id);');
  Index? _dbChatMessagesChatRemoteIdIndex;

  Index get dbChatMessagesChatRemoteIdIndex =>
      _dbChatMessagesChatRemoteIdIndex ??= Index(
          'db_chat_messages_chat_remote_id_index',
          'CREATE INDEX db_chat_messages_chat_remote_id_index ON db_chat_messages(chat_remote_id);');
  $DbChatAccountsTable? _dbChatAccounts;

  $DbChatAccountsTable get dbChatAccounts =>
      _dbChatAccounts ??= $DbChatAccountsTable(this);
  Index? _dbChatAccountsIndex;

  Index get dbChatAccountsIndex => _dbChatAccountsIndex ??= Index(
      'db_chat_accounts_index',
      'CREATE UNIQUE INDEX db_chat_accounts_index ON db_chat_accounts(chat_remote_id, account_remote_id);');
  $DbFiltersTable? _dbFilters;

  $DbFiltersTable get dbFilters => _dbFilters ??= $DbFiltersTable(this);
  Index? _dbFilterRemoteIdIndex;

  Index get dbFilterRemoteIdIndex => _dbFilterRemoteIdIndex ??= Index(
      'db_filter_remote_id_index',
      'CREATE UNIQUE INDEX db_filter_remote_id_index ON db_filters (remote_id);');
  $DbHomeTimelineStatusesTable? _dbHomeTimelineStatuses;

  $DbHomeTimelineStatusesTable get dbHomeTimelineStatuses =>
      _dbHomeTimelineStatuses ??= $DbHomeTimelineStatusesTable(this);
  $DbDraftStatusesTable? _dbDraftStatuses;

  $DbDraftStatusesTable get dbDraftStatuses =>
      _dbDraftStatuses ??= $DbDraftStatusesTable(this);
  StatusDao? _statusDao;

  StatusDao get statusDao => _statusDao ??= StatusDao(this as AppDatabase);
  StatusHashtagsDao? _statusHashtagsDao;

  StatusHashtagsDao get statusHashtagsDao =>
      _statusHashtagsDao ??= StatusHashtagsDao(this as AppDatabase);
  StatusListsDao? _statusListsDao;

  StatusListsDao get statusListsDao =>
      _statusListsDao ??= StatusListsDao(this as AppDatabase);
  AccountDao? _accountDao;

  AccountDao get accountDao => _accountDao ??= AccountDao(this as AppDatabase);
  AccountFollowingsDao? _accountFollowingsDao;

  AccountFollowingsDao get accountFollowingsDao =>
      _accountFollowingsDao ??= AccountFollowingsDao(this as AppDatabase);
  AccountFollowersDao? _accountFollowersDao;

  AccountFollowersDao get accountFollowersDao =>
      _accountFollowersDao ??= AccountFollowersDao(this as AppDatabase);
  ConversationDao? _conversationDao;

  ConversationDao get conversationDao =>
      _conversationDao ??= ConversationDao(this as AppDatabase);
  ConversationAccountsDao? _conversationAccountsDao;

  ConversationAccountsDao get conversationAccountsDao =>
      _conversationAccountsDao ??= ConversationAccountsDao(this as AppDatabase);
  ConversationStatusesDao? _conversationStatusesDao;

  ConversationStatusesDao get conversationStatusesDao =>
      _conversationStatusesDao ??= ConversationStatusesDao(this as AppDatabase);
  StatusFavouritedAccountsDao? _statusFavouritedAccountsDao;

  StatusFavouritedAccountsDao get statusFavouritedAccountsDao =>
      _statusFavouritedAccountsDao ??=
          StatusFavouritedAccountsDao(this as AppDatabase);
  StatusRebloggedAccountsDao? _statusRebloggedAccountsDao;

  StatusRebloggedAccountsDao get statusRebloggedAccountsDao =>
      _statusRebloggedAccountsDao ??=
          StatusRebloggedAccountsDao(this as AppDatabase);
  NotificationDao? _notificationDao;

  NotificationDao get notificationDao =>
      _notificationDao ??= NotificationDao(this as AppDatabase);
  ScheduledStatusDao? _scheduledStatusDao;

  ScheduledStatusDao get scheduledStatusDao =>
      _scheduledStatusDao ??= ScheduledStatusDao(this as AppDatabase);
  ChatDao? _chatDao;

  ChatDao get chatDao => _chatDao ??= ChatDao(this as AppDatabase);
  ChatAccountsDao? _chatAccountsDao;

  ChatAccountsDao get chatAccountsDao =>
      _chatAccountsDao ??= ChatAccountsDao(this as AppDatabase);
  ChatMessageDao? _chatMessageDao;

  ChatMessageDao get chatMessageDao =>
      _chatMessageDao ??= ChatMessageDao(this as AppDatabase);
  HomeTimelineStatusesDao? _homeTimelineStatusesDao;

  HomeTimelineStatusesDao get homeTimelineStatusesDao =>
      _homeTimelineStatusesDao ??= HomeTimelineStatusesDao(this as AppDatabase);
  DraftStatusDao? _draftStatusDao;

  DraftStatusDao get draftStatusDao =>
      _draftStatusDao ??= DraftStatusDao(this as AppDatabase);
  FilterDao? _filterDao;

  FilterDao get filterDao => _filterDao ??= FilterDao(this as AppDatabase);

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
        dbFilters,
        dbFilterRemoteIdIndex,
        dbHomeTimelineStatuses,
        dbDraftStatuses
      ];
}
