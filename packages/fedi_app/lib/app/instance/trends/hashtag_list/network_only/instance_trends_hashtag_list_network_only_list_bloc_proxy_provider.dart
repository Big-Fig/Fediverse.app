import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/pagination/list/hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/instance/trends/hashtag_list/network_only/instance_trends_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceTrendsHashtagListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const InstanceTrendsHashtagListNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IInstanceTrendsHashtagListNetworkOnlyListBloc,
          INetworkOnlyListBloc<IHashtag>>(
        update: (context, value, previous) => value,
        child: HashtagPaginationListBlocProxyProvider(
          child: child,
        ),
      );
}
