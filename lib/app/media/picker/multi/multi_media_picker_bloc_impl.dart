import 'dart:async';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/media/picker/media_picker_bloc_impl.dart';
import 'package:fedi/app/media/picker/multi/multi_media_picker_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("multi_media_picker_bloc_impl.dart");

class MultiMediaPickerBloc extends MediaPickerBloc
    implements IMultiMediaPickerBloc {
  final BehaviorSubject<List<IMediaDeviceFileMetadata>>
      currentFilesMetadataSelectionSubject = BehaviorSubject.seeded([]);
  final StreamController<List<IMediaDeviceFile>>
      acceptedFilesSelectionStreamController = StreamController.broadcast();

  final int? selectionCountLimit;

  final StreamController<bool> selectionCountLimitReachedStreamController =
      StreamController();

  @override
  bool get isSelectionCountLimitReached {
    var limit = selectionCountLimit;
    if (limit == null) {
      return false;
    } else {
      return currentFilesMetadataSelectionCount >= limit;
    }
  }

  @override
  Stream<bool> get selectionCountLimitReachedStream =>
      selectionCountLimitReachedStreamController.stream;

  MultiMediaPickerBloc({
    required this.selectionCountLimit,
  }) {
    addDisposable(subject: currentFilesMetadataSelectionSubject);
    addDisposable(streamController: acceptedFilesSelectionStreamController);
    addDisposable(streamController: selectionCountLimitReachedStreamController);
  }

  @override
  Stream<List<IMediaDeviceFile>> get acceptedFilesSelectionStream =>
      acceptedFilesSelectionStreamController.stream;

  @override
  List<IMediaDeviceFileMetadata>? get currentFilesMetadataSelection =>
      currentFilesMetadataSelectionSubject.value;

  @override
  Stream<List<IMediaDeviceFileMetadata>>
      get currentFilesMetadataSelectionStream =>
          currentFilesMetadataSelectionSubject.stream;

  @override
  Future toggleFileMetadataSelection(
      IMediaDeviceFileMetadata mediaDeviceFileMetadata) async {
    var fileMetadataSelected = isFileMetadataSelected(mediaDeviceFileMetadata);
    _logger.fine(() => "toggleFileMetadataSelection $mediaDeviceFileMetadata "
        "selected $fileMetadataSelected");
    if (fileMetadataSelected) {
      currentFilesMetadataSelectionSubject.add(
        currentFilesMetadataSelection!
            .where(
              (currentFileMetadata) =>
                  currentFileMetadata.deviceId !=
                  mediaDeviceFileMetadata.deviceId,
            )
            .toList(),
      );
    } else {
      if (isSelectionCountLimitReached) {
        selectionCountLimitReachedStreamController.add(true);
      } else {
        currentFilesMetadataSelectionSubject.add(
          [
            ...currentFilesMetadataSelection!,
            mediaDeviceFileMetadata,
          ],
        );
      }
    }
  }

  @override
  Future acceptSelectedFilesMetadata() async {
    assert(isSomethingSelected);
    _logger.fine(
        () => "acceptSelectedFiles ${currentFilesMetadataSelection!.length}");
    var futures = currentFilesMetadataSelection!
        .map((fileMetadata) => fileMetadata.loadMediaDeviceFile());

    var mediaFiles = await Future.wait(futures);
    acceptedFilesSelectionStreamController.add(mediaFiles);
    currentFilesMetadataSelectionSubject.add([]);
  }

  @override
  bool get isSomethingSelected =>
      currentFilesMetadataSelection?.isNotEmpty == true;

  @override
  Stream<bool> get isSomethingSelectedStream =>
      currentFilesMetadataSelectionStream.map(
        (currentFilesSelection) => currentFilesSelection.isNotEmpty == true,
      );

  @override
  int get currentFilesMetadataSelectionCount =>
      currentFilesMetadataSelection!.length;

  @override
  Stream<int> get currentFilesMetadataSelectionCountStream =>
      currentFilesMetadataSelectionStream.map(
        (selectedFiles) => currentFilesMetadataSelection!.length,
      );

  @override
  bool isFileMetadataSelected(
      IMediaDeviceFileMetadata mediaDeviceFileMetadata) {
    var selected = _calculateIsFileSelected(
      selectedFilesMetadata: currentFilesMetadataSelection!,
      mediaDeviceFileMetadata: mediaDeviceFileMetadata,
    );
    _logger.fine(() => "isFileMetadataSelected $selected "
        "mediaDeviceFileMetadata = $mediaDeviceFileMetadata");
    return selected;
  }

  bool _calculateIsFileSelected({
    required List<IMediaDeviceFileMetadata> selectedFilesMetadata,
    IMediaDeviceFileMetadata? mediaDeviceFileMetadata,
  }) {
    var found = selectedFilesMetadata.firstWhereOrNull(
      (selectedFileMetadata) => selectedFileMetadata == mediaDeviceFileMetadata,
    );
    return found != null;
  }

  @override
  Stream<bool> isFileMetadataSelectedStream(
          IMediaDeviceFileMetadata mediaDeviceFileMetadata) =>
      currentFilesMetadataSelectionStream.map(
        (selectedFiles) => _calculateIsFileSelected(
          selectedFilesMetadata: selectedFiles,
          mediaDeviceFileMetadata: mediaDeviceFileMetadata,
        ),
      );

  @override
  Future clearSelection() async {
    currentFilesMetadataSelectionSubject.add([]);
  }
}
