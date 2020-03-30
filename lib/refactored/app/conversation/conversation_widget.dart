import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_instance_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/app/conversation/status/context_api/conversation_status_list_bloc_context_api_impl.dart';
import 'package:fedi/refactored/app/conversation/status/conversation_api/conversation_status_list_bloc_conversation_api_impl.dart';
import 'package:fedi/refactored/app/conversation/status/conversation_status_list_widget.dart';
import 'package:fedi/refactored/app/conversation/status/post/conversation_post_status_widget.dart';
import 'package:fedi/refactored/app/status/list/status_list_service.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/status/pagination/status_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/status_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: true);
    return AsyncInitLoadingWidget(
        asyncInitLoadingBloc: conversationBloc,
        loadingFinishedBuilder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                  child: Provider<IStatusListService>(
                create: (context) {
//                  var pleromaConversationService =
//                      IPleromaConversationService.of(context, listen: false);

                var currentInstanceBloc = ICurrentInstanceBloc.of(context, listen: false);

                  if (currentInstanceBloc.currentInstance.isPleromaInstance) {
                    // pleroma instances support loading by conversation id
                    return ConversationStatusListConversationApiService(
                        conversation: conversationBloc.conversation,
                        pleromaConversationService:
                            IPleromaConversationService.of(context,
                                listen: false),
                        statusRepository:
                            IStatusRepository.of(context, listen: false));
                  } else {
                    // mastodon instances support conversation
                    // only by status context
                    return ConversationStatusListContextApiService(
                        conversation: conversationBloc.conversation,
                        pleromaStatusService:
                            IPleromaStatusService.of(context, listen: false),
                        statusRepository:
                            IStatusRepository.of(context, listen: false),
                        statusToFetchContext: conversationBloc.lastStatus);
                  }
                },
                child: DisposableProvider<IStatusPaginationBloc>(
                  create: (context) {
                    var statusPaginationBloc = StatusPaginationBloc(
                      statusListService:
                          IStatusListService.of(context, listen: false),
                      itemsCountPerPage: 20,
                      maximumCachedPagesCount: null,
                    );
                    return statusPaginationBloc;
                  },
                  child: DisposableProvider<IStatusPaginationListBloc>(
                    create: (context) => StatusPaginationListBloc(
                        paginationBloc:
                            IStatusPaginationBloc.of(context, listen: false)),
                    child: ConversationStatusListWidget(
                      key: PageStorageKey(
                          "${conversationBloc.conversation.remoteId}"),
                    ),
                  ),
                ),
              )),
              ConversationPostStatusWidget()
            ],
          );
        });
  }
}
