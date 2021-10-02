import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pleroma_chat_model.freezed.dart';

abstract class IPleromaChat implements IChat {
  static int compareItemsToSort(
    IPleromaChat? a,
    IPleromaChat? b,
  ) {
    if (a?.updatedAt == null && b?.updatedAt == null) {
      return 0;
    } else if (a?.updatedAt != null && b?.updatedAt == null) {
      return 1;
    } else if (a?.updatedAt == null && b?.updatedAt != null) {
      return -1;
    } else {
      return a!.updatedAt!.compareTo(b!.updatedAt!);
    }
  }

  static bool isItemsEqual(
    IPleromaChat a,
    IPleromaChat b,
  ) =>
      a.remoteId == b.remoteId;
}

@freezed
class DbPleromaChatPopulated with _$DbPleromaChatPopulated {
  const factory DbPleromaChatPopulated({
    required DbChat dbChat,
    required DbAccount dbAccount,
  }) = _DbPleromaChatPopulated;
}

@freezed
class DbPleromaChatWithLastMessagePopulated
    with _$DbPleromaChatWithLastMessagePopulated {
  const factory DbPleromaChatWithLastMessagePopulated({
    required DbPleromaChatPopulated dbPleromaChatPopulated,
    required DbChatMessagePopulated? dbChatMessagePopulated,
  }) = _DbPleromaChatWithLastMessagePopulated;
}

@freezed
class DbPleromaChatWithLastMessagePopulatedWrapper
    with _$DbPleromaChatWithLastMessagePopulatedWrapper
    implements IPleromaChatWithLastMessage {
  const DbPleromaChatWithLastMessagePopulatedWrapper._();

  const factory DbPleromaChatWithLastMessagePopulatedWrapper({
    required DbPleromaChatWithLastMessagePopulated
        dbPleromaChatWithLastMessagePopulated,
  }) = _DbPleromaChatWithLastMessagePopulatedWrapper;

  @override
  IPleromaChat get chat => DbPleromaChatPopulatedWrapper(
        dbChatPopulated:
            dbPleromaChatWithLastMessagePopulated.dbPleromaChatPopulated,
      );

  @override
  IPleromaChatMessage? get lastChatMessage =>
      dbPleromaChatWithLastMessagePopulated.dbChatMessagePopulated != null
          ? DbPleromaChatMessagePopulatedWrapper(
              dbChatMessagePopulated:
                  dbPleromaChatWithLastMessagePopulated.dbChatMessagePopulated!,
            )
          : null;

  @override
  int compareTo(IPleromaChatWithLastMessage b) =>
      IPleromaChat.compareItemsToSort(
        chat,
        b.chat,
      );

  @override
  bool isEqualTo(IPleromaChatWithLastMessage b) => IPleromaChat.isItemsEqual(
        chat,
        b.chat,
      );
}

@freezed
class DbPleromaChatPopulatedWrapper
    with _$DbPleromaChatPopulatedWrapper
    implements IPleromaChat {
  const DbPleromaChatPopulatedWrapper._();
  const factory DbPleromaChatPopulatedWrapper({
    required DbPleromaChatPopulated dbChatPopulated,
  }) = _DbPleromaChatPopulatedWrapper;

  @override
  int? get localId => dbChatPopulated.dbChat.id;

  @override
  String get remoteId => dbChatPopulated.dbChat.remoteId;

  @override
  int get unread => dbChatPopulated.dbChat.unread;

  @override
  DateTime? get updatedAt => dbChatPopulated.dbChat.updatedAt;

  @override
  List<IAccount> get accounts => [
        DbAccountPopulatedWrapper(
          dbAccountPopulated: DbAccountPopulated(
            dbAccount: dbChatPopulated.dbAccount,
          ),
        ),
      ];
}

extension IPleromaChatExtension on IPleromaChat {
  DbPleromaChatPopulatedWrapper toDbPleromaChatPopulatedWrapper() {
    if (this is DbPleromaChatPopulatedWrapper) {
      return this as DbPleromaChatPopulatedWrapper;
    } else {
      return DbPleromaChatPopulatedWrapper(
        dbChatPopulated: toDbPleromaChatPopulated(),
      );
    }
  }

  DbPleromaChatPopulated toDbPleromaChatPopulated() {
    if (this is DbPleromaChatPopulatedWrapper) {
      var dbPleromaChatPopulatedWrapper = this as DbPleromaChatPopulatedWrapper;

      return dbPleromaChatPopulatedWrapper.dbChatPopulated;
    } else {
      return DbPleromaChatPopulated(
        dbChat: toDbChat(),
        dbAccount: accounts.first.toDbAccount(),
      );
    }
  }

  DbChat toDbChat() {
    if (this is DbPleromaChatPopulatedWrapper) {
      var dbPleromaChatPopulatedWrapper = this as DbPleromaChatPopulatedWrapper;

      return dbPleromaChatPopulatedWrapper.dbChatPopulated.dbChat;
    } else {
      return DbChat(
        id: localId,
        remoteId: remoteId,
        unread: unread,
        updatedAt: updatedAt,
        accountRemoteId: accounts.first.remoteId,
      );
    }
  }
}
