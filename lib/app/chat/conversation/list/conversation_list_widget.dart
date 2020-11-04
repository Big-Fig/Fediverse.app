import 'package:fedi/app/chat/conversation/conversation_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_model.dart';
import 'package:fedi/app/chat/conversation/list/conversation_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';

class ConversationListWidget extends FediPaginationListWidget<IConversation> {
  const ConversationListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IConversation> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IConversation>.value(
                value: items[index],
                child:
                    DisposableProxyProvider<IConversation, IConversationBloc>(
                        update: (context, conversation, oldValue) =>
                            ConversationBloc.createFromContext(context,
                                conversation: conversation),
                        child: FediListTile(
                            isFirstInList: index == 0 && header == null,
                            child: ConversationListItemWidget())),
              ));

  @override
  IPaginationListBloc<PaginationPage<IConversation>, IConversation>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var paginationListBloc = Provider.of<
            IPaginationListBloc<PaginationPage<IConversation>, IConversation>>(
        context,
        listen: listen);
    return paginationListBloc;
  }
}
