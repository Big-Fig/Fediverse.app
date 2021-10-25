import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/message/repository/unifedi_chat_message_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IUnifediChatMessageRepository
    implements
        IDisposable,
        IAppRemoteReadWriteRepository<
            DbChatMessage,
            IUnifediChatMessage,
            IUnifediApiChatMessage,
            int,
            String,
            UnifediChatMessageRepositoryFilters,
            UnifediChatMessageRepositoryOrderingTermData> {
  static IUnifediChatMessageRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatMessageRepository>(context, listen: listen);

  Future<IUnifediChatMessage?> findByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Stream<IUnifediChatMessage?> watchByOldPendingRemoteId(
    String oldPendingRemoteId,
  );

  Stream<IUnifediChatMessage?> watchChatLastChatMessage({
    required IUnifediChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<IUnifediChatMessage?> getChatLastChatMessage({
    required IUnifediChat chat,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<Map<IUnifediChat, IUnifediChatMessage?>> getChatsLastChatMessage({
    required List<IUnifediChat> chats,
    bool onlyPendingStatePublishedOrNull = false,
  });

  Future<void> markChatMessageAsDeleted({
    required String chatMessageRemoteId,
  });

  Future<void> markChatMessageAsHiddenLocallyOnDevice({
    required int chatMessageLocalId,
  });
}
