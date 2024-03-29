import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const StatusCachedListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IStatusCachedListBloc, ICachedListBloc<IStatus?>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IStatusCachedListBloc, IStatusListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
