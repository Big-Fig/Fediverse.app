import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class ConversationPaginationListBaseWidget
    extends PaginationListWidget<IConversation> {
  ConversationPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    RefreshAction additionalRefreshAction,
  }) : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
            additionalRefreshAction: additionalRefreshAction);

  @override
  IPaginationListBloc<PaginationPage<IConversation>, IConversation>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    IConversationPaginationListBloc timelinePaginationListBloc =
        IConversationPaginationListBloc.of(context, listen: listen);
    return timelinePaginationListBloc;
  }
}
