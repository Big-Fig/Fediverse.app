import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaPickerBloc extends IDisposable {
  static IMediaPickerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMediaPickerBloc>(context, listen: listen);

  Future<void> toggleFileMetadataSelection(
    IMediaDeviceFileMetadata mediaDeviceFileMetadata,
  );

  Stream<bool> isFileMetadataSelectedStream(
    IMediaDeviceFileMetadata mediaDeviceFileMetadata,
  );

  bool isFileMetadataSelected(IMediaDeviceFileMetadata mediaDeviceFileMetadata);
}
