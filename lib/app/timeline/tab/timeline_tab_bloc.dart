import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';

abstract class ITimelineTabBloc implements IAsyncInitLoadingBloc, IDisposable {
  IStatusCachedListBloc get statusCachedListBloc;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      get paginationListWithNewItemsBloc;

  Timeline get timeline;

  ITimelineLocalPreferenceBloc get timelineLocalPreferencesBloc;

  String get timelineId;

  void resubscribeWebSocketsUpdates(WebSocketsListenType webSocketsListenType);
}
