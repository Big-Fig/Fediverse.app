import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/home/home_bloc.dart';
import 'package:fedi/app/home/home_model.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page'
    '.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/messages/chat_messages_home_tab_page.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/messages/conversation_messages_home_tab_page.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_page.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_bloc_impl.dart';
import 'package:fedi/app/home/tab/timelines/timelines_home_tab_page.dart';
import 'package:fedi/app/instance/fedi_instance_image_background_widget.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("home_page.dart");

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    var homeBloc = IHomeBloc.of(context, listen: false);

    return StreamBuilder<HomeTab>(
        stream: homeBloc.selectedTabStream,
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
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom),
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
        stream: myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValueStream,
        initialData: myAccountSettingsBloc.isNewChatsEnabledFieldBloc.currentValue,
        builder: (context, snapshot) {
          var isNewChatsEnabled = snapshot.data;

          if (isNewChatsEnabled == true) {
            return _buildChatMessagesTab(context);
          } else {
            return _buildConversationMessagesTab(context);
          }
        });
  }

  DisposableProvider<ITimelinesHomeTabBloc> buildTimelinesTab(BuildContext context) {
    return DisposableProvider<ITimelinesHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);
        var timelinesHomeTabBloc = TimelinesHomeTabBloc();

        timelinesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.timelines) {
            timelinesHomeTabBloc.scrollToTop();
          }
        }));
        return timelinesHomeTabBloc;
      },
      child: ProxyProvider<ITimelinesHomeTabBloc, INestedScrollControllerBloc>(
        update: (context, value, previous) => value.nestedScrollControllerBloc,
        child: ProxyProvider<ITimelinesHomeTabBloc, IScrollControllerBloc>(
          update: (context, value, previous) =>
              value.nestedScrollControllerBloc,
          child:
              ProxyProvider<ITimelinesHomeTabBloc, IFediNestedScrollViewBloc>(
            update: (context, value, previous) =>
                value.fediNestedScrollViewBloc,
            child: const TimelinesHomeTabPage(),
          ),
        ),
      ),
    );
  }

  DisposableProvider<INotificationsHomeTabBloc> _buildNotificationsTab(BuildContext context) {
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
      child:
          ProxyProvider<INotificationsHomeTabBloc, INestedScrollControllerBloc>(
        update: (context, value, previous) => value.nestedScrollControllerBloc,
        child: ProxyProvider<INotificationsHomeTabBloc, IScrollControllerBloc>(
          update: (context, value, previous) =>
              value.nestedScrollControllerBloc,
          child: ProxyProvider<INotificationsHomeTabBloc,
              IFediNestedScrollViewBloc>(
            update: (context, value, previous) =>
                value.fediNestedScrollViewBloc,
            child: const NotificationsHomeTabPage(
                //                  key: PageStorageKey<String>("NotificationsHomeTabPage"),
                ),
          ),
        ),
      ),
    );
  }

  DisposableProvider<IChatMessagesHomeTabBloc> _buildChatMessagesTab(BuildContext context) {
    return DisposableProvider<IChatMessagesHomeTabBloc>(
      create: (context) {
        var homeBloc = IHomeBloc.of(context, listen: false);

        var chatMessagesHomeTabBloc = ChatMessagesHomeTabBloc(

            );

        chatMessagesHomeTabBloc.addDisposable(streamSubscription:
            homeBloc.reselectedTabStream.listen((reselectedTab) {
          if (reselectedTab == HomeTab.messages) {
            chatMessagesHomeTabBloc.scrollToTop();
          }
        }));

        return chatMessagesHomeTabBloc;
      },
      child:
          ProxyProvider<IChatMessagesHomeTabBloc, INestedScrollControllerBloc>(
        update: (context, value, previous) => value.nestedScrollControllerBloc,
        child: ProxyProvider<IChatMessagesHomeTabBloc, IScrollControllerBloc>(
          update: (context, value, previous) =>
              value.nestedScrollControllerBloc,
          child: ProxyProvider<IChatMessagesHomeTabBloc,
              IFediNestedScrollViewBloc>(
            update: (context, value, previous) =>
                value.fediNestedScrollViewBloc,
            child: const ChatMessagesHomeTabPage(
              key: PageStorageKey<String>("ChatMessagesHomeTabPage"),
            ),
          ),
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
      child: ProxyProvider<IConversationMessagesHomeTabBloc,
          INestedScrollControllerBloc>(
        update: (context, value, previous) => value.nestedScrollControllerBloc,
        child: ProxyProvider<IConversationMessagesHomeTabBloc,
            IScrollControllerBloc>(
          update: (context, value, previous) =>
              value.nestedScrollControllerBloc,
          child: ProxyProvider<IConversationMessagesHomeTabBloc,
              IFediNestedScrollViewBloc>(
            update: (context, value, previous) =>
                value.fediNestedScrollViewBloc,
            child: const ConversationMessagesHomeTabPage(
              key: PageStorageKey<String>("ConversationMessagesHomeTabPage"),
            ),
          ),
        ),
      ),
    );
  }

  DisposableProvider<IAccountHomeTabBloc> _buildAccountTab(BuildContext context) {
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
      child: ProxyProvider<IAccountHomeTabBloc, INestedScrollControllerBloc>(
        update: (context, value, previous) => value.nestedScrollControllerBloc,
        child: ProxyProvider<IAccountHomeTabBloc, IScrollControllerBloc>(
          update: (context, value, previous) =>
              value.nestedScrollControllerBloc,
          child: ProxyProvider<IAccountHomeTabBloc, IFediNestedScrollViewBloc>(
            update: (context, value, previous) =>
                value.fediNestedScrollViewBloc,
            child: const AccountHomeTabPage(
              key: PageStorageKey<String>("AccountHomeTabPage"),
            ),
          ),
        ),
      ),
    );
  }

  const HomePage();
}
