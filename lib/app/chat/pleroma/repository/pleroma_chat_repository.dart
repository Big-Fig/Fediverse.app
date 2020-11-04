import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatRepository
    implements
        IReadIdListRepository<DbChatPopulatedWrapper, int>,
        IWriteIdListRepository<DbChat, int>,
        IDisposable {
  static IChatRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatRepository>(context, listen: listen);

  Future<DbChatPopulatedWrapper> findByRemoteId(String remoteId);

  Future upsertRemoteChats(List<IPleromaChat> remoteChats);

  Stream<DbChatPopulatedWrapper> watchByRemoteId(String remoteId);

  Future upsertRemoteChat(IPleromaChat remoteChat);

  Future<List<DbChatPopulatedWrapper>> getChats(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData});

  Stream<List<DbChatPopulatedWrapper>> watchChats(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required int limit,
      @required int offset,
      @required ChatOrderingTermData orderingTermData});

  Future<DbChatPopulatedWrapper> getChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData});

  Stream<DbChatPopulatedWrapper> watchChat(
      {@required IChat olderThan,
      @required IChat newerThan,
      @required ChatOrderingTermData orderingTermData});

  Future updateLocalChatByRemoteChat(
      {@required IChat oldLocalChat, @required IPleromaChat newRemoteChat});

  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();

  Future<IChat> findByAccount({@required IAccount account});

  Future markAsRead({@required IChat chat});

  Future incrementUnreadCount(
      {@required String chatRemoteId, @required DateTime updatedAt});
}
