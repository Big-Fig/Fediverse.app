import 'package:collection/collection.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/network_only/my_account_featured_hashtag_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccountFeaturedHashtagNetworkOnlyPaginationBloc
    extends NetworkOnlyUnifediPaginationBloc<IMyAccountFeaturedHashtag>
    implements IAccountFeaturedHashtagNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IMyAccountFeaturedHashtag> listBloc;

  AccountFeaturedHashtagNetworkOnlyPaginationBloc({
    required this.listBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => listBloc.unifediApi;

  static AccountFeaturedHashtagNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      AccountFeaturedHashtagNetworkOnlyPaginationBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listBloc: Provider.of<INetworkOnlyListBloc<IMyAccountFeaturedHashtag>>(
          context,
          listen: false,
        ),
      );

  @override
  Future<List<IMyAccountFeaturedHashtag>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<IMyAccountFeaturedHashtag>? olderPage,
    required PaginationPage<IMyAccountFeaturedHashtag>? newerPage,
  }) =>
      listBloc.loadItemsFromRemoteForPage(
        itemsCountPerPage: itemsCountPerPage,
        // todo: think about it
        // accountFeaturedHashtag don't have id and pagination?
        maxId: newerPage?.items.lastOrNull?.name,
        minId: olderPage?.items.firstOrNull?.name,
        pageIndex: pageIndex,
      );
}
