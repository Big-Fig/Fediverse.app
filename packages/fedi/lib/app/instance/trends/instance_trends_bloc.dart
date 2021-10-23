import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceTrendsBloc
    implements IInstanceBloc, IInstanceLocationBloc {
  static IInstanceTrendsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceTrendsBloc>(context, listen: listen);

  IInstanceTrendsHashtagListNetworkOnlyListBloc
      get instanceTrendsHashtagListNetworkOnlyListBloc;

  IHashtagNetworkOnlyPaginationBloc
      get instanceTrendsHashtagListNetworkOnlyPaginationBloc;

  IHashtagPaginationListBloc get hashtagPaginationListBloc;
}

extension IInstanceTrendsBlocExtension on IInstanceTrendsBloc {
  String get instanceUriDomain => instanceUri.host;
}
