import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/media/picker/media_picker_bloc_impl.dart';
import 'package:fedi_app/app/media/picker/single/single_media_picker_bloc.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';

class SingleMediaPickerBloc extends MediaPickerBloc
    implements ISingleMediaPickerBloc {
  final StreamController<IMediaDeviceFile> fileSelectionStreamController =
      StreamController.broadcast();

  @override
  Stream<IMediaDeviceFile> get fileSelectionStream =>
      fileSelectionStreamController.stream;

  SingleMediaPickerBloc() {
    fileSelectionStreamController.disposeWith(this);
  }

  @override
  Future<void> toggleFileMetadataSelection(
    IMediaDeviceFileMetadata mediaDeviceFileMetadata,
  ) async {
    var mediaDeviceFile = await mediaDeviceFileMetadata.loadMediaDeviceFile();
    fileSelectionStreamController.add(mediaDeviceFile);
  }

  @override
  bool isFileMetadataSelected(
    IMediaDeviceFileMetadata mediaDeviceFileMetadata,
  ) =>
      false;

  @override
  Stream<bool> isFileMetadataSelectedStream(
    IMediaDeviceFileMetadata mediaDeviceFileMetadata,
  ) =>
      Stream.value(
        isFileMetadataSelected(mediaDeviceFileMetadata),
      );
}
