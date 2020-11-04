import 'package:fedi/app/database/app_database.dart';

abstract class IConversationChat {
  int get localId;

  String get remoteId;

  bool get unread;
}

class DbConversationChatWrapper implements IConversationChat {
  final DbConversation dbConversation;

  DbConversationChatWrapper(this.dbConversation);

  @override
  int get localId => dbConversation.id;

  @override
  String get remoteId => dbConversation.remoteId;

  @override
  bool get unread => dbConversation.unread;

  @override
  String toString() {
    return 'DbConversationChatWrapper{dbConversation: $dbConversation}';
  }

  DbConversationChatWrapper copyWith({int id, String remoteId, bool unread}) =>
      DbConversationChatWrapper(dbConversation.copyWith(
        id: id ?? localId,
        remoteId: remoteId ?? this.remoteId,
        unread: unread ?? this.unread,
      ));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbConversationChatWrapper &&
          runtimeType == other.runtimeType &&
          dbConversation == other.dbConversation;
  @override
  int get hashCode => dbConversation.hashCode;
}
