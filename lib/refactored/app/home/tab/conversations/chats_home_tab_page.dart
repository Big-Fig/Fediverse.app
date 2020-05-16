import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/chat/list/chat_list_container_bloc.dart';
import 'package:fedi/refactored/app/chat/list/chat_list_container_bloc_impl.dart';
import 'package:fedi/refactored/app/chat/list/chat_list_container_widget.dart';
import 'package:fedi/refactored/app/chat/start/start_chat_page.dart';
import 'package:fedi/refactored/app/search/search_page.dart';
import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/refactored/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/refactored/app/ui/fedi_icons.dart';
import 'package:fedi/refactored/app/ui/header/fedi_header_text.dart';
import 'package:fedi/refactored/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
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
      body: FediHomeTabContainer(
        topHeaderHeightInSafeArea: 104.0,
        topBar: buildTopBar(context, isPleromaInstance),
        body: buildBody(context, isPleromaInstance),
      ),
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
          child: FediHeaderText(
              AppLocalizations.of(context).tr("app.home.tab.chats.title")),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FediTransparentTextButton(
              AppLocalizations.of(context)
                  .tr("app.home.tab.chats.action.switch_to_dms"),
              onPressed: () {
                IMyAccountSettingsBloc.of(context, listen: false)
                    .changeIsNewChatsEnabled(false);
              },
            ),
            if (isPleromaInstance)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: buildSearchActionButton(context),
              ),
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
        child: ChatListContainerWidget(key: key));
  }

  Center buildMastodonBody(BuildContext context) {
    return Center(
        child: Text(AppLocalizations.of(context)
            .tr("app.home.tab.chats.not_supported_on_mastodon")));
  }
}
