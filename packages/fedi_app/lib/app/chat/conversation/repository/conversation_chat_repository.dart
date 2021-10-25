import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IConversationChatRepository
    implements
        IAppRemoteReadWriteRepository<
            DbConversation,
            IConversationChat,
            IUnifediApiConversation,
            int,
            String,
            ConversationChatRepositoryFilters,
            ConversationRepositoryChatOrderingTermData>,
        IDisposable {
  static IConversationChatRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatRepository>(
        context,
        listen: listen,
      );

  Future<void> markAsRead({
    required IConversationChat conversation,
    required Batch? batchTransaction,
  });

  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();

  Future<List<IConversationChatWithLastMessage>>
      getConversationsWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  });

  Stream<List<IConversationChatWithLastMessage>>
      watchConversationsWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  });

  Future<IConversationChatWithLastMessage?> getConversationWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  });

  Stream<IConversationChatWithLastMessage?> watchConversationWithLastMessage({
    required ConversationChatRepositoryFilters? filters,
    ConversationRepositoryChatOrderingTermData? orderingTermData =
        ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  });
}
