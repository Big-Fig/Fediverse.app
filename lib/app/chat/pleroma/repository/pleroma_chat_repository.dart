import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatRepository
    implements
        IReadIdListRepository<DbPleromaChatPopulatedWrapper, int>,
        IWriteIdListRepository<DbChat, int>,
        IDisposable {
  static IPleromaChatRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatRepository>(context, listen: listen);

  Future<DbPleromaChatPopulatedWrapper> findByRemoteId(String remoteId);

  Future upsertRemoteChats(List<pleroma_lib.IPleromaChat> remoteChats);

  Stream<DbPleromaChatPopulatedWrapper> watchByRemoteId(String remoteId);

  Future upsertRemoteChat(pleroma_lib.IPleromaChat remoteChat);

  Future<List<DbPleromaChatPopulatedWrapper>> getChats(
      {@required IPleromaChat olderThan,
      @required IPleromaChat newerThan,
      @required int limit,
      @required int offset,
      @required PleromaChatOrderingTermData orderingTermData});

  Stream<List<DbPleromaChatPopulatedWrapper>> watchChats(
      {@required IPleromaChat olderThan,
      @required IPleromaChat newerThan,
      @required int limit,
      @required int offset,
      @required PleromaChatOrderingTermData orderingTermData});

  Future<DbPleromaChatPopulatedWrapper> getChat(
      {@required IPleromaChat olderThan,
      @required IPleromaChat newerThan,
      @required PleromaChatOrderingTermData orderingTermData});

  Stream<DbPleromaChatPopulatedWrapper> watchChat(
      {@required IPleromaChat olderThan,
      @required IPleromaChat newerThan,
      @required PleromaChatOrderingTermData orderingTermData});

  Future updateLocalChatByRemoteChat({
    @required IPleromaChat oldLocalChat,
    @required pleroma_lib.IPleromaChat newRemoteChat,
  });

  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();

  Future<IPleromaChat> findByAccount({@required IAccount account});

  Future markAsRead({@required IPleromaChat chat});

  Future incrementUnreadCount(
      {@required String chatRemoteId, @required DateTime updatedAt});
}
