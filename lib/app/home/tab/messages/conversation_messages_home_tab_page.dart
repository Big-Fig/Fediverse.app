import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/conversation/conversations_list_bloc.dart';
import 'package:fedi/app/conversation/conversations_list_bloc_impl.dart';
import 'package:fedi/app/conversation/list/conversation_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/conversation/list/conversation_list_widget.dart';
import 'package:fedi/app/conversation/start/start_conversation_page.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/fedi_blurred_text_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/header/fedi_header_text.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_without_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("conversation_messages_home_tab_page.dart");

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class ConversationMessagesHomeTabPage extends StatelessWidget {
  const ConversationMessagesHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.transparent,
      body: buildNestedScrollView(context),
    );
  }

  Widget buildNestedScrollView(BuildContext context) =>
      FediNestedScrollViewWithoutNestedScrollableTabsWidget(
          onLongScrollUpTopOverlayWidget: null,
          topSliverScrollOffsetToShowWhiteStatusBar: null,
          topSliverWidgets: [
            FediTabMainHeaderBarWidget(
              leadingWidgets: [
                FediHeaderText(tr("app.home.tab.conversations.title"))
              ],
              content: null,
              endingWidgets: [
                buildSwitchToChatsActionButton(context),
                const FediBigHorizontalSpacer(),
                buildStartConversationActionButton(context)
              ],
            ),
          ],
          providerBuilder: (context, child) =>
              DisposableProvider<IConversationsListBloc>(
                create: (context) =>
                    ConversationsListBloc.createFromContext(context),
                child: Builder(builder: (context) {
                  var conversationsListBloc =
                      IConversationsListBloc.of(context, listen: false);

                  return MultiProvider(
                    providers: [
                      Provider.value(
                          value: conversationsListBloc.conversationListService),
                      Provider.value(
                          value:
                              conversationsListBloc.conversationPaginationBloc),
                      Provider.value(
                          value: conversationsListBloc
                              .conversationPaginationListBloc),
                      Provider<ICachedPaginationListWithNewItemsBloc>.value(
                          value: conversationsListBloc
                              .conversationPaginationListWithNewItemsBloc),
                      Provider<IPaginationListBloc>.value(
                          value: conversationsListBloc
                              .conversationPaginationListBloc),
                    ],
                    child: child,
                  );
                }),
              ),
          contentBuilder: (context) {
            return FediDarkStatusBarStyleArea(
              child: ClipRRect(
                borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
                child: Container(
                  color: Colors.white,
                  child: ConversationListWidget(
                    key: PageStorageKey("ConversationsListWidget"),
                  ),
                ),
              ),
            );
          },
          overlayBuilder: (context) =>
              ConversationListTapToLoadOverlayWidget());

  FediBlurredTextButton buildSwitchToChatsActionButton(
      BuildContext context) {
    return FediBlurredTextButton(
        tr("app.home.tab.conversations.action.switch_to_chats"), onPressed: () {
      IMyAccountSettingsBloc.of(context, listen: false)
          .isNewChatsEnabledFieldBloc
          .changeCurrentValue(true);
    });
  }

  Widget buildStartConversationActionButton(BuildContext context) =>
      FediIconInCircleBlurredButton(
        FediIcons.pen,
        onPressed: () {
          goToStartConversationPage(context);
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediIconInCircleBlurredButton(
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
      );
}
