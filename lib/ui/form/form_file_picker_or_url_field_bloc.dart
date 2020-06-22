import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/ui/form/form_field_bloc.dart';

abstract class IFormFilePickerOrUrlFieldBloc extends IFormFieldBloc {

  void onNewFilePicked(FilePickerFile filePickerFile);

}
