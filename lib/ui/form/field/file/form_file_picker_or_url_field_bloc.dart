import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/ui/form/field/form_field_bloc.dart';

abstract class IFormFilePickerOrUrlFieldBloc extends IFormFieldBloc {
  int get maximumFileSizeInBytes;

  FilePickerFile get currentFilePickerFile;

  bool get isPossibleToDeleteOriginal;

  bool get isOriginalDeleted;
  Stream<bool> get isOriginalDeletedStream;

  bool get isOriginalExist;
  Stream<bool> get isOriginalExistStream;

  Stream<FilePickerFile> get currentFilePickerFileStream;

  Future pickNewFile(FilePickerFile filePickerFile);

  void deleteOriginal();
}
