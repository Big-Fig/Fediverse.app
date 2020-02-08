import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_model.dart';

class FilePickerBloc implements IFilePickerBloc {
  @override
  FilePickerTab selectedTab;

  @override
  Stream<FilePickerTab> selectedTabStream;
}
