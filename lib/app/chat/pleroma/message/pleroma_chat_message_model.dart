import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';

abstract class IPleromaChatMessage extends IChatMessage {
  @override
  IPleromaChatMessage copyWith({
    int? localId,
    String? remoteId,
    String? chatRemoteId,
    IAccount? account,
    String? content,
    DateTime? createdAt,
    List<IPleromaMediaAttachment>? mediaAttachments,
    List<PleromaEmoji>? emojis,
    IPleromaCard? card,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? deleted,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  });
}

extension IPleromaChatDbMessage on IPleromaChatMessage {
  DbPleromaChatMessagePopulatedWrapper toDbChatMessagePopulatedWrapper() {
    if (this is DbPleromaChatMessagePopulatedWrapper) {
      return this as DbPleromaChatMessagePopulatedWrapper;
    } else {
      return DbPleromaChatMessagePopulatedWrapper(
        dbChatMessagePopulated: toDbChatMessagePopulated(),
      );
    }
  }

  DbChatMessagePopulated toDbChatMessagePopulated() {
    if (this is DbPleromaChatMessagePopulatedWrapper) {
      return (this as DbPleromaChatMessagePopulatedWrapper)
          .dbChatMessagePopulated;
    } else {
      return DbChatMessagePopulated(
        dbChatMessage: toDbChatMessage(),
        dbAccount: toDbAccount(),
      );
    }
  }

  DbChatMessage toDbChatMessage() {
    if (this is DbPleromaChatMessagePopulatedWrapper) {
      return (this as DbPleromaChatMessagePopulatedWrapper)
          .dbChatMessagePopulated
          .dbChatMessage;
    } else {
      return DbChatMessage(
        id: localId,
        remoteId: remoteId,
        chatRemoteId: chatRemoteId,
        content: content,
        createdAt: createdAt,
        emojis: emojis?.toPleromaEmojis(),
        card: card?.toPleromaCard(),
        mediaAttachment:
            mediaAttachments?.singleOrNull?.toPleromaMediaAttachment(),
        accountRemoteId: accountRemoteId,
        pendingState: pendingState,
        oldPendingRemoteId: oldPendingRemoteId,
        deleted: deleted,
        hiddenLocallyOnDevice: hiddenLocallyOnDevice,
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
      );
    }
  }

  DbAccount? toDbAccount() {
    if (this is DbPleromaChatMessagePopulatedWrapper) {
      return (this as DbPleromaChatMessagePopulatedWrapper)
          .dbChatMessagePopulated
          .dbAccount;
    } else {
      return account?.toDbAccount();
    }
  }
}

class DbPleromaChatMessagePopulatedWrapper extends IPleromaChatMessage {
  final DbChatMessagePopulated dbChatMessagePopulated;

  @override
  String toString() {
    return 'DbPleromaChatMessagePopulatedWrapper{'
        'dbChatMessagePopulated: $dbChatMessagePopulated'
        '}';
  }

  DbPleromaChatMessagePopulatedWrapper({
    required this.dbChatMessagePopulated,
  });

  @override
  int? get localId => dbChatMessagePopulated.dbChatMessage.id;

