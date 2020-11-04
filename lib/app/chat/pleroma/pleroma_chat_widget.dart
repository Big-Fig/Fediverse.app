import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/list/cached/pleroma_chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/list/pleroma_chat_message_list_widget.dart';
import 'package:fedi/app/chat/pleroma/message/pagination/cached/pleroma_chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pagination/cached/pleroma_chat_message_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/message/post_message_widget.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/widgets.dart';

class PleromaChatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IPleromaChatBloc.of(context, listen: true);
    return FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: chatBloc,
        loadingFinishedBuilder: (context) {
          return PleromaChatMessageListBloc.provideToContext(
            context,
            chat: chatBloc.chat,
            child: PleromaChatMessageCachedPaginationBloc.provideToContext(
              context,
              child: PleromaChatMessageCachedPaginationListWithNewItemsBloc
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
    IPleromaChatBloc chatBloc,
  ) {
    var postMessageBloc = IPostMessageBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: postMessageBloc.isExpandedStream,
        initialData: postMessageBloc.isExpanded,
        builder: (context, snapshot) {
          var isPostMessageExpanded = snapshot.data;
          var postMessageWidget = const _PleromaChatPostMessageWidget();
          if (isPostMessageExpanded) {
            return postMessageWidget;
          } else {
            return Column(
              children: <Widget>[
                Expanded(
                  child: UnfocusOnScrollAreaWidget(
                    child: Padding(
                      padding: FediPadding.horizontalBigPadding,
                      child: PleromaChatMessageListWidget(
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

class _PleromaChatPostMessageWidget extends StatelessWidget {
  const _PleromaChatPostMessageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostMessageWidget(
      hintText:
      S.of(context).app_chat_post_field_content_hint,
    );
  }
}
