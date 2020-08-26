import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/status/list/hashtag_timeline_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HashtagPage extends StatelessWidget {
  final IHashtag hashtag;

  HashtagPage({
    @required this.hashtag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        centerTitle: false,
        title: "#${hashtag.name}",
        actions: <Widget>[
          buildOpenInBrowserAction(context),
        ],
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

  FediIconButton buildOpenInBrowserAction(BuildContext context) {
    return FediIconButton(
      icon: Icon(FediIcons.browser),
      onPressed: () {
        UrlHelper.handleUrlClick(context, hashtag.url);
      },
    );
  }
}

void goToHashtagPage({
  @required BuildContext context,
  @required IHashtag hashtag,
}) {
  Navigator.push(
    context,
    createHashtagPageRoute(
      context: context,
      hashtag: hashtag,
    ),
  );
}

MaterialPageRoute createHashtagPageRoute({
  @required BuildContext context,
  @required IHashtag hashtag,
}) {
  return MaterialPageRoute(
      builder: (context) => DisposableProvider<IStatusCachedListBloc>(
            create: (BuildContext context) =>
                HashtagTimelineStatusCachedListBloc(
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
                    hashtag: hashtag),
            child: ProxyProvider<IStatusCachedListBloc,
                    IPleromaCachedListBloc<IStatus>>(
                update: (context, value, previous) => value,
                child: StatusCachedPaginationBloc.provideToContext(context,
                    child: StatusCachedPaginationListWithNewItemsBloc
                        .provideToContext(context,
                            mergeNewItemsImmediately: false,
                            child: HashtagPage(
                              hashtag: hashtag,
                            )))),
          ));
}
