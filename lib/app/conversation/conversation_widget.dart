import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/conversation/status/context_api/conversation_status_list_context_api_bloc_impl.dart';
import 'package:fedi/app/conversation/status/conversation_api/conversation_status_list_conversation_api_bloc_impl.dart';
import 'package:fedi/app/conversation/status/conversation_status_list_widget.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/post/post_status_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: true);
    return AsyncInitLoadingWidget(
        asyncInitLoadingBloc: conversationBloc,
        loadingFinishedBuilder: (context) {
          return DisposableProvider<IStatusCachedListBloc>(
              create: (context) {
                var currentInstanceBloc =
                    ICurrentAuthInstanceBloc.of(context, listen: false);

                if (currentInstanceBloc.currentInstance.isPleromaInstance) {
                  // pleroma instances support loading by conversation id
                  return ConversationStatusListConversationApiBloc
                      .createFromContext(context,
                          conversation: conversationBloc.conversation);
                } else {
                  // mastodon instances support conversation
                  // only by status context
                  return ConversationStatusListContextApiBloc.createFromContext(
                      context,
                      conversation: conversationBloc.conversation,
                      statusToFetchContext: conversationBloc.lastStatus);
                }
              },
              child: DisposableProvider<
                  IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                create: (context) =>
                    StatusCachedPaginationBloc.createFromContext(context),
                child: DisposableProvider<
                    IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
                  create: (context) => StatusPaginationListWithNewItemsBloc(
                      mergeNewItemsImmediately: true,
                      statusCachedListBloc:
                          IStatusCachedListBloc.of(context, listen: false),
                      paginationBloc: Provider.of<
                          IPaginationBloc<PaginationPage<IStatus>,
                              IStatus>>(context, listen: false)),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ConversationStatusListWidget(
                            key: PageStorageKey(
                                conversationBloc.conversation.remoteId),
                          ),
                        ),
                      ),
                      const FediUltraLightGreyDivider(),
                      const PostStatusWidget(
                        showVisibilityAction: false,
                        expanded: false,
                        isTransparent: false,
                        goBackOnSuccess: false,
                        displayMentions: false,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
