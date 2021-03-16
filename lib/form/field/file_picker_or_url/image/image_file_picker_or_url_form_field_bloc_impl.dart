import 'package:fedi/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc_impl.dart';
import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("image_file_picker_or_url_form_field_bloc_impl.dart");

class ImageFilePickerOrUrlFormFieldBloc extends FilePickerOrUrlFormFieldBloc
    implements IImageFilePickerOrUrlFormFieldBloc {
  BehaviorSubject<MediaImageSource?> imageSourceSubject = BehaviorSubject();

  ImageFilePickerOrUrlFormFieldBloc({
    required String? originalUrl,
    required int? maxFileSizeInBytes,
    required bool isPossibleToDeleteOriginal,
    bool isEnabled = true,
  }) : super(
          originalUrl: originalUrl,
          maximumFileSizeInBytes: maxFileSizeInBytes,
          isPossibleToDeleteOriginal: isPossibleToDeleteOriginal,
          isEnabled: isEnabled,
        ) {
    addDisposable(subject: imageSourceSubject);
    addDisposable(
      streamSubscription: Rx.combineLatest2(
        currentFilePickerFileStream,
        isOriginalDeletedStream,
        (dynamic currentFilePickerFile, dynamic isOriginalDeleted) => createMediaSource(
          filePickerFile: currentFilePickerFile,
          url: originalUrl,
          isOriginalDeleted: isOriginalDeleted,
        ),
      ).listen(
        (mediaSourceFuture) {
          mediaSourceFuture.then((mediaSource) {
            imageSourceSubject.add(mediaSource);
          });
        },
      ),
    );
  }

  @override
  Stream<MediaImageSource?> get imageSourceStream => imageSourceSubject.stream;

  @override
  MediaImageSource? get imageSource => imageSourceSubject.value;

  Future<MediaImageSource?> createMediaSource({
    required IMediaDeviceFile? filePickerFile,
    required String? url,
    required bool isOriginalDeleted,
  }) async {
    _logger.finest(() => "createMediaSource filePickerFile = $filePickerFile "
        "url = $url "
        "isOriginalDeleted = $isOriginalDeleted ");
    MediaImageSource? result;
    if (filePickerFile != null) {
      result = MediaImageSource(file: await filePickerFile.loadFile());
    } else if (url != null && !isOriginalDeleted) {
      result = MediaImageSource(url: url);
    }
    return result;
  }
}
