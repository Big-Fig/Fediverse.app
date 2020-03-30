import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationPaginationListBloc
    implements
        IPaginationListBloc<CachedNetworkPaginationPage<IConversation>, IConversation> {
  static IConversationPaginationListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationPaginationListBloc>(context, listen: listen);
}
