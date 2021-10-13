import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/form/field/form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('file_picker_or_url_form_field_bloc_impl.dart');

class FilePickerOrUrlFormFieldBloc extends FormFieldBloc
    implements IFilePickerOrUrlFormFieldBloc {
  final String? originalUrl;
  @override
  final int? maximumFileSizeInBytes;

  @override
  final bool isPossibleToDeleteOriginal;

  BehaviorSubject<bool> isOriginalDeletedSubject =
      BehaviorSubject.seeded(false);

  @override
  bool? get isOriginalDeleted => isOriginalDeletedSubject.valueOrNull;

  @override
  Stream<bool> get isOriginalDeletedStream => isOriginalDeletedSubject.stream;

  @override
  bool get isOriginalExist =>
      originalUrl?.isNotEmpty == true && !isOriginalDeleted!;

  @override
  Stream<bool> get isOriginalExistStream => isOriginalDeletedStream.map(
        (isOriginalDeleted) =>
            originalUrl?.isNotEmpty == true && !isOriginalDeleted,
      );

  final BehaviorSubject<IMediaDeviceFile?> _currentMediaDeviceFileSubject =
      BehaviorSubject.seeded(null);

  @override
  IMediaDeviceFile? get currentMediaDeviceFile =>
      _currentMediaDeviceFileSubject.valueOrNull;

  @override
  Stream<IMediaDeviceFile?> get currentFilePickerFileStream =>
      _currentMediaDeviceFileSubject.stream;

  FilePickerOrUrlFormFieldBloc({
    required this.originalUrl,
    required this.maximumFileSizeInBytes,
    required this.isPossibleToDeleteOriginal,
    bool isEnabled = true,
  }) : super(
          isEnabled: isEnabled,
        ) {
    currentFilePickerFileStream.listen(
      (_) {
        _recalculateIsSomethingChanged();
      },
    ).disposeWith(this);
    isOriginalDeletedStream.listen(
      (_) {
        _recalculateIsSomethingChanged();
      },
    ).disposeWith(this);

    isOriginalDeletedSubject.disposeWith(this);
  }

  void _recalculateIsSomethingChanged() {
    isChangedSubject.add(currentMediaDeviceFile != null || isOriginalDeleted!);
  }

  @override
  Future pickNewFile(IMediaDeviceFile mediaDeviceFile) async {
    var file = await mediaDeviceFile.loadFile();
    var length = await file.length();
    if (maximumFileSizeInBytes != null &&
        maximumFileSizeInBytes != 0 &&
        length > maximumFileSizeInBytes!) {
      throw UploadMediaExceedFileSizeLimitException(
        file: file,
        maximumFileSizeInBytes: maximumFileSizeInBytes,
        currentFileSizeInBytes: length,
      );
    }

    // restore original deletion if we have something to replace original
    isOriginalDeletedSubject.add(false);
    if (currentMediaDeviceFile?.isNeedDeleteAfterUsage == true) {
      await currentMediaDeviceFile!.delete();
    }
    _currentMediaDeviceFileSubject.add(mediaDeviceFile);
  }

  @override
  void deleteOriginal() {
    var pickedFileExist = currentMediaDeviceFile != null;
    _logger.finest(() => 'deleteOriginal() pickedFileExist $pickedFileExist ');
    if (pickedFileExist) {
      _currentMediaDeviceFileSubject.add(null);
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
    _currentMediaDeviceFileSubject.add(null);
  }
}
