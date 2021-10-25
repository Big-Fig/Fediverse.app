import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFilePaginationListBloc
    implements
        IPaginationListBloc<PaginationPage<IMediaDeviceFileMetadata>,
            IMediaDeviceFileMetadata> {
  static IMediaDeviceFilePaginationListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaDeviceFilePaginationListBloc>(context, listen: listen);
}
