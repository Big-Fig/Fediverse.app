import 'package:fedi/app/list/local_only/local_only_list_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_local_only_list_bloc.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_bloc.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc_impl.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MediaDeviceFileLocalOnlyPaginationBloc extends LocalOnlyPaginationBloc<
    PaginationPage<IMediaDeviceFileMetadata>,
    IMediaDeviceFileMetadata> implements IMediaDeviceFilePaginationBloc {
  final IMediaDeviceFileLocalOnlyListBloc listBloc;

  MediaDeviceFileLocalOnlyPaginationBloc({
    required this.listBloc,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  PaginationPage<IMediaDeviceFileMetadata> createPage({
    required int pageIndex,
    required List<IMediaDeviceFileMetadata> loadedItems,
    required int? itemsCountPerPage,
  }) =>
      PaginationPage(
        pageIndex: pageIndex,
        requestedLimitPerPage: itemsCountPerPage,
        items: loadedItems,
      );

  @override
  Future<List<IMediaDeviceFileMetadata>> loadItemsFromLocalForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    PaginationPage<IMediaDeviceFileMetadata>? olderPage,
    PaginationPage<IMediaDeviceFileMetadata>? newerPage,
  }) =>
      listBloc.loadItemsFromLocalForPage(
        pageIndex: pageIndex,
        itemsCountPerPage: itemsCountPerPage,
        olderThan: olderPage?.items.first,
        newerThan: newerPage?.items.last,
      );

  static MediaDeviceFileLocalOnlyPaginationBloc createFromContext(
    BuildContext context,
  ) =>
      MediaDeviceFileLocalOnlyPaginationBloc(
        listBloc: Provider.of<ILocalOnlyListBloc<IMediaDeviceFileMetadata>>(
          context,
          listen: false,
        ) as IMediaDeviceFileLocalOnlyListBloc,
        maximumCachedPagesCount: null,
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IMediaDeviceFilePaginationBloc>(
      create: (context) =>
          MediaDeviceFileLocalOnlyPaginationBloc.createFromContext(
        context,
      ),
      child: ProxyProvider<
          IMediaDeviceFilePaginationBloc,
          ILocalOnlyPaginationBloc<PaginationPage<IMediaDeviceFileMetadata>,
              IMediaDeviceFileMetadata>>(
        update: (context, value, previous) => value,
        child: LocalOnlyPaginationBlocProxyProvider<
            PaginationPage<IMediaDeviceFileMetadata>, IMediaDeviceFileMetadata>(
          child: child,
        ),
      ),
    );
  }
}
