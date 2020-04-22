import 'package:fedi/refactored/app/conversation/list/conversation_list_service.dart';
import 'package:fedi/refactored/app/conversation/list/conversation_list_service_impl.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/home/tab/conversations/conversations_home_tab_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversations_home_tab_bloc_impl.dart");

class ConversationsHomeTabBloc extends DisposableOwner
    implements IConversationsHomeTabBloc {
  @override
  IConversationListService conversationListService;

  @override
  IConversationPaginationBloc conversationPaginationBloc;

  @override
  IConversationPaginationListBloc conversationPaginationListBloc;

  ConversationsHomeTabBloc(
      {@required IPleromaConversationService pleromaConversationService,
      @required IConversationRepository conversationRepository}) {
    _logger.finest(() => "constructor");
    conversationListService = ConversationListService(
        pleromaConversationService: pleromaConversationService,
        conversationRepository: conversationRepository);
    addDisposable(disposable: conversationListService);
    conversationPaginationBloc = ConversationPaginationBloc(
        itemsCountPerPage: 20,
        listService: conversationListService,
        maximumCachedPagesCount: null);
    addDisposable(disposable: conversationListService);
    conversationPaginationListBloc = ConversationPaginationListBloc(
        paginationBloc: conversationPaginationBloc);
    addDisposable(disposable: conversationPaginationListBloc);
  }

  static ConversationsHomeTabBloc createFromContext(BuildContext context) =>
      ConversationsHomeTabBloc(
          pleromaConversationService:
              IPleromaConversationService.of(context, listen: false),
          conversationRepository:
              IConversationRepository.of(context, listen: false));
}
