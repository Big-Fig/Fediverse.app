import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/list/cached/filter_cached_list_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FilterCachedPaginationListBloc<
        TPage extends CachedPaginationPage<IFilter>>
    extends CachedPaginationListBloc<TPage, IFilter> {
  final IFilterCachedListBloc cachedListBloc;

  FilterCachedPaginationListBloc({
    required this.cachedListBloc,
    required ICachedPaginationBloc<TPage, IFilter> cachedPaginationBloc,
  }) : super(cachedPaginationBloc: cachedPaginationBloc);

  static Widget provideToContext<TPage extends CachedPaginationPage<IFilter>>(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<ICachedPaginationListBloc<TPage, IFilter>>(
        create: (context) =>
            FilterCachedPaginationListBloc.createFromContext<TPage>(context),
        child: ProxyProvider<ICachedPaginationListBloc<TPage, IFilter>,
            ICachedPaginationListBloc>(
          update: (context, value, previous) => value,
          child: CachedPaginationListBlocProxyProvider<TPage, IFilter>(
            child: child,
          ),
        ),
      );

  static FilterCachedPaginationListBloc<TPage>
      createFromContext<TPage extends CachedPaginationPage<IFilter>>(
    BuildContext context,
  ) =>
          FilterCachedPaginationListBloc<TPage>(
            cachedPaginationBloc:
                Provider.of<ICachedPaginationBloc<TPage, IFilter>>(
              context,
              listen: false,
            ),
            cachedListBloc: IFilterCachedListBloc.of(context, listen: false),
          );
}
