import 'package:fedi/media/media_image_source_model.dart';
import 'package:fedi/ui/form/form_file_picker_or_url_field_bloc.dart';

abstract class IFormImageFilePickerOrUrlFieldBloc extends IFormFilePickerOrUrlFieldBloc {
  Stream<MediaImageSource> get imageSourceStream;

  MediaImageSource get imageSource;

}
