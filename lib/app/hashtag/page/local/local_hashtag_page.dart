import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_widget.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page_bloc_impl.dart';
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

class LocalHashtagPage extends StatelessWidget {
  const LocalHashtagPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HashtagPageAppBarWidget(),
      body: const SafeArea(
        child: LocalHashtagPageBodyWidget(),
      ),
    );
  }
}

MaterialPageRoute createLocalHashtagPageRoute({
  required IHashtag hashtag,
  required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
}) =>
    MaterialPageRoute(
      builder: (context) => LocalHashtagPageBloc.provideToContext(
        context,
        hashtag: hashtag,
        myAccountFeaturedHashtag: myAccountFeaturedHashtag,
        child: ProxyProvider<ICurrentAuthInstanceBloc, IPleromaApiInstance>(
          update: (context, value, previous) => value.currentInstance!.info!,
          child: const LocalHashtagPage(),
        ),
      ),
    );

void goToLocalHashtagPage({
  required BuildContext context,
  required IHashtag hashtag,
  required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
}) {
  Navigator.push(
    context,
    createLocalHashtagPageRoute(
      hashtag: hashtag,
      myAccountFeaturedHashtag: myAccountFeaturedHashtag,
    ),
  );
}

class LocalHashtagPageBodyWidget extends StatelessWidget {
  const LocalHashtagPageBodyWidget();

  @override
  Widget build(BuildContext context) {
    var localHashtagPageBloc = ILocalHashtagPageBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: localHashtagPageBloc,
      loadingFinishedBuilder: (context) =>
          DisposableProxyProvider<ILocalHashtagPageBloc, IScrollControllerBloc>(
        update: (context, hashtagPageBloc, _) => ScrollControllerBloc(
          scrollController: hashtagPageBloc.scrollController,
        ),
        child: ProxyProvider<ILocalHashtagPageBloc, IStatusCachedListBloc>(
          update: (context, hashtagPageBloc, _) =>
              hashtagPageBloc.statusCachedListBloc,
          child: StatusCachedListBlocProxyProvider(
            child: ProxyProvider<IStatusCachedListBloc,
                IPleromaCachedListBloc<IStatus>>(
              update: (context, value, previous) => value,
              child: ProxyProvider<ILocalHashtagPageBloc,
                  IStatusCachedPaginationBloc>(
                update: (context, hashtagPageBloc, _) =>
                    hashtagPageBloc.statusCachedPaginationBloc,
                child: StatusCachedPaginationBlocProxyProvider(
                  child: ProxyProvider<
                      ILocalHashtagPageBloc,
                      ICachedPaginationListWithNewItemsBloc<
                          CachedPaginationPage<IStatus>, IStatus>>(
                    update: (context, hashtagPageBloc, _) => hashtagPageBloc
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
                                    localHashtagPageBloc.scrollController,
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
