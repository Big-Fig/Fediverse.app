import 'package:fedi/app/list/local_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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
    PaginationPage<IMediaDeviceFile>,
    IMediaDeviceFile> implements IMediaDeviceFilePaginationBloc {
  final IMediaDeviceFileLocalOnlyListBloc listBloc;

  MediaDeviceFileLocalOnlyPaginationBloc({
    @required this.listBloc,
    @required int itemsCountPerPage,
    @required int maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          itemsCountPerPage: itemsCountPerPage,
        );

  @override
  PaginationPage<IMediaDeviceFile> createPage(
          {@required int pageIndex,
          List<IMediaDeviceFile> loadedItems,
          @required int itemsCountPerPage}) =>
      PaginationPage(
        pageIndex: pageIndex,
        requestedLimitPerPage: itemsCountPerPage,
        items: loadedItems,
      );

  @override
  Future<List<IMediaDeviceFile>> loadItemsFromLocalForPage(
          {int pageIndex,
          int itemsCountPerPage,
          PaginationPage<IMediaDeviceFile> olderPage,
          PaginationPage<IMediaDeviceFile> newerPage}) =>
      listBloc.loadItemsFromLocalForPage(
        pageIndex: pageIndex,
        itemsCountPerPage: itemsCountPerPage,
        olderThan: olderPage?.items?.first,
        newerThan: newerPage?.items?.last,
      );

  static MediaDeviceFileLocalOnlyPaginationBloc createFromContext(
          BuildContext context) =>
      MediaDeviceFileLocalOnlyPaginationBloc(
        listBloc: Provider.of<ILocalOnlyListBloc<IMediaDeviceFile>>(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: null,
        itemsCountPerPage: 20,
      );

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<IMediaDeviceFilePaginationBloc>(
      create: (context) =>
          MediaDeviceFileLocalOnlyPaginationBloc.createFromContext(
        context,
      ),
      child: ProxyProvider<
              IMediaDeviceFilePaginationBloc,
              ILocalOnlyPaginationBloc<PaginationPage<IMediaDeviceFile>,
                  IMediaDeviceFile>>(
          update: (context, value, previous) => value,
          child: LocalOnlyPaginationBlocProxyProvider<
              PaginationPage<IMediaDeviceFile>,
              IMediaDeviceFile>(child: child)),
    );
  }
}
