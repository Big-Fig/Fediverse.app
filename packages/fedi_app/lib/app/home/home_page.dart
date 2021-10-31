import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/home/home_bloc.dart';
import 'package:fedi_app/app/home/home_model.dart';
import 'package:fedi_app/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi_app/app/home/home_page_keys.dart';
import 'package:fedi_app/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/account/account_home_tab_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/account/account_home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/account/account_home_tab_page.dart';
import 'package:fedi_app/app/home/tab/chat/conversation_chat_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/chat/conversation_chat_home_tab_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/chat/conversation_chat_home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/chat/conversation_chat_home_tab_page.dart';
import 'package:fedi_app/app/home/tab/chat/unifedi_chat_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/chat/unifedi_chat_home_tab_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/chat/unifedi_chat_home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/chat/unifedi_chat_home_tab_page.dart';
import 'package:fedi_app/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/notifications/notifications_home_tab_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/notifications/notifications_home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi_app/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/timelines/timelines_home_tab_bloc_impl.dart';
import 'package:fedi_app/app/home/tab/timelines/timelines_home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi_app/app/instance/background/instance_image_background_widget.dart';
import 'package:fedi_app/app/notification/repository/notification_repository.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('home_page.dart');

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => 'build');

    var homeBloc = IHomeBloc.of(context, listen: false);

    return StreamBuilder<HomeTab?>(
      stream: homeBloc.selectedTabStream.distinct(),
      initialData: homeBloc.selectedTab,
      builder: (context, snapshot) {
        var selectedTab = snapshot.data;

        _logger.finest(() => 'selectedTab $selectedTab');

        if (selectedTab == null) {
          return const SizedBox.shrink();
        }

        return Provider<HomeTab>.value(
          value: selectedTab,
          child: Scaffold(
            body: Stack(
              children: const [
                RepaintBoundary(
                  child: SizedBox(
                    // ignore: no-magic-number
                    height: 200,
                    child: _HomePageBackgroundWidget(),
                  ),
                ),
                _HomePageBodyWidget(),
              ],
            ),
            bottomNavigationBar: const _HomePageBottomNavBar(
              key: Key(HomePageKeys.bottomNavBarWidget),
            ),
          ),
        );
      },
    );
  }
}

class _HomePageBodyWidget extends StatelessWidget {
  const _HomePageBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedTab = Provider.of<HomeTab>(context);

    switch (selectedTab) {
      case HomeTab.timelines:
        return const _HomePageTimelineTabWidget();
      case HomeTab.notifications:
        return const _HomePageNotificationTabWidget();
      case HomeTab.chat:
        return const _HomePageMessagesTabWidget();
      case HomeTab.account:
        return const _HomePageAccountTabWidget();
    }
  }
}

class _HomePageBackgroundWidget extends StatelessWidget {
  const _HomePageBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediLightStatusBarStyleArea(
        child: Container(
          color: IFediUiColorTheme.of(context).primary,
          child: const InstanceImageBackgroundWidget(),
        ),
      );
}

class _HomePageAccountTabWidget extends StatelessWidget {
  const _HomePageAccountTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DisposableProvider<IAccountHomeTabBloc>(
        create: (context) {
          var homeBloc = IHomeBloc.of(context, listen: false);

          var accountHomeTabBloc = AccountHomeTabBloc();

          homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.account) {
                accountHomeTabBloc.scrollToTop();
              }
            },
          ).disposeWith(accountHomeTabBloc);

          return accountHomeTabBloc;
        },
        child: const AccountHomeTabBlocProxyProvider(
          child: AccountHomeTabPage(
            key: PageStorageKey<String>('AccountHomeTabPage'),
          ),
        ),
      );
}

class _HomePageMessagesTabConversationWidget extends StatelessWidget {
  const _HomePageMessagesTabConversationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<IConversationChatHomeTabBloc>(
        create: (context) {
          var homeBloc = IHomeBloc.of(context, listen: false);

          var conversationMessagesHomeTabBloc = ConversationChatHomeTabBloc(
              //              deviceHeight: MediaQuery.of(context).size.height,
              );

          homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.chat) {
                conversationMessagesHomeTabBloc.scrollToTop();
              }
            },
          ).disposeWith(conversationMessagesHomeTabBloc);

          return conversationMessagesHomeTabBloc;
        },
        child: const ConversationChatHomeTabBlocProxyProvider(
          child: ConversationChatHomeTabPage(),
        ),
      );
}

class _HomePageMessagesTabChatWidget extends StatelessWidget {
  const _HomePageMessagesTabChatWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<IUnifediChatHomeTabBloc>(
        create: (context) {
          var homeBloc = IHomeBloc.of(context, listen: false);

          var chatMessagesHomeTabBloc = UnifediChatHomeTabBloc();

          homeBloc.reselectedTabStream.listen((reselectedTab) {
            if (reselectedTab == HomeTab.chat) {
              chatMessagesHomeTabBloc.scrollToTop();
            }
          }).disposeWith(chatMessagesHomeTabBloc);

          return chatMessagesHomeTabBloc;
        },
        child: const UnifediChatHomeTabBlocProxyProvider(
          child: UnifediChatHomeTabPage(
            key: PageStorageKey<String>('ChatMessagesHomeTabPage'),
          ),
        ),
      );
}

class _HomePageNotificationTabWidget extends StatelessWidget {
  const _HomePageNotificationTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<INotificationsHomeTabBloc>(
        create: (context) {
          var homeBloc = IHomeBloc.of(context, listen: false);

          var notificationsHomeTabBloc = NotificationsHomeTabBloc(
            unifediNotificationService:
                Provider.of<IUnifediApiNotificationService>(
              context,
              listen: false,
            ),
            notificationRepository: INotificationRepository.of(
              context,
              listen: false,
            ),
          );

          homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.notifications) {
                notificationsHomeTabBloc.scrollToTop();
              }
            },
          ).disposeWith(notificationsHomeTabBloc);

          return notificationsHomeTabBloc;
        },
        child: const NotificationsHomeTabBlocProxyProvider(
          child: NotificationsHomeTabPage(),
        ),
      );
}

class _HomePageMessagesTabWidget extends StatelessWidget {
  const _HomePageMessagesTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatSettingsBloc = IChatSettingsBloc.of(context);

    return StreamBuilder<bool?>(
      stream: chatSettingsBloc.replaceConversationsWithUnifediChatsStream,
      initialData: chatSettingsBloc.replaceConversationsWithUnifediChats,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<ITimelinesHomeTabBloc>(
        create: (context) {
          var homeBloc = IHomeBloc.of(context, listen: false);
          var timelinesHomeTabBloc = TimelinesHomeTabBloc();

          _logger.finest(() => 'create timelinesHomeTabBloc');

          homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.timelines) {
                timelinesHomeTabBloc.scrollToTop();
              }
            },
          ).disposeWith(timelinesHomeTabBloc);

          return timelinesHomeTabBloc;
        },
        child: TimelinesHomeTabBlocProxyProvider(
          // post status timeline header widget
          // we should provide it here to avoid disposing
          // when navigating to pick image page
          child: NewPostStatusBloc.provideToContextWithInitial(
            context,
            child: const TimelinesHomeTabPage(),
            initialMediaAttachments: null,
            initialText: null,
            initialSubject: null,
          ),
        ),
      );
}

class _HomePageBottomNavBar extends StatelessWidget {
  const _HomePageBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: SizedBox(
          // ignore: no-magic-number
          height: 58,
          child: Column(
            children: const [
              FediUltraLightGreyDivider(),
              HomePageBottomNavigationBarWidget(),
            ],
          ),
        ),
      );
}
