import 'package:collection/collection.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/network_only/my_account_featured_hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IMyAccountFeaturedHashtag>
    implements IAccountFeaturedHashtagNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IMyAccountFeaturedHashtag> listBloc;

  AccountFeaturedHashtagNetworkOnlyPaginationBloc({
    required this.listBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listBloc.pleromaApi;

  static AccountFeaturedHashtagNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      AccountFeaturedHashtagNetworkOnlyPaginationBloc(
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
  }) {
    return listBloc.loadItemsFromRemoteForPage(
      itemsCountPerPage: itemsCountPerPage,
      // todo: think about it
      // accountFeaturedHashtag don't have id and pagination?
      maxId: newerPage?.items.lastOrNull?.name,
      minId: olderPage?.items.firstOrNull?.name,
      pageIndex: pageIndex,
    );
  }
}
