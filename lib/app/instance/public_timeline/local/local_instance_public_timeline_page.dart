import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_widget.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './local_instance_public_timeline_page_bloc.dart';
import 'package:fedi/app/instance/public_timeline/local/local_instance_public_timeline_page_bloc_impl.dart';

class LocalInstancePublicTimelinePage extends StatelessWidget {
  const LocalInstancePublicTimelinePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InstancePublicTimelinePageAppBarWidget(),
      body: const SafeArea(
        child: LocalInstancePublicTimelinePageBodyWidget(),
      ),
    );
  }
}

MaterialPageRoute createLocalInstancePublicTimelinePageRoute({
  required IPleromaApiInstance pleromaApiInstance,
}) =>
    MaterialPageRoute(
      builder: (context) =>
          LocalInstancePublicTimelinePageBloc.provideToContext(
        context,
        pleromaApiInstance: pleromaApiInstance,
        child: ProxyProvider<ICurrentAuthInstanceBloc, IPleromaApiInstance>(
          update: (context, value, previous) => value.currentInstance!.info!,
          child: const LocalInstancePublicTimelinePage(),
        ),
      ),
    );

void goToLocalInstancePublicTimelinePage({
  required BuildContext context,
  required IPleromaApiInstance pleromaApiInstance,
}) {
  Navigator.push(
    context,
    createLocalInstancePublicTimelinePageRoute(
      pleromaApiInstance: pleromaApiInstance,
    ),
  );
}

class LocalInstancePublicTimelinePageBodyWidget extends StatelessWidget {
  const LocalInstancePublicTimelinePageBodyWidget();

  @override
  Widget build(BuildContext context) {
    var localInstancePublicTimelinePageBloc =
        ILocalInstancePublicTimelinePageBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: localInstancePublicTimelinePageBloc,
      loadingFinishedBuilder: (context) => DisposableProxyProvider<
          ILocalInstancePublicTimelinePageBloc, IScrollControllerBloc>(
        update: (context, instancePublicTimelinePageBloc, _) =>
            ScrollControllerBloc(
          scrollController: instancePublicTimelinePageBloc.scrollController,
        ),
        child: ProxyProvider<ILocalInstancePublicTimelinePageBloc,
            IStatusCachedListBloc>(
          update: (context, instancePublicTimelinePageBloc, _) =>
              instancePublicTimelinePageBloc.statusCachedListBloc,
          child: StatusCachedListBlocProxyProvider(
            child: ProxyProvider<IStatusCachedListBloc,
                IPleromaCachedListBloc<IStatus>>(
              update: (context, value, previous) => value,
              child: ProxyProvider<ILocalInstancePublicTimelinePageBloc,
                  IStatusCachedPaginationBloc>(
                update: (context, instancePublicTimelinePageBloc, _) =>
                    instancePublicTimelinePageBloc.statusCachedPaginationBloc,
                child: StatusCachedPaginationBlocProxyProvider(
                  child: ProxyProvider<
                      ILocalInstancePublicTimelinePageBloc,
                      ICachedPaginationListWithNewItemsBloc<
                          CachedPaginationPage<IStatus>, IStatus>>(
                    update: (context, instancePublicTimelinePageBloc, _) =>
                        instancePublicTimelinePageBloc
                            .statusCachedPaginationListWithNewItemsBloc,
                    child: ProxyProvider<
                        ICachedPaginationListWithNewItemsBloc<
                            CachedPaginationPage<IStatus>, IStatus>,
                        ICachedPaginationListWithNewItemsBloc>(
                      update: (context, value, previous) => value,
                      child: CachedPaginationListWithNewItemsBlocProxyProvider<
                          CachedPaginationPage<IStatus>, IStatus>(
                        child: CollapsibleOwnerWidget(
                          child: Stack(
                            children: <Widget>[
                              StatusCachedPaginationListTimelineWidget(
                                needWatchLocalRepositoryForUpdates: false,
                                scrollController:
                                    localInstancePublicTimelinePageBloc
                                        .scrollController,
                              ),
                              const StatusListTapToLoadOverlayWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
