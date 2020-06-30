import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/ui/form/field/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/file/form_file_picker_or_url_field_bloc.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class FormFilePickerOrUrlFieldBloc extends FormFieldBloc
    implements IFormFilePickerOrUrlFieldBloc {
  final String originalUrl;

  final BehaviorSubject<FilePickerFile> _currentFilePickerFileSubject =
      BehaviorSubject();

  @override
  FilePickerFile get currentFilePickerFile =>
      _currentFilePickerFileSubject.value;
  @override
  Stream<FilePickerFile> get currentFilePickerFileStream =>
      _currentFilePickerFileSubject.stream;

  FormFilePickerOrUrlFieldBloc({@required this.originalUrl}) {
    addDisposable(streamSubscription: currentFilePickerFileStream.listen((_) {
      isChangedSubject.add(true);
    }));
  }

  @override
  void onNewFilePicked(FilePickerFile filePickerFile) {
    if (currentFilePickerFile != null) {
      if (currentFilePickerFile.isNeedDeleteAfterUsage) {
        currentFilePickerFile.file.delete();
      }
    }
    _currentFilePickerFileSubject.add(filePickerFile);
  }

  @override
  List<FormItemValidationError> get errors => [];

  @override
  Stream<List<FormItemValidationError>> get errorsStream => Stream.empty();


}
