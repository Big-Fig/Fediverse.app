import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/message/list/cached/chat_message_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/message/list/chat_message_list_widget.dart';
import 'package:fedi/app/chat/message/pagination/cached/chat_message_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/chat/message/pagination/list/chat_message_cached_pagination_list_with_new_items_bloc_impl.dart';
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
                      child: buildBody(chatBloc)),
            ),
          );
        });
  }

  Widget buildBody(IChatBloc chatBloc) => Column(
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
          PostMessageWidget(
            hintText: tr("app.chat.post.field.content.hint"),
          )
        ],
      );
}
