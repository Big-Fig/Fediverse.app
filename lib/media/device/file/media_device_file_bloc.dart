import 'dart:typed_data';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFileBloc
    implements IDisposable, IAsyncInitLoadingBloc {
  static IMediaDeviceFileBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMediaDeviceFileBloc>(context, listen: listen);

  IMediaDeviceFileMetadata get mediaDeviceFileMetadata;

  MediaDeviceFileType get type;

  Uint8List? get thumbImageData;
}
