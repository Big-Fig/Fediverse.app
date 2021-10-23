import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'pleroma_chat_message_model.freezed.dart';

abstract class IPleromaChatMessage extends IChatMessage
    implements IEqualComparableObj<IPleromaChatMessage> {
  static int compareItemsToSort(
    IPleromaChatMessage? a,
    IPleromaChatMessage? b,
  ) {
    if (a?.createdAt == null && b?.createdAt == null) {
      return 0;
    } else if (a?.createdAt != null && b?.createdAt == null) {
      return 1;
    } else if (a?.createdAt == null && b?.createdAt != null) {
      return -1;
    } else {
      return a!.createdAt.compareTo(b!.createdAt);
    }
  }

  static bool isItemsEqual(IPleromaChatMessage a, IPleromaChatMessage b) =>
      a.remoteId == b.remoteId;
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
        emojis: emojis?.toUnifediApiEmojiList(),
        card: card?.toUnifediApiCard(),
        mediaAttachment:
            mediaAttachments?.singleOrNull?.toUnifediApiMediaAttachment(),
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

@freezed
class DbPleromaChatMessagePopulatedWrapper
    with _$DbPleromaChatMessagePopulatedWrapper
    implements IPleromaChatMessage {
  const DbPleromaChatMessagePopulatedWrapper._();

  const factory DbPleromaChatMessagePopulatedWrapper({
    required DbChatMessagePopulated dbChatMessagePopulated,
  }) = _DbPleromaChatMessagePopulatedWrapper;

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
  IUnifediApiCard? get card => dbChatMessagePopulated.dbChatMessage.card;

  @override
  DateTime get createdAt => dbChatMessagePopulated.dbChatMessage.createdAt;

  @override
  List<IUnifediApiEmoji>? get emojis =>
      dbChatMessagePopulated.dbChatMessage.emojis;

  @override
  String get remoteId => dbChatMessagePopulated.dbChatMessage.remoteId;

  @override
  List<IUnifediApiMediaAttachment>? get mediaAttachments {
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
  bool get deleted => dbChatMessagePopulated.dbChatMessage.deleted == true;

  @override
  bool get hiddenLocallyOnDevice =>
      dbChatMessagePopulated.dbChatMessage.hiddenLocallyOnDevice == true;

  @override
  String get accountRemoteId =>
      dbChatMessagePopulated.dbChatMessage.accountRemoteId;

  @override
  int compareTo(IPleromaChatMessage b) =>
      IPleromaChatMessage.compareItemsToSort(this, b);

  @override
  bool isEqualTo(IPleromaChatMessage b) =>
      IPleromaChatMessage.isItemsEqual(this, b);
}

@freezed
class DbChatMessagePopulated with _$DbChatMessagePopulated {
  const DbChatMessagePopulated._();
  const factory DbChatMessagePopulated({
    required DbChatMessage dbChatMessage,
    required DbAccount? dbAccount,
  }) = _DbChatMessagePopulated;
}
