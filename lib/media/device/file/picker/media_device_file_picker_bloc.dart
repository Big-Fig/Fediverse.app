import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/picker/media_device_file_picker_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaDeviceFilePickerBloc implements IDisposable {
  static IMediaDeviceFilePickerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMediaDeviceFilePickerBloc>(context, listen: listen);

  List<MediaDeviceFileType> get fileTypesToPick;

  MediaDeviceFilePickerFilter get selectedFilter;

  Stream<MediaDeviceFilePickerFilter> get selectedFilterStream;

  List<MediaDeviceFilePickerFilter> get availableFilters;

  Stream<List<MediaDeviceFilePickerFilter>> get availableFiltersStream;

  void onFilterSelected(BuildContext context, MediaDeviceFilePickerFilter filter);

  void onFileSelected(BuildContext context, IMediaDeviceFile filePickerFile);
}
