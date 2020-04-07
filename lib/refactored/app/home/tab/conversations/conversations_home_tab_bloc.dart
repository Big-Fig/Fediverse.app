import 'package:fedi/refactored/app/conversation/list/conversation_list_service.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class IConversationsHomeTabBloc extends Disposable {
  static IConversationsHomeTabBloc of(BuildContext context, {listen: true}) =>
      Provider.of<IConversationsHomeTabBloc>(context, listen: listen);

  IConversationListService get conversationListService;

  IConversationPaginationBloc get conversationPaginationBloc;

  IConversationPaginationListBloc get conversationPaginationListBloc;
}
