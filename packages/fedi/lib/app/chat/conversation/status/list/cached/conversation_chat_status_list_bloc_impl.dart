import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/status/list/cached/conversation_chat_status_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/repository/repository_model.dart';

abstract class ConversationChatStatusListBloc extends AsyncInitLoadingBloc
    implements IConversationChatStatusCachedListBloc {
  StatusRepositoryFilters get _statusRepositoryFilters =>
      StatusRepositoryFilters.only(
        onlyInConversation: conversation,
        onlyPendingStatePublishedOrNull: false,
      );

  StatusRepositoryOrderingTermData get orderingTermData =>
      StatusRepositoryOrderingTermData.createdAtDesc;

  final IStatusRepository statusRepository;
  final IConversationChat? conversation;

  ConversationChatStatusListBloc({
    required this.conversation,
    required this.statusRepository,
  });

  @override
  // ignore: no-empty-block
  Future<void> internalAsyncInit() async {
    // nothing
  }

  @override
  Future<List<IStatus>> loadLocalItems({
    required int? limit,
    required IStatus? newerThan,
    required IStatus? olderThan,
  }) async {
    var statuses = await statusRepository.findAllInAppType(
      filters: _statusRepositoryFilters,
      pagination: RepositoryPagination<IStatus>(
        olderThanItem: olderThan,
        newerThanItem: newerThan,
        limit: limit,
      ),
      orderingTerms: [orderingTermData],
    );

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus? item) =>
      statusRepository.watchFindAllInAppType(
        filters: _statusRepositoryFilters,
        pagination: RepositoryPagination<IStatus>(
          newerThanItem: item,
        ),
        orderingTerms: [orderingTermData],
      );
}
