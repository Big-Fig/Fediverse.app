import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter/widgets.dart';

typedef ChatCallback = Function(
    BuildContext context, IChat chat);

abstract class IChat {
  int get localId;

  String get remoteId;

  int get unread;

  DateTime get updatedAt;

  List<IAccount> get accounts;

  IChat copyWith(
      {int id,
      String remoteId,
      bool unread,
      DateTime updatedAt,
      List<IAccount> accounts});
}

class DbChatPopulated {
  final DbChat dbChat;
  final DbAccount dbAccount;
  DbChatPopulated({@required this.dbChat, @required this.dbAccount});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbChatPopulated &&
          runtimeType == other.runtimeType &&
          dbChat == other.dbChat &&
          dbAccount == other.dbAccount;
  @override
  int get hashCode => dbChat.hashCode ^ dbAccount.hashCode;

  @override
  String toString() {
    return 'DbChatPopulated{dbChat: $dbChat, dbAccount: $dbAccount}';
  }

  DbChatPopulated copyWith({DbChat dbChat, DbAccount dbAccount}) =>
      DbChatPopulated(
          dbChat: dbChat ?? this.dbChat,
          dbAccount: dbAccount ?? this.dbAccount);
}

class DbChatPopulatedWrapper implements IChat {
  final DbChatPopulated dbChatPopulated;

  DbChatPopulatedWrapper(this.dbChatPopulated);

  @override
  int get localId => dbChatPopulated.dbChat.id;

  @override
  String get remoteId => dbChatPopulated.dbChat.remoteId;

  @override
  int get unread => dbChatPopulated.dbChat.unread;
  @override
  DateTime get updatedAt => dbChatPopulated.dbChat.updatedAt;

  @override
  DbChatPopulatedWrapper copyWith(
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
    return DbChatPopulatedWrapper(DbChatPopulated(
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
