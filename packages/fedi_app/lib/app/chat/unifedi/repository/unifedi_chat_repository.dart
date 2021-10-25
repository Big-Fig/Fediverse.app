import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/unifedi/repository/unifedi_chat_repository_model.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IUnifediChatRepository
    implements
        IAppRemoteReadWriteRepository<
            DbChat,
            IUnifediChat,
            IUnifediApiChat,
            int,
            String,
            UnifediChatRepositoryFilters,
            UnifediChatRepositoryOrderingTermData>,
        IDisposable {
  static IUnifediChatRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatRepository>(
        context,
        listen: listen,
      );

  Future<List<IUnifediChatWithLastMessage>> getChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat>? pagination,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Stream<List<IUnifediChatWithLastMessage>> watchChatsWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    required RepositoryPagination<IUnifediChat>? pagination,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Future<IUnifediChatWithLastMessage?> getChatWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Stream<IUnifediChatWithLastMessage?> watchChatWithLastMessage({
    required UnifediChatRepositoryFilters? filters,
    UnifediChatRepositoryOrderingTermData? orderingTermData =
        UnifediChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();

  Future<IUnifediChat?> findByAccount({
    required IAccount account,
  });

  Future<void> markAsRead({
    required IUnifediChat chat,
    required Batch? batchTransaction,
  });

  Future<void> incrementUnreadCount({
    required String chatRemoteId,
    required DateTime updatedAt,
  });
}
