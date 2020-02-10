import 'dart:io';

import 'package:fedi/file/file_model.dart';
import 'package:fedi/file/picker/file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/multi/multi_file_picker_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class MultiFilePickerBloc extends FilePickerBloc
    implements IMultiFilePickerBloc {
  // ignore: close_sinks
  BehaviorSubject<List<FilePickerFile>> selectedFilesSubject;

  @override
  List<FilePickerFile> get selectedFiles => selectedFilesSubject.value;

  @override
  Stream<List<FilePickerFile>> get selectedFilesStream => selectedFilesSubject.stream;

  MultiFilePickerBloc(
      {@required List<FilePickerFileType> fileTypesToPick,
      @required bool captureEnabled,
      @required FilePickerTab startActiveTab,
      List<FilePickerFile> initialSelectedFiles = const []})
      : super(
            fileTypesToPick: fileTypesToPick,
            captureEnabled: captureEnabled,
            startActiveTab: startActiveTab) {
    selectedFilesSubject = BehaviorSubject.seeded(initialSelectedFiles);
    addDisposable(subject: selectedFilesSubject);
  }

  @override
  onFileSelected(FilePickerFile filePickerFile) {
   selectedFiles.add(filePickerFile);
   selectedFilesSubject.add(selectedFiles);
  }
}
