import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/media/device/file/pagination/media_device_file_pagination_bloc.dart';
import 'package:fedi_app/media/device/file/pagination/media_device_file_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MediaDeviceFilePaginationListBloc extends PaginationListBloc<
    PaginationPage<IMediaDeviceFileMetadata>,
    IMediaDeviceFileMetadata> implements IMediaDeviceFilePaginationListBloc {
  MediaDeviceFilePaginationListBloc({
    required IMediaDeviceFilePaginationBloc paginationBloc,
  }) : super(
          paginationBloc: paginationBloc,
        );

  static MediaDeviceFilePaginationListBloc createFromContext(
    BuildContext context,
  ) =>
      MediaDeviceFilePaginationListBloc(
        paginationBloc: Provider.of<IMediaDeviceFilePaginationBloc>(context),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IMediaDeviceFilePaginationListBloc>(
        create: MediaDeviceFilePaginationListBloc.createFromContext,
        child: ProxyProvider<
            IMediaDeviceFilePaginationListBloc,
            IPaginationListBloc<PaginationPage<IMediaDeviceFileMetadata>,
                IMediaDeviceFileMetadata>>(
          update: (context, value, previous) => value,
          child: ProxyProvider<IMediaDeviceFilePaginationListBloc,
              IPaginationListBloc>(
            update: (context, value, previous) => value,
            child: child,
          ),
        ),
      );
}
