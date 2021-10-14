import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/trends/instance_trends_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceTrendsBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const InstanceTrendsBlocProxyProvider({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IInstanceTrendsBloc, IInstanceBloc>(
        update: (context, bloc, previous) => bloc,
        child: ProxyProvider<IInstanceTrendsBloc,
            IInstanceTrendsHashtagListNetworkOnlyListBloc>(
          update: (context, bloc, previous) =>
              bloc.instanceTrendsHashtagListNetworkOnlyListBloc,
          child: ProxyProvider<IInstanceTrendsBloc, IHashtagListBloc>(
            update: (context, bloc, previous) =>
                bloc.instanceTrendsHashtagListNetworkOnlyListBloc,
            child: ProxyProvider<IInstanceTrendsBloc,
                IHashtagNetworkOnlyPaginationBloc>(
              update: (context, bloc, previous) =>
                  bloc.instanceTrendsHashtagListNetworkOnlyPaginationBloc,
              child: ProxyProvider<IInstanceTrendsBloc,
                  IHashtagPaginationListBloc>(
                update: (context, bloc, previous) =>
                    bloc.hashtagPaginationListBloc,
                child: ProxyProvider<IInstanceTrendsBloc,
                    IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
                  update: (context, bloc, previous) =>
                      bloc.hashtagPaginationListBloc,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
}
