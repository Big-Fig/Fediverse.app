import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:fedi/ui/form/form_file_picker_or_url_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_image_file_picker_or_url_field_bloc.dart';
import 'package:flutter/widgets.dart';

class FormImageFilePickerOrUrlFieldBloc extends FormFilePickerOrUrlFieldBloc
    implements IFormImageFilePickerOrUrlFieldBloc {
  FormImageFilePickerOrUrlFieldBloc({@required String originalUrl})
      : super(originalUrl: originalUrl);


  @override
  Stream<MediaImageSource> get imageSourceStream =>
      currentFilePickerFileStream.map((currentFilePickerFile) =>
          createMediaSource(currentFilePickerFile, originalUrl));

  @override
  MediaImageSource get imageSource =>
      createMediaSource(currentFilePickerFile, originalUrl);

  MediaImageSource createMediaSource(FilePickerFile filePickerFile,
      String url) {
    if (filePickerFile != null) {
      return MediaImageSource(file: filePickerFile.file);
    } else {
      return MediaImageSource(url: url);
    }
  }
}
