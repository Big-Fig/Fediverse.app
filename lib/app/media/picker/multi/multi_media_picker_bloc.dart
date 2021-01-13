import 'package:fedi/app/media/picker/media_picker_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMultiMediaPickerBloc implements IMediaPickerBloc {
  static IMultiMediaPickerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMultiMediaPickerBloc>(context, listen: listen);

  Stream<List<IMediaDeviceFile>> get acceptedFilesSelectionStream;

  Stream<List<IMediaDeviceFile>> get currentFilesSelectionStream;

  List<IMediaDeviceFile> get currentFilesSelection;

  bool get isSomethingSelected;

  Stream<bool> get isSomethingSelectedStream;

  void acceptSelectedFiles();
}
