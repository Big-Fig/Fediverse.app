import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountCachedPaginationBloc extends CachedPleromaPaginationBloc<IAccount>
    implements IAccountCachedPaginationBloc {
  final IPleromaCachedListBloc<IAccount> listService;

  AccountCachedPaginationBloc({
    required this.listService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listService.pleromaApi;

  @override
  Future<List<IAccount>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IAccount>? olderPage,
    required CachedPaginationPage<IAccount>? newerPage,
  }) {

    return listService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.firstOrNull,
        olderThan: newerPage?.items.lastOrNull,
      );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IAccount>? olderPage,
    required CachedPaginationPage<IAccount>? newerPage,
  }) async {
    // cant refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return listService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  static AccountCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      AccountCachedPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listService: Provider.of<IPleromaCachedListBloc<IAccount>>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    int? maximumCachedPagesCount,
  }) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<IAccount>, IAccount>>(
      create: (context) => AccountCachedPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<CachedPaginationPage<IAccount>,
          IAccount>(child: child),
    );
  }
}
