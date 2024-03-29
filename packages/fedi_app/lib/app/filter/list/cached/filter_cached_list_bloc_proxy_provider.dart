import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/list/cached/filter_cached_list_bloc.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FilterCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const FilterCachedListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IFilterCachedListBloc, ICachedListBloc<IFilter>>(
        update: (context, value, previous) => value,
        child: child,
      );
}
