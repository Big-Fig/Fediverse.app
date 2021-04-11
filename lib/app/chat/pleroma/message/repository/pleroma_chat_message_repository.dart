import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatMessageRepository
    implements
        IDisposable,
        IAppRemoteReadWriteRepository<
            DbChatMessage,
            IPleromaChatMessage,
            pleroma_lib.IPleromaChatMessage,
            int,
            String,
            PleromaChatMessageRepositoryFilters,
            PleromaChatMessageRepositoryOrderingTermData> {
  static IPleromaChatMessageRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatMessageRepository>(context, listen: listen);


  Future<IPleromaChatMessage?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Stream<IPleromaChatMessage?> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  );


  Stream<IPleromaChatMessage?> watchChatLastChatMessage({
    required IPleromaChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<IPleromaChatMessage?> getChatLastChatMessage({
    required IPleromaChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<Map<IPleromaChat, IPleromaChatMessage?>> getChatsLastChatMessage({
    required List<IPleromaChat> chats,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future markChatMessageAsDeleted({
    required String chatMessageRemoteId,
    required Batch? batchTransaction,
  });

  Future markChatMessageAsHiddenLocallyOnDevice({
    required int chatMessageLocalId,
    required Batch? batchTransaction,
  });
}
