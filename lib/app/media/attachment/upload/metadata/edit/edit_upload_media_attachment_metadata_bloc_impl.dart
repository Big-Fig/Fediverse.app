import 'package:fedi/app/media/attachment/upload/metadata/edit/edit_upload_media_attachment_metadata_bloc.dart';
import 'package:fedi/app/media/attachment/upload/metadata/upload_media_attachment_metadata_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';

class EditUploadMediaAttachmentMetadataBloc extends FormBloc
    implements IEditUploadMediaAttachmentMetadataBloc {
  @override
  final UploadMediaAttachmentMetadata? initialMetadata;

  EditUploadMediaAttachmentMetadataBloc({
    required this.initialMetadata,
  })  : descriptionField = StringValueFormFieldBloc(
          originValue: initialMetadata?.description ?? '',
          validators: [],
          maxLength: null,
        ),
        super(isAllItemsInitialized: true);

  @override
  IStringValueFormFieldBloc descriptionField;

  @override
  List<IFormItemBloc> get currentItems => [descriptionField];

  @override
  bool get isInitialMetadataExist => initialMetadata != null;

  @override
  UploadMediaAttachmentMetadata extractCurrentEnteredMetadata() {
    var description = descriptionField.currentValue;

    return UploadMediaAttachmentMetadata(
      description: description.isNotEmpty ? description : null,
    );
  }
}