  @override
  IAccount? get account => dbChatMessagePopulated.dbAccount != null
      ? DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbChatMessagePopulated.dbAccount!,
          ),
        )
      : null;

  @override
  String get chatRemoteId => dbChatMessagePopulated.dbChatMessage.chatRemoteId;

  @override
  String? get content => dbChatMessagePopulated.dbChatMessage.content;

  @override
  IPleromaCard? get card => dbChatMessagePopulated.dbChatMessage.card;

  @override
  DateTime get createdAt => dbChatMessagePopulated.dbChatMessage.createdAt;

  @override
  List<IPleromaEmoji>? get emojis =>
      dbChatMessagePopulated.dbChatMessage.emojis;

  @override
  String get remoteId => dbChatMessagePopulated.dbChatMessage.remoteId;

  @override
  List<IPleromaMediaAttachment>? get mediaAttachments {
    var mediaAttachment = dbChatMessagePopulated.dbChatMessage.mediaAttachment;
    return mediaAttachment != null
        ? [
            mediaAttachment,
          ]
        : null;
  }

  @override
  PendingState? get pendingState =>
      dbChatMessagePopulated.dbChatMessage.pendingState;

  @override
  String? get oldPendingRemoteId =>
      dbChatMessagePopulated.dbChatMessage.oldPendingRemoteId;

  @override
  String? get wasSentWithIdempotencyKey =>
      dbChatMessagePopulated.dbChatMessage.wasSentWithIdempotencyKey;

  @override
  DbPleromaChatMessagePopulatedWrapper copyWith({
    int? localId,
    String? remoteId,
    String? chatRemoteId,
    IAccount? account,
    String? content,
    DateTime? createdAt,
    List<IPleromaMediaAttachment>? mediaAttachments,
    List<PleromaEmoji>? emojis,
    IPleromaCard? card,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? deleted,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  }) =>
      DbPleromaChatMessagePopulatedWrapper(
        dbChatMessagePopulated: dbChatMessagePopulated.copyWith(
          localId: localId,
          remoteId: remoteId,
          chatRemoteId: chatRemoteId,
          account: account,
          content: content,
          createdAt: createdAt,
          mediaAttachment: mediaAttachments?.firstOrNull,
          emojis: emojis,
          card: card,
          pendingState: pendingState,
          oldPendingRemoteId: oldPendingRemoteId,
          deleted: deleted,
          hiddenLocallyOnDevice: hiddenLocallyOnDevice,
          wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPleromaChatMessagePopulatedWrapper &&
          runtimeType == other.runtimeType &&
          dbChatMessagePopulated == other.dbChatMessagePopulated;

  @override
  int get hashCode => dbChatMessagePopulated.hashCode;

  @override
  bool get deleted => dbChatMessagePopulated.dbChatMessage.deleted == true;

  @override
  bool get hiddenLocallyOnDevice =>
      dbChatMessagePopulated.dbChatMessage.hiddenLocallyOnDevice == true;

  @override
  String get accountRemoteId => dbChatMessagePopulated.dbChatMessage.accountRemoteId;
}

class DbChatMessagePopulated {
  final DbChatMessage dbChatMessage;
  final DbAccount? dbAccount;

  DbChatMessagePopulated({
    required this.dbChatMessage,
    required this.dbAccount,
  });

  // ignore: code-metrics
  DbChatMessagePopulated copyWith({
    int? localId,
    String? remoteId,
    String? chatRemoteId,
    IAccount? account,
    String? content,
    DateTime? createdAt,
    IPleromaMediaAttachment? mediaAttachment,
    List<IPleromaEmoji>? emojis,
    IPleromaCard? card,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? deleted,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  }) =>
      DbChatMessagePopulated(
        dbChatMessage: DbChatMessage(
          id: localId ?? dbChatMessage.id,
          remoteId: remoteId ?? dbChatMessage.remoteId,
          chatRemoteId: chatRemoteId ?? dbChatMessage.chatRemoteId,
          content: content ?? dbChatMessage.content,
          createdAt: createdAt ?? dbChatMessage.createdAt,
          emojis: emojis?.toPleromaEmojis() ?? dbChatMessage.emojis,
          card: card?.toPleromaCard() ?? dbChatMessage.card,
          mediaAttachment: mediaAttachment?.toPleromaMediaAttachment() ??
              dbChatMessage.mediaAttachment,
          accountRemoteId: account?.remoteId ?? dbChatMessage.accountRemoteId,
          pendingState: pendingState ?? dbChatMessage.pendingState,
          oldPendingRemoteId:
              oldPendingRemoteId ?? dbChatMessage.oldPendingRemoteId,
          deleted: deleted ?? dbChatMessage.deleted,
          hiddenLocallyOnDevice:
              hiddenLocallyOnDevice ?? dbChatMessage.hiddenLocallyOnDevice,
          wasSentWithIdempotencyKey: wasSentWithIdempotencyKey ??
              dbChatMessage.wasSentWithIdempotencyKey,
        ),
        dbAccount: account?.toDbAccount() ?? dbAccount,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbChatMessagePopulated &&
          runtimeType == other.runtimeType &&
          dbChatMessage == other.dbChatMessage &&
          dbAccount == other.dbAccount;

  @override
  int get hashCode => dbChatMessage.hashCode ^ dbAccount.hashCode;

  @override
  String toString() {
    return 'DbStatusPopulated{dbStatus: $dbChatMessage, dbAccount: $dbAccount}';
  }
}
