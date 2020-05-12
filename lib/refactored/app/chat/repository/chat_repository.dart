import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/repository/chat_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatRepository
    implements
        IReadIdListRepository<DbChatWrapper, int>,
        IWriteIdListRepository<DbChat, int>,
        Disposable {
  static IChatRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatRepository>(context, listen: listen);

  Future<DbChatWrapper> findByRemoteId(String remoteId);

  Future upsertRemoteChats(List<IPleromaChat> remoteChats);

  Stream<DbChatWrapper> watchByRemoteId(String remoteId);

  Future upsertRemoteChat(IPleromaChat remoteChat);

  Future<List<DbChatWrapper>> getChats(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData});

  Stream<List<DbChatWrapper>> watchChats(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData});

  Future<DbChatWrapper> getChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData});

  Stream<DbChatWrapper> watchChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData});

  Future updateLocalChatByRemoteChat(
      {@required IChat oldLocalChat, @required IPleromaChat newRemoteChat});

  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();

  Future<IChat> findByAccount({@required IAccount account});

  Future markAsRead({@required IChat chat});

  Future incrementUnreadCount({@required String chatRemoteId});
}
