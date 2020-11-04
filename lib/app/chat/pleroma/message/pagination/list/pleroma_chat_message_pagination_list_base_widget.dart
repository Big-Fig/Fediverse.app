import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class PleromaChatMessagePaginationListBaseWidget
    extends FediPaginationListWidget<IPleromaChatMessage> {
  PleromaChatMessagePaginationListBaseWidget({
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
  IPaginationListBloc<PaginationPage<IPleromaChatMessage>, IPleromaChatMessage>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var timelinePaginationListBloc = Provider.of<
            IPaginationListBloc<PaginationPage<IPleromaChatMessage>, IPleromaChatMessage>>(
        context,
        listen: listen);
    return timelinePaginationListBloc;
  }
}
