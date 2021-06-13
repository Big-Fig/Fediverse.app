import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi/app/hashtag/list/network_only/hashtag_network_only_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagNetworkOnlyListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  HashtagNetworkOnlyListBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IHashtagNetworkOnlyListBloc,
        INetworkOnlyListBloc<IHashtag>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IHashtagNetworkOnlyListBloc, IHashtagListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
