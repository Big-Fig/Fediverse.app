import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unifedi_chat_model.freezed.dart';

abstract class IUnifediChat implements IChat {
  static int compareItemsToSort(
    IUnifediChat? a,
    IUnifediChat? b,
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
    IUnifediChat a,
    IUnifediChat b,
  ) =>
      a.remoteId == b.remoteId;
}

@freezed
class DbUnifediChatPopulated with _$DbUnifediChatPopulated {
  const factory DbUnifediChatPopulated({
    required DbChat dbChat,
    required DbAccount dbAccount,
  }) = _DbUnifediChatPopulated;
}

@freezed
class DbUnifediChatWithLastMessagePopulated
    with _$DbUnifediChatWithLastMessagePopulated {
  const factory DbUnifediChatWithLastMessagePopulated({
    required DbUnifediChatPopulated dbUnifediChatPopulated,
    required DbChatMessagePopulated? dbChatMessagePopulated,
  }) = _DbUnifediChatWithLastMessagePopulated;
}

@freezed
class DbUnifediChatWithLastMessagePopulatedWrapper
    with _$DbUnifediChatWithLastMessagePopulatedWrapper
    implements IUnifediChatWithLastMessage {
  const DbUnifediChatWithLastMessagePopulatedWrapper._();

  const factory DbUnifediChatWithLastMessagePopulatedWrapper({
    required DbUnifediChatWithLastMessagePopulated
        dbUnifediChatWithLastMessagePopulated,
  }) = _DbUnifediChatWithLastMessagePopulatedWrapper;

  @override
  IUnifediChat get chat => DbUnifediChatPopulatedWrapper(
        dbChatPopulated:
            dbUnifediChatWithLastMessagePopulated.dbUnifediChatPopulated,
      );

  @override
  IUnifediChatMessage? get lastChatMessage =>
      dbUnifediChatWithLastMessagePopulated.dbChatMessagePopulated != null
          ? DbUnifediChatMessagePopulatedWrapper(
              dbChatMessagePopulated:
                  dbUnifediChatWithLastMessagePopulated.dbChatMessagePopulated!,
            )
          : null;

  @override
  int compareTo(IUnifediChatWithLastMessage b) =>
      IUnifediChat.compareItemsToSort(
        chat,
        b.chat,
      );

  @override
  bool isEqualTo(IUnifediChatWithLastMessage b) => IUnifediChat.isItemsEqual(
        chat,
        b.chat,
      );
}

@freezed
class DbUnifediChatPopulatedWrapper
    with _$DbUnifediChatPopulatedWrapper
    implements IUnifediChat {
  const DbUnifediChatPopulatedWrapper._();
  const factory DbUnifediChatPopulatedWrapper({
    required DbUnifediChatPopulated dbChatPopulated,
  }) = _DbUnifediChatPopulatedWrapper;

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

extension IUnifediChatExtension on IUnifediChat {
  DbUnifediChatPopulatedWrapper toDbUnifediChatPopulatedWrapper() {
    if (this is DbUnifediChatPopulatedWrapper) {
      return this as DbUnifediChatPopulatedWrapper;
    } else {
      return DbUnifediChatPopulatedWrapper(
        dbChatPopulated: toDbUnifediChatPopulated(),
      );
    }
  }

  DbUnifediChatPopulated toDbUnifediChatPopulated() {
    if (this is DbUnifediChatPopulatedWrapper) {
      var dbUnifediChatPopulatedWrapper = this as DbUnifediChatPopulatedWrapper;

      return dbUnifediChatPopulatedWrapper.dbChatPopulated;
    } else {
      return DbUnifediChatPopulated(
        dbChat: toDbChat(),
        dbAccount: accounts.first.toDbAccount(),
      );
    }
  }

  DbChat toDbChat() {
    if (this is DbUnifediChatPopulatedWrapper) {
      var dbUnifediChatPopulatedWrapper = this as DbUnifediChatPopulatedWrapper;

      return dbUnifediChatPopulatedWrapper.dbChatPopulated.dbChat;
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
