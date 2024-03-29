import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFilePaginationBloc
    implements
        ILocalOnlyPaginationBloc<PaginationPage<IMediaDeviceFileMetadata>,
            IMediaDeviceFileMetadata> {
  static IMediaDeviceFilePaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaDeviceFilePaginationBloc>(
        context,
        listen: listen,
      );
}
