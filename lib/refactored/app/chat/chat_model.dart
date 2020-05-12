import 'package:fedi/refactored/app/database/app_database.dart';

abstract class IChat {
  int get localId;

  String get remoteId;

  int get unread;

  IChat copyWith({int id, String remoteId, bool unread});
}

class DbChatWrapper implements IChat {
  final DbChat dbChat;

  DbChatWrapper(this.dbChat);

  @override
  int get localId => dbChat.id;

  @override
  String get remoteId => dbChat.remoteId;

  @override
  int get unread => dbChat.unread;

  @override
  String toString() {
    return 'DbChatWrapper{dbChat: $dbChat}';
  }

  @override
  DbChatWrapper copyWith({int id, String remoteId, bool unread}) =>
      DbChatWrapper(dbChat.copyWith(
        id: id ?? localId,
        remoteId: remoteId ?? this.remoteId,
        unread: unread ?? this.unread,
      ));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbChatWrapper &&
          runtimeType == other.runtimeType &&
          dbChat == other.dbChat;
  @override
  int get hashCode => dbChat.hashCode;
}
