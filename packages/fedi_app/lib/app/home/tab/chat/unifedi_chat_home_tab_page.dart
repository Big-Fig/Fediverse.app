import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi_app/app/chat/conversation/unread/conversation_chat_unread_badge_bloc_impl.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/list/unifedi_chat_list_tap_to_load_overlay_widget.dart';
import 'package:fedi_app/app/chat/unifedi/start/unifedi_chat_start_page.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/cached/unifedi_chat_with_last_message_cached_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/unifedi_chat_with_last_message_list_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/unifedi_chat_with_last_message_list_bloc_impl.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/list/unifedi_chat_with_last_message_list_widget.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/list/unifedi_chat_with_last_message_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/pagination/unifedi_chat_with_last_message_pagination_bloc.dart';
import 'package:fedi_app/app/chat/unifedi/with_last_message/unifedi_chat_with_last_message_model.dart';
import 'package:fedi_app/app/home/tab/chat/unifedi_chat_home_tab_page_keys.dart';
import 'package:fedi_app/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_blurred_text_button_with_border.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/fedi_border_radius.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/header/fedi_header_text.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_without_scrollable_tabs_widget.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi_app/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('chat_messages_home_tab_page.dart');

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class UnifediChatHomeTabPage extends StatelessWidget {
  const UnifediChatHomeTabPage({Key? key}) : super(key: key);

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
        topSliverWidgets: const [
          _ChatMessagesHomeTabPageHeaderWidget(),
        ],
        // ignore: avoid-returning-widgets
        providerBuilder: (context, child) => provideContentContext(child),
        contentBuilder: (context) =>
            const _ChatMessagesHomeTabPageContentWidget(),
        overlayBuilder: (context) =>
            const UnifediChatListTapToLoadOverlayWidget(),
      ),
    );
  }

  DisposableProvider<IUnifediChatWithLastMessageListBloc> provideContentContext(
    Widget child,
  ) =>
      DisposableProvider<IUnifediChatWithLastMessageListBloc>(
        create: (context) =>
            UnifediChatWithLastMessageListBloc.createFromContext(
          context,
          handlerType: WebSocketsChannelHandlerType.foregroundValue,
        ),
        child: Builder(
          builder: (context) {
            var chatsListBloc =
                IUnifediChatWithLastMessageListBloc.of(context, listen: false);

            return MultiProvider(
              providers: [
                Provider<IUnifediChatWithLastMessageCachedListBloc>.value(
                  value: chatsListBloc.chatListBloc,
                ),
                Provider<IUnifediChatWithLastMessagePaginationBloc>.value(
                  value: chatsListBloc.chatPaginationBloc,
                ),
                Provider<
                    IPaginationListBloc<
                        PaginationPage<IUnifediChatWithLastMessage>,
                        IUnifediChatWithLastMessage>>.value(
                  value: chatsListBloc.chatPaginationListBloc,
                ),
                Provider<
                    ICachedPaginationListWithNewItemsBloc<
                        CachedPaginationPage<IUnifediChatWithLastMessage>,
                        IUnifediChatWithLastMessage>>.value(
                  value: chatsListBloc.chatPaginationListWithNewItemsBloc,
                ),
                Provider<
                    IUnifediChatWithLastMessagePaginationListWithNewItemsBloc<
                        CachedPaginationPage<
                            IUnifediChatWithLastMessage>>>.value(
                  value: chatsListBloc.chatPaginationListWithNewItemsBloc,
                ),
                Provider<ICachedPaginationListWithNewItemsBloc>.value(
                  value: chatsListBloc.chatPaginationListWithNewItemsBloc,
                ),
                Provider<IPaginationListBloc>.value(
                  value: chatsListBloc.chatPaginationListWithNewItemsBloc,
                ),
              ],
              child: child,
            );
          },
        ),
      );
}

class _ChatMessagesHomeTabPageContentWidget extends StatelessWidget {
  const _ChatMessagesHomeTabPageContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);

    var currentInstance = currentUnifediApiAccessBloc.currentInstance!;
    var isPleromaInstance = currentInstance.isPleroma;

    // todo: remove hack
    var isSupportChats = isPleromaInstance;

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return FediDarkStatusBarStyleArea(
      child: ClipRRect(
        borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
        child: Container(
          color: fediUiColorTheme.white,
          child: isPleromaInstance
              ? isSupportChats
                  ? const UnifediChatHomeTabPageUnifediBody()
                  : const UnifediChatHomeTabPageUnifediNotSupportedBody()
              : const _UnifediChatHomeTabPageMastodonBody(),
        ),
      ),
    );
  }
}

class UnifediChatHomeTabPageUnifediNotSupportedBody extends StatelessWidget {
  const UnifediChatHomeTabPageUnifediNotSupportedBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: FediEmptyWidget(
          title: S.of(context).app_home_tab_chat_unifedi_notSupported_unifedi,
        ),
      );
}

class UnifediChatHomeTabPageUnifediBody extends StatelessWidget {
  const UnifediChatHomeTabPageUnifediBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const UnifediChatWithLastMessageListWidget(
        key: Key(
          UnifediChatHomeTabPageKeys.unifediChatWithLastMessageListWidget,
        ),
      );
}

class _UnifediChatHomeTabPageMastodonBody extends StatelessWidget {
  const _UnifediChatHomeTabPageMastodonBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: FediEmptyWidget(
          title: S.of(context).app_home_tab_chat_unifedi_notSupported_mastodon,
        ),
      );
}

class _ChatMessagesHomeTabPageHeaderWidget extends StatelessWidget {
  const _ChatMessagesHomeTabPageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);

    var currentInstance = currentUnifediApiAccessBloc.currentInstance!;
    var isPleromaInstance = currentInstance.isPleroma;

    // todo: remove hack
    var isSupportChats = isPleromaInstance;

    return FediTabMainHeaderBarWidget(
      leadingWidgets: [
        FediHeaderText(
          text: S.of(context).app_home_tab_chat_unifedi_title,
        ),
      ],
      content: null,
      endingWidgets: [
        const _ChatMessagesHomeTabPageHeaderSwitchToDmActionWidget(),
        const FediBigHorizontalSpacer(),
        if (isPleromaInstance && isSupportChats)
          const _ChatMessagesHomeTabPageHeaderAddActionWidget(),
      ],
    );
  }
}

class _ChatMessagesHomeTabPageHeaderAddActionWidget extends StatelessWidget {
  const _ChatMessagesHomeTabPageHeaderAddActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconInCircleBlurredButton(
        FediIcons.plus,
        onPressed: () {
          goToUnifediChatStartPage(context);
        },
      );
}

class _ChatMessagesHomeTabPageHeaderSwitchToDmActionWidget
    extends StatelessWidget {
  const _ChatMessagesHomeTabPageHeaderSwitchToDmActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProxyProvider<IConversationChatRepository, IFediBoolBadgeBloc>(
        update: (context, conversationChatRepository, _) =>
            ConversationChatUnreadBadgeBloc(
          conversationChatRepository: conversationChatRepository,
        ),
        child: FediBoolBadgeWidget(
          child: FediBlurredTextButtonWithBorder(
            S.of(context).app_home_tab_chat_unifedi_action_switch_to_dms,
            onPressed: () {
              IChatSettingsBloc.of(context, listen: false)
                  .changeReplaceConversationsWithUnifediChats(
                replaceConversationsWithChats: false,
              );
            },
            expanded: false,
          ),
        ),
      );
}
