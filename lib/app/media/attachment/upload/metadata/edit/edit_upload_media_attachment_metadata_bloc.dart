import 'package:fedi/app/media/attachment/upload/metadata/upload_media_attachment_metadata_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditUploadMediaAttachmentMetadataBloc implements IFormBloc {
  static IEditUploadMediaAttachmentMetadataBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditUploadMediaAttachmentMetadataBloc>(
        context,
        listen: listen,
      );

  IStringValueFormFieldBloc get descriptionField;

  UploadMediaAttachmentMetadata? get initialMetadata;

  bool get isInitialMetadataExist;

  UploadMediaAttachmentMetadata extractCurrentEnteredMetadata();
}
