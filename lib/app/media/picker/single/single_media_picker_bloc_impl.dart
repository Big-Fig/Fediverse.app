import 'dart:async';

import 'package:fedi/app/media/picker/media_picker_bloc_impl.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';

class SingleMediaPickerBloc extends MediaPickerBloc
    implements ISingleMediaPickerBloc {
  final StreamController<IMediaDeviceFile> fileSelectionStreamController =
      StreamController.broadcast();

  @override
  Stream<IMediaDeviceFile> get fileSelectionStream =>
      fileSelectionStreamController.stream;

  SingleMediaPickerBloc() {
    addDisposable(streamController: fileSelectionStreamController);
  }

  @override
  void onFileSelected(IMediaDeviceFile mediaDeviceFile) {
    fileSelectionStreamController.add(mediaDeviceFile);
  }
}
