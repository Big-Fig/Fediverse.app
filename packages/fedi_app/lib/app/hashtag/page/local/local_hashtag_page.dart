import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_widget.dart';
import 'package:fedi_app/app/hashtag/page/local/local_hashtag_page_bloc.dart';
import 'package:fedi_app/app/hashtag/page/local/local_hashtag_page_bloc_impl.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi_app/app/status/pagination/cached/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalHashtagPage extends StatelessWidget {
  const LocalHashtagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: HashtagPageAppBarWidget(),
        body: SafeArea(
          child: LocalHashtagPageBodyWidget(),
        ),
      );
}

MaterialPageRoute<void> createLocalHashtagPageRoute({
  required IHashtag hashtag,
  required IMyAccountFeaturedHashtag? myAccountFeaturedHashtag,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => LocalHashtagPageBloc.provideToContext(
        context,
        hashtag: hashtag,
        myAccountFeaturedHashtag: myAccountFeaturedHashtag,
        child: ProxyProvider<ICurrentAccessBloc, IUnifediApiInstance>(
          update: (context, value, previous) =>
              value.currentInstance!.instance!,
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
  const LocalHashtagPageBodyWidget({Key? key}) : super(key: key);

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
            child:
                ProxyProvider<IStatusCachedListBloc, ICachedListBloc<IStatus>>(
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
