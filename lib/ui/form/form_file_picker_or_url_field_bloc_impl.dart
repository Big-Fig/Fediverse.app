import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/ui/form/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_file_picker_or_url_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FormFilePickerOrUrlFieldBloc extends FormFieldBloc
    implements IFormFilePickerOrUrlFieldBloc {
  final String originalUrl;

  final BehaviorSubject<FilePickerFile> _currentFilePickerFileSubject =
      BehaviorSubject();

  FilePickerFile get currentFilePickerFile =>
      _currentFilePickerFileSubject.value;
  Stream<FilePickerFile> get currentFilePickerFileStream =>
      _currentFilePickerFileSubject.stream;

  FormFilePickerOrUrlFieldBloc({@required this.originalUrl});

  @override
  void onNewFilePicked(FilePickerFile filePickerFile) {
    if (currentFilePickerFile != null) {
      if (currentFilePickerFile.isNeedDeleteAfterUsage) {
        currentFilePickerFile.file.delete();
      }
    }
    _currentFilePickerFileSubject.add(filePickerFile);
  }
}
