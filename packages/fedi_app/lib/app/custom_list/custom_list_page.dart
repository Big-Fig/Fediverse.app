import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/custom_list/custom_list_bloc.dart';
import 'package:fedi_app/app/custom_list/custom_list_bloc_impl.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:fedi_app/app/custom_list/edit/edit_custom_list_page.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi_app/app/status/pagination/cached/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi_app/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/edit/edit_timeline_settings_dialog.dart';
import 'package:fedi_app/app/timeline/status/timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/timeline/timeline_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CustomListPage extends StatefulWidget {
  const CustomListPage({Key? key}) : super(key: key);

  @override
  CustomListPageState createState() => CustomListPageState();
}

class CustomListPageState extends State<CustomListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      DisposableProvider<IScrollControllerBloc>(
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

class _CustomListPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomListPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          FediPageTitleAppBar(
            centerTitle: false,
            title: '',
            actions: const [
              _CustomListPageAppBarEditActionWidget(),
              _CustomListPageAppBarSettingsActionWidget(),
            ],
          ),
          const Expanded(
            child: Center(
              child: _CustomListPageAppBarTitleWidget(),
            ),
          ),
        ],
      );

  @override
  Size get preferredSize =>
      // todo: refactor
      // ignore: no-magic-number
      FediPageTitleAppBar.calculatePreferredSize() + const Offset(0, 48.0);
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
  Widget build(BuildContext context) => FediPageAppBarTextActionWidget(
        text: S.of(context).app_account_my_customList_list_action_edit,
        onPressed: () {
          goToEditCustomListPage(
            context: context,
            customList: Provider.of<ICustomList>(context, listen: false),
            onSubmit: (customList) {
              var paginationListBloc =
                  IPaginationListBloc.of(context, listen: false);
              // ignore: cascade_invocations
              paginationListBloc.refreshWithController();

              var customListBloc = ICustomListBloc.of(context, listen: false);
              // ignore: cascade_invocations
              customListBloc.updateList(customList);
            },
            onDelete: () {
              var customListBloc = ICustomListBloc.of(context, listen: false);
              // ignore: cascade_invocations
              customListBloc.updateList(null);
              Navigator.of(context).pop();
            },
          );
        },
      );
}

class _CustomListPageAppBarSettingsActionWidget extends StatelessWidget {
  const _CustomListPageAppBarSettingsActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        icon: Icon(
          FediIcons.settings,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        onPressed: () {
          var timeline = ITimelineLocalPreferenceBlocOld.of(
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
            unifediApiInstance: ICurrentAccessBloc.of(
              context,
              listen: false,
            ).currentInstance!.instance!,
            instanceLocation: InstanceLocation.local,
          );
        },
      );
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

MaterialPageRoute<void> createCustomListPageRoute({
  required BuildContext context,
  required ICustomList customList,
  required Function(ICustomList? customList)? onChanged,
  required VoidCallback? onDeleted,
}) {
  var currentUnifediApiAccessBloc =
      ICurrentAccessBloc.of(context, listen: false);

  return MaterialPageRoute<void>(
    builder: (context) => Provider<ICustomList>.value(
      value: customList,
      child: DisposableProvider<ITimelineLocalPreferenceBlocOld>(
        create: (context) {
          var bloc = TimelineLocalPreferenceBloc.customList(
            ILocalPreferencesService.of(context, listen: false),
            userAtHost: currentUnifediApiAccessBloc.currentInstance!.userAtHost,
            customList: customList,
          );

          // ignore: cascade_invocations
          bloc.performAsyncInit();

          return bloc;
        },
        child: _CustomListPageWrapper(
          onChanged: onChanged,
          onDeleted: onDeleted,
        ),
      ),
    ),
  );
}

class _CustomListPageWrapper extends StatelessWidget {
  final FutureOr<void> Function(ICustomList? customList)? onChanged;
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
          ITimelineLocalPreferenceBlocOld.of(context, listen: false),
      loadingFinishedBuilder: (BuildContext context) =>
          DisposableProvider<IStatusCachedListBloc>(
        create: (BuildContext context) {
          var customListTimelineStatusCachedListBloc =
              TimelineStatusCachedListBloc.createFromContext(
            context,
            handlerType: WebSocketsChannelHandlerType.foregroundValue,
            timelineLocalPreferencesBloc: ITimelineLocalPreferenceBlocOld.of(
              context,
              listen: false,
            ),
          );

          return customListTimelineStatusCachedListBloc;
        },
        child: StatusCachedListBlocProxyProvider(
          child: ProxyProvider<IStatusCachedListBloc, ICachedListBloc<IStatus>>(
            update: (context, value, previous) => value,
            child: StatusCachedListBlocLoadingWidget(
              child: StatusCachedPaginationBloc.provideToContext(
                context,
                child:
                    StatusCachedPaginationListWithNewItemsBloc.provideToContext(
                  context,
                  mergeNewItemsImmediately: false,
                  child: Provider<ICustomList>.value(
                    value: customList,
                    child:
                        DisposableProxyProvider<ICustomList, ICustomListBloc>(
                      update: (context, customList, _) => createCustomListBloc(
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
      ),
    );
  }

  CustomListBloc createCustomListBloc(
    BuildContext context,
    ICustomList customList,
  ) {
    var customListBloc = CustomListBloc(
      customList: customList,
      unifediListService: Provider.of<IUnifediApiListService>(
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
        (dynamic data) {
          onDeleted!();
        },
      ).disposeWith(customListBloc);
    }

    return customListBloc;
  }
}
