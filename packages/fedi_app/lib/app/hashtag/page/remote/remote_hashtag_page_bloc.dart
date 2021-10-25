import 'package:fedi_app/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRemoteHashtagPageBloc implements IHashtagPageBloc {
  static IRemoteHashtagPageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRemoteHashtagPageBloc>(context, listen: listen);

  IStatusNetworkOnlyListBloc get statusNetworkOnlyListBloc;

  IStatusNetworkOnlyPaginationBloc get statusNetworkOnlyPaginationBloc;

  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      get statusPaginationListBloc;

  IRemoteInstanceBloc get remoteInstanceBloc;
}
