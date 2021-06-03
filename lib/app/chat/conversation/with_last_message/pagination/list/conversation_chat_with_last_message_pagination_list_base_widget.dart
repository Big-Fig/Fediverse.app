import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ConversationChatPaginationListBaseWidget
    extends FediPaginationListWidget<IConversationChatWithLastMessage> {
  ConversationChatPaginationListBaseWidget({
    required Key key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          header: header,
          footer: footer,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
      IConversationChatWithLastMessage> retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var chatPaginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IConversationChatWithLastMessage>,
            IConversationChatWithLastMessage>>(context, listen: listen);
    return chatPaginationListBloc;
  }
}
