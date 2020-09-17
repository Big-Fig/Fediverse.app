import 'dart:typed_data';

import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFileBloc
    implements Disposable, IAsyncInitLoadingBloc {
  static IMediaDeviceFileBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMediaDeviceFileBloc>(context, listen: listen);

  Future<IMediaDeviceFile> retrieveFile();

  MediaDeviceFileType get type;

  Uint8List get thumbImageData;
}
