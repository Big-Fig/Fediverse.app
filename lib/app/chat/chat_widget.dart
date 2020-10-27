import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/message/list/cached/chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_widget.dart';
import 'package:fedi/app/chat/message/pagination/cached/chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/message/pagination/list/chat_message_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/widgets.dart';

class ChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: true);
    return FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: chatBloc,
        loadingFinishedBuilder: (context) {
          return ChatMessageListBloc.provideToContext(
            context,
            chat: chatBloc.chat,
            child: ChatMessageCachedPaginationBloc.provideToContext(
              context,
              child: ChatMessageCachedPaginationListWithNewItemsBloc
                  .provideToContext(context,
                      mergeNewItemsImmediately: true,
                      child: buildBody(
                        context,
                        chatBloc,
                      )),
            ),
          );
        });
  }

  Widget buildBody(
    BuildContext context,
    IChatBloc chatBloc,
  ) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: postMessageBloc.isExpandedStream,
        initialData: postMessageBloc.isExpanded,
        builder: (context, snapshot) {
          var isPostMessageExpanded = snapshot.data;
          var postMessageWidget = PostMessageWidget(
            hintText:
            S.of(context).app_chat_post_field_content_hint,
          );
          if (isPostMessageExpanded) {
            return postMessageWidget;
          } else {
            return Column(
              children: <Widget>[
                Expanded(
                  child: UnfocusOnScrollAreaWidget(
                    child: Padding(
                      padding: FediPadding.horizontalBigPadding,
                      child: ChatMessageListWidget(
                        key: PageStorageKey(chatBloc.chat.remoteId),
                      ),
                    ),
                  ),
                ),
                const FediUltraLightGreyDivider(),
                postMessageWidget
              ],
            );
          }
        });
  }
}
