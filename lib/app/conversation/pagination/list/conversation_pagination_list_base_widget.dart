import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ConversationPaginationListBaseWidget
    extends FediPaginationListWidget<IConversation> {
  ConversationPaginationListBaseWidget(
      {@required Key key,
      Widget header,
      Widget footer,
      bool alwaysShowHeader,
      bool alwaysShowFooter})
      : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter);

  @override
  IPaginationListBloc<PaginationPage<IConversation>, IConversation>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var conversationPaginationListBloc = Provider.of<
            IPaginationListBloc<PaginationPage<IConversation>, IConversation>>(
        context,
        listen: listen);
    return conversationPaginationListBloc;
  }
}
