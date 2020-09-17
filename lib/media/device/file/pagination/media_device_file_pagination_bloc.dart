import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFilePaginationBloc
    implements
        ILocalOnlyPaginationBloc<PaginationPage<IMediaDeviceFile>,
            IMediaDeviceFile> {
  static IMediaDeviceFilePaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMediaDeviceFilePaginationBloc>(context, listen: listen);
}
