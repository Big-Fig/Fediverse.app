import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_dialog.dart';
import 'package:fedi/app/timeline/status/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

class CustomListPage extends StatefulWidget {
  const CustomListPage();

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
        appBar: const _CustomListPageAppBar(),
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

class _CustomListPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomListPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FediPageTitleAppBar(
          centerTitle: false,
          title: '',
          actions: [
            const _CustomListPageAppBarEditActionWidget(),
            const _CustomListPageAppBarSettingsActionWidget(),
          ],
        ),
        Expanded(
          child: const Center(
            child: _CustomListPageAppBarTitleWidget(),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      // todo: refactor
      // ignore: no-magic-number
      FediPageTitleAppBar.calculatePreferredSize() + Offset(0, 48.0);
}

class _CustomListPageAppBarTitleWidget extends StatelessWidget {
  const _CustomListPageAppBarTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var customListBloc = ICustomListBloc.of(context);

    return StreamBuilder<ICustomList?>(
      stream: customListBloc.customListStream,
      initialData: customListBloc.customList,
      builder: (context, snapshot) {
        var customList = snapshot.data!;

        return Text(
          customList.title,
          style: fediUiTextTheme.giantTitleShortBoldDarkGrey,
        );
      },
    );
  }
}

class _CustomListPageAppBarEditActionWidget extends StatelessWidget {
  const _CustomListPageAppBarEditActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPageAppBarTextActionWidget(
      text: S.of(context).app_acccount_my_customList_list_action_edit,
      onPressed: () {
        goToEditCustomListPage(
          context: context,
          customList: Provider.of<ICustomList>(context, listen: false),
          onSubmit: (customList) {
            var paginationListBloc =
                IPaginationListBloc.of(context, listen: false);
            paginationListBloc.refreshWithController();

            var customListBloc = ICustomListBloc.of(context, listen: false);
            customListBloc.updateList(customList);
          },
          onDelete: () {
            var customListBloc = ICustomListBloc.of(context, listen: false);
            customListBloc.updateList(null);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

class _CustomListPageAppBarSettingsActionWidget extends StatelessWidget {
  const _CustomListPageAppBarSettingsActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(
        FediIcons.settings,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      onPressed: () {
        var timeline = ITimelineLocalPreferenceBloc.of(
          context,
          listen: false,
        ).value!;
        var customList = Provider.of<ICustomList>(
          context,
          listen: false,
        );
        showEditTimelineSettingsDialog(
          context: context,
          timeline: Timeline.byType(
            id: timeline.id,
            isPossibleToDelete: false,
            label: customList.title,
            type: TimelineType.customList,
            settings: timeline.settings,
          ),
          lockedSource: true,
          unifediApiInstance: ICurrentAuthInstanceBloc.of(
            context,
            listen: false,
          ).currentInstance!.info!,
          instanceLocation: InstanceLocation.local,
        );
      },
    );
  }
}

void goToCustomListPage({
  required BuildContext context,
  required ICustomList customList,
  required Function(ICustomList? customList) onChanged,
  required VoidCallback onDeleted,
}) {
  Navigator.push(
    context,
    createCustomListPageRoute(
      context: context,
      customList: customList,
      onChanged: onChanged,
      onDeleted: onDeleted,
    ),
  );
}

MaterialPageRoute createCustomListPageRoute({
  required BuildContext context,
  required ICustomList customList,
  required Function(ICustomList? customList)? onChanged,
  required VoidCallback? onDeleted,
}) {
  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);

  return MaterialPageRoute(
    builder: (context) {
      return Provider<ICustomList>.value(
        value: customList,
        child: DisposableProvider<ITimelineLocalPreferenceBloc>(
          create: (context) {
            var bloc = TimelineLocalPreferenceBloc.customList(
              ILocalPreferencesService.of(context, listen: false),
              userAtHost: currentAuthInstanceBloc.currentInstance!.userAtHost,
              customList: customList,
            );

            bloc.performAsyncInit();

            return bloc;
          },
          child: _CustomListPageWrapper(
            onChanged: onChanged,
            onDeleted: onDeleted,
          ),
        ),
      );
    },
  );
}

class _CustomListPageWrapper extends StatelessWidget {
  final Function(ICustomList? customList)? onChanged;
  final VoidCallback? onDeleted;

  const _CustomListPageWrapper({
    Key? key,
    this.onChanged,
    this.onDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customList = Provider.of<ICustomList>(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc:
          ITimelineLocalPreferenceBloc.of(context, listen: false),
      loadingFinishedBuilder: (BuildContext context) {
        return DisposableProvider<IStatusCachedListBloc>(
          create: (BuildContext context) {
            var customListTimelineStatusCachedListBloc =
                TimelineStatusCachedListBloc.createFromContext(
              context,
              handlerType: WebSocketsChannelHandlerType.foregroundValue,
              timelineLocalPreferencesBloc: ITimelineLocalPreferenceBloc.of(
                context,
                listen: false,
              ),
            );

            return customListTimelineStatusCachedListBloc;
          },
          child: StatusCachedListBlocProxyProvider(
            child: ProxyProvider<IStatusCachedListBloc,
                ICachedListBloc<IStatus>>(
              update: (context, value, previous) => value,
              child: StatusCachedListBlocLoadingWidget(
                child: StatusCachedPaginationBloc.provideToContext(
                  context,
                  child: StatusCachedPaginationListWithNewItemsBloc
                      .provideToContext(
                    context,
                    mergeNewItemsImmediately: false,
                    child: Provider<ICustomList>.value(
                      value: customList,
                      child:
                          DisposableProxyProvider<ICustomList, ICustomListBloc>(
                        update: (context, customList, _) =>
                            createCustomListBloc(
                          context,
                          customList,
                        ),
                        child: const CustomListPage(),
                      ),
                    ),
                    mergeOwnStatusesImmediately: false,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  CustomListBloc createCustomListBloc(
    BuildContext context,
    ICustomList customList,
  ) {
    var customListBloc = CustomListBloc(
      customList: customList,
      pleromaListService: Provider.of<IUnifediApiListService>(
        context,
        listen: false,
      ),
    );

    if (onChanged != null) {
      customListBloc.customListStream.listen(
        (customList) {
          onChanged!(customList);
        },
      ).disposeWith(customListBloc);
    }
    if (onDeleted != null) {
      customListBloc.deletedStream.listen(
        (_) {
          onDeleted!();
        },
      ).disposeWith(customListBloc);
    }

    return customListBloc;
  }
}
