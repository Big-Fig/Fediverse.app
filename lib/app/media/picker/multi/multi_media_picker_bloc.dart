import 'package:fedi/app/media/picker/media_picker_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMultiMediaPickerBloc implements IMediaPickerBloc {
  static IMultiMediaPickerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMultiMediaPickerBloc>(context, listen: listen);

  Stream<List<IMediaDeviceFile>> get acceptedFilesSelectionStream;

  Stream<List<IMediaDeviceFileMetadata>>
      get currentFilesMetadataSelectionStream;

  List<IMediaDeviceFileMetadata>? get currentFilesMetadataSelection;

  bool get isSomethingSelected;

  Stream<bool> get isSomethingSelectedStream;

  int get currentFilesMetadataSelectionCount;

  Stream<int> get currentFilesMetadataSelectionCountStream;

  bool get isSelectionCountLimitReached;

  Stream<bool> get selectionCountLimitReachedStream;

  Future<void> acceptSelectedFilesMetadata();

  Future<void> clearSelection();
}
