import 'package:fedi/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagPageBlocProxyProvider extends StatelessWidget {
  final Widget child;

  HashtagPageBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IHashtagPageBloc, IInstanceLocationBloc>(
        update: (context, bloc, previous) => bloc,
        child: child,
      );
}
