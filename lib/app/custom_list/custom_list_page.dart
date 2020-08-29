import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/status/list/custom_list_timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListPage extends StatelessWidget {
  final ICustomList customList;

  CustomListPage({
    @required this.customList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        centerTitle: false,
        title: "app.custom_list.title".tr(
          args: [
            customList.title,
          ],
        ),
      ),
      body: SafeArea(
        child: CollapsibleOwnerWidget(
          child: StatusCachedPaginationListTimelineWidget(
            needWatchLocalRepositoryForUpdates: false,
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
  return MaterialPageRoute(
      builder: (context) => DisposableProvider<IStatusCachedListBloc>(
            create: (BuildContext context) =>
                CustomListTimelineStatusCachedListBloc(
                    pleromaTimelineService: IPleromaTimelineService.of(
                      context,
                      listen: false,
                    ),
                    statusRepository: IStatusRepository.of(
                      context,
                      listen: false,
                    ),
                    timelineLocalPreferencesBloc:
                        ITimelineSettingsLocalPreferencesBloc.of(context,
                            listen: false),
                    currentInstanceBloc: ICurrentAuthInstanceBloc.of(
                      context,
                      listen: false,
                    ),
                    customList: customList),
            child: ProxyProvider<IStatusCachedListBloc,
                    IPleromaCachedListBloc<IStatus>>(
                update: (context, value, previous) => value,
                child: StatusCachedPaginationBloc.provideToContext(context,
                    child: StatusCachedPaginationListWithNewItemsBloc
                        .provideToContext(context,
                            mergeNewItemsImmediately: false,
                            child: CustomListPage(
                              customList: customList,
                            )))),
          ));
}
