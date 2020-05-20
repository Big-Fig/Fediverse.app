import 'package:fedi/app/database/app_database.dart';

abstract class IChat {
  int get localId;

  String get remoteId;

  int get unread;

  DateTime get updatedAt;

  IChat copyWith({int id, String remoteId, bool unread, DateTime updatedAt});
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
  DateTime get updatedAt => dbChat.updatedAt;

  @override
  String toString() {
    return 'DbChatWrapper{dbChat: $dbChat}';
  }

  @override
  DbChatWrapper copyWith(
          {int id, String remoteId, bool unread, DateTime updatedAt}) =>
      DbChatWrapper(dbChat.copyWith(
          id: id ?? localId,
          remoteId: remoteId ?? this.remoteId,
          unread: unread ?? this.unread,
          updatedAt: updatedAt ?? this.updatedAt));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbChatWrapper &&
          runtimeType == other.runtimeType &&
          dbChat == other.dbChat;
  @override
  int get hashCode => dbChat.hashCode;
}
