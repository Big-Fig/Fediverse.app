import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi_app/app/hashtag/list/network_only/hashtag_network_only_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagNetworkOnlyListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const HashtagNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IHashtagNetworkOnlyListBloc, INetworkOnlyListBloc<IHashtag>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IHashtagNetworkOnlyListBloc, IHashtagListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
