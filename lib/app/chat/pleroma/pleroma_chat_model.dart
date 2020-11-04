import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter/widgets.dart';

typedef PleromaChatCallback = Function(
    BuildContext context, IPleromaChat chat);

abstract class IPleromaChat {
  int get localId;

  String get remoteId;

  int get unread;

  DateTime get updatedAt;

  List<IAccount> get accounts;

  IPleromaChat copyWith(
      {int id,
      String remoteId,
      bool unread,
      DateTime updatedAt,
      List<IAccount> accounts});
}

class DbPleromaChatPopulated {
  final DbChat dbChat;
  final DbAccount dbAccount;
  DbPleromaChatPopulated({@required this.dbChat, @required this.dbAccount});

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
    return 'DbChatPopulated{dbChat: $dbChat, dbAccount: $dbAccount}';
  }

  DbPleromaChatPopulated copyWith({DbChat dbChat, DbAccount dbAccount}) =>
      DbPleromaChatPopulated(
          dbChat: dbChat ?? this.dbChat,
          dbAccount: dbAccount ?? this.dbAccount);
}

class DbPleromaChatPopulatedWrapper implements IPleromaChat {
  final DbPleromaChatPopulated dbChatPopulated;

  DbPleromaChatPopulatedWrapper(this.dbChatPopulated);

  @override
  int get localId => dbChatPopulated.dbChat.id;

  @override
  String get remoteId => dbChatPopulated.dbChat.remoteId;

  @override
  int get unread => dbChatPopulated.dbChat.unread;
  @override
  DateTime get updatedAt => dbChatPopulated.dbChat.updatedAt;

  @override
  DbPleromaChatPopulatedWrapper copyWith(
      {int id,
      String remoteId,
      bool unread,
      DateTime updatedAt,
      List<IAccount> accounts}) {
    assert(accounts?.length == null || accounts.length < 2);
    var account;
    if (accounts?.isNotEmpty == true) {
      account = accounts.first;
    }
    return DbPleromaChatPopulatedWrapper(DbPleromaChatPopulated(
        dbChat: dbChatPopulated.dbChat.copyWith(
            id: id ?? localId,
            remoteId: remoteId ?? this.remoteId,
            unread: unread ?? this.unread,
            updatedAt: updatedAt ?? this.updatedAt),
        dbAccount: account != null
            ? dbAccountFromAccount(account)
            : dbChatPopulated.dbAccount));
  }

  @override
  List<IAccount> get accounts => [DbAccountWrapper(dbChatPopulated.dbAccount)];
}
