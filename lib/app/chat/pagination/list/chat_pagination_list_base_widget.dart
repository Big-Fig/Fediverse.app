import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ChatPaginationListBaseWidget
    extends FediPaginationListWidget<IChat> {
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
  IPaginationListBloc<PaginationPage<IChat>, IChat> retrievePaginationListBloc(
      BuildContext context,
      {@required bool listen}) {
    var chatPaginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IChat>, IChat>>(context,
            listen: listen);
    return chatPaginationListBloc;
  }
}
