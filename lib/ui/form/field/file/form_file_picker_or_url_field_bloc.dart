import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/ui/form/field/form_field_bloc.dart';

abstract class IFormFilePickerOrUrlFieldBloc extends IFormFieldBloc {
  FilePickerFile get currentFilePickerFile;

  Stream<FilePickerFile> get currentFilePickerFileStream;

  void onNewFilePicked(FilePickerFile filePickerFile);
}
