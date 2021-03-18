import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/conversation/unread/conversation_chat_unread_badge_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/list/pleroma_chat_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/chat/pleroma/start/pleroma_chat_start_page.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/pleroma_chat_with_last_message_list_bloc.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/pleroma_chat_with_last_message_list_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/with_last_message/list/pleroma_chat_with_last_message_list_widget.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_blurred_text_button_with_border.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/header/fedi_header_text.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_without_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("chat_messages_home_tab_page.dart");

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class PleromaChatHomeTabPage extends StatelessWidget {
  const PleromaChatHomeTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Scaffold(
      key: _drawerKey,
      backgroundColor: fediUiColorTheme.transparent,
      body: FediNestedScrollViewWithoutNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget: null,
        topSliverScrollOffsetToShowWhiteStatusBar: null,
        topSliverWidgets: [
          const _ChatMessagesHomeTabPageHeaderWidget(),
        ],
        providerBuilder: (context, child) => provideContentContext(child),
        contentBuilder: (context) =>
            const _ChatMessagesHomeTabPageContentWidget(),
        overlayBuilder: (context) =>
            const PleromaChatListTapToLoadOverlayWidget(),
      ),
    );
  }

  DisposableProvider<IPleromaChatWithLastMessageListBloc> provideContentContext(
      Widget child) {
    return DisposableProvider<IPleromaChatWithLastMessageListBloc>(
      create: (context) => PleromaChatWithLastMessageListBloc.createFromContext(
        context,
        webSocketsListenType: WebSocketsListenType.foreground,
      ),
      child: Builder(builder: (context) {
        var chatsListBloc =
            IPleromaChatWithLastMessageListBloc.of(context, listen: false);

        return MultiProvider(
          providers: [
            Provider.value(value: chatsListBloc.chatListBloc),
            Provider.value(value: chatsListBloc.chatPaginationBloc),
            Provider.value(value: chatsListBloc.chatPaginationListBloc),
            Provider.value(
                value: chatsListBloc.chatPaginationListWithNewItemsBloc),
            Provider<ICachedPaginationListWithNewItemsBloc?>.value(
                value: chatsListBloc.chatPaginationListWithNewItemsBloc),
            Provider<IPaginationListBloc?>.value(
                value: chatsListBloc.chatPaginationListWithNewItemsBloc),
          ],
          child: child,
        );
      }),
    );
  }
}

class _ChatMessagesHomeTabPageContentWidget extends StatelessWidget {
  const _ChatMessagesHomeTabPageContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);

    var currentInstance = currentAuthInstanceBloc.currentInstance!;
    var isPleromaInstance = currentInstance.isPleroma;

    var isSupportChats = currentInstance.isSupportChats;

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return FediDarkStatusBarStyleArea(
      child: ClipRRect(
        borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
        child: Container(
          color: fediUiColorTheme.white,
          child: buildBody(
            context: context,
            isPleromaInstance: isPleromaInstance,
            isSupportChats: isSupportChats,
          ),
        ),
      ),
    );
  }

  Widget buildBody({
    required BuildContext context,
    required bool isPleromaInstance,
    required bool isSupportChats,
  }) =>
      isPleromaInstance
          ? isSupportChats
              ? buildPleromaBody()
              : buildPleromaNotSupportedBody(context)
          : buildMastodonBody(context);

  Widget buildPleromaBody() => const PleromaChatWithLastMessageListWidget(
        key: PageStorageKey("PleromaChatWithLastMessageListWidget"),
      );

  Widget buildMastodonBody(BuildContext context) => Center(
        child: FediEmptyWidget(
          title: S.of(context).app_home_tab_chat_pleroma_notSupported_mastodon,
        ),
      );

  Widget buildPleromaNotSupportedBody(BuildContext context) => Center(
        child: FediEmptyWidget(
          title: S.of(context).app_home_tab_chat_pleroma_notSupported_pleroma,
        ),
      );
}

class _ChatMessagesHomeTabPageHeaderWidget extends StatelessWidget {
  const _ChatMessagesHomeTabPageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);

    var currentInstance = currentAuthInstanceBloc.currentInstance!;
    var isPleromaInstance = currentInstance.isPleroma;

    var isSupportChats = currentInstance.isSupportChats;
    return FediTabMainHeaderBarWidget(
      leadingWidgets: [
        FediHeaderText(
          S.of(context).app_home_tab_chat_pleroma_title,
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
  Widget build(BuildContext context) {
    return FediIconInCircleBlurredButton(
      FediIcons.plus,
      onPressed: () {
        goToPleromaChatStartPage(context);
      },
    );
  }
}

class _ChatMessagesHomeTabPageHeaderSwitchToDmActionWidget
    extends StatelessWidget {
  const _ChatMessagesHomeTabPageHeaderSwitchToDmActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProxyProvider<IConversationChatRepository,
        IFediBoolBadgeBloc>(
      update: (context, conversationChatRepository, _) =>
          ConversationChatUnreadBadgeBloc(
        conversationChatRepository: conversationChatRepository,
      ),
      child: FediBoolBadgeWidget(
        child: FediBlurredTextButtonWithBorder(
          S.of(context).app_home_tab_chat_pleroma_action_switch_to_dms,
          onPressed: () {
            IChatSettingsBloc.of(context, listen: false)
                .changeReplaceConversationsWithPleromaChats(false);
          },
          expanded: false,
        ),
      ),
    );
  }
}
