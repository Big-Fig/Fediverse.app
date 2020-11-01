import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/picker/media_device_file_picker_bloc.dart';
import 'package:fedi/media/device/file/picker/media_device_file_picker_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

abstract class MediaDeviceFilePicker extends DisposableOwner
    implements IMediaDeviceFilePickerBloc {
  @override
  final List<MediaDeviceFileType> fileTypesToPick;
  final bool captureEnabled;

  // ignore: close_sinks
  BehaviorSubject<MediaDeviceFilePickerFilter> selectedFilterSubject;

  @override
  MediaDeviceFilePickerFilter get selectedFilter => selectedFilterSubject.value;

  @override
  Stream<MediaDeviceFilePickerFilter> get selectedFilterStream =>
      selectedFilterSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<List<MediaDeviceFilePickerFilter>> availableFiltersSubject;

  @override
  List<MediaDeviceFilePickerFilter> get availableFilters =>
      availableFiltersSubject.value;

  @override
  Stream<List<MediaDeviceFilePickerFilter>> get availableFiltersStream =>
      availableFiltersSubject.stream;

  MediaDeviceFilePicker(
      {@required this.fileTypesToPick,
      @required this.captureEnabled,
      @required MediaDeviceFilePickerFilter startFilter}) {
    var tabs = calculateFilePickerFilters(
        fileTypesToPick: fileTypesToPick, captureEnabled: captureEnabled);

    if (!tabs.contains(startFilter)) {
      throw "Can't select startFilter $startFilter, because it don't "
          "exist in tabs = $tabs";
    }

    availableFiltersSubject = BehaviorSubject.seeded(tabs);
    addDisposable(subject: availableFiltersSubject);

    selectedFilterSubject = BehaviorSubject.seeded(startFilter);
    addDisposable(subject: selectedFilterSubject);
  }

  static List<MediaDeviceFilePickerFilter> calculateFilePickerFilters(
      {@required List<MediaDeviceFileType> fileTypesToPick,
      @required bool captureEnabled}) {
    var tabs = <MediaDeviceFilePickerFilter>{};

    fileTypesToPick.forEach((type) {
      switch (type) {
        case MediaDeviceFileType.image:
          tabs.add(MediaDeviceFilePickerFilter.gallery);
          if (captureEnabled) {
            tabs.add(MediaDeviceFilePickerFilter.captureImage);
          }
          break;
        case MediaDeviceFileType.video:
          tabs.add(MediaDeviceFilePickerFilter.gallery);
          if (captureEnabled) {
            tabs.add(MediaDeviceFilePickerFilter.captureVideo);
          }
          break;
        case MediaDeviceFileType.other:
        case MediaDeviceFileType.audio:
        default:
          throw "Not implemented yet";
          break;
      }
    });

    return tabs.toList();
  }

  @override
  void onFilterSelected(BuildContext context, MediaDeviceFilePickerFilter filter) {
    selectedFilterSubject.add(filter);
  }
}
