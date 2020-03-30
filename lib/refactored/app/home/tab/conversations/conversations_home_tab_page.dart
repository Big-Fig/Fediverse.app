import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/refactored/app/conversation/list/conversation_list_service.dart';
import 'package:fedi/refactored/app/conversation/list/conversation_list_service_impl.dart';
import 'package:fedi/refactored/app/conversation/list/conversation_list_widget.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/conversation_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/conversation/pagination/list/conversation_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/start/start_conversation_page.dart';
import 'package:fedi/refactored/app/home/tab/conversations/conversations_home_tab_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("conversations_home_tab_page.dart.dart");

class ConversationsHomeTabPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        title: Text("Messages"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              goToStartConversationPage(context);
            },
          ),
        ],
      ),
      body: buildBodyWidget(context),
    );
  }

  Widget buildBodyWidget(BuildContext context) {
    _logger.finest(() => "buildBodyWidget");

    var conversationsHomeTabBloc =
        IConversationsHomeTabBloc.of(context, listen: true);

    return MultiProvider(
      providers: [
        Provider.value(value: conversationsHomeTabBloc.conversationListService),
        Provider.value(value: conversationsHomeTabBloc.conversationPaginationBloc),
        Provider.value(value: conversationsHomeTabBloc.conversationPaginationListBloc),
      ],
      child: ConversationListWidget(
        key: PageStorageKey("ConversationsHomePage"),
      ),
    );

    return DisposableProvider<IConversationListService>(
        create: (context) {
          _logger.finest(() => "buildBodyWidget DisposableProvider "
              "IConversationListService");
          var conversationRepository =
              IConversationRepository.of(context, listen: false);

          var pleromaConversationService =
              IPleromaConversationService.of(context, listen: false);

          return ConversationListService(
              pleromaConversationService: pleromaConversationService,
              conversationRepository: conversationRepository);
        },
        child: DisposableProvider<IConversationPaginationBloc>(
          create: (context) {
            _logger.finest(() => "buildBodyWidget DisposableProvider "
                "IConversationPaginationBloc");

            return ConversationPaginationBloc(
                itemsCountPerPage: 20,
                listService:
                    IConversationListService.of(context, listen: false),
                maximumCachedPagesCount: null);
          },
          child: DisposableProvider<IConversationPaginationListBloc>(
            create: (context) {
              var conversationPaginationListBloc =
                  ConversationPaginationListBloc(
                paginationBloc:
                    IConversationPaginationBloc.of(context, listen: false),
              );
              return conversationPaginationListBloc;
            },
            child: ConversationListWidget(
              key: PageStorageKey("ConversationsHomePage"),
            ),
          ),
        ));
  }
}
