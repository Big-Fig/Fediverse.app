import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/list/chat_list_container_bloc.dart';
import 'package:fedi/app/chat/list/chat_list_container_bloc_impl.dart';
import 'package:fedi/app/chat/list/chat_list_container_widget.dart';
import 'package:fedi/app/chat/start/start_chat_page.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/header/fedi_header_text.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("chats_home_tab_page.dart");

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class ChatsHomeTabPage extends StatelessWidget {
  const ChatsHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var isPleromaInstance =
        currentAuthInstanceBloc.currentInstance.isPleromaInstance;
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        body: FediDarkStatusBarStyleArea(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
            child: Container(
              color: Colors.white,
              child: buildBody(context, isPleromaInstance),
            ),
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
                      child: buildTopBar(context, isPleromaInstance),
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
//      body: FediHomeTabContainer(
//        topHeaderHeightInSafeArea: 104.0,
//        topBar: buildTopBar(context, isPleromaInstance),
//        body: buildBody(context, isPleromaInstance),
//      ),
    );
  }

  Widget buildBody(BuildContext context, bool isPleromaInstance) =>
      isPleromaInstance ? buildPleromaBody() : buildMastodonBody(context);

  Widget buildTopBar(BuildContext context, bool isPleromaInstance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FediHeaderText(tr("app.home.tab.chats.title")),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FediTransparentTextButton(
              tr("app.home.tab.chats.action.switch_to_dms"),
              onPressed: () {
                IMyAccountSettingsBloc.of(context, listen: false)
                    .changeIsNewChatsEnabled(false);
              },
            ),
            if (isPleromaInstance)
//              Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                child: buildSearchActionButton(context),
//              ),
              if (isPleromaInstance)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buildPenActionButton(context),
                ),
          ],
        )
      ],
    );
  }

  Widget buildPenActionButton(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.pen,
        onPressed: () {
          goToStartChatPage(context);
        },
      );

  Widget buildSearchActionButton(BuildContext context) =>
      FediIconInCircleTransparentButton(
        FediIcons.search,
        onPressed: () {
          goToSearchPage(context);
        },
      );

  DisposableProvider<IChatListContainerBloc> buildPleromaBody() {
    return DisposableProvider<IChatListContainerBloc>(
        create: (context) => ChatsListContainerBloc.createFromContext(context),
        child: const ChatListContainerWidget());
  }

  Center buildMastodonBody(BuildContext context) {
    return Center(
        child: Text(tr("app.home.tab.chats.not_supported_on_mastodon")));
  }
}
