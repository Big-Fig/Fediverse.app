import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_model.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatRepository
    implements
        IAppRemoteReadWriteRepository<
            DbChat,
            IPleromaChat,
            pleroma_lib.IPleromaChat,
            int,
            String,
            PleromaChatRepositoryFilters,
            PleromaChatRepositoryOrderingTermData>,
        IDisposable {
  static IPleromaChatRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatRepository>(
        context,
        listen: listen,
      );

  Future<List<IPleromaChatWithLastMessage>> getChatsWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Stream<List<IPleromaChatWithLastMessage>> watchChatsWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    required RepositoryPagination<IPleromaChat>? pagination,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Future<IPleromaChatWithLastMessage?> getChatWithLastMessage({
    required PleromaChatRepositoryFilters filters,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  });

  Stream<IPleromaChatWithLastMessage?> watchChatWithLastMessage({
    required PleromaChatRepositoryFilters? filters,
    PleromaChatRepositoryOrderingTermData? orderingTermData =
        PleromaChatRepositoryOrderingTermData.updatedAtDesc,
  });


  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();

  Future<IPleromaChat?> findByAccount({
    required IAccount account,
  });

  Future markAsRead({
    required IPleromaChat chat,
    required Batch? batchTransaction,
  });

  Future incrementUnreadCount({
    required String chatRemoteId,
    required DateTime updatedAt,
  });


}
