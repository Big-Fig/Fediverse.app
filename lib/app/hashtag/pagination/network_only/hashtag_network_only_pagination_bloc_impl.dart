import 'package:collection/collection.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagNetworkOnlyPaginationBloc
    extends NetworkOnlyPleromaPaginationBloc<IHashtag>
    implements IHashtagNetworkOnlyPaginationBloc {
  final INetworkOnlyListBloc<IHashtag> listBloc;

  HashtagNetworkOnlyPaginationBloc({
    required this.listBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => listBloc.pleromaApi;

  static HashtagNetworkOnlyPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      HashtagNetworkOnlyPaginationBloc(
        maximumCachedPagesCount: maximumCachedPagesCount,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        listBloc: Provider.of<INetworkOnlyListBloc<IHashtag>>(
          context,
          listen: false,
        ),
      );

  @override
  Future<List<IHashtag>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required PaginationPage<IHashtag>? olderPage,
    required PaginationPage<IHashtag>? newerPage,
  }) {
    return listBloc.loadItemsFromRemoteForPage(
      itemsCountPerPage: itemsCountPerPage,
      // todo: think about it
      // hashtag don't have id and pagination?
      maxId: newerPage?.items.lastOrNull?.name,
      minId: olderPage?.items.firstOrNull?.name,
      pageIndex: pageIndex,
    );
  }
}
