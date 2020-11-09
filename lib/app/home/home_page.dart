import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_page.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_page.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi/app/instance/fedi_instance_image_background_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("home_page.dart");

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var homeBloc = IHomeBloc.of(context, listen: false);

    return StreamBuilder<HomeTab>(
      stream: homeBloc.selectedTabStream.distinct(),
      initialData: homeBloc.selectedTab,
      builder: (context, snapshot) {
        var selectedTab = snapshot.data;

        _logger.finest(() => "selectedTab $selectedTab");

        if (selectedTab == null) {
          return SizedBox.shrink();
        }

        return Scaffold(
          body: Stack(
            children: [
              RepaintBoundary(
                child: Container(
                  height: 180,
                  child: const _HomePageBackgroundWidget(),
                ),
              ),
              buildBody(context, selectedTab),
            ],
          ),
          bottomNavigationBar: const _HomePageBottomNavBar(),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, HomeTab selectedTab) {
    switch (selectedTab) {
      case HomeTab.timelines:
        return const _HomePageTimelineTabWidget();
        break;
      case HomeTab.notifications:
        return const _HomePageNotificationTabWidget();
        break;
      case HomeTab.chat:
        return const _HomePageMessagesTabWidget();

        break;
      case HomeTab.account:
        return const _HomePageAccountTabWidget();
        break;
    }

    throw "buildBody invalid selectedTab = $selectedTab";
  }
}

class _HomePageBackgroundWidget extends StatelessWidget {
  const _HomePageBackgroundWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediLightStatusBarStyleArea(
      child: Container(
        color: IFediUiColorTheme.of(context).primary,
        child: const FediInstanceImageBackgroundWidget(),
      ),
    );
  }
}

class _HomePageAccountTabWidget extends StatelessWidget {
  const _HomePageAccountTabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<IAccountHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var accountHomeTabBloc = AccountHomeTabBloc(
            //              deviceHeight: MediaQuery.of(context).size.height,
            );

        accountHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.account) {
            accountHomeTabBloc.scrollToTop();
          }
        }));

        return accountHomeTabBloc;
      },
      child: AccountHomeTabBlocProxyProvider(
        child: const AccountHomeTabPage(
          key: PageStorageKey<String>("AccountHomeTabPage"),
        ),
      ),
    );
  }
}

class _HomePageMessagesTabConversationWidget extends StatelessWidget {
  const _HomePageMessagesTabConversationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<IConversationChatHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var conversationMessagesHomeTabBloc = ConversationChatHomeTabBloc(
            //              deviceHeight: MediaQuery.of(context).size.height,
            );

        conversationMessagesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.chat) {
            conversationMessagesHomeTabBloc.scrollToTop();
          }
        }));

        return conversationMessagesHomeTabBloc;
      },
      child: ConversationChatHomeTabBlocProxyProvider(
        child: const ConversationChatHomeTabPage(),
      ),
    );
  }
}

class _HomePageMessagesTabChatWidget extends StatelessWidget {
  const _HomePageMessagesTabChatWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<IPleromaChatHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var chatMessagesHomeTabBloc = PleromaChatHomeTabBloc();

        chatMessagesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.chat) {
            chatMessagesHomeTabBloc.scrollToTop();
          }
        }));

        return chatMessagesHomeTabBloc;
      },
      child: PleromaChatHomeTabBlocProxyProvider(
        child: const PleromaChatHomeTabPage(
          key: PageStorageKey<String>("ChatMessagesHomeTabPage"),
        ),
      ),
    );
  }
}

class _HomePageNotificationTabWidget extends StatelessWidget {
  const _HomePageNotificationTabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<INotificationsHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var notificationsHomeTabBloc = NotificationsHomeTabBloc(
            //              deviceHeight: MediaQuery.of(context).size.height,
            );

        notificationsHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.notifications) {
            notificationsHomeTabBloc.scrollToTop();
          }
        }));

        return notificationsHomeTabBloc;
      },
      child: NotificationsHomeTabBlocProxyProvider(
        child: NotificationsHomeTabPage(),
      ),
    );
  }
}

class _HomePageMessagesTabWidget extends StatelessWidget {
  const _HomePageMessagesTabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context);
    return StreamBuilder<bool>(
      stream:
          myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValueStream,
      initialData:
          myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValue,
      builder: (context, snapshot) {
        var isNewChatsEnabled = snapshot.data;

        if (isNewChatsEnabled == true) {
          return const _HomePageMessagesTabChatWidget();
        } else {
          return const _HomePageMessagesTabConversationWidget();
        }
      },
    );
  }
}

class _HomePageTimelineTabWidget extends StatelessWidget {
  const _HomePageTimelineTabWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<ITimelinesHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);
        var timelinesHomeTabBloc = TimelinesHomeTabBloc();

        _logger.finest(() => "create timelinesHomeTabBloc");

        timelinesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.timelines) {
            timelinesHomeTabBloc.scrollToTop();
          }
        }));
        return timelinesHomeTabBloc;
      },
      child: TimelinesHomeTabBlocProxyProvider(
        child: const TimelinesHomeTabPage(),
      ),
    );
  }
}

class _HomePageBottomNavBar extends StatelessWidget {
  const _HomePageBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Container(
          height: 58,
          child: Column(
            children: [
              const FediUltraLightGreyDivider(),
              const HomePageBottomNavigationBarWidget(),
            ],
          ),
        ),
      );
}
