import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/chat/conversation_chat_home_tab_page.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_page.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc_proxy_provider.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi/app/instance/fedi_instance_image_background_widget.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/post/new/new_post_status_bloc_impl.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("home_page.dart");

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var homeBloc = IHomeBloc.of(context, listen: false);

    return StreamBuilder<HomeTab?>(
      stream: homeBloc.selectedTabStream.distinct(),
      initialData: homeBloc.selectedTab,
      builder: (context, snapshot) {
        var selectedTab = snapshot.data;

        _logger.finest(() => "selectedTab $selectedTab");

        if (selectedTab == null) {
          return const SizedBox.shrink();
        }

        return Scaffold(
          body: Stack(
            children: [
              RepaintBoundary(
                child: Container(
                  // ignore: no-magic-number
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<IAccountHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var accountHomeTabBloc = AccountHomeTabBloc(
          currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
            context,
            listen: false,
          ),
        );

        accountHomeTabBloc.addDisposable(
          streamSubscription: homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.account) {
                accountHomeTabBloc.scrollToTop();
              }
            },
          ),
        );

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
    Key? key,
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
    Key? key,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<INotificationsHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var notificationsHomeTabBloc = NotificationsHomeTabBloc(
          pleromaNotificationService: IPleromaApiNotificationService.of(
            context,
            listen: false,
          ),
          notificationRepository: INotificationRepository.of(
            context,
            listen: false,
          ),
        );

        notificationsHomeTabBloc.addDisposable(
          streamSubscription: homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.notifications) {
                notificationsHomeTabBloc.scrollToTop();
              }
            },
          ),
        );

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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatSettingsBloc = IChatSettingsBloc.of(context);
    return StreamBuilder<bool?>(
      stream: chatSettingsBloc.replaceConversationsWithPleromaChatsStream,
      initialData: chatSettingsBloc.replaceConversationsWithPleromaChats,
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
  Widget build(BuildContext context) {
    return DisposableProvider<ITimelinesHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);
        var timelinesHomeTabBloc = TimelinesHomeTabBloc();

        _logger.finest(() => "create timelinesHomeTabBloc");

        timelinesHomeTabBloc.addDisposable(
          streamSubscription: homeBloc.reselectedTabStream.listen(
            (reselectedTab) {
              if (reselectedTab == HomeTab.timelines) {
                timelinesHomeTabBloc.scrollToTop();
              }
            },
          ),
        );
        return timelinesHomeTabBloc;
      },
      child: TimelinesHomeTabBlocProxyProvider(
        // post status timeline header widget
        // we should provide it here to avoid disposing
        // when navigating to pick image page
        child: NewPostStatusBloc.provideToContextWithInitial(
          context,
          child: TimelinesHomeTabPage(),
          initialMediaAttachments: null,
          initialText: null,
          initialSubject: null,
        ),
      ),
    );
  }
}

class _HomePageBottomNavBar extends StatelessWidget {
  const _HomePageBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Container(
          // ignore: no-magic-number
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
