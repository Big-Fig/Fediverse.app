import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/app/timeline/timeline_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

abstract class ITimelineTabBloc implements IAsyncInitLoadingBloc, IDisposable {
  IStatusCachedListBloc get statusCachedListBloc;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      get paginationListWithNewItemsBloc;

  Timeline get timeline;

  ITimelineLocalPreferenceBlocOld get timelineLocalPreferencesBloc;

  String get timelineId;

  void resubscribeWebSocketsUpdates(WebSocketsChannelHandlerType handlerType);
}
