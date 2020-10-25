import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:fedi/ui/form/field/file/form_file_picker_or_url_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/file/image/form_image_file_picker_or_url_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("form_image_file_picker_or_url_field_bloc_impl.dart");

class FormImageFilePickerOrUrlFieldBloc extends FormFilePickerOrUrlFieldBloc
    implements IFormImageFilePickerOrUrlFieldBloc {
  FormImageFilePickerOrUrlFieldBloc({
    @required String originalUrl,
    @required int maxFileSizeInBytes,
    @required bool isPossibleToDeleteOriginal,
  }) : super(
          originalUrl: originalUrl,
          maximumFileSizeInBytes: maxFileSizeInBytes,
          isPossibleToDeleteOriginal: isPossibleToDeleteOriginal,
        );

  @override
  Stream<MediaImageSource> get imageSourceStream => Rx.combineLatest2(
        currentFilePickerFileStream,
        isOriginalDeletedStream,
        (currentFilePickerFile, isOriginalDeleted) => createMediaSource(
          currentFilePickerFile,
          originalUrl,
          isOriginalDeleted,
        ),
      ).asyncMap((future) async => await future).asBroadcastStream();

  @override
  Future<MediaImageSource> get imageSource =>
      createMediaSource(currentMediaDeviceFile, originalUrl, isOriginalDeleted);

  Future<MediaImageSource> createMediaSource(
    IMediaDeviceFile filePickerFile,
    String url,
    bool isOriginalDeleted,
  ) async {
    _logger.finest(() => "createMediaSource filePickerFile = $filePickerFile "
        "url = $url "
        "isOriginalDeleted = $isOriginalDeleted ");
    MediaImageSource result;
    if (filePickerFile != null) {
      result = MediaImageSource(file: await filePickerFile.loadFile());
    } else if (url != null && !isOriginalDeleted) {
      result = MediaImageSource(url: url);
    }
    return result;
  }
}
