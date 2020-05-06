import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/conversations_list_bloc.dart';
import 'package:fedi/refactored/app/conversation/list/cached/conversation_cached_list_service.dart';
import 'package:fedi/refactored/app/conversation/list/cached/conversation_cached_list_service_impl.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/websockets/my_account_conversations_websockets_handler_impl.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversations_home_tab_bloc_impl.dart");

class ConversationsListBloc extends DisposableOwner
    implements IConversationsListBloc {
  @override
  IConversationCachedListService conversationListService;

  @override
  IConversationPaginationBloc conversationPaginationBloc;

  @override
  IPaginationListBloc<PaginationPage<IConversation>, IConversation>
      conversationPaginationListBloc;

  final INotificationRepository notificationRepository;
  final IStatusRepository statusRepository;
  final IConversationRepository conversationRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;

  ConversationsListBloc({
    @required IPleromaConversationService pleromaConversationService,
    @required this.notificationRepository,
    @required this.statusRepository,
    @required this.conversationRepository,
    @required this.pleromaWebSocketsService,
  }) {
    _logger.finest(() => "constructor");
    conversationListService = ConversationCachedListService(
        pleromaConversationService: pleromaConversationService,
        conversationRepository: conversationRepository);
    addDisposable(disposable: conversationListService);
    conversationPaginationBloc = ConversationPaginationBloc(
        itemsCountPerPage: 20,
        listService: conversationListService,
        maximumCachedPagesCount: null);
    addDisposable(disposable: conversationListService);
    conversationPaginationListBloc = ConversationPaginationListWithNewItemsBloc(
        paginationBloc: conversationPaginationBloc,
        cachedListService: conversationListService,
        mergeNewItemsImmediately: false,
    );
    addDisposable(disposable: conversationPaginationListBloc);

    addDisposable(
        disposable: MyAccountConversationsWebSocketsHandler(
            notificationRepository: notificationRepository,
            conversationRepository: conversationRepository,
            statusRepository: statusRepository,
            pleromaWebSocketsService: pleromaWebSocketsService));
  }

  static ConversationsListBloc createFromContext(BuildContext context) =>
      ConversationsListBloc(
        pleromaConversationService:
            IPleromaConversationService.of(context, listen: false),
        conversationRepository:
            IConversationRepository.of(context, listen: false),
        notificationRepository:
            INotificationRepository.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
      );
}
