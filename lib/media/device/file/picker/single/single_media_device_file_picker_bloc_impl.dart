import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/picker/media_device_file_picker_bloc_impl.dart';
import 'package:fedi/media/device/file/picker/media_device_file_picker_model.dart';
import 'package:fedi/media/device/file/picker/single/single_media_device_file_picker_bloc.dart';
import 'package:flutter/widgets.dart';

class SingleMediaDeviceFilePicker extends MediaDeviceFilePicker
    implements ISingleMediaDeviceFilePickerBloc {
  final MediaDeviceFileCallback onFileSelectedCallback;

  SingleMediaDeviceFilePicker(
      {@required this.onFileSelectedCallback,
      @required List<MediaDeviceFileType> fileTypesToPick,
      @required bool captureEnabled,
      @required MediaDeviceFilePickerFilter startActiveTab})
      : super(
            fileTypesToPick: fileTypesToPick,
            captureEnabled: captureEnabled,
            startFilter: startActiveTab);

  @override
  void onFileSelected(BuildContext context, IMediaDeviceFile filePickerFile) {
    if (onFileSelectedCallback != null) {
      onFileSelectedCallback(context, filePickerFile);
    }
  }
}
