import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ChatMessagePaginationListBaseWidget
    extends PaginationListWidget<IChatMessage> {
  ChatMessagePaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter);

  @override
  IPaginationListBloc<PaginationPage<IChatMessage>, IChatMessage>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var timelinePaginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IChatMessage>, IChatMessage>>(
            context,
            listen: listen);
    return timelinePaginationListBloc;
  }
}
