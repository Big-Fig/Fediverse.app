import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page'
    '.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_page.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_bloc_proxy_providier.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_page.dart';
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
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
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
                _buildBackground(),
                buildBody(context, selectedTab),
              ],
            ),
            bottomNavigationBar: _buildBottomNavBar(context),
          );
        });
  }

  Padding _buildBottomNavBar(BuildContext context) {
    return Padding(
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

  FediLightStatusBarStyleArea _buildBackground() => FediLightStatusBarStyleArea(
        child: Container(
          color: FediColors.primaryColor,
          child: FediInstanceImageBackgroundWidget(
            child: Container(),
          ),
        ),
      );

  Widget buildBody(BuildContext context, HomeTab selectedTab) {
    switch (selectedTab) {
      case HomeTab.timelines:
        return buildTimelinesTab(context);
        break;
      case HomeTab.notifications:
        return _buildNotificationsTab(context);
        break;
      case HomeTab.messages:
        return _buildMessagesTab(context);

        break;
      case HomeTab.account:
        return _buildAccountTab(context);
        break;
    }

    throw "buildBody invalid selectedTab = $selectedTab";
  }

  StreamBuilder<bool> _buildMessagesTab(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream:
            myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValueStream,
        initialData:
            myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValue,
        builder: (context, snapshot) {
          var isNewChatsEnabled = snapshot.data;

          if (isNewChatsEnabled == true) {
            return _buildChatMessagesTab(context);
          } else {
            return _buildConversationMessagesTab(context);
          }
        });
  }

  DisposableProvider<ITimelinesHomeTabBloc> buildTimelinesTab(
      BuildContext context) {
    _logger.finest(() => "buildTimelinesTab");
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
        child: TimelinesHomeTabPage(),
      ),
    );
  }

  Widget _buildNotificationsTab(BuildContext context) {
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

  DisposableProvider<IChatMessagesHomeTabBloc> _buildChatMessagesTab(
      BuildContext context) {
    return DisposableProvider<IChatMessagesHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var chatMessagesHomeTabBloc = ChatMessagesHomeTabBloc();

        chatMessagesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.messages) {
            chatMessagesHomeTabBloc.scrollToTop();
          }
        }));

        return chatMessagesHomeTabBloc;
      },
      child: ChatMessagesHomeTabBlocProxyProvider(
        child: const ChatMessagesHomeTabPage(
          key: PageStorageKey<String>("ChatMessagesHomeTabPage"),
        ),
      ),
    );
  }

  DisposableProvider<IConversationMessagesHomeTabBloc>
      _buildConversationMessagesTab(BuildContext context) {
    return DisposableProvider<IConversationMessagesHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var conversationMessagesHomeTabBloc = ConversationMessagesHomeTabBloc(
            //              deviceHeight: MediaQuery.of(context).size.height,
            );

        conversationMessagesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.messages) {
            conversationMessagesHomeTabBloc.scrollToTop();
          }
        }));

        return conversationMessagesHomeTabBloc;
      },
      child: ConversationMessagesHomeTabBlocProxyProvider(
        child: const ConversationMessagesHomeTabPage(),
      ),
    );
  }

  DisposableProvider<IAccountHomeTabBloc> _buildAccountTab(
      BuildContext context) {
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
