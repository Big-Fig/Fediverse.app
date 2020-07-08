import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/edit/avatar/edit_my_account_header_dialog.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/header/edit_my_account_avatar_dialog.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/form/fedi_form_pair_edit_text_row.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:fedi/ui/form/group/pair/form_link_pair_field_group_bloc.dart';
import 'package:flutter/material.dart';


class EditMyAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: true);
    return ListView(
      children: <Widget>[
        Container(
          height: FediSizes.editAccountAvatarTopPadding +
              FediSizes.editAccountAvatarSize +
              FediSizes.editAccountAvatarCircleBorderWidth * 2,
          child: Stack(
            children: [
              Container(
                height: FediSizes.editAccountHeaderBackgroundHeight,
                child: buildHeaderField(context, editMyAccountBloc),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: FediSizes.editAccountAvatarTopPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildAvatarField(context, editMyAccountBloc),
                  ],
                ),
              ),
            ],
          ),
        ),
        const FediSmallVerticalSpacer(),
        Padding(
          padding: FediPadding.horizontalBigPadding,
          child: Column(
            children: [
              buildTextField(
                  formStringFieldBloc: editMyAccountBloc.displayNameField,
                  label: tr("app.account.my.edit.field"
                      ".display_name.label"),
                  nextFormStringFieldBloc: editMyAccountBloc.noteField),
              buildTextField(
                formStringFieldBloc: editMyAccountBloc.noteField,
                label: tr(
                  "app.account.my.edit.field.note.label",
                ),
                nextFormStringFieldBloc: null,
              ),
              buildLockedField(context, editMyAccountBloc),
              buildCustomFields(context, editMyAccountBloc)
            ],
          ),
        ),
        // Form
      ],
    );
  }

  Widget buildEditHeaderBackgroundActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleBlurredButton(
        FediIcons.camera,
        iconSize: 15.0,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          startChoosingFileToUploadHeader(context, editMyAccountBloc);
        },
      );

  void startChoosingFileToUploadHeader(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    goToSingleMediaPickerPage(context, fileTypesToPick: [
      FilePickerFileType.image,
    ], fileSelectedCallback: (FilePickerFile filePickerFile) async {
      showEditMyAccountHeaderDialog(context, filePickerFile,
          (filePickerFile) async {
        Navigator.of(context).pop();
        await editMyAccountBloc.headerField.onNewFilePicked(filePickerFile);
      });
    });
  }

  GestureDetector buildAvatarField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        startChoosingFileToUploadAvatar(context, editMyAccountBloc);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          buildAvatarFieldImage(context, editMyAccountBloc),
          buildEditAvatarActionButton(context, editMyAccountBloc),
        ],
      ),
    );
  }

  void startChoosingFileToUploadAvatar(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    goToSingleMediaPickerPage(context, fileTypesToPick: [
      FilePickerFileType.image,
    ], fileSelectedCallback: (FilePickerFile filePickerFile) async {
      showEditMyAccountAvatarDialog(context, filePickerFile,
          (filePickerFile) async {
        Navigator.of(context).pop();
        await editMyAccountBloc.avatarField.onNewFilePicked(filePickerFile);
      });
    });
  }

  Widget buildEditAvatarActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleBlurredButton(
        FediIcons.camera,
        iconSize: 15.0,
        borderWidth: 2.0,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          startChoosingFileToUploadAvatar(context, editMyAccountBloc);
        },
      );

  Widget buildAvatarFieldImage(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FediSizes.editAccountAvatarAndBorderSize / 2),
        border: Border.all(
          width: FediSizes.editAccountAvatarCircleBorderWidth,
          color: FediColors.white,
          style: BorderStyle.solid,
        ),
      ),
      child: StreamBuilder<MediaImageSource>(
          stream: editMyAccountBloc.avatarField.imageSourceStream,
          initialData: editMyAccountBloc.avatarField.imageSource,
          builder: (context, snapshot) {
            var source = snapshot.data;

            if (source.url != null) {
              var url = source.url;
              return CachedNetworkImage(
                imageUrl: url,
                placeholder: (context, url) => Container(
                  width: FediSizes.editAccountProgressSize,
                  height: FediSizes.editAccountProgressSize,
                  child: FediCircularProgressIndicator(),
                ),
                imageBuilder: (context, imageProvider) {
                  return buildAvatarImageContainer(imageProvider);
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: FediSizes.editAccountAvatarSize,
                width: FediSizes.editAccountAvatarSize,
              );
            } else {
              return buildAvatarImageContainer(Image.file(source.file).image);
            }
          }),
    );
  }

  Container buildAvatarImageContainer(ImageProvider imageProvider) {
    return Container(
      height: FediSizes.editAccountAvatarSize,
      width: FediSizes.editAccountAvatarSize,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(
              FediSizes.editAccountAvatarSize / 2 -
                  FediSizes.editAccountAvatarCircleBorderWidth),
          child: Image(
            image: imageProvider,
          )),
    );
  }

  Widget buildHeaderField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return Stack(
      children: <Widget>[
        buildHeaderFieldImage(context, editMyAccountBloc),
        Positioned(
          bottom: FediSizes.bigPadding,
          right: FediSizes.bigPadding,
          child:
              buildEditHeaderBackgroundActionButton(context, editMyAccountBloc),
        ),
      ],
    );
  }

  Widget buildHeaderFieldImage(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: StreamBuilder<MediaImageSource>(
          stream: editMyAccountBloc.headerField.imageSourceStream,
          initialData: editMyAccountBloc.headerField.imageSource,
          builder: (context, snapshot) {
            var source = snapshot.data;
            if (source.url != null) {
              var url = source.url;
              return CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Container(
                    width: FediSizes.editAccountProgressSize,
                    height: FediSizes.editAccountProgressSize,
                    child: FediCircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            } else {
              return Image.file(
                source.file,
                fit: BoxFit.cover,
              );
            }
          }),
    );
  }

  Widget buildTextField(
      {@required IFormStringFieldBloc formStringFieldBloc,
      @required String label,
      @required IFormStringFieldBloc nextFormStringFieldBloc}) {
    var isHaveNextField = nextFormStringFieldBloc != null;

    return FormStringFieldFormRowWidget(
      autocorrect: true,
      label: label,
      formStringFieldBloc: formStringFieldBloc,
      hint: label,
      onSubmitted: isHaveNextField
          ? (String value) {
              formStringFieldBloc.focusNode.unfocus();
              nextFormStringFieldBloc.focusNode.requestFocus();
            }
          : null,
      textInputAction:
          isHaveNextField ? TextInputAction.next : TextInputAction.done,
    );
  }

  Widget buildLockedField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    var label = tr("app.account.my.edit.field.locked.label");
    var field = editMyAccountBloc.lockedField;
    return FormBoolFieldFormRowWidget(label: label, field: field);
  }

  Widget buildCustomFields(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    var customFieldsGroupBloc = editMyAccountBloc.customFieldsGroupBloc;
    return StreamBuilder<List<IFormLinkPairFieldGroupBloc>>(
        stream: customFieldsGroupBloc.itemsStream,
        initialData: customFieldsGroupBloc.items,
        builder: (context, snapshot) {
          var fields = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...fields.asMap().entries.map(
                (entry) {
                  var index = entry.key;
                  var nextIndex = index + 1;

                  IFormLinkPairFieldGroupBloc nextCustomField;
                  if (nextIndex < fields.length) {
                    nextCustomField = fields[nextIndex];
                  }
                  return buildCustomField(
                      context: context,
                      fieldGroupBloc: customFieldsGroupBloc,
                      customField: entry.value,
                      index: index,
                      nextCustomField: nextCustomField);
                },
              ),
              StreamBuilder<bool>(
                  stream:
                      customFieldsGroupBloc.isMaximumFieldsCountReachedStream,
                  initialData:
                      customFieldsGroupBloc.isMaximumFieldsCountReached,
                  builder: (context, snapshot) {
                    var isMaximumCustomFieldsCountReached = snapshot.data;

                    if (isMaximumCustomFieldsCountReached != true) {
                      return Padding(
                        padding: FediPadding.allBigPadding,
                        child: FediPrimaryFilledTextButton(
                          tr("app.account.my.edit.field.custom_field.action"
                              ".add_new"),
                          onPressed: () {
                            customFieldsGroupBloc.addNewEmptyField();
                          },
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
            ],
          );
        });
  }

  Widget buildCustomField(
      {@required
          BuildContext context,
      @required
          IFormOneTypeGroupBloc<IFormLinkPairFieldGroupBloc> fieldGroupBloc,
      @required
          IFormLinkPairFieldGroupBloc customField,
      @required
          IFormLinkPairFieldGroupBloc nextCustomField,
      @required
          int index}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FediFormPairEditTextRow(
            label: tr("app.account.my.edit.field.custom_field.label",
                args: [(index + 1).toString()]),
            nameHint: tr("app.account.my.edit.field.custom_field.name"
                ".label"),
            valueHint: tr("app.account.my.edit.field.custom_field.value"
                ".label"),
            nameStringFieldBloc: customField.keyField,
            valueStringFieldBloc: customField.valueField,
            ending: FediIconButton(
              FediIcons.close,
              onPressed: () {
                fieldGroupBloc.removeField(customField);
              },
            ),
            nextFocusNode: nextCustomField?.keyField?.focusNode,
          ),
        ),
      ],
    );
  }

  const EditMyAccountWidget();
}
