import 'package:fedi/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRemoteInstancePublicTimelinePageBloc
    implements IInstancePublicTimelinePageBloc {
  static IRemoteInstancePublicTimelinePageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRemoteInstancePublicTimelinePageBloc>(
        context,
        listen: listen,
      );

  IStatusNetworkOnlyListBloc get statusNetworkOnlyListBloc;

  IStatusNetworkOnlyPaginationBloc get statusNetworkOnlyPaginationBloc;

  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      get statusPaginationListBloc;

  IRemoteInstanceBloc get remoteInstanceBloc;
}
