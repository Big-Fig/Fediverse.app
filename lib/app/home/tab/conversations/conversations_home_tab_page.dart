import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/conversation/conversations_list_bloc.dart';
import 'package:fedi/app/conversation/conversations_list_bloc_impl.dart';
import 'package:fedi/app/conversation/conversations_list_widget.dart';
import 'package:fedi/app/conversation/start/start_conversation_page.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/header/fedi_header_text.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("conversations_home_tab_page.dart");

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class ConversationsHomeTabPage extends StatelessWidget {
  const ConversationsHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        controller: IScrollControllerBloc.of(context).scrollController,
        body: FediDarkStatusBarStyleArea(
          child: DisposableProvider<IConversationsListBloc>(
            create: (context) =>
                ConversationsListBloc.createFromContext(context),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Container(
                    color: Colors.white, child: ConversationsListWidget())),
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0 + MediaQuery.of(context).padding.top,
                      bottom: 24.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: FediLightStatusBarStyleArea(
                      child: buildTopBar(context),
                    ),
                  ),
//              _buildCollapsedAppBarBody(context)
                ],
              ),
            ),
//            buildSliverAppBar(context, tabs, notificationsTabsBloc),
          ];
        },
      ),
//
//      body: FediHomeTabContainer(
//        topHeaderHeightInSafeArea:
//        FediSizes.headerImageSingleRowSafeAreaHeight,
//        topBar: buildTopBar(context),
//        body: DisposableProvider<IConversationsListBloc>(
//            create: (context) =>
//                ConversationsListBloc.createFromContext(context),
//            child: const ConversationsListWidget()),
//      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FediHeaderText(tr("app.home.tab.conversations.title")),
        ),
        Row(
          children: <Widget>[
            FediTransparentTextButton(
                tr("app.home.tab.conversations.action.switch_to_chats"),
                onPressed: () {
              IMyAccountSettingsBloc.of(context, listen: false)
                  .changeIsNewChatsEnabled(true);
            }),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 8.0),
//              child: buildSearchActionButton(context),
//            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: buildPenActionButton(context),
            )
          ],
        )
      ],
    );
  }

  Widget buildPenActionButton(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.pen,
        onPressed: () {
          goToStartConversationPage(context);
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
      );
}
