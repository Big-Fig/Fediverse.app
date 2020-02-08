import 'dart:io';

import 'package:fedi/file/picker/file_picker_bloc.dart';

abstract class IMultiFilePickerBloc implements IFilePickerBloc {
  Stream<List<File>> get selectedFilesStream;

  List<File> get selectedFiles;
}
