import 'package:fedi/app/chat/pleroma/with_last_message/pleroma_chat_with_last_message_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class PleromaChatPaginationListBaseWidget
    extends FediPaginationListWidget<IPleromaChatWithLastMessage> {
  PleromaChatPaginationListBaseWidget({
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
  IPaginationListBloc<PaginationPage<IPleromaChatWithLastMessage>,
      IPleromaChatWithLastMessage> retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var chatPaginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IPleromaChatWithLastMessage>,
            IPleromaChatWithLastMessage>>(context, listen: listen);
    return chatPaginationListBloc;
  }
}
