import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/ui/form/field/file/form_file_picker_or_url_field_bloc.dart';
import 'package:fedi/ui/form/field/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("form_file_picker_or_url_field_bloc_impl.dart");

class FormFilePickerOrUrlFieldBloc extends FormFieldBloc
    implements IFormFilePickerOrUrlFieldBloc {
  final String originalUrl;
  @override
  final int maximumFileSizeInBytes;

  @override
  final bool isPossibleToDeleteOriginal;

  BehaviorSubject<bool> isOriginalDeletedSubject =
      BehaviorSubject.seeded(false);

  @override
  bool get isOriginalDeleted => isOriginalDeletedSubject.value;

  @override
  Stream<bool> get isOriginalDeletedStream => isOriginalDeletedSubject.stream;

  @override
  bool get isOriginalExist =>
      originalUrl?.isNotEmpty == true && !isOriginalDeleted;

  @override
  Stream<bool> get isOriginalExistStream =>
      isOriginalDeletedStream.map((isOriginalDeleted) =>
          originalUrl?.isNotEmpty == true && !isOriginalDeleted);

  final BehaviorSubject<FilePickerFile> _currentFilePickerFileSubject =
      BehaviorSubject.seeded(null);

  @override
  FilePickerFile get currentFilePickerFile =>
      _currentFilePickerFileSubject.value;

  @override
  Stream<FilePickerFile> get currentFilePickerFileStream =>
      _currentFilePickerFileSubject.stream;

  FormFilePickerOrUrlFieldBloc({
    @required this.originalUrl,
    @required this.maximumFileSizeInBytes,
    @required this.isPossibleToDeleteOriginal,
  }) {
    addDisposable(
      streamSubscription: currentFilePickerFileStream.listen(
        (_) {
          _recalculateIsSomethingChanged();
        },
      ),
    );
    addDisposable(
      streamSubscription: isOriginalDeletedStream.listen(
        (_) {
          _recalculateIsSomethingChanged();
        },
      ),
    );

    addDisposable(subject: isOriginalDeletedSubject);
  }

  void _recalculateIsSomethingChanged() {
    isChangedSubject.add(currentFilePickerFile != null || isOriginalDeleted);
  }

  @override
  Future pickNewFile(FilePickerFile filePickerFile) async {
    var length = await filePickerFile.file.length();
    if (length > maximumFileSizeInBytes) {
      throw UploadMediaExceedFileSizeLimitException(
        file: filePickerFile.file,
        maximumFileSizeInBytes: maximumFileSizeInBytes,
        currentFileSizeInBytes: length,
      );
    }

    // restore original deletion if we have something to replace original
    isOriginalDeletedSubject.add(false);
    if (currentFilePickerFile?.isNeedDeleteAfterUsage == true) {
      await currentFilePickerFile.file.delete();
    }
    _currentFilePickerFileSubject.add(filePickerFile);
  }

  @override
  void deleteOriginal() {
    var pickedFileExist = currentFilePickerFile != null;
    _logger.finest(() => "deleteOriginal() pickedFileExist $pickedFileExist ");
    if (pickedFileExist) {
      _currentFilePickerFileSubject.add(null);
    } else {
      assert(isPossibleToDeleteOriginal);
      isOriginalDeletedSubject.add(true);
    }
  }

  @override
  List<FormItemValidationError> get errors => [];

  @override
  Stream<List<FormItemValidationError>> get errorsStream => Stream.empty();

  @override
  void clear() {
    _currentFilePickerFileSubject.add(null);
  }
}
