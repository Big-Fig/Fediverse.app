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
  final PleromaApiVisibility visibility;
  final String uri;
  final String? url;
  final int repliesCount;
  final int reblogsCount;
  final int favouritesCount;
  final bool favourited;
  final bool reblogged;
  final bool muted;
  final bool? bookmarked;
  final bool? pinned;
  final String? content;
  final String? reblogStatusRemoteId;
  final PleromaApiApplication? application;
  final String accountRemoteId;
  final List<PleromaApiMediaAttachment>? mediaAttachments;
  final List<PleromaApiMention>? mentions;
  final List<PleromaApiTag>? tags;
  final List<PleromaApiEmoji>? emojis;
  final PleromaApiPoll? poll;
  final PleromaApiCard? card;
  final String? language;
  final PleromaApiContent? pleromaContent;
  final int? pleromaConversationId;
  final int? pleromaDirectConversationId;
  final String? pleromaInReplyToAccountAcct;
  final bool? pleromaLocal;
  final PleromaApiContent? pleromaSpoilerText;
  final DateTime? pleromaExpiresAt;
  final bool? pleromaThreadMuted;
  final List<PleromaApiStatusEmojiReaction>? pleromaEmojiReactions;
  final bool? deleted;
  final bool? hiddenLocallyOnDevice;
  final PendingState? pendingState;
  final String? oldPendingRemoteId;
  final String? wasSentWithIdempotencyKey;
  DbStatus(
      {this.id,
      required this.remoteId,
      required this.createdAt,
      this.inReplyToRemoteId,
      this.inReplyToAccountRemoteId,
      required this.sensitive,
      this.spoilerText,
      required this.visibility,
      required this.uri,
      this.url,
      required this.repliesCount,
      required this.reblogsCount,
      required this.favouritesCount,
      required this.favourited,
      required this.reblogged,
      required this.muted,
      this.bookmarked,
      this.pinned,
      this.content,
      this.reblogStatusRemoteId,
      this.application,
      required this.accountRemoteId,
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
      this.pleromaEmojiReactions,
      this.deleted,
      this.hiddenLocallyOnDevice,
      this.pendingState,
      this.oldPendingRemoteId,
      this.wasSentWithIdempotencyKey});
  factory DbStatus.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbStatus(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      inReplyToRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}in_reply_to_remote_id']),
      inReplyToAccountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}in_reply_to_account_remote_id']),
      sensitive: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sensitive'])!,
      spoilerText: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}spoiler_text']),
      visibility: $DbStatusesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}visibility']))!,
      uri: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uri'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url']),
      repliesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}replies_count'])!,
      reblogsCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reblogs_count'])!,
      favouritesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favourites_count'])!,
      favourited: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}favourited'])!,
      reblogged: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reblogged'])!,
      muted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}muted'])!,
      bookmarked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bookmarked']),
      pinned: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pinned']),
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content']),
      reblogStatusRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}reblog_status_remote_id']),
      application: $DbStatusesTable.$converter1.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}application'])),
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
      mediaAttachments: $DbStatusesTable.$converter2.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachments'])),
      mentions: $DbStatusesTable.$converter3.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mentions'])),
      tags: $DbStatusesTable.$converter4.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tags'])),
      emojis: $DbStatusesTable.$converter5.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      poll: $DbStatusesTable.$converter6.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}poll'])),
      card: $DbStatusesTable.$converter7.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card'])),
      language: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
      pleromaContent: $DbStatusesTable.$converter8.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_content'])),
      pleromaConversationId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_conversation_id']),
      pleromaDirectConversationId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_direct_conversation_id']),
      pleromaInReplyToAccountAcct: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_in_reply_to_account_acct']),
      pleromaLocal: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_local']),
      pleromaSpoilerText: $DbStatusesTable.$converter9.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_spoiler_text'])),
      pleromaExpiresAt: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_expires_at']),
      pleromaThreadMuted: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_thread_muted']),
      pleromaEmojiReactions: $DbStatusesTable.$converter10.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_emoji_reactions'])),
      deleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
      hiddenLocallyOnDevice: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}hidden_locally_on_device']),
      pendingState: $DbStatusesTable.$converter11.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pending_state'])),
      oldPendingRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}old_pending_remote_id']),
      wasSentWithIdempotencyKey: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}was_sent_with_idempotency_key']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || inReplyToRemoteId != null) {
      map['in_reply_to_remote_id'] = Variable<String?>(inReplyToRemoteId);
    }
    if (!nullToAbsent || inReplyToAccountRemoteId != null) {
      map['in_reply_to_account_remote_id'] =
          Variable<String?>(inReplyToAccountRemoteId);
    }
    map['sensitive'] = Variable<bool>(sensitive);
    if (!nullToAbsent || spoilerText != null) {
      map['spoiler_text'] = Variable<String?>(spoilerText);
    }
    {
      final converter = $DbStatusesTable.$converter0;
      map['visibility'] = Variable<String>(converter.mapToSql(visibility)!);
    }
    map['uri'] = Variable<String>(uri);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String?>(url);
    }
    map['replies_count'] = Variable<int>(repliesCount);
    map['reblogs_count'] = Variable<int>(reblogsCount);
    map['favourites_count'] = Variable<int>(favouritesCount);
    map['favourited'] = Variable<bool>(favourited);
    map['reblogged'] = Variable<bool>(reblogged);
    map['muted'] = Variable<bool>(muted);
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
    map['account_remote_id'] = Variable<String>(accountRemoteId);
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
      final converter = $DbStatusesTable.$converter10;
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
      remoteId: Value(remoteId),
      createdAt: Value(createdAt),
      inReplyToRemoteId: inReplyToRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(inReplyToRemoteId),
      inReplyToAccountRemoteId: inReplyToAccountRemoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(inReplyToAccountRemoteId),
      sensitive: Value(sensitive),
      spoilerText: spoilerText == null && nullToAbsent
          ? const Value.absent()
          : Value(spoilerText),
      visibility: Value(visibility),
      uri: Value(uri),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      repliesCount: Value(repliesCount),
      reblogsCount: Value(reblogsCount),
      favouritesCount: Value(favouritesCount),
      favourited: Value(favourited),
      reblogged: Value(reblogged),
      muted: Value(muted),
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
      accountRemoteId: Value(accountRemoteId),
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
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      inReplyToRemoteId:
          serializer.fromJson<String?>(json['inReplyToRemoteId']),
      inReplyToAccountRemoteId:
          serializer.fromJson<String?>(json['inReplyToAccountRemoteId']),
      sensitive: serializer.fromJson<bool>(json['sensitive']),
      spoilerText: serializer.fromJson<String?>(json['spoilerText']),
      visibility: serializer.fromJson<PleromaApiVisibility>(json['visibility']),
      uri: serializer.fromJson<String>(json['uri']),
      url: serializer.fromJson<String?>(json['url']),
      repliesCount: serializer.fromJson<int>(json['repliesCount']),
      reblogsCount: serializer.fromJson<int>(json['reblogsCount']),
      favouritesCount: serializer.fromJson<int>(json['favouritesCount']),
      favourited: serializer.fromJson<bool>(json['favourited']),
      reblogged: serializer.fromJson<bool>(json['reblogged']),
      muted: serializer.fromJson<bool>(json['muted']),
      bookmarked: serializer.fromJson<bool?>(json['bookmarked']),
      pinned: serializer.fromJson<bool?>(json['pinned']),
      content: serializer.fromJson<String?>(json['content']),
      reblogStatusRemoteId:
          serializer.fromJson<String?>(json['reblogStatusRemoteId']),
      application:
          serializer.fromJson<PleromaApiApplication?>(json['application']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      mediaAttachments: serializer
          .fromJson<List<PleromaApiMediaAttachment>?>(json['mediaAttachments']),
      mentions: serializer.fromJson<List<PleromaApiMention>?>(json['mentions']),
      tags: serializer.fromJson<List<PleromaApiTag>?>(json['tags']),
      emojis: serializer.fromJson<List<PleromaApiEmoji>?>(json['emojis']),
      poll: serializer.fromJson<PleromaApiPoll?>(json['poll']),
      card: serializer.fromJson<PleromaApiCard?>(json['card']),
      language: serializer.fromJson<String?>(json['language']),
      pleromaContent:
          serializer.fromJson<PleromaApiContent?>(json['pleromaContent']),
      pleromaConversationId:
          serializer.fromJson<int?>(json['pleromaConversationId']),
      pleromaDirectConversationId:
          serializer.fromJson<int?>(json['pleromaDirectConversationId']),
      pleromaInReplyToAccountAcct:
          serializer.fromJson<String?>(json['pleromaInReplyToAccountAcct']),
      pleromaLocal: serializer.fromJson<bool?>(json['pleromaLocal']),
      pleromaSpoilerText:
          serializer.fromJson<PleromaApiContent?>(json['pleromaSpoilerText']),
      pleromaExpiresAt:
          serializer.fromJson<DateTime?>(json['pleromaExpiresAt']),
      pleromaThreadMuted:
          serializer.fromJson<bool?>(json['pleromaThreadMuted']),
      pleromaEmojiReactions:
          serializer.fromJson<List<PleromaApiStatusEmojiReaction>?>(
              json['pleromaEmojiReactions']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      hiddenLocallyOnDevice:
          serializer.fromJson<bool?>(json['hiddenLocallyOnDevice']),
      pendingState: serializer.fromJson<PendingState?>(json['pendingState']),
      oldPendingRemoteId:
          serializer.fromJson<String?>(json['oldPendingRemoteId']),
      wasSentWithIdempotencyKey:
          serializer.fromJson<String?>(json['wasSentWithIdempotencyKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'inReplyToRemoteId': serializer.toJson<String?>(inReplyToRemoteId),
      'inReplyToAccountRemoteId':
          serializer.toJson<String?>(inReplyToAccountRemoteId),
      'sensitive': serializer.toJson<bool>(sensitive),
      'spoilerText': serializer.toJson<String?>(spoilerText),
      'visibility': serializer.toJson<PleromaApiVisibility>(visibility),
      'uri': serializer.toJson<String>(uri),
      'url': serializer.toJson<String?>(url),
      'repliesCount': serializer.toJson<int>(repliesCount),
      'reblogsCount': serializer.toJson<int>(reblogsCount),
      'favouritesCount': serializer.toJson<int>(favouritesCount),
      'favourited': serializer.toJson<bool>(favourited),
      'reblogged': serializer.toJson<bool>(reblogged),
      'muted': serializer.toJson<bool>(muted),
      'bookmarked': serializer.toJson<bool?>(bookmarked),
      'pinned': serializer.toJson<bool?>(pinned),
      'content': serializer.toJson<String?>(content),
      'reblogStatusRemoteId': serializer.toJson<String?>(reblogStatusRemoteId),
      'application': serializer.toJson<PleromaApiApplication?>(application),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'mediaAttachments':
          serializer.toJson<List<PleromaApiMediaAttachment>?>(mediaAttachments),
      'mentions': serializer.toJson<List<PleromaApiMention>?>(mentions),
      'tags': serializer.toJson<List<PleromaApiTag>?>(tags),
      'emojis': serializer.toJson<List<PleromaApiEmoji>?>(emojis),
      'poll': serializer.toJson<PleromaApiPoll?>(poll),
      'card': serializer.toJson<PleromaApiCard?>(card),
      'language': serializer.toJson<String?>(language),
      'pleromaContent': serializer.toJson<PleromaApiContent?>(pleromaContent),
      'pleromaConversationId': serializer.toJson<int?>(pleromaConversationId),
      'pleromaDirectConversationId':
          serializer.toJson<int?>(pleromaDirectConversationId),
      'pleromaInReplyToAccountAcct':
          serializer.toJson<String?>(pleromaInReplyToAccountAcct),
      'pleromaLocal': serializer.toJson<bool?>(pleromaLocal),
      'pleromaSpoilerText':
          serializer.toJson<PleromaApiContent?>(pleromaSpoilerText),
      'pleromaExpiresAt': serializer.toJson<DateTime?>(pleromaExpiresAt),
      'pleromaThreadMuted': serializer.toJson<bool?>(pleromaThreadMuted),
      'pleromaEmojiReactions': serializer
          .toJson<List<PleromaApiStatusEmojiReaction>?>(pleromaEmojiReactions),
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
          PleromaApiVisibility? visibility,
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
          PleromaApiApplication? application,
          String? accountRemoteId,
          List<PleromaApiMediaAttachment>? mediaAttachments,
          List<PleromaApiMention>? mentions,
          List<PleromaApiTag>? tags,
          List<PleromaApiEmoji>? emojis,
          PleromaApiPoll? poll,
          PleromaApiCard? card,
          String? language,
          PleromaApiContent? pleromaContent,
          int? pleromaConversationId,
          int? pleromaDirectConversationId,
          String? pleromaInReplyToAccountAcct,
          bool? pleromaLocal,
          PleromaApiContent? pleromaSpoilerText,
          DateTime? pleromaExpiresAt,
          bool? pleromaThreadMuted,
          List<PleromaApiStatusEmojiReaction>? pleromaEmojiReactions,
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<DateTime> createdAt;
  final Value<String?> inReplyToRemoteId;
  final Value<String?> inReplyToAccountRemoteId;
  final Value<bool> sensitive;
  final Value<String?> spoilerText;
  final Value<PleromaApiVisibility> visibility;
  final Value<String> uri;
  final Value<String?> url;
  final Value<int> repliesCount;
  final Value<int> reblogsCount;
  final Value<int> favouritesCount;
  final Value<bool> favourited;
  final Value<bool> reblogged;
  final Value<bool> muted;
  final Value<bool?> bookmarked;
  final Value<bool?> pinned;
  final Value<String?> content;
  final Value<String?> reblogStatusRemoteId;
  final Value<PleromaApiApplication?> application;
  final Value<String> accountRemoteId;
  final Value<List<PleromaApiMediaAttachment>?> mediaAttachments;
  final Value<List<PleromaApiMention>?> mentions;
  final Value<List<PleromaApiTag>?> tags;
  final Value<List<PleromaApiEmoji>?> emojis;
  final Value<PleromaApiPoll?> poll;
  final Value<PleromaApiCard?> card;
  final Value<String?> language;
  final Value<PleromaApiContent?> pleromaContent;
  final Value<int?> pleromaConversationId;
  final Value<int?> pleromaDirectConversationId;
  final Value<String?> pleromaInReplyToAccountAcct;
  final Value<bool?> pleromaLocal;
  final Value<PleromaApiContent?> pleromaSpoilerText;
  final Value<DateTime?> pleromaExpiresAt;
  final Value<bool?> pleromaThreadMuted;
  final Value<List<PleromaApiStatusEmojiReaction>?> pleromaEmojiReactions;
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
    this.spoilerText = const Value.absent(),
    required PleromaApiVisibility visibility,
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
        visibility = Value(visibility),
        uri = Value(uri),
        repliesCount = Value(repliesCount),
        reblogsCount = Value(reblogsCount),
        favouritesCount = Value(favouritesCount),
        accountRemoteId = Value(accountRemoteId);
  static Insertable<DbStatus> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<DateTime>? createdAt,
    Expression<String?>? inReplyToRemoteId,
    Expression<String?>? inReplyToAccountRemoteId,
    Expression<bool>? sensitive,
    Expression<String?>? spoilerText,
    Expression<PleromaApiVisibility>? visibility,
    Expression<String>? uri,
    Expression<String?>? url,
    Expression<int>? repliesCount,
    Expression<int>? reblogsCount,
    Expression<int>? favouritesCount,
    Expression<bool>? favourited,
    Expression<bool>? reblogged,
    Expression<bool>? muted,
    Expression<bool?>? bookmarked,
    Expression<bool?>? pinned,
    Expression<String?>? content,
    Expression<String?>? reblogStatusRemoteId,
    Expression<PleromaApiApplication?>? application,
    Expression<String>? accountRemoteId,
    Expression<List<PleromaApiMediaAttachment>?>? mediaAttachments,
    Expression<List<PleromaApiMention>?>? mentions,
    Expression<List<PleromaApiTag>?>? tags,
    Expression<List<PleromaApiEmoji>?>? emojis,
    Expression<PleromaApiPoll?>? poll,
    Expression<PleromaApiCard?>? card,
    Expression<String?>? language,
    Expression<PleromaApiContent?>? pleromaContent,
    Expression<int?>? pleromaConversationId,
    Expression<int?>? pleromaDirectConversationId,
    Expression<String?>? pleromaInReplyToAccountAcct,
    Expression<bool?>? pleromaLocal,
    Expression<PleromaApiContent?>? pleromaSpoilerText,
    Expression<DateTime?>? pleromaExpiresAt,
    Expression<bool?>? pleromaThreadMuted,
    Expression<List<PleromaApiStatusEmojiReaction>?>? pleromaEmojiReactions,
    Expression<bool?>? deleted,
    Expression<bool?>? hiddenLocallyOnDevice,
    Expression<PendingState?>? pendingState,
    Expression<String?>? oldPendingRemoteId,
    Expression<String?>? wasSentWithIdempotencyKey,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<DateTime>? createdAt,
      Value<String?>? inReplyToRemoteId,
      Value<String?>? inReplyToAccountRemoteId,
      Value<bool>? sensitive,
      Value<String?>? spoilerText,
      Value<PleromaApiVisibility>? visibility,
      Value<String>? uri,
      Value<String?>? url,
      Value<int>? repliesCount,
      Value<int>? reblogsCount,
      Value<int>? favouritesCount,
      Value<bool>? favourited,
      Value<bool>? reblogged,
      Value<bool>? muted,
      Value<bool?>? bookmarked,
      Value<bool?>? pinned,
      Value<String?>? content,
      Value<String?>? reblogStatusRemoteId,
      Value<PleromaApiApplication?>? application,
      Value<String>? accountRemoteId,
      Value<List<PleromaApiMediaAttachment>?>? mediaAttachments,
      Value<List<PleromaApiMention>?>? mentions,
      Value<List<PleromaApiTag>?>? tags,
      Value<List<PleromaApiEmoji>?>? emojis,
      Value<PleromaApiPoll?>? poll,
      Value<PleromaApiCard?>? card,
      Value<String?>? language,
      Value<PleromaApiContent?>? pleromaContent,
      Value<int?>? pleromaConversationId,
      Value<int?>? pleromaDirectConversationId,
      Value<String?>? pleromaInReplyToAccountAcct,
      Value<bool?>? pleromaLocal,
      Value<PleromaApiContent?>? pleromaSpoilerText,
      Value<DateTime?>? pleromaExpiresAt,
      Value<bool?>? pleromaThreadMuted,
      Value<List<PleromaApiStatusEmojiReaction>?>? pleromaEmojiReactions,
      Value<bool?>? deleted,
      Value<bool?>? hiddenLocallyOnDevice,
      Value<PendingState?>? pendingState,
      Value<String?>? oldPendingRemoteId,
      Value<String?>? wasSentWithIdempotencyKey}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (inReplyToRemoteId.present) {
      map['in_reply_to_remote_id'] = Variable<String?>(inReplyToRemoteId.value);
    }
    if (inReplyToAccountRemoteId.present) {
      map['in_reply_to_account_remote_id'] =
          Variable<String?>(inReplyToAccountRemoteId.value);
    }
    if (sensitive.present) {
      map['sensitive'] = Variable<bool>(sensitive.value);
    }
    if (spoilerText.present) {
      map['spoiler_text'] = Variable<String?>(spoilerText.value);
    }
    if (visibility.present) {
      final converter = $DbStatusesTable.$converter0;
      map['visibility'] =
          Variable<String>(converter.mapToSql(visibility.value)!);
    }
    if (uri.present) {
      map['uri'] = Variable<String>(uri.value);
    }
    if (url.present) {
      map['url'] = Variable<String?>(url.value);
    }
    if (repliesCount.present) {
      map['replies_count'] = Variable<int>(repliesCount.value);
    }
    if (reblogsCount.present) {
      map['reblogs_count'] = Variable<int>(reblogsCount.value);
    }
    if (favouritesCount.present) {
      map['favourites_count'] = Variable<int>(favouritesCount.value);
    }
    if (favourited.present) {
      map['favourited'] = Variable<bool>(favourited.value);
    }
    if (reblogged.present) {
      map['reblogged'] = Variable<bool>(reblogged.value);
    }
    if (muted.present) {
      map['muted'] = Variable<bool>(muted.value);
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
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
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
      final converter = $DbStatusesTable.$converter10;
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inReplyToRemoteIdMeta =
      const VerificationMeta('inReplyToRemoteId');
  @override
  late final GeneratedTextColumn inReplyToRemoteId =
      _constructInReplyToRemoteId();
  GeneratedTextColumn _constructInReplyToRemoteId() {
    return GeneratedTextColumn(
      'in_reply_to_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _inReplyToAccountRemoteIdMeta =
      const VerificationMeta('inReplyToAccountRemoteId');
  @override
  late final GeneratedTextColumn inReplyToAccountRemoteId =
      _constructInReplyToAccountRemoteId();
  GeneratedTextColumn _constructInReplyToAccountRemoteId() {
    return GeneratedTextColumn(
      'in_reply_to_account_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _sensitiveMeta = const VerificationMeta('sensitive');
  @override
  late final GeneratedBoolColumn sensitive = _constructSensitive();
  GeneratedBoolColumn _constructSensitive() {
    return GeneratedBoolColumn(
      'sensitive',
      $tableName,
      false,
    );
  }

  final VerificationMeta _spoilerTextMeta =
      const VerificationMeta('spoilerText');
  @override
  late final GeneratedTextColumn spoilerText = _constructSpoilerText();
  GeneratedTextColumn _constructSpoilerText() {
    return GeneratedTextColumn(
      'spoiler_text',
      $tableName,
      true,
    );
  }

  final VerificationMeta _visibilityMeta = const VerificationMeta('visibility');
  @override
  late final GeneratedTextColumn visibility = _constructVisibility();
  GeneratedTextColumn _constructVisibility() {
    return GeneratedTextColumn(
      'visibility',
      $tableName,
      false,
    );
  }

  final VerificationMeta _uriMeta = const VerificationMeta('uri');
  @override
  late final GeneratedTextColumn uri = _constructUri();
  GeneratedTextColumn _constructUri() {
    return GeneratedTextColumn(
      'uri',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedTextColumn url = _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _repliesCountMeta =
      const VerificationMeta('repliesCount');
  @override
  late final GeneratedIntColumn repliesCount = _constructRepliesCount();
  GeneratedIntColumn _constructRepliesCount() {
    return GeneratedIntColumn(
      'replies_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reblogsCountMeta =
      const VerificationMeta('reblogsCount');
  @override
  late final GeneratedIntColumn reblogsCount = _constructReblogsCount();
  GeneratedIntColumn _constructReblogsCount() {
    return GeneratedIntColumn(
      'reblogs_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _favouritesCountMeta =
      const VerificationMeta('favouritesCount');
  @override
  late final GeneratedIntColumn favouritesCount = _constructFavouritesCount();
  GeneratedIntColumn _constructFavouritesCount() {
    return GeneratedIntColumn(
      'favourites_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _favouritedMeta = const VerificationMeta('favourited');
  @override
  late final GeneratedBoolColumn favourited = _constructFavourited();
  GeneratedBoolColumn _constructFavourited() {
    return GeneratedBoolColumn('favourited', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _rebloggedMeta = const VerificationMeta('reblogged');
  @override
  late final GeneratedBoolColumn reblogged = _constructReblogged();
  GeneratedBoolColumn _constructReblogged() {
    return GeneratedBoolColumn('reblogged', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _mutedMeta = const VerificationMeta('muted');
  @override
  late final GeneratedBoolColumn muted = _constructMuted();
  GeneratedBoolColumn _constructMuted() {
    return GeneratedBoolColumn('muted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _bookmarkedMeta = const VerificationMeta('bookmarked');
  @override
  late final GeneratedBoolColumn bookmarked = _constructBookmarked();
  GeneratedBoolColumn _constructBookmarked() {
    return GeneratedBoolColumn(
      'bookmarked',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedBoolColumn pinned = _constructPinned();
  GeneratedBoolColumn _constructPinned() {
    return GeneratedBoolColumn(
      'pinned',
      $tableName,
      true,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _reblogStatusRemoteIdMeta =
      const VerificationMeta('reblogStatusRemoteId');
  @override
  late final GeneratedTextColumn reblogStatusRemoteId =
      _constructReblogStatusRemoteId();
  GeneratedTextColumn _constructReblogStatusRemoteId() {
    return GeneratedTextColumn(
      'reblog_status_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _applicationMeta =
      const VerificationMeta('application');
  @override
  late final GeneratedTextColumn application = _constructApplication();
  GeneratedTextColumn _constructApplication() {
    return GeneratedTextColumn(
      'application',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn(
      'account_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mediaAttachmentsMeta =
      const VerificationMeta('mediaAttachments');
  @override
  late final GeneratedTextColumn mediaAttachments =
      _constructMediaAttachments();
  GeneratedTextColumn _constructMediaAttachments() {
    return GeneratedTextColumn(
      'media_attachments',
      $tableName,
      true,
    );
  }

  final VerificationMeta _mentionsMeta = const VerificationMeta('mentions');
  @override
  late final GeneratedTextColumn mentions = _constructMentions();
  GeneratedTextColumn _constructMentions() {
    return GeneratedTextColumn(
      'mentions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedTextColumn tags = _constructTags();
  GeneratedTextColumn _constructTags() {
    return GeneratedTextColumn(
      'tags',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emojisMeta = const VerificationMeta('emojis');
  @override
  late final GeneratedTextColumn emojis = _constructEmojis();
  GeneratedTextColumn _constructEmojis() {
    return GeneratedTextColumn(
      'emojis',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pollMeta = const VerificationMeta('poll');
  @override
  late final GeneratedTextColumn poll = _constructPoll();
  GeneratedTextColumn _constructPoll() {
    return GeneratedTextColumn(
      'poll',
      $tableName,
      true,
    );
  }

  final VerificationMeta _cardMeta = const VerificationMeta('card');
  @override
  late final GeneratedTextColumn card = _constructCard();
  GeneratedTextColumn _constructCard() {
    return GeneratedTextColumn(
      'card',
      $tableName,
      true,
    );
  }

  final VerificationMeta _languageMeta = const VerificationMeta('language');
  @override
  late final GeneratedTextColumn language = _constructLanguage();
  GeneratedTextColumn _constructLanguage() {
    return GeneratedTextColumn(
      'language',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaContentMeta =
      const VerificationMeta('pleromaContent');
  @override
  late final GeneratedTextColumn pleromaContent = _constructPleromaContent();
  GeneratedTextColumn _constructPleromaContent() {
    return GeneratedTextColumn(
      'pleroma_content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaConversationIdMeta =
      const VerificationMeta('pleromaConversationId');
  @override
  late final GeneratedIntColumn pleromaConversationId =
      _constructPleromaConversationId();
  GeneratedIntColumn _constructPleromaConversationId() {
    return GeneratedIntColumn(
      'pleroma_conversation_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaDirectConversationIdMeta =
      const VerificationMeta('pleromaDirectConversationId');
  @override
  late final GeneratedIntColumn pleromaDirectConversationId =
      _constructPleromaDirectConversationId();
  GeneratedIntColumn _constructPleromaDirectConversationId() {
    return GeneratedIntColumn(
      'pleroma_direct_conversation_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaInReplyToAccountAcctMeta =
      const VerificationMeta('pleromaInReplyToAccountAcct');
  @override
  late final GeneratedTextColumn pleromaInReplyToAccountAcct =
      _constructPleromaInReplyToAccountAcct();
  GeneratedTextColumn _constructPleromaInReplyToAccountAcct() {
    return GeneratedTextColumn(
      'pleroma_in_reply_to_account_acct',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaLocalMeta =
      const VerificationMeta('pleromaLocal');
  @override
  late final GeneratedBoolColumn pleromaLocal = _constructPleromaLocal();
  GeneratedBoolColumn _constructPleromaLocal() {
    return GeneratedBoolColumn(
      'pleroma_local',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaSpoilerTextMeta =
      const VerificationMeta('pleromaSpoilerText');
  @override
  late final GeneratedTextColumn pleromaSpoilerText =
      _constructPleromaSpoilerText();
  GeneratedTextColumn _constructPleromaSpoilerText() {
    return GeneratedTextColumn(
      'pleroma_spoiler_text',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaExpiresAtMeta =
      const VerificationMeta('pleromaExpiresAt');
  @override
  late final GeneratedDateTimeColumn pleromaExpiresAt =
      _constructPleromaExpiresAt();
  GeneratedDateTimeColumn _constructPleromaExpiresAt() {
    return GeneratedDateTimeColumn(
      'pleroma_expires_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaThreadMutedMeta =
      const VerificationMeta('pleromaThreadMuted');
  @override
  late final GeneratedBoolColumn pleromaThreadMuted =
      _constructPleromaThreadMuted();
  GeneratedBoolColumn _constructPleromaThreadMuted() {
    return GeneratedBoolColumn(
      'pleroma_thread_muted',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaEmojiReactionsMeta =
      const VerificationMeta('pleromaEmojiReactions');
  @override
  late final GeneratedTextColumn pleromaEmojiReactions =
      _constructPleromaEmojiReactions();
  GeneratedTextColumn _constructPleromaEmojiReactions() {
    return GeneratedTextColumn(
      'pleroma_emoji_reactions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  @override
  late final GeneratedBoolColumn deleted = _constructDeleted();
  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn(
      'deleted',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hiddenLocallyOnDeviceMeta =
      const VerificationMeta('hiddenLocallyOnDevice');
  @override
  late final GeneratedBoolColumn hiddenLocallyOnDevice =
      _constructHiddenLocallyOnDevice();
  GeneratedBoolColumn _constructHiddenLocallyOnDevice() {
    return GeneratedBoolColumn(
      'hidden_locally_on_device',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pendingStateMeta =
      const VerificationMeta('pendingState');
  @override
  late final GeneratedTextColumn pendingState = _constructPendingState();
  GeneratedTextColumn _constructPendingState() {
    return GeneratedTextColumn(
      'pending_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _oldPendingRemoteIdMeta =
      const VerificationMeta('oldPendingRemoteId');
  @override
  late final GeneratedTextColumn oldPendingRemoteId =
      _constructOldPendingRemoteId();
  GeneratedTextColumn _constructOldPendingRemoteId() {
    return GeneratedTextColumn(
      'old_pending_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _wasSentWithIdempotencyKeyMeta =
      const VerificationMeta('wasSentWithIdempotencyKey');
  @override
  late final GeneratedTextColumn wasSentWithIdempotencyKey =
      _constructWasSentWithIdempotencyKey();
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
    return DbStatus.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbStatusesTable createAlias(String alias) {
    return $DbStatusesTable(_db, alias);
  }

  static TypeConverter<PleromaApiVisibility, String> $converter0 =
      PleromaApiVisibilityTypeConverter();
  static TypeConverter<PleromaApiApplication, String> $converter1 =
      PleromaApplicationDatabaseConverter();
  static TypeConverter<List<PleromaApiMediaAttachment>, String> $converter2 =
      PleromaMediaAttachmentListDatabaseConverter();
  static TypeConverter<List<PleromaApiMention>, String> $converter3 =
      PleromaMentionListDatabaseConverter();
  static TypeConverter<List<PleromaApiTag>, String> $converter4 =
      PleromaApiTagListDatabaseConverter();
  static TypeConverter<List<PleromaApiEmoji>, String> $converter5 =
      PleromaApiEmojiListDatabaseConverter();
  static TypeConverter<PleromaApiPoll, String> $converter6 =
      PleromaPollDatabaseConverter();
  static TypeConverter<PleromaApiCard, String> $converter7 =
      PleromaCardDatabaseConverter();
  static TypeConverter<PleromaApiContent, String> $converter8 =
      PleromaContentDatabaseConverter();
  static TypeConverter<PleromaApiContent, String> $converter9 =
      PleromaContentDatabaseConverter();
  static TypeConverter<List<PleromaApiStatusEmojiReaction>, String>
      $converter10 = PleromaEmojiReactionsListDatabaseConverter();
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
  final bool? bot;
  final String avatarStatic;
  final String avatar;
  final String acct;
  final DateTime? lastStatusAt;
  final List<PleromaApiField>? fields;
  final List<PleromaApiEmoji>? emojis;
  final String? pleromaBackgroundImage;
  final List<PleromaApiTag>? pleromaTags;
  final PleromaApiAccountRelationship? pleromaRelationship;
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
  DbAccount(
      {this.id,
      required this.remoteId,
      required this.username,
      required this.url,
      this.note,
      required this.locked,
      required this.headerStatic,
      required this.header,
      required this.followingCount,
      required this.followersCount,
      required this.statusesCount,
      this.displayName,
      required this.createdAt,
      this.bot,
      required this.avatarStatic,
      required this.avatar,
      required this.acct,
      this.lastStatusAt,
      this.fields,
      this.emojis,
      this.pleromaBackgroundImage,
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
      this.pleromaSkipThreadContainment,
      this.pleromaAcceptsChatMessages});
  factory DbAccount.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbAccount(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      note: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}note']),
      locked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}locked'])!,
      headerStatic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}header_static'])!,
      header: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}header'])!,
      followingCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}following_count'])!,
      followersCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}followers_count'])!,
      statusesCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}statuses_count'])!,
      displayName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}display_name']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      bot: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bot']),
      avatarStatic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar_static'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      acct: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}acct'])!,
      lastStatusAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_status_at']),
      fields: $DbAccountsTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fields'])),
      emojis: $DbAccountsTable.$converter1.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      pleromaBackgroundImage: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_background_image']),
      pleromaTags: $DbAccountsTable.$converter2.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_tags'])),
      pleromaRelationship: $DbAccountsTable.$converter3.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}pleroma_relationship'])),
      pleromaIsAdmin: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma_is_admin']),
      pleromaIsModerator: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_is_moderator']),
      pleromaConfirmationPending: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_confirmation_pending']),
      pleromaHideFavorites: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_favorites']),
      pleromaHideFollowers: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_followers']),
      pleromaHideFollows: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_follows']),
      pleromaHideFollowersCount: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_followers_count']),
      pleromaHideFollowsCount: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_hide_follows_count']),
      pleromaDeactivated: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_deactivated']),
      pleromaAllowFollowingMove: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_allow_following_move']),
      pleromaSkipThreadContainment: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_skip_thread_containment']),
      pleromaAcceptsChatMessages: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}pleroma_accepts_chat_messages']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['username'] = Variable<String>(username);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String?>(note);
    }
    map['locked'] = Variable<bool>(locked);
    map['header_static'] = Variable<String>(headerStatic);
    map['header'] = Variable<String>(header);
    map['following_count'] = Variable<int>(followingCount);
    map['followers_count'] = Variable<int>(followersCount);
    map['statuses_count'] = Variable<int>(statusesCount);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String?>(displayName);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || bot != null) {
      map['bot'] = Variable<bool?>(bot);
    }
    map['avatar_static'] = Variable<String>(avatarStatic);
    map['avatar'] = Variable<String>(avatar);
    map['acct'] = Variable<String>(acct);
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
      remoteId: Value(remoteId),
      username: Value(username),
      url: Value(url),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      locked: Value(locked),
      headerStatic: Value(headerStatic),
      header: Value(header),
      followingCount: Value(followingCount),
      followersCount: Value(followersCount),
      statusesCount: Value(statusesCount),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      createdAt: Value(createdAt),
      bot: bot == null && nullToAbsent ? const Value.absent() : Value(bot),
      avatarStatic: Value(avatarStatic),
      avatar: Value(avatar),
      acct: Value(acct),
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
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      username: serializer.fromJson<String>(json['username']),
      url: serializer.fromJson<String>(json['url']),
      note: serializer.fromJson<String?>(json['note']),
      locked: serializer.fromJson<bool>(json['locked']),
      headerStatic: serializer.fromJson<String>(json['headerStatic']),
      header: serializer.fromJson<String>(json['header']),
      followingCount: serializer.fromJson<int>(json['followingCount']),
      followersCount: serializer.fromJson<int>(json['followersCount']),
      statusesCount: serializer.fromJson<int>(json['statusesCount']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      bot: serializer.fromJson<bool?>(json['bot']),
      avatarStatic: serializer.fromJson<String>(json['avatarStatic']),
      avatar: serializer.fromJson<String>(json['avatar']),
      acct: serializer.fromJson<String>(json['acct']),
      lastStatusAt: serializer.fromJson<DateTime?>(json['lastStatusAt']),
      fields: serializer.fromJson<List<PleromaApiField>?>(json['fields']),
      emojis: serializer.fromJson<List<PleromaApiEmoji>?>(json['emojis']),
      pleromaBackgroundImage:
          serializer.fromJson<String?>(json['pleromaBackgroundImage']),
      pleromaTags:
          serializer.fromJson<List<PleromaApiTag>?>(json['pleromaTags']),
      pleromaRelationship: serializer.fromJson<PleromaApiAccountRelationship?>(
          json['pleromaRelationship']),
      pleromaIsAdmin: serializer.fromJson<bool?>(json['pleromaIsAdmin']),
      pleromaIsModerator:
          serializer.fromJson<bool?>(json['pleromaIsModerator']),
      pleromaConfirmationPending:
          serializer.fromJson<bool?>(json['pleromaConfirmationPending']),
      pleromaHideFavorites:
          serializer.fromJson<bool?>(json['pleromaHideFavorites']),
      pleromaHideFollowers:
          serializer.fromJson<bool?>(json['pleromaHideFollowers']),
      pleromaHideFollows:
          serializer.fromJson<bool?>(json['pleromaHideFollows']),
      pleromaHideFollowersCount:
          serializer.fromJson<bool?>(json['pleromaHideFollowersCount']),
      pleromaHideFollowsCount:
          serializer.fromJson<bool?>(json['pleromaHideFollowsCount']),
      pleromaDeactivated:
          serializer.fromJson<bool?>(json['pleromaDeactivated']),
      pleromaAllowFollowingMove:
          serializer.fromJson<bool?>(json['pleromaAllowFollowingMove']),
      pleromaSkipThreadContainment:
          serializer.fromJson<bool?>(json['pleromaSkipThreadContainment']),
      pleromaAcceptsChatMessages:
          serializer.fromJson<bool?>(json['pleromaAcceptsChatMessages']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'username': serializer.toJson<String>(username),
      'url': serializer.toJson<String>(url),
      'note': serializer.toJson<String?>(note),
      'locked': serializer.toJson<bool>(locked),
      'headerStatic': serializer.toJson<String>(headerStatic),
      'header': serializer.toJson<String>(header),
      'followingCount': serializer.toJson<int>(followingCount),
      'followersCount': serializer.toJson<int>(followersCount),
      'statusesCount': serializer.toJson<int>(statusesCount),
      'displayName': serializer.toJson<String?>(displayName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'bot': serializer.toJson<bool?>(bot),
      'avatarStatic': serializer.toJson<String>(avatarStatic),
      'avatar': serializer.toJson<String>(avatar),
      'acct': serializer.toJson<String>(acct),
      'lastStatusAt': serializer.toJson<DateTime?>(lastStatusAt),
      'fields': serializer.toJson<List<PleromaApiField>?>(fields),
      'emojis': serializer.toJson<List<PleromaApiEmoji>?>(emojis),
      'pleromaBackgroundImage':
          serializer.toJson<String?>(pleromaBackgroundImage),
      'pleromaTags': serializer.toJson<List<PleromaApiTag>?>(pleromaTags),
      'pleromaRelationship': serializer
          .toJson<PleromaApiAccountRelationship?>(pleromaRelationship),
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
          List<PleromaApiField>? fields,
          List<PleromaApiEmoji>? emojis,
          String? pleromaBackgroundImage,
          List<PleromaApiTag>? pleromaTags,
          PleromaApiAccountRelationship? pleromaRelationship,
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<String> username;
  final Value<String> url;
  final Value<String?> note;
  final Value<bool> locked;
  final Value<String> headerStatic;
  final Value<String> header;
  final Value<int> followingCount;
  final Value<int> followersCount;
  final Value<int> statusesCount;
  final Value<String?> displayName;
  final Value<DateTime> createdAt;
  final Value<bool?> bot;
  final Value<String> avatarStatic;
  final Value<String> avatar;
  final Value<String> acct;
  final Value<DateTime?> lastStatusAt;
  final Value<List<PleromaApiField>?> fields;
  final Value<List<PleromaApiEmoji>?> emojis;
  final Value<String?> pleromaBackgroundImage;
  final Value<List<PleromaApiTag>?> pleromaTags;
  final Value<PleromaApiAccountRelationship?> pleromaRelationship;
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
    this.note = const Value.absent(),
    required bool locked,
    required String headerStatic,
    required String header,
    required int followingCount,
    required int followersCount,
    required int statusesCount,
    this.displayName = const Value.absent(),
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
        locked = Value(locked),
        headerStatic = Value(headerStatic),
        header = Value(header),
        followingCount = Value(followingCount),
        followersCount = Value(followersCount),
        statusesCount = Value(statusesCount),
        createdAt = Value(createdAt),
        avatarStatic = Value(avatarStatic),
        avatar = Value(avatar),
        acct = Value(acct);
  static Insertable<DbAccount> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<String>? username,
    Expression<String>? url,
    Expression<String?>? note,
    Expression<bool>? locked,
    Expression<String>? headerStatic,
    Expression<String>? header,
    Expression<int>? followingCount,
    Expression<int>? followersCount,
    Expression<int>? statusesCount,
    Expression<String?>? displayName,
    Expression<DateTime>? createdAt,
    Expression<bool?>? bot,
    Expression<String>? avatarStatic,
    Expression<String>? avatar,
    Expression<String>? acct,
    Expression<DateTime?>? lastStatusAt,
    Expression<List<PleromaApiField>?>? fields,
    Expression<List<PleromaApiEmoji>?>? emojis,
    Expression<String?>? pleromaBackgroundImage,
    Expression<List<PleromaApiTag>?>? pleromaTags,
    Expression<PleromaApiAccountRelationship?>? pleromaRelationship,
    Expression<bool?>? pleromaIsAdmin,
    Expression<bool?>? pleromaIsModerator,
    Expression<bool?>? pleromaConfirmationPending,
    Expression<bool?>? pleromaHideFavorites,
    Expression<bool?>? pleromaHideFollowers,
    Expression<bool?>? pleromaHideFollows,
    Expression<bool?>? pleromaHideFollowersCount,
    Expression<bool?>? pleromaHideFollowsCount,
    Expression<bool?>? pleromaDeactivated,
    Expression<bool?>? pleromaAllowFollowingMove,
    Expression<bool?>? pleromaSkipThreadContainment,
    Expression<bool?>? pleromaAcceptsChatMessages,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<String>? username,
      Value<String>? url,
      Value<String?>? note,
      Value<bool>? locked,
      Value<String>? headerStatic,
      Value<String>? header,
      Value<int>? followingCount,
      Value<int>? followersCount,
      Value<int>? statusesCount,
      Value<String?>? displayName,
      Value<DateTime>? createdAt,
      Value<bool?>? bot,
      Value<String>? avatarStatic,
      Value<String>? avatar,
      Value<String>? acct,
      Value<DateTime?>? lastStatusAt,
      Value<List<PleromaApiField>?>? fields,
      Value<List<PleromaApiEmoji>?>? emojis,
      Value<String?>? pleromaBackgroundImage,
      Value<List<PleromaApiTag>?>? pleromaTags,
      Value<PleromaApiAccountRelationship?>? pleromaRelationship,
      Value<bool?>? pleromaIsAdmin,
      Value<bool?>? pleromaIsModerator,
      Value<bool?>? pleromaConfirmationPending,
      Value<bool?>? pleromaHideFavorites,
      Value<bool?>? pleromaHideFollowers,
      Value<bool?>? pleromaHideFollows,
      Value<bool?>? pleromaHideFollowersCount,
      Value<bool?>? pleromaHideFollowsCount,
      Value<bool?>? pleromaDeactivated,
      Value<bool?>? pleromaAllowFollowingMove,
      Value<bool?>? pleromaSkipThreadContainment,
      Value<bool?>? pleromaAcceptsChatMessages}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (note.present) {
      map['note'] = Variable<String?>(note.value);
    }
    if (locked.present) {
      map['locked'] = Variable<bool>(locked.value);
    }
    if (headerStatic.present) {
      map['header_static'] = Variable<String>(headerStatic.value);
    }
    if (header.present) {
      map['header'] = Variable<String>(header.value);
    }
    if (followingCount.present) {
      map['following_count'] = Variable<int>(followingCount.value);
    }
    if (followersCount.present) {
      map['followers_count'] = Variable<int>(followersCount.value);
    }
    if (statusesCount.present) {
      map['statuses_count'] = Variable<int>(statusesCount.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String?>(displayName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (bot.present) {
      map['bot'] = Variable<bool?>(bot.value);
    }
    if (avatarStatic.present) {
      map['avatar_static'] = Variable<String>(avatarStatic.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (acct.present) {
      map['acct'] = Variable<String>(acct.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedTextColumn username = _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedTextColumn url = _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedTextColumn note = _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedBoolColumn locked = _constructLocked();
  GeneratedBoolColumn _constructLocked() {
    return GeneratedBoolColumn(
      'locked',
      $tableName,
      false,
    );
  }

  final VerificationMeta _headerStaticMeta =
      const VerificationMeta('headerStatic');
  @override
  late final GeneratedTextColumn headerStatic = _constructHeaderStatic();
  GeneratedTextColumn _constructHeaderStatic() {
    return GeneratedTextColumn(
      'header_static',
      $tableName,
      false,
    );
  }

  final VerificationMeta _headerMeta = const VerificationMeta('header');
  @override
  late final GeneratedTextColumn header = _constructHeader();
  GeneratedTextColumn _constructHeader() {
    return GeneratedTextColumn(
      'header',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followingCountMeta =
      const VerificationMeta('followingCount');
  @override
  late final GeneratedIntColumn followingCount = _constructFollowingCount();
  GeneratedIntColumn _constructFollowingCount() {
    return GeneratedIntColumn(
      'following_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followersCountMeta =
      const VerificationMeta('followersCount');
  @override
  late final GeneratedIntColumn followersCount = _constructFollowersCount();
  GeneratedIntColumn _constructFollowersCount() {
    return GeneratedIntColumn(
      'followers_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusesCountMeta =
      const VerificationMeta('statusesCount');
  @override
  late final GeneratedIntColumn statusesCount = _constructStatusesCount();
  GeneratedIntColumn _constructStatusesCount() {
    return GeneratedIntColumn(
      'statuses_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedTextColumn displayName = _constructDisplayName();
  GeneratedTextColumn _constructDisplayName() {
    return GeneratedTextColumn(
      'display_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _botMeta = const VerificationMeta('bot');
  @override
  late final GeneratedBoolColumn bot = _constructBot();
  GeneratedBoolColumn _constructBot() {
    return GeneratedBoolColumn(
      'bot',
      $tableName,
      true,
    );
  }

  final VerificationMeta _avatarStaticMeta =
      const VerificationMeta('avatarStatic');
  @override
  late final GeneratedTextColumn avatarStatic = _constructAvatarStatic();
  GeneratedTextColumn _constructAvatarStatic() {
    return GeneratedTextColumn(
      'avatar_static',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedTextColumn avatar = _constructAvatar();
  GeneratedTextColumn _constructAvatar() {
    return GeneratedTextColumn(
      'avatar',
      $tableName,
      false,
    );
  }

  final VerificationMeta _acctMeta = const VerificationMeta('acct');
  @override
  late final GeneratedTextColumn acct = _constructAcct();
  GeneratedTextColumn _constructAcct() {
    return GeneratedTextColumn(
      'acct',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastStatusAtMeta =
      const VerificationMeta('lastStatusAt');
  @override
  late final GeneratedDateTimeColumn lastStatusAt = _constructLastStatusAt();
  GeneratedDateTimeColumn _constructLastStatusAt() {
    return GeneratedDateTimeColumn(
      'last_status_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fieldsMeta = const VerificationMeta('fields');
  @override
  late final GeneratedTextColumn fields = _constructFields();
  GeneratedTextColumn _constructFields() {
    return GeneratedTextColumn(
      'fields',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emojisMeta = const VerificationMeta('emojis');
  @override
  late final GeneratedTextColumn emojis = _constructEmojis();
  GeneratedTextColumn _constructEmojis() {
    return GeneratedTextColumn(
      'emojis',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaBackgroundImageMeta =
      const VerificationMeta('pleromaBackgroundImage');
  @override
  late final GeneratedTextColumn pleromaBackgroundImage =
      _constructPleromaBackgroundImage();
  GeneratedTextColumn _constructPleromaBackgroundImage() {
    return GeneratedTextColumn(
      'pleroma_background_image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaTagsMeta =
      const VerificationMeta('pleromaTags');
  @override
  late final GeneratedTextColumn pleromaTags = _constructPleromaTags();
  GeneratedTextColumn _constructPleromaTags() {
    return GeneratedTextColumn(
      'pleroma_tags',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaRelationshipMeta =
      const VerificationMeta('pleromaRelationship');
  @override
  late final GeneratedTextColumn pleromaRelationship =
      _constructPleromaRelationship();
  GeneratedTextColumn _constructPleromaRelationship() {
    return GeneratedTextColumn(
      'pleroma_relationship',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaIsAdminMeta =
      const VerificationMeta('pleromaIsAdmin');
  @override
  late final GeneratedBoolColumn pleromaIsAdmin = _constructPleromaIsAdmin();
  GeneratedBoolColumn _constructPleromaIsAdmin() {
    return GeneratedBoolColumn(
      'pleroma_is_admin',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaIsModeratorMeta =
      const VerificationMeta('pleromaIsModerator');
  @override
  late final GeneratedBoolColumn pleromaIsModerator =
      _constructPleromaIsModerator();
  GeneratedBoolColumn _constructPleromaIsModerator() {
    return GeneratedBoolColumn(
      'pleroma_is_moderator',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaConfirmationPendingMeta =
      const VerificationMeta('pleromaConfirmationPending');
  @override
  late final GeneratedBoolColumn pleromaConfirmationPending =
      _constructPleromaConfirmationPending();
  GeneratedBoolColumn _constructPleromaConfirmationPending() {
    return GeneratedBoolColumn(
      'pleroma_confirmation_pending',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFavoritesMeta =
      const VerificationMeta('pleromaHideFavorites');
  @override
  late final GeneratedBoolColumn pleromaHideFavorites =
      _constructPleromaHideFavorites();
  GeneratedBoolColumn _constructPleromaHideFavorites() {
    return GeneratedBoolColumn(
      'pleroma_hide_favorites',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowersMeta =
      const VerificationMeta('pleromaHideFollowers');
  @override
  late final GeneratedBoolColumn pleromaHideFollowers =
      _constructPleromaHideFollowers();
  GeneratedBoolColumn _constructPleromaHideFollowers() {
    return GeneratedBoolColumn(
      'pleroma_hide_followers',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowsMeta =
      const VerificationMeta('pleromaHideFollows');
  @override
  late final GeneratedBoolColumn pleromaHideFollows =
      _constructPleromaHideFollows();
  GeneratedBoolColumn _constructPleromaHideFollows() {
    return GeneratedBoolColumn(
      'pleroma_hide_follows',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowersCountMeta =
      const VerificationMeta('pleromaHideFollowersCount');
  @override
  late final GeneratedBoolColumn pleromaHideFollowersCount =
      _constructPleromaHideFollowersCount();
  GeneratedBoolColumn _constructPleromaHideFollowersCount() {
    return GeneratedBoolColumn(
      'pleroma_hide_followers_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaHideFollowsCountMeta =
      const VerificationMeta('pleromaHideFollowsCount');
  @override
  late final GeneratedBoolColumn pleromaHideFollowsCount =
      _constructPleromaHideFollowsCount();
  GeneratedBoolColumn _constructPleromaHideFollowsCount() {
    return GeneratedBoolColumn(
      'pleroma_hide_follows_count',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaDeactivatedMeta =
      const VerificationMeta('pleromaDeactivated');
  @override
  late final GeneratedBoolColumn pleromaDeactivated =
      _constructPleromaDeactivated();
  GeneratedBoolColumn _constructPleromaDeactivated() {
    return GeneratedBoolColumn(
      'pleroma_deactivated',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaAllowFollowingMoveMeta =
      const VerificationMeta('pleromaAllowFollowingMove');
  @override
  late final GeneratedBoolColumn pleromaAllowFollowingMove =
      _constructPleromaAllowFollowingMove();
  GeneratedBoolColumn _constructPleromaAllowFollowingMove() {
    return GeneratedBoolColumn(
      'pleroma_allow_following_move',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaSkipThreadContainmentMeta =
      const VerificationMeta('pleromaSkipThreadContainment');
  @override
  late final GeneratedBoolColumn pleromaSkipThreadContainment =
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
  @override
  late final GeneratedBoolColumn pleromaAcceptsChatMessages =
      _constructPleromaAcceptsChatMessages();
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
    return DbAccount.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbAccountsTable createAlias(String alias) {
    return $DbAccountsTable(_db, alias);
  }

  static TypeConverter<List<PleromaApiField>, String> $converter0 =
      PleromaApiFieldListDatabaseConverter();
  static TypeConverter<List<PleromaApiEmoji>, String> $converter1 =
      PleromaApiEmojiListDatabaseConverter();
  static TypeConverter<List<PleromaApiTag>, String> $converter2 =
      PleromaApiTagListDatabaseConverter();
  static TypeConverter<PleromaApiAccountRelationship, String> $converter3 =
      PleromaApiAccountRelationshipDatabaseConverter();
}

class DbConversation extends DataClass implements Insertable<DbConversation> {
  final int? id;
  final String remoteId;
  final bool unread;
  final DateTime? updatedAt;
  DbConversation(
      {this.id, required this.remoteId, required this.unread, this.updatedAt});
  factory DbConversation.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbConversation(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      unread: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unread'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['unread'] = Variable<bool>(unread);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    return map;
  }

  DbConversationsCompanion toCompanion(bool nullToAbsent) {
    return DbConversationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: Value(remoteId),
      unread: Value(unread),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory DbConversation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversation(
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      unread: serializer.fromJson<bool>(json['unread']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'unread': serializer.toJson<bool>(unread),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConversation &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.unread == this.unread &&
          other.updatedAt == this.updatedAt);
}

class DbConversationsCompanion extends UpdateCompanion<DbConversation> {
  final Value<int?> id;
  final Value<String> remoteId;
  final Value<bool> unread;
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
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<bool>? unread,
    Expression<DateTime?>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (unread != null) 'unread': unread,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbConversationsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<bool>? unread,
      Value<DateTime?>? updatedAt}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (unread.present) {
      map['unread'] = Variable<bool>(unread.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  @override
  late final GeneratedBoolColumn unread = _constructUnread();
  GeneratedBoolColumn _constructUnread() {
    return GeneratedBoolColumn(
      'unread',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedDateTimeColumn updatedAt = _constructUpdatedAt();
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
    return DbConversation.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final PleromaApiNotificationPleromaPart? pleroma;
  final PleromaApiAccountReport? report;
  final PleromaApiChatMessage? chatMessage;
  final PleromaApiAccount? target;
  final bool? unread;
  final String type;
  final DateTime createdAt;
  final bool? dismissed;
  DbNotification(
      {this.id,
      required this.remoteId,
      this.accountRemoteId,
      this.statusRemoteId,
      this.chatRemoteId,
      this.chatMessageRemoteId,
      this.emoji,
      this.pleroma,
      this.report,
      this.chatMessage,
      this.target,
      this.unread,
      required this.type,
      required this.createdAt,
      this.dismissed});
  factory DbNotification.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbNotification(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      accountRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account_remote_id']),
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id']),
      chatRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_remote_id']),
      chatMessageRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}chat_message_remote_id']),
      emoji: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emoji']),
      pleroma: $DbNotificationsTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pleroma'])),
      report: $DbNotificationsTable.$converter1.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}report'])),
      chatMessage: $DbNotificationsTable.$converter2.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}chat_message'])),
      target: $DbNotificationsTable.$converter3.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}target'])),
      unread: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unread']),
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      dismissed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dismissed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
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
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || dismissed != null) {
      map['dismissed'] = Variable<bool?>(dismissed);
    }
    return map;
  }

  DbNotificationsCompanion toCompanion(bool nullToAbsent) {
    return DbNotificationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: Value(remoteId),
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
      type: Value(type),
      createdAt: Value(createdAt),
      dismissed: dismissed == null && nullToAbsent
          ? const Value.absent()
          : Value(dismissed),
    );
  }

  factory DbNotification.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbNotification(
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      accountRemoteId: serializer.fromJson<String?>(json['accountRemoteId']),
      statusRemoteId: serializer.fromJson<String?>(json['statusRemoteId']),
      chatRemoteId: serializer.fromJson<String?>(json['chatRemoteId']),
      chatMessageRemoteId:
          serializer.fromJson<String?>(json['chatMessageRemoteId']),
      emoji: serializer.fromJson<String?>(json['emoji']),
      pleroma: serializer
          .fromJson<PleromaApiNotificationPleromaPart?>(json['pleroma']),
      report: serializer.fromJson<PleromaApiAccountReport?>(json['report']),
      chatMessage:
          serializer.fromJson<PleromaApiChatMessage?>(json['chatMessage']),
      target: serializer.fromJson<PleromaApiAccount?>(json['target']),
      unread: serializer.fromJson<bool?>(json['unread']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      dismissed: serializer.fromJson<bool?>(json['dismissed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'accountRemoteId': serializer.toJson<String?>(accountRemoteId),
      'statusRemoteId': serializer.toJson<String?>(statusRemoteId),
      'chatRemoteId': serializer.toJson<String?>(chatRemoteId),
      'chatMessageRemoteId': serializer.toJson<String?>(chatMessageRemoteId),
      'emoji': serializer.toJson<String?>(emoji),
      'pleroma': serializer.toJson<PleromaApiNotificationPleromaPart?>(pleroma),
      'report': serializer.toJson<PleromaApiAccountReport?>(report),
      'chatMessage': serializer.toJson<PleromaApiChatMessage?>(chatMessage),
      'target': serializer.toJson<PleromaApiAccount?>(target),
      'unread': serializer.toJson<bool?>(unread),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
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
          PleromaApiNotificationPleromaPart? pleroma,
          PleromaApiAccountReport? report,
          PleromaApiChatMessage? chatMessage,
          PleromaApiAccount? target,
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<String?> accountRemoteId;
  final Value<String?> statusRemoteId;
  final Value<String?> chatRemoteId;
  final Value<String?> chatMessageRemoteId;
  final Value<String?> emoji;
  final Value<PleromaApiNotificationPleromaPart?> pleroma;
  final Value<PleromaApiAccountReport?> report;
  final Value<PleromaApiChatMessage?> chatMessage;
  final Value<PleromaApiAccount?> target;
  final Value<bool?> unread;
  final Value<String> type;
  final Value<DateTime> createdAt;
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
    required String type,
    required DateTime createdAt,
    this.dismissed = const Value.absent(),
  })  : remoteId = Value(remoteId),
        type = Value(type),
        createdAt = Value(createdAt);
  static Insertable<DbNotification> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<String?>? accountRemoteId,
    Expression<String?>? statusRemoteId,
    Expression<String?>? chatRemoteId,
    Expression<String?>? chatMessageRemoteId,
    Expression<String?>? emoji,
    Expression<PleromaApiNotificationPleromaPart?>? pleroma,
    Expression<PleromaApiAccountReport?>? report,
    Expression<PleromaApiChatMessage?>? chatMessage,
    Expression<PleromaApiAccount?>? target,
    Expression<bool?>? unread,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<bool?>? dismissed,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<String?>? accountRemoteId,
      Value<String?>? statusRemoteId,
      Value<String?>? chatRemoteId,
      Value<String?>? chatMessageRemoteId,
      Value<String?>? emoji,
      Value<PleromaApiNotificationPleromaPart?>? pleroma,
      Value<PleromaApiAccountReport?>? report,
      Value<PleromaApiChatMessage?>? chatMessage,
      Value<PleromaApiAccount?>? target,
      Value<bool?>? unread,
      Value<String>? type,
      Value<DateTime>? createdAt,
      Value<bool?>? dismissed}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
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
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn(
      'account_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  @override
  late final GeneratedTextColumn chatRemoteId = _constructChatRemoteId();
  GeneratedTextColumn _constructChatRemoteId() {
    return GeneratedTextColumn(
      'chat_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chatMessageRemoteIdMeta =
      const VerificationMeta('chatMessageRemoteId');
  @override
  late final GeneratedTextColumn chatMessageRemoteId =
      _constructChatMessageRemoteId();
  GeneratedTextColumn _constructChatMessageRemoteId() {
    return GeneratedTextColumn(
      'chat_message_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedTextColumn emoji = _constructEmoji();
  GeneratedTextColumn _constructEmoji() {
    return GeneratedTextColumn(
      'emoji',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pleromaMeta = const VerificationMeta('pleroma');
  @override
  late final GeneratedTextColumn pleroma = _constructPleroma();
  GeneratedTextColumn _constructPleroma() {
    return GeneratedTextColumn(
      'pleroma',
      $tableName,
      true,
    );
  }

  final VerificationMeta _reportMeta = const VerificationMeta('report');
  @override
  late final GeneratedTextColumn report = _constructReport();
  GeneratedTextColumn _constructReport() {
    return GeneratedTextColumn(
      'report',
      $tableName,
      true,
    );
  }

  final VerificationMeta _chatMessageMeta =
      const VerificationMeta('chatMessage');
  @override
  late final GeneratedTextColumn chatMessage = _constructChatMessage();
  GeneratedTextColumn _constructChatMessage() {
    return GeneratedTextColumn(
      'chat_message',
      $tableName,
      true,
    );
  }

  final VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedTextColumn target = _constructTarget();
  GeneratedTextColumn _constructTarget() {
    return GeneratedTextColumn(
      'target',
      $tableName,
      true,
    );
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  @override
  late final GeneratedBoolColumn unread = _constructUnread();
  GeneratedBoolColumn _constructUnread() {
    return GeneratedBoolColumn(
      'unread',
      $tableName,
      true,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedTextColumn type = _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dismissedMeta = const VerificationMeta('dismissed');
  @override
  late final GeneratedBoolColumn dismissed = _constructDismissed();
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
    } else if (isInserting) {
      context.missing(_typeMeta);
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
    return DbNotification.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbNotificationsTable createAlias(String alias) {
    return $DbNotificationsTable(_db, alias);
  }

  static TypeConverter<PleromaApiNotificationPleromaPart, String> $converter0 =
      PleromaNotificationPleromaPartDatabaseConverter();
  static TypeConverter<PleromaApiAccountReport, String> $converter1 =
      PleromaAccountReportDatabaseConverter();
  static TypeConverter<PleromaApiChatMessage, String> $converter2 =
      PleromaChatMessageDatabaseConverter();
  static TypeConverter<PleromaApiAccount, String> $converter3 =
      PleromaAccountDatabaseConverter();
}

class DbConversationStatus extends DataClass
    implements Insertable<DbConversationStatus> {
  final int? id;
  final String conversationRemoteId;
  final String statusRemoteId;
  DbConversationStatus(
      {this.id,
      required this.conversationRemoteId,
      required this.statusRemoteId});
  factory DbConversationStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbConversationStatus(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      conversationRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}conversation_remote_id'])!,
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['conversation_remote_id'] = Variable<String>(conversationRemoteId);
    map['status_remote_id'] = Variable<String>(statusRemoteId);
    return map;
  }

  DbConversationStatusesCompanion toCompanion(bool nullToAbsent) {
    return DbConversationStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      conversationRemoteId: Value(conversationRemoteId),
      statusRemoteId: Value(statusRemoteId),
    );
  }

  factory DbConversationStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversationStatus(
      id: serializer.fromJson<int?>(json['id']),
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
      'conversationRemoteId': serializer.toJson<String>(conversationRemoteId),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConversationStatus &&
          other.id == this.id &&
          other.conversationRemoteId == this.conversationRemoteId &&
          other.statusRemoteId == this.statusRemoteId);
}

class DbConversationStatusesCompanion
    extends UpdateCompanion<DbConversationStatus> {
  final Value<int?> id;
  final Value<String> conversationRemoteId;
  final Value<String> statusRemoteId;
  const DbConversationStatusesCompanion({
    this.id = const Value.absent(),
    this.conversationRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
  });
  DbConversationStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String conversationRemoteId,
    required String statusRemoteId,
  })  : conversationRemoteId = Value(conversationRemoteId),
        statusRemoteId = Value(statusRemoteId);
  static Insertable<DbConversationStatus> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
          Variable<String>(conversationRemoteId.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String>(statusRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _conversationRemoteIdMeta =
      const VerificationMeta('conversationRemoteId');
  @override
  late final GeneratedTextColumn conversationRemoteId =
      _constructConversationRemoteId();
  GeneratedTextColumn _constructConversationRemoteId() {
    return GeneratedTextColumn(
      'conversation_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
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
    return DbConversationStatus.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbConversationStatusesTable createAlias(String alias) {
    return $DbConversationStatusesTable(_db, alias);
  }
}

class DbStatusHashtag extends DataClass implements Insertable<DbStatusHashtag> {
  final int? id;
  final String statusRemoteId;
  final String hashtag;
  DbStatusHashtag(
      {this.id, required this.statusRemoteId, required this.hashtag});
  factory DbStatusHashtag.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbStatusHashtag(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id'])!,
      hashtag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hashtag'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['status_remote_id'] = Variable<String>(statusRemoteId);
    map['hashtag'] = Variable<String>(hashtag);
    return map;
  }

  DbStatusHashtagsCompanion toCompanion(bool nullToAbsent) {
    return DbStatusHashtagsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: Value(statusRemoteId),
      hashtag: Value(hashtag),
    );
  }

  factory DbStatusHashtag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusHashtag(
      id: serializer.fromJson<int?>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      hashtag: serializer.fromJson<String>(json['hashtag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'hashtag': serializer.toJson<String>(hashtag),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbStatusHashtag &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.hashtag == this.hashtag);
}

class DbStatusHashtagsCompanion extends UpdateCompanion<DbStatusHashtag> {
  final Value<int?> id;
  final Value<String> statusRemoteId;
  final Value<String> hashtag;
  const DbStatusHashtagsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.hashtag = const Value.absent(),
  });
  DbStatusHashtagsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String hashtag,
  })  : statusRemoteId = Value(statusRemoteId),
        hashtag = Value(hashtag);
  static Insertable<DbStatusHashtag> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
      Value<String>? statusRemoteId,
      Value<String>? hashtag}) {
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
      map['status_remote_id'] = Variable<String>(statusRemoteId.value);
    }
    if (hashtag.present) {
      map['hashtag'] = Variable<String>(hashtag.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hashtagMeta = const VerificationMeta('hashtag');
  @override
  late final GeneratedTextColumn hashtag = _constructHashtag();
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
    return DbStatusHashtag.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbStatusHashtagsTable createAlias(String alias) {
    return $DbStatusHashtagsTable(_db, alias);
  }
}

class DbStatusList extends DataClass implements Insertable<DbStatusList> {
  final int? id;
  final String statusRemoteId;
  final String listRemoteId;
  DbStatusList(
      {this.id, required this.statusRemoteId, required this.listRemoteId});
  factory DbStatusList.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbStatusList(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id'])!,
      listRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}list_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['status_remote_id'] = Variable<String>(statusRemoteId);
    map['list_remote_id'] = Variable<String>(listRemoteId);
    return map;
  }

  DbStatusListsCompanion toCompanion(bool nullToAbsent) {
    return DbStatusListsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: Value(statusRemoteId),
      listRemoteId: Value(listRemoteId),
    );
  }

  factory DbStatusList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusList(
      id: serializer.fromJson<int?>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      listRemoteId: serializer.fromJson<String>(json['listRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'listRemoteId': serializer.toJson<String>(listRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbStatusList &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.listRemoteId == this.listRemoteId);
}

class DbStatusListsCompanion extends UpdateCompanion<DbStatusList> {
  final Value<int?> id;
  final Value<String> statusRemoteId;
  final Value<String> listRemoteId;
  const DbStatusListsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.listRemoteId = const Value.absent(),
  });
  DbStatusListsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String listRemoteId,
  })  : statusRemoteId = Value(statusRemoteId),
        listRemoteId = Value(listRemoteId);
  static Insertable<DbStatusList> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['status_remote_id'] = Variable<String>(statusRemoteId.value);
    }
    if (listRemoteId.present) {
      map['list_remote_id'] = Variable<String>(listRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _listRemoteIdMeta =
      const VerificationMeta('listRemoteId');
  @override
  late final GeneratedTextColumn listRemoteId = _constructListRemoteId();
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
    return DbStatusList.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbStatusListsTable createAlias(String alias) {
    return $DbStatusListsTable(_db, alias);
  }
}

class DbStatusFavouritedAccount extends DataClass
    implements Insertable<DbStatusFavouritedAccount> {
  final int? id;
  final String statusRemoteId;
  final String accountRemoteId;
  DbStatusFavouritedAccount(
      {this.id, required this.statusRemoteId, required this.accountRemoteId});
  factory DbStatusFavouritedAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbStatusFavouritedAccount(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id'])!,
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['status_remote_id'] = Variable<String>(statusRemoteId);
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    return map;
  }

  DbStatusFavouritedAccountsCompanion toCompanion(bool nullToAbsent) {
    return DbStatusFavouritedAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: Value(statusRemoteId),
      accountRemoteId: Value(accountRemoteId),
    );
  }

  factory DbStatusFavouritedAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusFavouritedAccount(
      id: serializer.fromJson<int?>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbStatusFavouritedAccount &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbStatusFavouritedAccountsCompanion
    extends UpdateCompanion<DbStatusFavouritedAccount> {
  final Value<int?> id;
  final Value<String> statusRemoteId;
  final Value<String> accountRemoteId;
  const DbStatusFavouritedAccountsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbStatusFavouritedAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String accountRemoteId,
  })  : statusRemoteId = Value(statusRemoteId),
        accountRemoteId = Value(accountRemoteId);
  static Insertable<DbStatusFavouritedAccount> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['status_remote_id'] = Variable<String>(statusRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
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
    return DbStatusFavouritedAccount.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbStatusFavouritedAccountsTable createAlias(String alias) {
    return $DbStatusFavouritedAccountsTable(_db, alias);
  }
}

class DbStatusRebloggedAccount extends DataClass
    implements Insertable<DbStatusRebloggedAccount> {
  final int? id;
  final String statusRemoteId;
  final String accountRemoteId;
  DbStatusRebloggedAccount(
      {this.id, required this.statusRemoteId, required this.accountRemoteId});
  factory DbStatusRebloggedAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbStatusRebloggedAccount(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id'])!,
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['status_remote_id'] = Variable<String>(statusRemoteId);
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    return map;
  }

  DbStatusRebloggedAccountsCompanion toCompanion(bool nullToAbsent) {
    return DbStatusRebloggedAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statusRemoteId: Value(statusRemoteId),
      accountRemoteId: Value(accountRemoteId),
    );
  }

  factory DbStatusRebloggedAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbStatusRebloggedAccount(
      id: serializer.fromJson<int?>(json['id']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbStatusRebloggedAccount &&
          other.id == this.id &&
          other.statusRemoteId == this.statusRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbStatusRebloggedAccountsCompanion
    extends UpdateCompanion<DbStatusRebloggedAccount> {
  final Value<int?> id;
  final Value<String> statusRemoteId;
  final Value<String> accountRemoteId;
  const DbStatusRebloggedAccountsCompanion({
    this.id = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbStatusRebloggedAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String statusRemoteId,
    required String accountRemoteId,
  })  : statusRemoteId = Value(statusRemoteId),
        accountRemoteId = Value(accountRemoteId);
  static Insertable<DbStatusRebloggedAccount> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['status_remote_id'] = Variable<String>(statusRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
  GeneratedTextColumn _constructStatusRemoteId() {
    return GeneratedTextColumn(
      'status_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
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
    return DbStatusRebloggedAccount.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbStatusRebloggedAccountsTable createAlias(String alias) {
    return $DbStatusRebloggedAccountsTable(_db, alias);
  }
}

class DbAccountFollowing extends DataClass
    implements Insertable<DbAccountFollowing> {
  final int? id;
  final String accountRemoteId;
  final String followingAccountRemoteId;
  DbAccountFollowing(
      {this.id,
      required this.accountRemoteId,
      required this.followingAccountRemoteId});
  factory DbAccountFollowing.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbAccountFollowing(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
      followingAccountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}following_account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    map['following_account_remote_id'] =
        Variable<String>(followingAccountRemoteId);
    return map;
  }

  DbAccountFollowingsCompanion toCompanion(bool nullToAbsent) {
    return DbAccountFollowingsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      accountRemoteId: Value(accountRemoteId),
      followingAccountRemoteId: Value(followingAccountRemoteId),
    );
  }

  factory DbAccountFollowing.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccountFollowing(
      id: serializer.fromJson<int?>(json['id']),
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
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'followingAccountRemoteId':
          serializer.toJson<String>(followingAccountRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAccountFollowing &&
          other.id == this.id &&
          other.accountRemoteId == this.accountRemoteId &&
          other.followingAccountRemoteId == this.followingAccountRemoteId);
}

class DbAccountFollowingsCompanion extends UpdateCompanion<DbAccountFollowing> {
  final Value<int?> id;
  final Value<String> accountRemoteId;
  final Value<String> followingAccountRemoteId;
  const DbAccountFollowingsCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.followingAccountRemoteId = const Value.absent(),
  });
  DbAccountFollowingsCompanion.insert({
    this.id = const Value.absent(),
    required String accountRemoteId,
    required String followingAccountRemoteId,
  })  : accountRemoteId = Value(accountRemoteId),
        followingAccountRemoteId = Value(followingAccountRemoteId);
  static Insertable<DbAccountFollowing> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
    }
    if (followingAccountRemoteId.present) {
      map['following_account_remote_id'] =
          Variable<String>(followingAccountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn(
      'account_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followingAccountRemoteIdMeta =
      const VerificationMeta('followingAccountRemoteId');
  @override
  late final GeneratedTextColumn followingAccountRemoteId =
      _constructFollowingAccountRemoteId();
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
    return DbAccountFollowing.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbAccountFollowingsTable createAlias(String alias) {
    return $DbAccountFollowingsTable(_db, alias);
  }
}

class DbAccountFollower extends DataClass
    implements Insertable<DbAccountFollower> {
  final int? id;
  final String accountRemoteId;
  final String followerAccountRemoteId;
  DbAccountFollower(
      {this.id,
      required this.accountRemoteId,
      required this.followerAccountRemoteId});
  factory DbAccountFollower.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbAccountFollower(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
      followerAccountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}follower_account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    map['follower_account_remote_id'] =
        Variable<String>(followerAccountRemoteId);
    return map;
  }

  DbAccountFollowersCompanion toCompanion(bool nullToAbsent) {
    return DbAccountFollowersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      accountRemoteId: Value(accountRemoteId),
      followerAccountRemoteId: Value(followerAccountRemoteId),
    );
  }

  factory DbAccountFollower.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbAccountFollower(
      id: serializer.fromJson<int?>(json['id']),
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
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'followerAccountRemoteId':
          serializer.toJson<String>(followerAccountRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAccountFollower &&
          other.id == this.id &&
          other.accountRemoteId == this.accountRemoteId &&
          other.followerAccountRemoteId == this.followerAccountRemoteId);
}

class DbAccountFollowersCompanion extends UpdateCompanion<DbAccountFollower> {
  final Value<int?> id;
  final Value<String> accountRemoteId;
  final Value<String> followerAccountRemoteId;
  const DbAccountFollowersCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.followerAccountRemoteId = const Value.absent(),
  });
  DbAccountFollowersCompanion.insert({
    this.id = const Value.absent(),
    required String accountRemoteId,
    required String followerAccountRemoteId,
  })  : accountRemoteId = Value(accountRemoteId),
        followerAccountRemoteId = Value(followerAccountRemoteId);
  static Insertable<DbAccountFollower> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
    }
    if (followerAccountRemoteId.present) {
      map['follower_account_remote_id'] =
          Variable<String>(followerAccountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn(
      'account_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followerAccountRemoteIdMeta =
      const VerificationMeta('followerAccountRemoteId');
  @override
  late final GeneratedTextColumn followerAccountRemoteId =
      _constructFollowerAccountRemoteId();
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
    return DbAccountFollower.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbAccountFollowersTable createAlias(String alias) {
    return $DbAccountFollowersTable(_db, alias);
  }
}

class DbConversationAccount extends DataClass
    implements Insertable<DbConversationAccount> {
  final int? id;
  final String conversationRemoteId;
  final String accountRemoteId;
  DbConversationAccount(
      {this.id,
      required this.conversationRemoteId,
      required this.accountRemoteId});
  factory DbConversationAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbConversationAccount(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      conversationRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}conversation_remote_id'])!,
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['conversation_remote_id'] = Variable<String>(conversationRemoteId);
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    return map;
  }

  DbConversationAccountsCompanion toCompanion(bool nullToAbsent) {
    return DbConversationAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      conversationRemoteId: Value(conversationRemoteId),
      accountRemoteId: Value(accountRemoteId),
    );
  }

  factory DbConversationAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbConversationAccount(
      id: serializer.fromJson<int?>(json['id']),
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
      'conversationRemoteId': serializer.toJson<String>(conversationRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbConversationAccount &&
          other.id == this.id &&
          other.conversationRemoteId == this.conversationRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbConversationAccountsCompanion
    extends UpdateCompanion<DbConversationAccount> {
  final Value<int?> id;
  final Value<String> conversationRemoteId;
  final Value<String> accountRemoteId;
  const DbConversationAccountsCompanion({
    this.id = const Value.absent(),
    this.conversationRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbConversationAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String conversationRemoteId,
    required String accountRemoteId,
  })  : conversationRemoteId = Value(conversationRemoteId),
        accountRemoteId = Value(accountRemoteId);
  static Insertable<DbConversationAccount> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
          Variable<String>(conversationRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _conversationRemoteIdMeta =
      const VerificationMeta('conversationRemoteId');
  @override
  late final GeneratedTextColumn conversationRemoteId =
      _constructConversationRemoteId();
  GeneratedTextColumn _constructConversationRemoteId() {
    return GeneratedTextColumn(
      'conversation_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
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
    return DbConversationAccount.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbConversationAccountsTable createAlias(String alias) {
    return $DbConversationAccountsTable(_db, alias);
  }
}

class DbScheduledStatus extends DataClass
    implements Insertable<DbScheduledStatus> {
  final int? id;
  final String remoteId;
  final DateTime scheduledAt;
  final bool canceled;
  final PleromaApiScheduledStatusParams params;
  final List<PleromaApiMediaAttachment>? mediaAttachments;
  DbScheduledStatus(
      {this.id,
      required this.remoteId,
      required this.scheduledAt,
      required this.canceled,
      required this.params,
      this.mediaAttachments});
  factory DbScheduledStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbScheduledStatus(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      scheduledAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}scheduled_at'])!,
      canceled: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}canceled'])!,
      params: $DbScheduledStatusesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}params']))!,
      mediaAttachments: $DbScheduledStatusesTable.$converter1.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachments'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['canceled'] = Variable<bool>(canceled);
    {
      final converter = $DbScheduledStatusesTable.$converter0;
      map['params'] = Variable<String>(converter.mapToSql(params)!);
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
      remoteId: Value(remoteId),
      scheduledAt: Value(scheduledAt),
      canceled: Value(canceled),
      params: Value(params),
      mediaAttachments: mediaAttachments == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaAttachments),
    );
  }

  factory DbScheduledStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbScheduledStatus(
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      canceled: serializer.fromJson<bool>(json['canceled']),
      params:
          serializer.fromJson<PleromaApiScheduledStatusParams>(json['params']),
      mediaAttachments: serializer
          .fromJson<List<PleromaApiMediaAttachment>?>(json['mediaAttachments']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'canceled': serializer.toJson<bool>(canceled),
      'params': serializer.toJson<PleromaApiScheduledStatusParams>(params),
      'mediaAttachments':
          serializer.toJson<List<PleromaApiMediaAttachment>?>(mediaAttachments),
    };
  }

  DbScheduledStatus copyWith(
          {int? id,
          String? remoteId,
          DateTime? scheduledAt,
          bool? canceled,
          PleromaApiScheduledStatusParams? params,
          List<PleromaApiMediaAttachment>? mediaAttachments}) =>
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<DateTime> scheduledAt;
  final Value<bool> canceled;
  final Value<PleromaApiScheduledStatusParams> params;
  final Value<List<PleromaApiMediaAttachment>?> mediaAttachments;
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
    required PleromaApiScheduledStatusParams params,
    this.mediaAttachments = const Value.absent(),
  })  : remoteId = Value(remoteId),
        scheduledAt = Value(scheduledAt),
        canceled = Value(canceled),
        params = Value(params);
  static Insertable<DbScheduledStatus> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<DateTime>? scheduledAt,
    Expression<bool>? canceled,
    Expression<PleromaApiScheduledStatusParams>? params,
    Expression<List<PleromaApiMediaAttachment>?>? mediaAttachments,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<DateTime>? scheduledAt,
      Value<bool>? canceled,
      Value<PleromaApiScheduledStatusParams>? params,
      Value<List<PleromaApiMediaAttachment>?>? mediaAttachments}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (canceled.present) {
      map['canceled'] = Variable<bool>(canceled.value);
    }
    if (params.present) {
      final converter = $DbScheduledStatusesTable.$converter0;
      map['params'] = Variable<String>(converter.mapToSql(params.value)!);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _scheduledAtMeta =
      const VerificationMeta('scheduledAt');
  @override
  late final GeneratedDateTimeColumn scheduledAt = _constructScheduledAt();
  GeneratedDateTimeColumn _constructScheduledAt() {
    return GeneratedDateTimeColumn(
      'scheduled_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _canceledMeta = const VerificationMeta('canceled');
  @override
  late final GeneratedBoolColumn canceled = _constructCanceled();
  GeneratedBoolColumn _constructCanceled() {
    return GeneratedBoolColumn(
      'canceled',
      $tableName,
      false,
    );
  }

  final VerificationMeta _paramsMeta = const VerificationMeta('params');
  @override
  late final GeneratedTextColumn params = _constructParams();
  GeneratedTextColumn _constructParams() {
    return GeneratedTextColumn(
      'params',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mediaAttachmentsMeta =
      const VerificationMeta('mediaAttachments');
  @override
  late final GeneratedTextColumn mediaAttachments =
      _constructMediaAttachments();
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
    return DbScheduledStatus.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbScheduledStatusesTable createAlias(String alias) {
    return $DbScheduledStatusesTable(_db, alias);
  }

  static TypeConverter<PleromaApiScheduledStatusParams, String> $converter0 =
      PleromaScheduledStatusParamsDatabaseConverter();
  static TypeConverter<List<PleromaApiMediaAttachment>, String> $converter1 =
      PleromaMediaAttachmentListDatabaseConverter();
}

class DbChat extends DataClass implements Insertable<DbChat> {
  final int? id;
  final String remoteId;
  final int unread;
  final DateTime? updatedAt;
  final String accountRemoteId;
  DbChat(
      {this.id,
      required this.remoteId,
      required this.unread,
      this.updatedAt,
      required this.accountRemoteId});
  factory DbChat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbChat(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      unread: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unread'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['unread'] = Variable<int>(unread);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    return map;
  }

  DbChatsCompanion toCompanion(bool nullToAbsent) {
    return DbChatsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: Value(remoteId),
      unread: Value(unread),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      accountRemoteId: Value(accountRemoteId),
    );
  }

  factory DbChat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbChat(
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      unread: serializer.fromJson<int>(json['unread']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'unread': serializer.toJson<int>(unread),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<int> unread;
  final Value<DateTime?> updatedAt;
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
    required String remoteId,
    required int unread,
    this.updatedAt = const Value.absent(),
    required String accountRemoteId,
  })  : remoteId = Value(remoteId),
        unread = Value(unread),
        accountRemoteId = Value(accountRemoteId);
  static Insertable<DbChat> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<int>? unread,
    Expression<DateTime?>? updatedAt,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<int>? unread,
      Value<DateTime?>? updatedAt,
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (unread.present) {
      map['unread'] = Variable<int>(unread.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime?>(updatedAt.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _unreadMeta = const VerificationMeta('unread');
  @override
  late final GeneratedIntColumn unread = _constructUnread();
  GeneratedIntColumn _constructUnread() {
    return GeneratedIntColumn(
      'unread',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedDateTimeColumn updatedAt = _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
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
    return DbChat.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  final List<PleromaApiEmoji>? emojis;
  final PleromaApiMediaAttachment? mediaAttachment;
  final PleromaApiCard? card;
  final PendingState? pendingState;
  final bool? deleted;
  final bool? hiddenLocallyOnDevice;
  final String? oldPendingRemoteId;
  final String? wasSentWithIdempotencyKey;
  DbChatMessage(
      {this.id,
      required this.remoteId,
      required this.chatRemoteId,
      required this.accountRemoteId,
      this.content,
      required this.createdAt,
      this.emojis,
      this.mediaAttachment,
      this.card,
      this.pendingState,
      this.deleted,
      this.hiddenLocallyOnDevice,
      this.oldPendingRemoteId,
      this.wasSentWithIdempotencyKey});
  factory DbChatMessage.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbChatMessage(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      chatRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_remote_id'])!,
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      emojis: $DbChatMessagesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emojis'])),
      mediaAttachment: $DbChatMessagesTable.$converter1.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}media_attachment'])),
      card: $DbChatMessagesTable.$converter2.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card'])),
      pendingState: $DbChatMessagesTable.$converter3.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}pending_state'])),
      deleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
      hiddenLocallyOnDevice: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}hidden_locally_on_device']),
      oldPendingRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}old_pending_remote_id']),
      wasSentWithIdempotencyKey: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}was_sent_with_idempotency_key']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['chat_remote_id'] = Variable<String>(chatRemoteId);
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
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
      remoteId: Value(remoteId),
      chatRemoteId: Value(chatRemoteId),
      accountRemoteId: Value(accountRemoteId),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: Value(createdAt),
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
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      chatRemoteId: serializer.fromJson<String>(json['chatRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      content: serializer.fromJson<String?>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      emojis: serializer.fromJson<List<PleromaApiEmoji>?>(json['emojis']),
      mediaAttachment: serializer
          .fromJson<PleromaApiMediaAttachment?>(json['mediaAttachment']),
      card: serializer.fromJson<PleromaApiCard?>(json['card']),
      pendingState: serializer.fromJson<PendingState?>(json['pendingState']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      hiddenLocallyOnDevice:
          serializer.fromJson<bool?>(json['hiddenLocallyOnDevice']),
      oldPendingRemoteId:
          serializer.fromJson<String?>(json['oldPendingRemoteId']),
      wasSentWithIdempotencyKey:
          serializer.fromJson<String?>(json['wasSentWithIdempotencyKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'chatRemoteId': serializer.toJson<String>(chatRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'emojis': serializer.toJson<List<PleromaApiEmoji>?>(emojis),
      'mediaAttachment':
          serializer.toJson<PleromaApiMediaAttachment?>(mediaAttachment),
      'card': serializer.toJson<PleromaApiCard?>(card),
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
          List<PleromaApiEmoji>? emojis,
          PleromaApiMediaAttachment? mediaAttachment,
          PleromaApiCard? card,
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<String> chatRemoteId;
  final Value<String> accountRemoteId;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  final Value<List<PleromaApiEmoji>?> emojis;
  final Value<PleromaApiMediaAttachment?> mediaAttachment;
  final Value<PleromaApiCard?> card;
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
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<String>? chatRemoteId,
    Expression<String>? accountRemoteId,
    Expression<String?>? content,
    Expression<DateTime>? createdAt,
    Expression<List<PleromaApiEmoji>?>? emojis,
    Expression<PleromaApiMediaAttachment?>? mediaAttachment,
    Expression<PleromaApiCard?>? card,
    Expression<PendingState?>? pendingState,
    Expression<bool?>? deleted,
    Expression<bool?>? hiddenLocallyOnDevice,
    Expression<String?>? oldPendingRemoteId,
    Expression<String?>? wasSentWithIdempotencyKey,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<String>? chatRemoteId,
      Value<String>? accountRemoteId,
      Value<String?>? content,
      Value<DateTime>? createdAt,
      Value<List<PleromaApiEmoji>?>? emojis,
      Value<PleromaApiMediaAttachment?>? mediaAttachment,
      Value<PleromaApiCard?>? card,
      Value<PendingState?>? pendingState,
      Value<bool?>? deleted,
      Value<bool?>? hiddenLocallyOnDevice,
      Value<String?>? oldPendingRemoteId,
      Value<String?>? wasSentWithIdempotencyKey}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (chatRemoteId.present) {
      map['chat_remote_id'] = Variable<String>(chatRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  @override
  late final GeneratedTextColumn chatRemoteId = _constructChatRemoteId();
  GeneratedTextColumn _constructChatRemoteId() {
    return GeneratedTextColumn(
      'chat_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn(
      'account_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emojisMeta = const VerificationMeta('emojis');
  @override
  late final GeneratedTextColumn emojis = _constructEmojis();
  GeneratedTextColumn _constructEmojis() {
    return GeneratedTextColumn(
      'emojis',
      $tableName,
      true,
    );
  }

  final VerificationMeta _mediaAttachmentMeta =
      const VerificationMeta('mediaAttachment');
  @override
  late final GeneratedTextColumn mediaAttachment = _constructMediaAttachment();
  GeneratedTextColumn _constructMediaAttachment() {
    return GeneratedTextColumn(
      'media_attachment',
      $tableName,
      true,
    );
  }

  final VerificationMeta _cardMeta = const VerificationMeta('card');
  @override
  late final GeneratedTextColumn card = _constructCard();
  GeneratedTextColumn _constructCard() {
    return GeneratedTextColumn(
      'card',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pendingStateMeta =
      const VerificationMeta('pendingState');
  @override
  late final GeneratedTextColumn pendingState = _constructPendingState();
  GeneratedTextColumn _constructPendingState() {
    return GeneratedTextColumn(
      'pending_state',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  @override
  late final GeneratedBoolColumn deleted = _constructDeleted();
  GeneratedBoolColumn _constructDeleted() {
    return GeneratedBoolColumn(
      'deleted',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hiddenLocallyOnDeviceMeta =
      const VerificationMeta('hiddenLocallyOnDevice');
  @override
  late final GeneratedBoolColumn hiddenLocallyOnDevice =
      _constructHiddenLocallyOnDevice();
  GeneratedBoolColumn _constructHiddenLocallyOnDevice() {
    return GeneratedBoolColumn(
      'hidden_locally_on_device',
      $tableName,
      true,
    );
  }

  final VerificationMeta _oldPendingRemoteIdMeta =
      const VerificationMeta('oldPendingRemoteId');
  @override
  late final GeneratedTextColumn oldPendingRemoteId =
      _constructOldPendingRemoteId();
  GeneratedTextColumn _constructOldPendingRemoteId() {
    return GeneratedTextColumn(
      'old_pending_remote_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _wasSentWithIdempotencyKeyMeta =
      const VerificationMeta('wasSentWithIdempotencyKey');
  @override
  late final GeneratedTextColumn wasSentWithIdempotencyKey =
      _constructWasSentWithIdempotencyKey();
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
    return DbChatMessage.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbChatMessagesTable createAlias(String alias) {
    return $DbChatMessagesTable(_db, alias);
  }

  static TypeConverter<List<PleromaApiEmoji>, String> $converter0 =
      PleromaApiEmojiListDatabaseConverter();
  static TypeConverter<PleromaApiMediaAttachment, String> $converter1 =
      PleromaMediaAttachmentDatabaseConverter();
  static TypeConverter<PleromaApiCard, String> $converter2 =
      PleromaCardDatabaseConverter();
  static TypeConverter<PendingState, String> $converter3 =
      PendingStateDatabaseConverter();
}

class DbChatAccount extends DataClass implements Insertable<DbChatAccount> {
  final int? id;
  final String chatRemoteId;
  final String accountRemoteId;
  DbChatAccount(
      {this.id, required this.chatRemoteId, required this.accountRemoteId});
  factory DbChatAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbChatAccount(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chatRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_remote_id'])!,
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['chat_remote_id'] = Variable<String>(chatRemoteId);
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    return map;
  }

  DbChatAccountsCompanion toCompanion(bool nullToAbsent) {
    return DbChatAccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chatRemoteId: Value(chatRemoteId),
      accountRemoteId: Value(accountRemoteId),
    );
  }

  factory DbChatAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbChatAccount(
      id: serializer.fromJson<int?>(json['id']),
      chatRemoteId: serializer.fromJson<String>(json['chatRemoteId']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'chatRemoteId': serializer.toJson<String>(chatRemoteId),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbChatAccount &&
          other.id == this.id &&
          other.chatRemoteId == this.chatRemoteId &&
          other.accountRemoteId == this.accountRemoteId);
}

class DbChatAccountsCompanion extends UpdateCompanion<DbChatAccount> {
  final Value<int?> id;
  final Value<String> chatRemoteId;
  final Value<String> accountRemoteId;
  const DbChatAccountsCompanion({
    this.id = const Value.absent(),
    this.chatRemoteId = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
  });
  DbChatAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String chatRemoteId,
    required String accountRemoteId,
  })  : chatRemoteId = Value(chatRemoteId),
        accountRemoteId = Value(accountRemoteId);
  static Insertable<DbChatAccount> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['chat_remote_id'] = Variable<String>(chatRemoteId.value);
    }
    if (accountRemoteId.present) {
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _chatRemoteIdMeta =
      const VerificationMeta('chatRemoteId');
  @override
  late final GeneratedTextColumn chatRemoteId = _constructChatRemoteId();
  GeneratedTextColumn _constructChatRemoteId() {
    return GeneratedTextColumn(
      'chat_remote_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
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
    return DbChatAccount.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  DbFilter(
      {this.id,
      required this.remoteId,
      required this.phrase,
      required this.context,
      required this.irreversible,
      required this.wholeWord,
      this.expiresAt});
  factory DbFilter.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbFilter(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      phrase: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phrase'])!,
      context: $DbFiltersTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}context']))!,
      irreversible: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}irreversible'])!,
      wholeWord: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}whole_word'])!,
      expiresAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}expires_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['phrase'] = Variable<String>(phrase);
    {
      final converter = $DbFiltersTable.$converter0;
      map['context'] = Variable<String>(converter.mapToSql(context)!);
    }
    map['irreversible'] = Variable<bool>(irreversible);
    map['whole_word'] = Variable<bool>(wholeWord);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime?>(expiresAt);
    }
    return map;
  }

  DbFiltersCompanion toCompanion(bool nullToAbsent) {
    return DbFiltersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: Value(remoteId),
      phrase: Value(phrase),
      context: Value(context),
      irreversible: Value(irreversible),
      wholeWord: Value(wholeWord),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
    );
  }

  factory DbFilter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbFilter(
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      phrase: serializer.fromJson<String>(json['phrase']),
      context: serializer.fromJson<List<String>>(json['context']),
      irreversible: serializer.fromJson<bool>(json['irreversible']),
      wholeWord: serializer.fromJson<bool>(json['wholeWord']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'phrase': serializer.toJson<String>(phrase),
      'context': serializer.toJson<List<String>>(context),
      'irreversible': serializer.toJson<bool>(irreversible),
      'wholeWord': serializer.toJson<bool>(wholeWord),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
    };
  }

  DbFilter copyWith(
          {int? id,
          String? remoteId,
          String? phrase,
          List<String>? context,
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
  bool operator ==(Object other) =>
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
  final Value<String> remoteId;
  final Value<String> phrase;
  final Value<List<String>> context;
  final Value<bool> irreversible;
  final Value<bool> wholeWord;
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
    required List<String> context,
    required bool irreversible,
    required bool wholeWord,
    this.expiresAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        phrase = Value(phrase),
        context = Value(context),
        irreversible = Value(irreversible),
        wholeWord = Value(wholeWord);
  static Insertable<DbFilter> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<String>? phrase,
    Expression<List<String>>? context,
    Expression<bool>? irreversible,
    Expression<bool>? wholeWord,
    Expression<DateTime?>? expiresAt,
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
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<String>? phrase,
      Value<List<String>>? context,
      Value<bool>? irreversible,
      Value<bool>? wholeWord,
      Value<DateTime?>? expiresAt}) {
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
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (phrase.present) {
      map['phrase'] = Variable<String>(phrase.value);
    }
    if (context.present) {
      final converter = $DbFiltersTable.$converter0;
      map['context'] = Variable<String>(converter.mapToSql(context.value)!);
    }
    if (irreversible.present) {
      map['irreversible'] = Variable<bool>(irreversible.value);
    }
    if (wholeWord.present) {
      map['whole_word'] = Variable<bool>(wholeWord.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _phraseMeta = const VerificationMeta('phrase');
  @override
  late final GeneratedTextColumn phrase = _constructPhrase();
  GeneratedTextColumn _constructPhrase() {
    return GeneratedTextColumn(
      'phrase',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contextMeta = const VerificationMeta('context');
  @override
  late final GeneratedTextColumn context = _constructContext();
  GeneratedTextColumn _constructContext() {
    return GeneratedTextColumn(
      'context',
      $tableName,
      false,
    );
  }

  final VerificationMeta _irreversibleMeta =
      const VerificationMeta('irreversible');
  @override
  late final GeneratedBoolColumn irreversible = _constructIrreversible();
  GeneratedBoolColumn _constructIrreversible() {
    return GeneratedBoolColumn(
      'irreversible',
      $tableName,
      false,
    );
  }

  final VerificationMeta _wholeWordMeta = const VerificationMeta('wholeWord');
  @override
  late final GeneratedBoolColumn wholeWord = _constructWholeWord();
  GeneratedBoolColumn _constructWholeWord() {
    return GeneratedBoolColumn(
      'whole_word',
      $tableName,
      false,
    );
  }

  final VerificationMeta _expiresAtMeta = const VerificationMeta('expiresAt');
  @override
  late final GeneratedDateTimeColumn expiresAt = _constructExpiresAt();
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
    } else if (isInserting) {
      context.missing(_irreversibleMeta);
    }
    if (data.containsKey('whole_word')) {
      context.handle(_wholeWordMeta,
          wholeWord.isAcceptableOrUnknown(data['whole_word']!, _wholeWordMeta));
    } else if (isInserting) {
      context.missing(_wholeWordMeta);
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
    return DbFilter.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbFiltersTable createAlias(String alias) {
    return $DbFiltersTable(_db, alias);
  }

  static TypeConverter<List<String>, String> $converter0 =
      StringListDatabaseConverter();
}

class DbInstanceAnnouncement extends DataClass
    implements Insertable<DbInstanceAnnouncement> {
  final int? id;
  final String remoteId;
  final bool allDay;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final bool read;
  final String content;
  final List<PleromaApiAnnouncementReaction>? reactions;
  final List<PleromaApiMention>? mentions;
  final List<PleromaApiTag>? tags;
  final List<PleromaApiStatus>? statuses;
  final DateTime? scheduledAt;
  final DateTime? startsAt;
  final DateTime? endsAt;
  DbInstanceAnnouncement(
      {this.id,
      required this.remoteId,
      required this.allDay,
      required this.publishedAt,
      required this.updatedAt,
      required this.read,
      required this.content,
      this.reactions,
      this.mentions,
      this.tags,
      this.statuses,
      this.scheduledAt,
      this.startsAt,
      this.endsAt});
  factory DbInstanceAnnouncement.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbInstanceAnnouncement(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      remoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remote_id'])!,
      allDay: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}all_day'])!,
      publishedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      read: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}read'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      reactions: $DbInstanceAnnouncementsTable.$converter0.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}reactions'])),
      mentions: $DbInstanceAnnouncementsTable.$converter1.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}mentions'])),
      tags: $DbInstanceAnnouncementsTable.$converter2.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}tags'])),
      statuses: $DbInstanceAnnouncementsTable.$converter3.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}statuses'])),
      scheduledAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}scheduled_at']),
      startsAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}starts_at']),
      endsAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ends_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['remote_id'] = Variable<String>(remoteId);
    map['all_day'] = Variable<bool>(allDay);
    map['published_at'] = Variable<DateTime>(publishedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['read'] = Variable<bool>(read);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || reactions != null) {
      final converter = $DbInstanceAnnouncementsTable.$converter0;
      map['reactions'] = Variable<String?>(converter.mapToSql(reactions));
    }
    if (!nullToAbsent || mentions != null) {
      final converter = $DbInstanceAnnouncementsTable.$converter1;
      map['mentions'] = Variable<String?>(converter.mapToSql(mentions));
    }
    if (!nullToAbsent || tags != null) {
      final converter = $DbInstanceAnnouncementsTable.$converter2;
      map['tags'] = Variable<String?>(converter.mapToSql(tags));
    }
    if (!nullToAbsent || statuses != null) {
      final converter = $DbInstanceAnnouncementsTable.$converter3;
      map['statuses'] = Variable<String?>(converter.mapToSql(statuses));
    }
    if (!nullToAbsent || scheduledAt != null) {
      map['scheduled_at'] = Variable<DateTime?>(scheduledAt);
    }
    if (!nullToAbsent || startsAt != null) {
      map['starts_at'] = Variable<DateTime?>(startsAt);
    }
    if (!nullToAbsent || endsAt != null) {
      map['ends_at'] = Variable<DateTime?>(endsAt);
    }
    return map;
  }

  DbInstanceAnnouncementsCompanion toCompanion(bool nullToAbsent) {
    return DbInstanceAnnouncementsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      remoteId: Value(remoteId),
      allDay: Value(allDay),
      publishedAt: Value(publishedAt),
      updatedAt: Value(updatedAt),
      read: Value(read),
      content: Value(content),
      reactions: reactions == null && nullToAbsent
          ? const Value.absent()
          : Value(reactions),
      mentions: mentions == null && nullToAbsent
          ? const Value.absent()
          : Value(mentions),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      statuses: statuses == null && nullToAbsent
          ? const Value.absent()
          : Value(statuses),
      scheduledAt: scheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledAt),
      startsAt: startsAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startsAt),
      endsAt:
          endsAt == null && nullToAbsent ? const Value.absent() : Value(endsAt),
    );
  }

  factory DbInstanceAnnouncement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbInstanceAnnouncement(
      id: serializer.fromJson<int?>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      allDay: serializer.fromJson<bool>(json['allDay']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      read: serializer.fromJson<bool>(json['read']),
      content: serializer.fromJson<String>(json['content']),
      reactions: serializer
          .fromJson<List<PleromaApiAnnouncementReaction>?>(json['reactions']),
      mentions: serializer.fromJson<List<PleromaApiMention>?>(json['mentions']),
      tags: serializer.fromJson<List<PleromaApiTag>?>(json['tags']),
      statuses: serializer.fromJson<List<PleromaApiStatus>?>(json['statuses']),
      scheduledAt: serializer.fromJson<DateTime?>(json['scheduledAt']),
      startsAt: serializer.fromJson<DateTime?>(json['startsAt']),
      endsAt: serializer.fromJson<DateTime?>(json['endsAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'allDay': serializer.toJson<bool>(allDay),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'read': serializer.toJson<bool>(read),
      'content': serializer.toJson<String>(content),
      'reactions':
          serializer.toJson<List<PleromaApiAnnouncementReaction>?>(reactions),
      'mentions': serializer.toJson<List<PleromaApiMention>?>(mentions),
      'tags': serializer.toJson<List<PleromaApiTag>?>(tags),
      'statuses': serializer.toJson<List<PleromaApiStatus>?>(statuses),
      'scheduledAt': serializer.toJson<DateTime?>(scheduledAt),
      'startsAt': serializer.toJson<DateTime?>(startsAt),
      'endsAt': serializer.toJson<DateTime?>(endsAt),
    };
  }

  DbInstanceAnnouncement copyWith(
          {int? id,
          String? remoteId,
          bool? allDay,
          DateTime? publishedAt,
          DateTime? updatedAt,
          bool? read,
          String? content,
          List<PleromaApiAnnouncementReaction>? reactions,
          List<PleromaApiMention>? mentions,
          List<PleromaApiTag>? tags,
          List<PleromaApiStatus>? statuses,
          DateTime? scheduledAt,
          DateTime? startsAt,
          DateTime? endsAt}) =>
      DbInstanceAnnouncement(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        allDay: allDay ?? this.allDay,
        publishedAt: publishedAt ?? this.publishedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        read: read ?? this.read,
        content: content ?? this.content,
        reactions: reactions ?? this.reactions,
        mentions: mentions ?? this.mentions,
        tags: tags ?? this.tags,
        statuses: statuses ?? this.statuses,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        startsAt: startsAt ?? this.startsAt,
        endsAt: endsAt ?? this.endsAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbInstanceAnnouncement(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('allDay: $allDay, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('read: $read, ')
          ..write('content: $content, ')
          ..write('reactions: $reactions, ')
          ..write('mentions: $mentions, ')
          ..write('tags: $tags, ')
          ..write('statuses: $statuses, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          remoteId.hashCode,
          $mrjc(
              allDay.hashCode,
              $mrjc(
                  publishedAt.hashCode,
                  $mrjc(
                      updatedAt.hashCode,
                      $mrjc(
                          read.hashCode,
                          $mrjc(
                              content.hashCode,
                              $mrjc(
                                  reactions.hashCode,
                                  $mrjc(
                                      mentions.hashCode,
                                      $mrjc(
                                          tags.hashCode,
                                          $mrjc(
                                              statuses.hashCode,
                                              $mrjc(
                                                  scheduledAt.hashCode,
                                                  $mrjc(
                                                      startsAt.hashCode,
                                                      endsAt
                                                          .hashCode))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbInstanceAnnouncement &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.allDay == this.allDay &&
          other.publishedAt == this.publishedAt &&
          other.updatedAt == this.updatedAt &&
          other.read == this.read &&
          other.content == this.content &&
          other.reactions == this.reactions &&
          other.mentions == this.mentions &&
          other.tags == this.tags &&
          other.statuses == this.statuses &&
          other.scheduledAt == this.scheduledAt &&
          other.startsAt == this.startsAt &&
          other.endsAt == this.endsAt);
}

class DbInstanceAnnouncementsCompanion
    extends UpdateCompanion<DbInstanceAnnouncement> {
  final Value<int?> id;
  final Value<String> remoteId;
  final Value<bool> allDay;
  final Value<DateTime> publishedAt;
  final Value<DateTime> updatedAt;
  final Value<bool> read;
  final Value<String> content;
  final Value<List<PleromaApiAnnouncementReaction>?> reactions;
  final Value<List<PleromaApiMention>?> mentions;
  final Value<List<PleromaApiTag>?> tags;
  final Value<List<PleromaApiStatus>?> statuses;
  final Value<DateTime?> scheduledAt;
  final Value<DateTime?> startsAt;
  final Value<DateTime?> endsAt;
  const DbInstanceAnnouncementsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.allDay = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.read = const Value.absent(),
    this.content = const Value.absent(),
    this.reactions = const Value.absent(),
    this.mentions = const Value.absent(),
    this.tags = const Value.absent(),
    this.statuses = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.endsAt = const Value.absent(),
  });
  DbInstanceAnnouncementsCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required bool allDay,
    required DateTime publishedAt,
    required DateTime updatedAt,
    required bool read,
    required String content,
    this.reactions = const Value.absent(),
    this.mentions = const Value.absent(),
    this.tags = const Value.absent(),
    this.statuses = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.endsAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        allDay = Value(allDay),
        publishedAt = Value(publishedAt),
        updatedAt = Value(updatedAt),
        read = Value(read),
        content = Value(content);
  static Insertable<DbInstanceAnnouncement> custom({
    Expression<int?>? id,
    Expression<String>? remoteId,
    Expression<bool>? allDay,
    Expression<DateTime>? publishedAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? read,
    Expression<String>? content,
    Expression<List<PleromaApiAnnouncementReaction>?>? reactions,
    Expression<List<PleromaApiMention>?>? mentions,
    Expression<List<PleromaApiTag>?>? tags,
    Expression<List<PleromaApiStatus>?>? statuses,
    Expression<DateTime?>? scheduledAt,
    Expression<DateTime?>? startsAt,
    Expression<DateTime?>? endsAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (allDay != null) 'all_day': allDay,
      if (publishedAt != null) 'published_at': publishedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (read != null) 'read': read,
      if (content != null) 'content': content,
      if (reactions != null) 'reactions': reactions,
      if (mentions != null) 'mentions': mentions,
      if (tags != null) 'tags': tags,
      if (statuses != null) 'statuses': statuses,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (startsAt != null) 'starts_at': startsAt,
      if (endsAt != null) 'ends_at': endsAt,
    });
  }

  DbInstanceAnnouncementsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? remoteId,
      Value<bool>? allDay,
      Value<DateTime>? publishedAt,
      Value<DateTime>? updatedAt,
      Value<bool>? read,
      Value<String>? content,
      Value<List<PleromaApiAnnouncementReaction>?>? reactions,
      Value<List<PleromaApiMention>?>? mentions,
      Value<List<PleromaApiTag>?>? tags,
      Value<List<PleromaApiStatus>?>? statuses,
      Value<DateTime?>? scheduledAt,
      Value<DateTime?>? startsAt,
      Value<DateTime?>? endsAt}) {
    return DbInstanceAnnouncementsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      allDay: allDay ?? this.allDay,
      publishedAt: publishedAt ?? this.publishedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      read: read ?? this.read,
      content: content ?? this.content,
      reactions: reactions ?? this.reactions,
      mentions: mentions ?? this.mentions,
      tags: tags ?? this.tags,
      statuses: statuses ?? this.statuses,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (allDay.present) {
      map['all_day'] = Variable<bool>(allDay.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (reactions.present) {
      final converter = $DbInstanceAnnouncementsTable.$converter0;
      map['reactions'] = Variable<String?>(converter.mapToSql(reactions.value));
    }
    if (mentions.present) {
      final converter = $DbInstanceAnnouncementsTable.$converter1;
      map['mentions'] = Variable<String?>(converter.mapToSql(mentions.value));
    }
    if (tags.present) {
      final converter = $DbInstanceAnnouncementsTable.$converter2;
      map['tags'] = Variable<String?>(converter.mapToSql(tags.value));
    }
    if (statuses.present) {
      final converter = $DbInstanceAnnouncementsTable.$converter3;
      map['statuses'] = Variable<String?>(converter.mapToSql(statuses.value));
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime?>(scheduledAt.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime?>(startsAt.value);
    }
    if (endsAt.present) {
      map['ends_at'] = Variable<DateTime?>(endsAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbInstanceAnnouncementsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('allDay: $allDay, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('read: $read, ')
          ..write('content: $content, ')
          ..write('reactions: $reactions, ')
          ..write('mentions: $mentions, ')
          ..write('tags: $tags, ')
          ..write('statuses: $statuses, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('startsAt: $startsAt, ')
          ..write('endsAt: $endsAt')
          ..write(')'))
        .toString();
  }
}

class $DbInstanceAnnouncementsTable extends DbInstanceAnnouncements
    with TableInfo<$DbInstanceAnnouncementsTable, DbInstanceAnnouncement> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbInstanceAnnouncementsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _remoteIdMeta = const VerificationMeta('remoteId');
  @override
  late final GeneratedTextColumn remoteId = _constructRemoteId();
  GeneratedTextColumn _constructRemoteId() {
    return GeneratedTextColumn('remote_id', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _allDayMeta = const VerificationMeta('allDay');
  @override
  late final GeneratedBoolColumn allDay = _constructAllDay();
  GeneratedBoolColumn _constructAllDay() {
    return GeneratedBoolColumn(
      'all_day',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedDateTimeColumn publishedAt = _constructPublishedAt();
  GeneratedDateTimeColumn _constructPublishedAt() {
    return GeneratedDateTimeColumn(
      'published_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedDateTimeColumn updatedAt = _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedBoolColumn read = _constructRead();
  GeneratedBoolColumn _constructRead() {
    return GeneratedBoolColumn(
      'read',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reactionsMeta = const VerificationMeta('reactions');
  @override
  late final GeneratedTextColumn reactions = _constructReactions();
  GeneratedTextColumn _constructReactions() {
    return GeneratedTextColumn(
      'reactions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _mentionsMeta = const VerificationMeta('mentions');
  @override
  late final GeneratedTextColumn mentions = _constructMentions();
  GeneratedTextColumn _constructMentions() {
    return GeneratedTextColumn(
      'mentions',
      $tableName,
      true,
    );
  }

  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedTextColumn tags = _constructTags();
  GeneratedTextColumn _constructTags() {
    return GeneratedTextColumn(
      'tags',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusesMeta = const VerificationMeta('statuses');
  @override
  late final GeneratedTextColumn statuses = _constructStatuses();
  GeneratedTextColumn _constructStatuses() {
    return GeneratedTextColumn(
      'statuses',
      $tableName,
      true,
    );
  }

  final VerificationMeta _scheduledAtMeta =
      const VerificationMeta('scheduledAt');
  @override
  late final GeneratedDateTimeColumn scheduledAt = _constructScheduledAt();
  GeneratedDateTimeColumn _constructScheduledAt() {
    return GeneratedDateTimeColumn(
      'scheduled_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startsAtMeta = const VerificationMeta('startsAt');
  @override
  late final GeneratedDateTimeColumn startsAt = _constructStartsAt();
  GeneratedDateTimeColumn _constructStartsAt() {
    return GeneratedDateTimeColumn(
      'starts_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _endsAtMeta = const VerificationMeta('endsAt');
  @override
  late final GeneratedDateTimeColumn endsAt = _constructEndsAt();
  GeneratedDateTimeColumn _constructEndsAt() {
    return GeneratedDateTimeColumn(
      'ends_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        allDay,
        publishedAt,
        updatedAt,
        read,
        content,
        reactions,
        mentions,
        tags,
        statuses,
        scheduledAt,
        startsAt,
        endsAt
      ];
  @override
  $DbInstanceAnnouncementsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_instance_announcements';
  @override
  final String actualTableName = 'db_instance_announcements';
  @override
  VerificationContext validateIntegrity(
      Insertable<DbInstanceAnnouncement> instance,
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
    if (data.containsKey('all_day')) {
      context.handle(_allDayMeta,
          allDay.isAcceptableOrUnknown(data['all_day']!, _allDayMeta));
    } else if (isInserting) {
      context.missing(_allDayMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    } else if (isInserting) {
      context.missing(_readMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    context.handle(_reactionsMeta, const VerificationResult.success());
    context.handle(_mentionsMeta, const VerificationResult.success());
    context.handle(_tagsMeta, const VerificationResult.success());
    context.handle(_statusesMeta, const VerificationResult.success());
    if (data.containsKey('scheduled_at')) {
      context.handle(
          _scheduledAtMeta,
          scheduledAt.isAcceptableOrUnknown(
              data['scheduled_at']!, _scheduledAtMeta));
    }
    if (data.containsKey('starts_at')) {
      context.handle(_startsAtMeta,
          startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta));
    }
    if (data.containsKey('ends_at')) {
      context.handle(_endsAtMeta,
          endsAt.isAcceptableOrUnknown(data['ends_at']!, _endsAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbInstanceAnnouncement map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbInstanceAnnouncement.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbInstanceAnnouncementsTable createAlias(String alias) {
    return $DbInstanceAnnouncementsTable(_db, alias);
  }

  static TypeConverter<List<PleromaApiAnnouncementReaction>, String>
      $converter0 = PleromaApiAnnouncementReactionListDatabaseConverter();
  static TypeConverter<List<PleromaApiMention>, String> $converter1 =
      PleromaApiMentionListDatabaseConverter();
  static TypeConverter<List<PleromaApiTag>, String> $converter2 =
      PleromaApiTagListDatabaseConverter();
  static TypeConverter<List<PleromaApiStatus>, String> $converter3 =
      PleromaApiStatusListDatabaseConverter();
}

class DbHomeTimelineStatus extends DataClass
    implements Insertable<DbHomeTimelineStatus> {
  final int? id;
  final String accountRemoteId;
  final String statusRemoteId;
  DbHomeTimelineStatus(
      {this.id, required this.accountRemoteId, required this.statusRemoteId});
  factory DbHomeTimelineStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbHomeTimelineStatus(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      accountRemoteId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}account_remote_id'])!,
      statusRemoteId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status_remote_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['account_remote_id'] = Variable<String>(accountRemoteId);
    map['status_remote_id'] = Variable<String>(statusRemoteId);
    return map;
  }

  DbHomeTimelineStatusesCompanion toCompanion(bool nullToAbsent) {
    return DbHomeTimelineStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      accountRemoteId: Value(accountRemoteId),
      statusRemoteId: Value(statusRemoteId),
    );
  }

  factory DbHomeTimelineStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbHomeTimelineStatus(
      id: serializer.fromJson<int?>(json['id']),
      accountRemoteId: serializer.fromJson<String>(json['accountRemoteId']),
      statusRemoteId: serializer.fromJson<String>(json['statusRemoteId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'accountRemoteId': serializer.toJson<String>(accountRemoteId),
      'statusRemoteId': serializer.toJson<String>(statusRemoteId),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbHomeTimelineStatus &&
          other.id == this.id &&
          other.accountRemoteId == this.accountRemoteId &&
          other.statusRemoteId == this.statusRemoteId);
}

class DbHomeTimelineStatusesCompanion
    extends UpdateCompanion<DbHomeTimelineStatus> {
  final Value<int?> id;
  final Value<String> accountRemoteId;
  final Value<String> statusRemoteId;
  const DbHomeTimelineStatusesCompanion({
    this.id = const Value.absent(),
    this.accountRemoteId = const Value.absent(),
    this.statusRemoteId = const Value.absent(),
  });
  DbHomeTimelineStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String accountRemoteId,
    required String statusRemoteId,
  })  : accountRemoteId = Value(accountRemoteId),
        statusRemoteId = Value(statusRemoteId);
  static Insertable<DbHomeTimelineStatus> custom({
    Expression<int?>? id,
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
      {Value<int?>? id,
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
      map['account_remote_id'] = Variable<String>(accountRemoteId.value);
    }
    if (statusRemoteId.present) {
      map['status_remote_id'] = Variable<String>(statusRemoteId.value);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _accountRemoteIdMeta =
      const VerificationMeta('accountRemoteId');
  @override
  late final GeneratedTextColumn accountRemoteId = _constructAccountRemoteId();
  GeneratedTextColumn _constructAccountRemoteId() {
    return GeneratedTextColumn('account_remote_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _statusRemoteIdMeta =
      const VerificationMeta('statusRemoteId');
  @override
  late final GeneratedTextColumn statusRemoteId = _constructStatusRemoteId();
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
    return DbHomeTimelineStatus.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  DbDraftStatus({this.id, required this.updatedAt, required this.data});
  factory DbDraftStatus.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbDraftStatus(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      data: $DbDraftStatusesTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      final converter = $DbDraftStatusesTable.$converter0;
      map['data'] = Variable<String>(converter.mapToSql(data)!);
    }
    return map;
  }

  DbDraftStatusesCompanion toCompanion(bool nullToAbsent) {
    return DbDraftStatusesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      updatedAt: Value(updatedAt),
      data: Value(data),
    );
  }

  factory DbDraftStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbDraftStatus(
      id: serializer.fromJson<int?>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      data: serializer.fromJson<PostStatusData>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'data': serializer.toJson<PostStatusData>(data),
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDraftStatus &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.data == this.data);
}

class DbDraftStatusesCompanion extends UpdateCompanion<DbDraftStatus> {
  final Value<int?> id;
  final Value<DateTime> updatedAt;
  final Value<PostStatusData> data;
  const DbDraftStatusesCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.data = const Value.absent(),
  });
  DbDraftStatusesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime updatedAt,
    required PostStatusData data,
  })  : updatedAt = Value(updatedAt),
        data = Value(data);
  static Insertable<DbDraftStatus> custom({
    Expression<int?>? id,
    Expression<DateTime>? updatedAt,
    Expression<PostStatusData>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (data != null) 'data': data,
    });
  }

  DbDraftStatusesCompanion copyWith(
      {Value<int?>? id,
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
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (data.present) {
      final converter = $DbDraftStatusesTable.$converter0;
      map['data'] = Variable<String>(converter.mapToSql(data.value)!);
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
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedDateTimeColumn updatedAt = _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedTextColumn data = _constructData();
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
    return DbDraftStatus.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
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
  late final $DbStatusesTable dbStatuses = $DbStatusesTable(this);
  late final Index dbStatusRemoteIdIndex = Index('db_status_remote_id_index',
      'CREATE UNIQUE INDEX db_status_remote_id_index ON db_statuses (remote_id);');
  late final $DbAccountsTable dbAccounts = $DbAccountsTable(this);
  late final Index dbAccountRemoteIdIndex = Index('db_account_remote_id_index',
      'CREATE UNIQUE INDEX db_account_remote_id_index ON db_accounts (remote_id);');
  late final $DbConversationsTable dbConversations =
      $DbConversationsTable(this);
  late final Index dbConversationRemoteIdIndex = Index(
      'db_conversation_remote_id_index',
      'CREATE UNIQUE INDEX db_conversation_remote_id_index ON db_conversations (remote_id);');
  late final $DbNotificationsTable dbNotifications =
      $DbNotificationsTable(this);
  late final Index dbNotificationRemoteIdIndex = Index(
      'db_notification_remote_id_index',
      'CREATE UNIQUE INDEX db_notification_remote_id_index ON db_notifications (remote_id);');
  late final $DbConversationStatusesTable dbConversationStatuses =
      $DbConversationStatusesTable(this);
  late final Index dbConversationStatusesIndex = Index(
      'db_conversation_statuses_index',
      'CREATE UNIQUE INDEX db_conversation_statuses_index ON db_conversation_statuses(status_remote_id, conversation_remote_id);');
  late final $DbStatusHashtagsTable dbStatusHashtags =
      $DbStatusHashtagsTable(this);
  late final Index dbStatusHashtagsIndex = Index('db_status_hashtags_index',
      'CREATE UNIQUE INDEX db_status_hashtags_index ON db_status_hashtags(status_remote_id, hashtag);');
  late final $DbStatusListsTable dbStatusLists = $DbStatusListsTable(this);
  late final Index dbStatusListsIndex = Index('db_status_lists_index',
      'CREATE UNIQUE INDEX db_status_lists_index ON db_status_lists(status_remote_id, list_remote_id);');
  late final $DbStatusFavouritedAccountsTable dbStatusFavouritedAccounts =
      $DbStatusFavouritedAccountsTable(this);
  late final Index dbStatusFavouritedAccountsIndex = Index(
      'db_status_favourited_accounts_index',
      'CREATE UNIQUE INDEX db_status_favourited_accounts_index ON db_status_favourited_accounts(status_remote_id, account_remote_id);');
  late final $DbStatusRebloggedAccountsTable dbStatusRebloggedAccounts =
      $DbStatusRebloggedAccountsTable(this);
  late final Index dbStatusRebloggedAccountsIndex = Index(
      'db_status_reblogged_accounts_index',
      'CREATE UNIQUE INDEX db_status_reblogged_accounts_index ON db_status_reblogged_accounts(status_remote_id, account_remote_id);');
  late final $DbAccountFollowingsTable dbAccountFollowings =
      $DbAccountFollowingsTable(this);
  late final Index dbAccountFollowingsIndex = Index(
      'db_account_followings_index',
      'CREATE UNIQUE INDEX db_account_followings_index ON db_account_followings(account_remote_id, following_account_remote_id);');
  late final $DbAccountFollowersTable dbAccountFollowers =
      $DbAccountFollowersTable(this);
  late final Index dbAccountFollowersIndex = Index('db_account_followers_index',
      'CREATE UNIQUE INDEX db_account_followers_index ON db_account_followers(account_remote_id, follower_account_remote_id);');
  late final $DbConversationAccountsTable dbConversationAccounts =
      $DbConversationAccountsTable(this);
  late final Index dbConversationAccountsIndex = Index(
      'db_conversation_accounts_index',
      'CREATE UNIQUE INDEX db_conversation_accounts_index ON db_conversation_accounts(conversation_remote_id, account_remote_id);');
  late final $DbScheduledStatusesTable dbScheduledStatuses =
      $DbScheduledStatusesTable(this);
  late final Index dbScheduledStatusRemoteIdIndex = Index(
      'db_scheduled_status_remote_id_index',
      'CREATE UNIQUE INDEX db_scheduled_status_remote_id_index ON db_scheduled_statuses (remote_id);');
  late final $DbChatsTable dbChats = $DbChatsTable(this);
  late final Index dbChatRemoteIdIndex = Index('db_chat_remote_id_index',
      'CREATE UNIQUE INDEX db_chat_remote_id_index ON db_chats (remote_id);');
  late final $DbChatMessagesTable dbChatMessages = $DbChatMessagesTable(this);
  late final Index dbChatMessagesRemoteIdIndex = Index(
      'db_chat_messages_remote_id_index',
      'CREATE UNIQUE INDEX db_chat_messages_remote_id_index ON db_chat_messages(remote_id);');
  late final Index dbChatMessagesChatRemoteIdIndex = Index(
      'db_chat_messages_chat_remote_id_index',
      'CREATE INDEX db_chat_messages_chat_remote_id_index ON db_chat_messages(chat_remote_id);');
  late final $DbChatAccountsTable dbChatAccounts = $DbChatAccountsTable(this);
  late final Index dbChatAccountsIndex = Index('db_chat_accounts_index',
      'CREATE UNIQUE INDEX db_chat_accounts_index ON db_chat_accounts(chat_remote_id, account_remote_id);');
  late final $DbFiltersTable dbFilters = $DbFiltersTable(this);
  late final Index dbFilterRemoteIdIndex = Index('db_filter_remote_id_index',
      'CREATE UNIQUE INDEX db_filter_remote_id_index ON db_filters (remote_id);');
  late final $DbInstanceAnnouncementsTable dbInstanceAnnouncements =
      $DbInstanceAnnouncementsTable(this);
  late final Index dbInstanceAnnouncementRemoteIdIndex = Index(
      'db_instance_announcement_remote_id_index',
      'CREATE UNIQUE INDEX db_instance_announcement_remote_id_index ON db_instance_announcements (remote_id);');
  late final $DbHomeTimelineStatusesTable dbHomeTimelineStatuses =
      $DbHomeTimelineStatusesTable(this);
  late final $DbDraftStatusesTable dbDraftStatuses =
      $DbDraftStatusesTable(this);
  late final StatusDao statusDao = StatusDao(this as AppDatabase);
  late final StatusHashtagsDao statusHashtagsDao =
      StatusHashtagsDao(this as AppDatabase);
  late final StatusListsDao statusListsDao =
      StatusListsDao(this as AppDatabase);
  late final AccountDao accountDao = AccountDao(this as AppDatabase);
  late final AccountFollowingsDao accountFollowingsDao =
      AccountFollowingsDao(this as AppDatabase);
  late final AccountFollowersDao accountFollowersDao =
      AccountFollowersDao(this as AppDatabase);
  late final ConversationDao conversationDao =
      ConversationDao(this as AppDatabase);
  late final ConversationAccountsDao conversationAccountsDao =
      ConversationAccountsDao(this as AppDatabase);
  late final ConversationStatusesDao conversationStatusesDao =
      ConversationStatusesDao(this as AppDatabase);
  late final StatusFavouritedAccountsDao statusFavouritedAccountsDao =
      StatusFavouritedAccountsDao(this as AppDatabase);
  late final StatusRebloggedAccountsDao statusRebloggedAccountsDao =
      StatusRebloggedAccountsDao(this as AppDatabase);
  late final NotificationDao notificationDao =
      NotificationDao(this as AppDatabase);
  late final ScheduledStatusDao scheduledStatusDao =
      ScheduledStatusDao(this as AppDatabase);
  late final ChatDao chatDao = ChatDao(this as AppDatabase);
  late final ChatAccountsDao chatAccountsDao =
      ChatAccountsDao(this as AppDatabase);
  late final ChatMessageDao chatMessageDao =
      ChatMessageDao(this as AppDatabase);
  late final HomeTimelineStatusesDao homeTimelineStatusesDao =
      HomeTimelineStatusesDao(this as AppDatabase);
  late final DraftStatusDao draftStatusDao =
      DraftStatusDao(this as AppDatabase);
  late final FilterDao filterDao = FilterDao(this as AppDatabase);
  late final InstanceAnnouncementDao instanceAnnouncementDao =
      InstanceAnnouncementDao(this as AppDatabase);
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
        dbInstanceAnnouncements,
        dbInstanceAnnouncementRemoteIdIndex,
        dbHomeTimelineStatuses,
        dbDraftStatuses
      ];
}
