import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';

class ConversationPaginationListBloc
    extends PaginationListBloc<CachedNetworkPaginationPage<IConversation>, IConversation>
    implements IConversationPaginationListBloc {
  ConversationPaginationListBloc(
      {@required IConversationPaginationBloc paginationBloc})
      : super(paginationBloc: paginationBloc);
}
