import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/database/app_database.dart';

abstract class IPleromaChat implements IChat {
  @override
  IPleromaChat copyWith({
    int? id,
    String? remoteId,
    int? unread,
    DateTime? updatedAt,
    List<IAccount>? accounts,
  });
}

class DbPleromaChatPopulated {
  final DbChat dbChat;
  final DbAccount dbAccount;

  DbPleromaChatPopulated({
    required this.dbChat,
    required this.dbAccount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbPleromaChatPopulated &&
          runtimeType == other.runtimeType &&
          dbChat == other.dbChat &&
          dbAccount == other.dbAccount;

  @override
  int get hashCode => dbChat.hashCode ^ dbAccount.hashCode;

  @override
  String toString() {
    return 'DbChatPopulated{'
        'dbChat: $dbChat, '
        'dbAccount: $dbAccount'
        '}';
  }

  DbPleromaChatPopulated copyWith({
    DbChat? dbChat,
    DbAccount? dbAccount,
  }) =>
      DbPleromaChatPopulated(
        dbChat: dbChat ?? this.dbChat,
        dbAccount: dbAccount ?? this.dbAccount,
      );
}

class DbPleromaChatWithLastMessagePopulated {
  final DbPleromaChatPopulated dbPleromaChatPopulated;
  final DbChatMessagePopulated? dbChatMessagePopulated;

  DbPleromaChatWithLastMessagePopulated({
    required this.dbPleromaChatPopulated,
    required this.dbChatMessagePopulated,
  });
}

class DbPleromaChatWithLastMessagePopulatedWrapper
    implements IPleromaChatWithLastMessage {
  final DbPleromaChatWithLastMessagePopulated
      dbPleromaChatWithLastMessagePopulated;

  DbPleromaChatWithLastMessagePopulatedWrapper({
    required this.dbPleromaChatWithLastMessagePopulated,
  });

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
}

class DbPleromaChatPopulatedWrapper implements IPleromaChat {
  final DbPleromaChatPopulated dbChatPopulated;

  DbPleromaChatPopulatedWrapper({
    required this.dbChatPopulated,
  });

  @override
  int? get localId => dbChatPopulated.dbChat.id;

  @override
  String get remoteId => dbChatPopulated.dbChat.remoteId;

  @override
  int get unread => dbChatPopulated.dbChat.unread;

  @override
  DateTime? get updatedAt => dbChatPopulated.dbChat.updatedAt;

  @override
  DbPleromaChatPopulatedWrapper copyWith({
    int? id,
    String? remoteId,
    int? unread,
    DateTime? updatedAt,
    List<IAccount>? accounts,
  }) {
    assert(accounts?.length == null || accounts!.length < 2);

    var account = accounts?.singleOrNull;
    return DbPleromaChatPopulatedWrapper(
      dbChatPopulated: DbPleromaChatPopulated(
        dbChat: dbChatPopulated.dbChat.copyWith(
          id: id ?? localId,
          remoteId: remoteId ?? this.remoteId,
          unread: unread ?? this.unread,
          updatedAt: updatedAt ?? this.updatedAt,
        ),
        dbAccount: account?.toDbAccount() ?? dbChatPopulated.dbAccount,
      ),
    );
  }

  @override
  List<IAccount> get accounts => [
        DbAccountWrapper(
          dbAccount: dbChatPopulated.dbAccount,
        ),
      ];
}
