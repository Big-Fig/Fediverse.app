import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/media/attachment/upload/metadata/edit/edit_upload_media_attachment_metadata_bloc.dart';
import 'package:fedi/app/media/attachment/upload/metadata/edit/edit_upload_media_attachment_metadata_bloc_impl.dart';
import 'package:fedi/app/media/attachment/upload/metadata/upload_media_attachment_metadata_model.dart';
import 'package:fedi/app/ui/dialog/fedi_dialog.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef SaveCallback = Function(UploadMediaAttachmentMetadata metadata);

Future<UploadMediaAttachmentMetadata?>
    showEditUploadMediaAttachmentMetadataDialog({
  required BuildContext context,
  required UploadMediaAttachmentMetadata? initialMetadata,
}) async {
  var deleted = false;
  UploadMediaAttachmentMetadata? actuallySavedMetadata;

  var dialog = EditUploadMediaAttachmentMetadataDialog.createFromContext(
    context: context,
    initialMetadata: initialMetadata,
    saveCallback: (UploadMediaAttachmentMetadata savedMetadata) {
      actuallySavedMetadata = savedMetadata;
    },
    deleteCallback: () {
      deleted = true;
    },
  );

  await dialog.show<void>(context);

  if (deleted) {
    return null;
  } else {
    if (actuallySavedMetadata != null) {
      if (actuallySavedMetadata!.isAnyDataExist) {
        return actuallySavedMetadata;
      } else {
        return null;
      }
    } else {
      return initialMetadata;
    }
  }
}

class EditUploadMediaAttachmentMetadataDialog extends FediDialog {
  // ignore: avoid-late-keyword
  late IEditUploadMediaAttachmentMetadataBloc
      editUploadMediaAttachmentMetadataBloc;

  EditUploadMediaAttachmentMetadataDialog.createFromContext({
    required BuildContext context,
    required UploadMediaAttachmentMetadata? initialMetadata,
    required SaveCallback saveCallback,
    required VoidCallback deleteCallback,
  }) : super(
          actionsBorderVisible: true,
          title: S.of(context).app_media_upload_metadata_dialog_title,
          actions: [
            createSaveAction(
              context: context,
              saveCallback: saveCallback,
            ),
            if (initialMetadata != null)
              createDeleteAction(
                context: context,
                deleteCallback: deleteCallback,
              ),
          ],
          actionsAxis: Axis.vertical,
          cancelable: true,
        ) {
    editUploadMediaAttachmentMetadataBloc =
        EditUploadMediaAttachmentMetadataBloc(
      initialMetadata: initialMetadata,
    );
    editUploadMediaAttachmentMetadataBloc.disposeWith(this);
  }

  static DialogAction createSaveAction({
    required BuildContext context,
    required SaveCallback saveCallback,
  }) =>
      DialogAction(
        label: S.of(context).app_media_upload_metadata_dialog_action_save,
        onAction: (context) async {
          var editUploadMediaAttachmentMetadataBloc =
              IEditUploadMediaAttachmentMetadataBloc.of(
            context,
            listen: false,
          );

          saveCallback(
            editUploadMediaAttachmentMetadataBloc
                .extractCurrentEnteredMetadata(),
          );
          Navigator.of(context).pop();
        },
        isActionEnabledFetcher: (context) =>
            IEditUploadMediaAttachmentMetadataBloc.of(context, listen: false)
                .isHaveChangesAndNoErrors,
        isActionEnabledStreamFetcher: (context) =>
            IEditUploadMediaAttachmentMetadataBloc.of(context, listen: false)
                .isHaveChangesAndNoErrorsStream,
      );

  static DialogAction createDeleteAction({
    required BuildContext context,
    required VoidCallback deleteCallback,
  }) =>
      DialogAction(
        customColor: IFediUiColorTheme.of(context, listen: false).error,
        onAction: (context) {
          deleteCallback();
          Navigator.of(context).pop();
        },
        label: S.of(context).app_media_upload_metadata_dialog_action_delete,
      );

  @override
  Widget buildDialogBody(BuildContext context) =>
      Provider<IEditUploadMediaAttachmentMetadataBloc>.value(
        value: editUploadMediaAttachmentMetadataBloc,
        child: Builder(
          builder: (context) => super.buildDialogBody(context),
        ),
      );

  @override
  Widget buildContentWidget(BuildContext context) => ProxyProvider<
          IEditUploadMediaAttachmentMetadataBloc, IStringValueFormFieldBloc>(
        update: (context, value, _) => value.descriptionField,
        child: StringValueFormFieldRowWidget(
          label: null,
          autocorrect: false,
          hint: S
              .of(context)
              .app_media_upload_metadata_dialog_field_description_hint,
          // ignore: no-empty-block
          onSubmitted: (_) {
            // nothing
          },
          textInputAction: TextInputAction.done,
        ),
      );
}
