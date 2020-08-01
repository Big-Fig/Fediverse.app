import 'package:fedi/app/chat/with_last_message/chat_with_last_message_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ChatPaginationListBaseWidget
    extends FediPaginationListWidget<IChatWithLastMessage> {
  ChatPaginationListBaseWidget(
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
  IPaginationListBloc<PaginationPage<IChatWithLastMessage>,
          IChatWithLastMessage>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var chatPaginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IChatWithLastMessage>,
            IChatWithLastMessage>>(context, listen: listen);
    return chatPaginationListBloc;
  }
}
