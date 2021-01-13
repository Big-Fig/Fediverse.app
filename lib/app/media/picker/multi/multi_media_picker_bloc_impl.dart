import 'dart:async';

import 'package:fedi/app/media/picker/media_picker_bloc_impl.dart';
import 'package:fedi/app/media/picker/multi/multi_media_picker_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:rxdart/rxdart.dart';

class MultiMediaPickerBloc extends MediaPickerBloc
    implements IMultiMediaPickerBloc {
  final BehaviorSubject<List<IMediaDeviceFile>> currentFilesSelectionSubject =
      BehaviorSubject.seeded([]);
  final StreamController<List<IMediaDeviceFile>>
      acceptedFilesSelectionStreamController = StreamController.broadcast();

  MultiMediaPickerBloc() {
    addDisposable(subject: currentFilesSelectionSubject);
    addDisposable(streamController: acceptedFilesSelectionStreamController);
  }

  @override
  Stream<List<IMediaDeviceFile>> get acceptedFilesSelectionStream =>
      acceptedFilesSelectionStreamController.stream;

  @override
  List<IMediaDeviceFile> get currentFilesSelection =>
      currentFilesSelectionSubject.value;

  @override
  Stream<List<IMediaDeviceFile>> get currentFilesSelectionStream =>
      currentFilesSelectionSubject.stream;

  @override
  void onFileSelected(IMediaDeviceFile mediaDeviceFile) {
    if (currentFilesSelection.contains(mediaDeviceFile)) {
      currentFilesSelectionSubject.add([
        ...currentFilesSelection,
        mediaDeviceFile,
      ]);
    } else {
      currentFilesSelectionSubject.add(
        currentFilesSelection
            .where(
              (file) => file != mediaDeviceFile,
            )
            .toList(),
      );
    }
  }

  @override
  void acceptSelectedFiles() {
    assert(isSomethingSelected);
  }

  @override
  bool get isSomethingSelected => currentFilesSelection?.isNotEmpty == true;

  @override
  Stream<bool> get isSomethingSelectedStream => currentFilesSelectionStream.map(
        (currentFilesSelection) => currentFilesSelection?.isNotEmpty == true,
      );
}
