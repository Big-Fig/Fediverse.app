import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/database/app_database.dart';

abstract class IConversationChat implements IChat {
  @override
  IConversationChat copyWith({
    int id,
    String remoteId,
    int unread,
    DateTime updatedAt,
    List<IAccount> accounts,
  });
}

class DbConversationChatWrapper implements IConversationChat {
  final DbConversation dbConversation;

  DbConversationChatWrapper(this.dbConversation);

  @override
  int get localId => dbConversation.id;

  @override
  String get remoteId => dbConversation.remoteId;

  @override
  int get unread => dbConversation.unread == true ? 1 : 0;

  @override
  String toString() {
    return 'DbConversationChatWrapper{dbConversation: $dbConversation}';
  }

  @override
  DbConversationChatWrapper copyWith({
    int id,
    String remoteId,
    int unread,
    DateTime updatedAt,
    List<IAccount> accounts,
  }) {
    return DbConversationChatWrapper(
      dbConversation.copyWith(
        id: id ?? localId,
        remoteId: remoteId ?? this.remoteId,
        unread: (unread != null && unread > 0) ? true : false ?? this.unread,
        updatedAt: updatedAt ?? this.updatedAt,
      ),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbConversationChatWrapper &&
          runtimeType == other.runtimeType &&
          dbConversation == other.dbConversation;
  @override
  int get hashCode => dbConversation.hashCode;

  @override
  // TODO: implement accounts
  List<IAccount> get accounts => throw UnimplementedError();

  @override
  DateTime get updatedAt => dbConversation.updatedAt;
}
