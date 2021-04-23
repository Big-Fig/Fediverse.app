import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_conversation_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatRepository
    implements
        IAppRemoteReadWriteRepository<
            DbConversation,
            IConversationChat,
            IPleromaConversation,
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

  // Future upsertRemoteConversations(
  //   List<IPleromaConversation> remoteConversations,
  // );
  //
  // Future upsertRemoteConversation(
  //   IPleromaConversation remoteConversation,
  // );
  //
  // Future<List<DbConversationChatPopulatedWrapper>> getConversations({
  //   required ConversationChatRepositoryFilters? filters,
  //   required RepositoryPagination<IConversationChat>? pagination,
  //   ConversationRepositoryChatOrderingTermData? orderingTermData =
  //       ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  // });
  //
  // Stream<List<DbConversationChatPopulatedWrapper>> watchConversations({
  //   required ConversationChatRepositoryFilters? filters,
  //   required RepositoryPagination<IConversationChat>? pagination,
  //   ConversationRepositoryChatOrderingTermData? orderingTermData =
  //       ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  // });
  //
  // Future<DbConversationChatPopulatedWrapper?> getConversation({
  //   required ConversationChatRepositoryFilters? filters,
  //   ConversationRepositoryChatOrderingTermData? orderingTermData =
  //       ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  // });
  //
  // Stream<DbConversationChatPopulatedWrapper?> watchConversation({
  //   required ConversationChatRepositoryFilters? filters,
  //   ConversationRepositoryChatOrderingTermData? orderingTermData =
  //       ConversationRepositoryChatOrderingTermData.updatedAtDesc,
  // });
  //
  // Future updateLocalConversationByRemoteConversation({
  //   required IConversationChat oldLocalConversation,
  //   required IPleromaConversation newRemoteConversation,
  // });

  Future markAsRead({
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
