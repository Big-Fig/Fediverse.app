import 'dart:io';

import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_model.dart';

abstract class IMultiFilePickerBloc implements IFilePickerBloc {
  Stream<List<FilePickerFile>> get selectedFilesStream;

  List<FilePickerFile> get selectedFiles;
}
