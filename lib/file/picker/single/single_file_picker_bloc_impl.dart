import 'dart:io';

import 'package:fedi/file/file_model.dart';
import 'package:fedi/file/picker/file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc.dart';
import 'package:flutter/widgets.dart';

class SingleFilePickerBloc extends FilePickerBloc
    implements ISingleFilePickerBloc {
  final Function(File file) fileSelectedCallback;
  SingleFilePickerBloc(
      {@required this.fileSelectedCallback,
      @required List<FileType> fileTypesToPick,
      @required bool captureEnabled,
      @required FilePickerTab startActiveTab})
      : super(
            fileTypesToPick: fileTypesToPick,
            captureEnabled: captureEnabled,
            startActiveTab: startActiveTab);
}
