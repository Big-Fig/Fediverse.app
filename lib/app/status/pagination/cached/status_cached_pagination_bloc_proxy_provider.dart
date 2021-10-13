import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusCachedPaginationBlocProxyProvider extends StatelessWidget {
  final Widget child;

  StatusCachedPaginationBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IStatusCachedPaginationBloc,
        ICachedPaginationBloc<CachedPaginationPage<IStatus>, IStatus>>(
      update: (context, value, previous) => value,
      child: CachedPaginationBlocProxyProvider<CachedPaginationPage<IStatus>,
          IStatus>(
        child: child,
      ),
    );
  }
}
