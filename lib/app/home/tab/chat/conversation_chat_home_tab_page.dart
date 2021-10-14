import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/chat/conversation/start/conversation_chat_start_page.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/cached/conversation_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/conversation_chat_with_last_message_list_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/conversation_chat_with_last_message_list_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/with_last_message/list/conversation_chat_with_last_message_list_widget.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/conversation_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi/app/chat/conversation/with_last_message/pagination/list/conversation_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/app/chat/pleroma/list/pleroma_chat_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/unread/pleroma_chat_unread_badge_bloc_impl.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_blurred_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/header/fedi_header_text.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_without_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger('conversation_messages_home_tab_page.dart');

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class ConversationChatHomeTabPage extends StatelessWidget {
  const ConversationChatHomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => 'build');
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Scaffold(
      key: _drawerKey,
      backgroundColor: fediUiColorTheme.transparent,
      body: FediNestedScrollViewWithoutNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget: null,
        topSliverScrollOffsetToShowWhiteStatusBar: null,
        topSliverWidgets: [
          const _ConversationMessagesHomeTabPageHeaderWidget(),
        ],
        providerBuilder: (context, child) => provideContentContext(child),
        contentBuilder: (context) =>
            const _ConversationMessagesHomeTabPageContentWidget(),
        overlayBuilder: (context) =>
            const PleromaChatListTapToLoadOverlayWidget(),
      ),
    );
  }

  DisposableProvider<
      IConversationChatWithLastMessageListBloc> provideContentContext(
    Widget child,
  ) =>
      DisposableProvider<IConversationChatWithLastMessageListBloc>(
        create: (context) =>
            ConversationChatWithLastMessageListBloc.createFromContext(context),
        child: Builder(
          builder: (context) {
            var chatsListBloc = IConversationChatWithLastMessageListBloc.of(
              context,
              listen: false,
            );

            return MultiProvider(
              providers: [
                Provider<IConversationChatWithLastMessageCachedListBloc>.value(
                  value: chatsListBloc.cachedListBloc,
                ),
                Provider<IConversationChatWithLastMessagePaginationBloc>.value(
                  value: chatsListBloc.paginationBloc,
                ),
                Provider<
                    IPaginationListBloc<
                        PaginationPage<IConversationChatWithLastMessage>,
                        IConversationChatWithLastMessage>>.value(
                  value: chatsListBloc.chatPaginationListBloc,
                ),
                Provider<
                    IConversationChatWithLastMessagePaginationListWithNewItemsBloc<
                        CachedPaginationPage<
                            IConversationChatWithLastMessage>>>.value(
                  value: chatsListBloc.paginationListWithNewItemsBloc,
                ),
                Provider<
                    ICachedPaginationListWithNewItemsBloc<
                        CachedPaginationPage<IConversationChatWithLastMessage>,
                        IConversationChatWithLastMessage>>.value(
                  value: chatsListBloc.paginationListWithNewItemsBloc,
                ),
                Provider<ICachedPaginationListWithNewItemsBloc>.value(
                  value: chatsListBloc.paginationListWithNewItemsBloc,
                ),
                Provider<IPaginationListBloc>.value(
                  value: chatsListBloc.paginationListWithNewItemsBloc,
                ),
              ],
              child: child,
            );
          },
        ),
      );
}

class _ConversationMessagesHomeTabPageContentWidget extends StatelessWidget {
  const _ConversationMessagesHomeTabPageContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return FediDarkStatusBarStyleArea(
      child: ClipRRect(
        borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
        child: Container(
          color: fediUiColorTheme.white,
          child: const ConversationChatWithLastMessageListWidget(
            key: PageStorageKey('ConversationChatWithLastMessageListWidget'),
          ),
        ),
      ),
    );
  }
}

class _ConversationMessagesHomeTabPageHeaderWidget extends StatelessWidget {
  const _ConversationMessagesHomeTabPageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediTabMainHeaderBarWidget(
        leadingWidgets: [
          FediHeaderText(
            S.of(context).app_home_tab_chat_conversation_title,
          ),
        ],
        content: null,
        endingWidgets: [
          buildSwitchToChatsActionButton(context),
          const FediBigHorizontalSpacer(),
          buildStartConversationActionButton(context),
        ],
      );

  Widget buildSwitchToChatsActionButton(BuildContext context) =>
      DisposableProxyProvider<IPleromaChatRepository, IFediBoolBadgeBloc>(
        update: (context, pleromaChatRepository, _) =>
            PleromaChatUnreadBadgeBloc(
          pleromaChatRepository: pleromaChatRepository,
        ),
        child: FediBoolBadgeWidget(
          child: FediBlurredTextButtonWithBorder(
            S.of(context).app_home_tab_chat_conversation_action_switchToChats,
            onPressed: () {
              IChatSettingsBloc.of(context, listen: false)
                  .changeReplaceConversationsWithPleromaChats(
                replaceConversationsWithChats: true,
              );
            },
            expanded: false,
          ),
        ),
      );

  Widget buildStartConversationActionButton(BuildContext context) =>
      FediIconInCircleBlurredButton(
        FediIcons.plus,
        onPressed: () {
          goToStartConversationPage(context);
        },
      );
}
