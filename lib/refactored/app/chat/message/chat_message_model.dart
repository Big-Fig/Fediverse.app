import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:flutter/widgets.dart';

abstract class IChatMessage {
  int get localId;

  String get remoteId;

  String get chatRemoteId;

  IAccount get account;

  String get content;

  DateTime get createdAt;

  List<IPleromaEmoji> get emojis;

  IChatMessage copyWith({
    int localId,
    String remoteId,
    String chatRemoteId,
    IAccount account,
    String content,
    DateTime createdAt,
    List<PleromaEmoji> emojis,
  });
}

class DbChatMessagePopulatedWrapper extends IChatMessage {
  final DbChatMessagePopulated dbChatMessagePopulated;

  DbChatMessagePopulatedWrapper(this.dbChatMessagePopulated);

  @override
  int get localId => dbChatMessagePopulated.dbChatMessage.id;

  @override
  IAccount get account => DbAccountWrapper(dbChatMessagePopulated.dbAccount);

  @override
  String get chatRemoteId => dbChatMessagePopulated.dbChatMessage.chatRemoteId;

  @override
  String get content => dbChatMessagePopulated.dbChatMessage.content;

  @override
  DateTime get createdAt => dbChatMessagePopulated.dbChatMessage.createdAt;

  @override
  List<IPleromaEmoji> get emojis => dbChatMessagePopulated.dbChatMessage.emojis;

  @override
  String get remoteId => dbChatMessagePopulated.dbChatMessage.remoteId;

  @override
  DbChatMessagePopulatedWrapper copyWith({
    int localId,
    String remoteId,
    String chatRemoteId,
    IAccount account,
    String content,
    DateTime createdAt,
    List<PleromaEmoji> emojis,
  }) =>
      DbChatMessagePopulatedWrapper(dbChatMessagePopulated.copyWith(
        localId: localId,
        remoteId: remoteId,
        chatRemoteId: chatRemoteId,
        account: account,
        content: content,
        createdAt: createdAt,
        emojis: emojis,
      ));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbChatMessagePopulatedWrapper &&
          runtimeType == other.runtimeType &&
          dbChatMessagePopulated == other.dbChatMessagePopulated;

  @override
  int get hashCode => dbChatMessagePopulated.hashCode;
}

class DbChatMessagePopulated {
  final DbChatMessage dbChatMessage;
  final DbAccount dbAccount;

  DbChatMessagePopulated({
    @required this.dbChatMessage,
    @required this.dbAccount,
  });

  DbChatMessagePopulated copyWith({
    int localId,
    String remoteId,
    String chatRemoteId,
    IAccount account,
    String content,
    DateTime createdAt,
    List<IPleromaEmoji> emojis,
  }) =>
      DbChatMessagePopulated(
          dbChatMessage: DbChatMessage(
            id: localId ?? dbChatMessage.id,
            remoteId: remoteId ?? dbChatMessage.remoteId,
            chatRemoteId: chatRemoteId ?? dbChatMessage.chatRemoteId,
            content: content ?? dbChatMessage.content,
            createdAt: createdAt ?? dbChatMessage.createdAt,
            emojis: emojis ?? dbChatMessage.emojis,
            accountRemoteId: account?.remoteId ?? dbAccount.remoteId,
          ),
          dbAccount:
              account != null ? dbAccountFromAccount(account) : dbAccount);

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
