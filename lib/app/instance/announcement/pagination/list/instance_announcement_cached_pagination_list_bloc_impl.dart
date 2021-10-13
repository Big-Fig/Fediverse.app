import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementCachedPaginationListBloc<
        TPage extends CachedPaginationPage<IInstanceAnnouncement>>
    extends CachedPaginationListBloc<TPage, IInstanceAnnouncement> {
  final IInstanceAnnouncementCachedListBloc cachedListBloc;

  InstanceAnnouncementCachedPaginationListBloc({
    required this.cachedListBloc,
    required ICachedPaginationBloc<TPage, IInstanceAnnouncement>
        cachedPaginationBloc,
  }) : super(cachedPaginationBloc: cachedPaginationBloc);

  static Widget provideToContext<
          TPage extends CachedPaginationPage<IInstanceAnnouncement>>(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<
          ICachedPaginationListBloc<TPage, IInstanceAnnouncement>>(
        create: (context) => InstanceAnnouncementCachedPaginationListBloc
            .createFromContext<TPage>(
          context,
        ),
        child: ProxyProvider<
            ICachedPaginationListBloc<TPage, IInstanceAnnouncement>,
            ICachedPaginationListBloc>(
          update: (context, value, previous) => value,
          child: CachedPaginationListBlocProxyProvider<TPage,
              IInstanceAnnouncement>(
            child: child,
          ),
        ),
      );

  static InstanceAnnouncementCachedPaginationListBloc<TPage> createFromContext<
          TPage extends CachedPaginationPage<IInstanceAnnouncement>>(
    BuildContext context,
  ) =>
      InstanceAnnouncementCachedPaginationListBloc<TPage>(
        cachedPaginationBloc:
            Provider.of<ICachedPaginationBloc<TPage, IInstanceAnnouncement>>(
          context,
          listen: false,
        ),
        cachedListBloc:
            IInstanceAnnouncementCachedListBloc.of(context, listen: false),
      );
}
