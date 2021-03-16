import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatRepository
    implements
        IReadIdListRepository<DbConversationChatWrapper, int>,
        IWriteIdListRepository<DbConversation, int>,
        IDisposable {
  static IConversationChatRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatRepository>(
        context,
        listen: listen,
      );

  Future<DbConversationChatWrapper?> findByRemoteId(
    String remoteId,
  );

  Future upsertRemoteConversations(
    List<IPleromaConversation> remoteConversations,
  );

  Future deleteByRemoteId(String remoteId);

  Stream<DbConversationChatWrapper?> watchByRemoteId(String remoteId);

  Future upsertRemoteConversation(
    IPleromaConversation remoteConversation,
  );

  Future<List<DbConversationChatWrapper>> getConversations({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  });

  Stream<List<DbConversationChatWrapper>> watchConversations({
    required ConversationChatRepositoryFilters? filters,
    required RepositoryPagination<IConversationChat>? pagination,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  });

  Future<DbConversationChatWrapper?> getConversation({
    required ConversationChatRepositoryFilters? filters,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  });

  Stream<DbConversationChatWrapper?> watchConversation({
    required ConversationChatRepositoryFilters? filters,
    ConversationChatOrderingTermData? orderingTermData =
        ConversationChatOrderingTermData.updatedAtDesc,
  });

  Future updateLocalConversationByRemoteConversation({
    required IConversationChat oldLocalConversation,
    required IPleromaConversation newRemoteConversation,
  });

  Future<bool> markAsRead({
    required IConversationChat conversation,
  });

  Future<int> getTotalUnreadCount();

  Stream<int> watchTotalUnreadCount();
}
