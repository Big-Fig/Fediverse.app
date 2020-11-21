import 'package:fedi/form/field/file_picker_or_url/file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/media/media_image_source_model.dart';

abstract class IImageFilePickerOrUrlFormFieldBloc
    extends IFilePickerOrUrlFormFieldBloc {
  Stream<MediaImageSource> get imageSourceStream;

  MediaImageSource get imageSource;
}
