import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/status/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/websockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListPage extends StatefulWidget {
  final ICustomList customList;

  CustomListPage({
    @required this.customList,
  });

  @override
  _CustomListPageState createState() => _CustomListPageState();
}

class _CustomListPageState extends State<CustomListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<IScrollControllerBloc>(
      create: (context) =>
          ScrollControllerBloc(scrollController: scrollController),
      child: Scaffold(
        appBar: FediSubPageTitleAppBar(
          centerTitle: false,
          title: S.of(context).app_customList_title(widget.customList.title),
          actions: [],
        ),
        body: SafeArea(
          child: CollapsibleOwnerWidget(
            child: Stack(
              children: <Widget>[
                StatusCachedPaginationListTimelineWidget(
                  needWatchLocalRepositoryForUpdates: false,
                  scrollController: scrollController,
                ),
                const StatusListTapToLoadOverlayWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void goToCustomListPage({
  @required BuildContext context,
  @required ICustomList customList,
}) {
  Navigator.push(
    context,
    createCustomListPageRoute(
      context: context,
      customList: customList,
    ),
  );
}

MaterialPageRoute createCustomListPageRoute({
  @required BuildContext context,
  @required ICustomList customList,
}) {
  var myAccountSettingsBloc = IMyAccountSettingsBloc.of(context, listen: false);
  var isRealtimeWebSocketsEnabled =
      myAccountSettingsBloc.isRealtimeWebSocketsEnabledFieldBloc.currentValue;

  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);

  return MaterialPageRoute(builder: (context) {
    return DisposableProvider<ITimelineLocalPreferencesBloc>(
      create: (context) {
        var bloc = TimelineLocalPreferencesBloc.customList(
          ILocalPreferencesService.of(context, listen: false),
          userAtHost: currentAuthInstanceBloc.currentInstance.userAtHost,
          customList: customList,
        );

        bloc.performAsyncInit();
        return bloc;
      },
      child: Builder(
        builder: (context) {
          return FediAsyncInitLoadingWidget(
            asyncInitLoadingBloc:
                ITimelineLocalPreferencesBloc.of(context, listen: false),
            loadingFinishedBuilder: (BuildContext context) {
              return DisposableProvider<IStatusCachedListBloc>(
                create: (BuildContext context) {
                  var customListTimelineStatusCachedListBloc =
                      TimelineStatusCachedListBloc(
                    pleromaTimelineService: IPleromaTimelineService.of(
                      context,
                      listen: false,
                    ),
                    statusRepository: IStatusRepository.of(
                      context,
                      listen: false,
                    ),
                    timelineLocalPreferencesBloc:
                        ITimelineLocalPreferencesBloc.of(context,
                            listen: false),
                    currentInstanceBloc: ICurrentAuthInstanceBloc.of(
                      context,
                      listen: false,
                    ),
                    pleromaAccountService: IPleromaAccountService.of(
                      context,
                      listen: false,
                    ),
                    listenWebSockets: isRealtimeWebSocketsEnabled,
                    webSocketsHandlerManagerBloc:
                        IWebSocketsHandlerManagerBloc.of(
                      context,
                      listen: false,
                    ),
                  );
                  return customListTimelineStatusCachedListBloc;
                },
                child: ProxyProvider<IStatusCachedListBloc,
                    IPleromaCachedListBloc<IStatus>>(
                  update: (context, value, previous) => value,
                  child: StatusCachedPaginationBloc.provideToContext(
                    context,
                    child: StatusCachedPaginationListWithNewItemsBloc
                        .provideToContext(
                      context,
                      mergeNewItemsImmediately: false,
                      child: CustomListPage(
                        customList: customList,
                      ),
                      mergeOwnStatusesImmediately: false,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  });
}
