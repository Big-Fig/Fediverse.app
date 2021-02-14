import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatMessageRepository
    implements
        IReadIdListRepository<IPleromaChatMessage, int>,
        IWriteIdListRepository<DbChatMessage, int>,
        IDisposable {
  static IPleromaChatMessageRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaChatMessageRepository>(context, listen: listen);

  Future<IPleromaChatMessage> findByRemoteId(String remoteId);

  Future deleteByRemoteId(String remoteId);

  Future upsertRemoteChatMessages(
    List<pleroma_lib.IPleromaChatMessage> remoteChatMessages,
  );

  Stream<IPleromaChatMessage> watchByRemoteId(
    String remoteId,
  );

  Future<IPleromaChatMessage> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Stream<IPleromaChatMessage> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Future updateLocalChatMessageByRemoteChatMessage({
    @required IPleromaChatMessage oldLocalChatMessage,
    @required pleroma_lib.IPleromaChatMessage newRemoteChatMessage,
  });

  Future upsertRemoteChatMessage(
    pleroma_lib.IPleromaChatMessage remoteChatMessage,
  );

  Future<List<IPleromaChatMessage>> getChatMessages({
    @required PleromaChatMessageRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChatMessage> pagination,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  });

  Stream<List<IPleromaChatMessage>> watchChatMessages({
    @required PleromaChatMessageRepositoryFilters filters,
    @required RepositoryPagination<IPleromaChatMessage> pagination,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  });

  Future<IPleromaChatMessage> getChatMessage({
    @required PleromaChatMessageRepositoryFilters filters,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  });

  Stream<IPleromaChatMessage> watchChatMessage({
    @required PleromaChatMessageRepositoryFilters filters,
    PleromaChatMessageOrderingTermData orderingTermData =
        PleromaChatMessageOrderingTermData.createdAtDesc,
  });

  Stream<IPleromaChatMessage> watchChatLastChatMessage({
    @required IPleromaChat chat,
  });

  Future<IPleromaChatMessage> getChatLastChatMessage({
    @required IPleromaChat chat,
  });

  Future<Map<IPleromaChat, IPleromaChatMessage>> getChatsLastChatMessage({
    @required List<IPleromaChat> chats,
  });

  Future markChatMessageAsDeleted({
    @required String chatMessageRemoteId,
  });

  Future markChatMessageAsHiddenLocallyOnDevice({
    @required int chatMessageLocalId,
  });
}
