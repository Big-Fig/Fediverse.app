import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/conversation/list/cached/conversation_cached_list_service.dart';
import 'package:fedi/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IConversationsListBloc extends Disposable {
  static IConversationsListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationsListBloc>(context, listen: listen);

  IConversationCachedListService get conversationListService;

  IConversationPaginationBloc get conversationPaginationBloc;

  IPaginationListBloc<PaginationPage<IConversation>, IConversation>
      get conversationPaginationListBloc;
}
