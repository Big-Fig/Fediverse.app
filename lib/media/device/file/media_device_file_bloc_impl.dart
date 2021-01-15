import 'dart:typed_data';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/media/device/file/media_device_file_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';

// todo: provide thumb size from UI
const _thumbImageSize = 150;

abstract class MediaDeviceFileBloc extends AsyncInitLoadingBloc
    implements IMediaDeviceFileBloc {
  @override
  final IMediaDeviceFileMetadata mediaDeviceFileMetadata;

  @override
  Uint8List thumbImageData;

  MediaDeviceFileBloc({@required this.mediaDeviceFileMetadata});

  @override
  Future internalAsyncInit() async {
    thumbImageData = await loadThumbData(
      width: _thumbImageSize,
      height: _thumbImageSize,
    );
  }

  Future<Uint8List> loadThumbData({@required int width, @required int height});
}
