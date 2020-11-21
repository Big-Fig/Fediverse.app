
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/form/field/form_field_bloc.dart';

abstract class IFormFilePickerOrUrlFieldBloc extends IFormFieldBloc {
  int get maximumFileSizeInBytes;

  IMediaDeviceFile get currentMediaDeviceFile;

  bool get isPossibleToDeleteOriginal;

  bool get isOriginalDeleted;
  Stream<bool> get isOriginalDeletedStream;

  bool get isOriginalExist;
  Stream<bool> get isOriginalExistStream;

  Stream<IMediaDeviceFile> get currentFilePickerFileStream;

  Future pickNewFile(IMediaDeviceFile filePickerFile);

  void deleteOriginal();
}
