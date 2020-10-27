import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/my/edit/avatar/edit_my_account_header_dialog.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/header/edit_my_account_avatar_dialog.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/app/media/picker/single_media_picker_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/form/fedi_form_column_label.dart';
import 'package:fedi/app/ui/form/fedi_form_pair_edit_text_row.dart';
import 'package:fedi/app/ui/notification_overlay/error_fedi_notification_overlay.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/media_image_source_model.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:fedi/ui/form/group/pair/form_link_pair_field_group_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:overlay_support/overlay_support.dart';

const editAccountAvatarSize = 120.0;
const editAccountProgressSize = 30.0;
const editAccountAvatarTopPadding = 50.0;
const editAccountAvatarCircleBorderWidth = 4.0;
const editAccountHeaderHeight = 148.0;
const editAccountBackgroundHeight = 200.0;
const editAccountAvatarAndBorderSize =
    editAccountAvatarSize + editAccountAvatarCircleBorderWidth;

var _logger = Logger("edit_my_account_widget.dart");

class EditMyAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: true);
    return ListView(
      children: <Widget>[
        Container(
          height: editAccountAvatarTopPadding +
              editAccountAvatarSize +
              editAccountAvatarCircleBorderWidth * 2,
          child: Stack(
            children: [
              Container(
                height: editAccountHeaderHeight,
                child: buildHeaderField(context, editMyAccountBloc),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: editAccountAvatarTopPadding,
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
              if (currentAuthInstanceBloc.currentInstance.isPleromaInstance)
                buildPleromaBackgroundFieldImage(context, editMyAccountBloc),
              buildTextField(
                  formStringFieldBloc: editMyAccountBloc.displayNameField,
                  label:
                      S.of(context).app_account_my_edit_field_displayName_label,
                  nextFormStringFieldBloc: editMyAccountBloc.noteField),
              buildTextField(
                formStringFieldBloc: editMyAccountBloc.noteField,
                label: S.of(context).app_account_my_edit_field_note_label,
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
        iconSize: FediSizes.mediumIconSize,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          startChoosingFileToUploadHeader(context, editMyAccountBloc);
        },
      );

  Widget buildEditPleromaBackgroundActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleBlurredButton(
        FediIcons.camera,
        iconSize: FediSizes.mediumIconSize,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          startChoosingFileToUploadBackground(context, editMyAccountBloc);
        },
      );

  Widget buildDeletePleromaBackgroundActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleBlurredButton(
        FediIcons.remove,
        iconSize: FediSizes.mediumIconSize,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          editMyAccountBloc.backgroundField.deleteOriginal();
        },
      );

  void startChoosingFileToUploadHeader(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    goToSingleMediaPickerPage(context, typesToPick: [
      MediaDeviceFileType.image,
    ], onFileSelectedCallback: (IMediaDeviceFile mediaDeviceFile) async {
      showEditMyAccountHeaderDialog(context, mediaDeviceFile,
          (filePickerFile) async {
        try {
          await editMyAccountBloc.headerField.pickNewFile(filePickerFile);
        } catch (e, stackTrace) {
          _logger.warning(
              "startChoosingFileToUploadHeader error", e, stackTrace);
          showMediaAttachmentFailedNotificationOverlay(context, e);
        }
        Navigator.of(context).pop();
      });
    });
  }

  void startChoosingFileToUploadBackground(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    goToSingleMediaPickerPage(context, typesToPick: [
      MediaDeviceFileType.image,
    ], onFileSelectedCallback: (IMediaDeviceFile mediaDeviceFile) async {
      showEditMyAccountHeaderDialog(context, mediaDeviceFile,
          (filePickerFile) async {
        try {
          await editMyAccountBloc.backgroundField.pickNewFile(filePickerFile);
        } catch (e, stackTrace) {
          _logger.warning(
              "startChoosingFileToUploadBackground error", e, stackTrace);
          showMediaAttachmentFailedNotificationOverlay(context, e);
        }
        Navigator.of(context).pop();
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
    goToSingleMediaPickerPage(context, typesToPick: [
      MediaDeviceFileType.image,
    ], onFileSelectedCallback: (IMediaDeviceFile mediaDeviceFile) async {
      showEditMyAccountAvatarDialog(context, mediaDeviceFile,
          (filePickerFile) async {
        try {
          await editMyAccountBloc.avatarField.pickNewFile(filePickerFile);
        } catch (e, stackTrace) {
          _logger.warning(
              "startChoosingFileToUploadAvatar error", e, stackTrace);
          showMediaAttachmentFailedNotificationOverlay(context, e);
        }
        Navigator.of(context).pop();
      });
    });
  }

  Widget buildEditAvatarActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleBlurredButton(
        FediIcons.camera,
        iconSize: FediSizes.mediumIconSize,
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
        borderRadius: BorderRadius.circular(editAccountAvatarAndBorderSize / 2),
        border: Border.all(
          width: editAccountAvatarCircleBorderWidth,
          color: IFediUiColorTheme.of(context).white,
          style: BorderStyle.solid,
        ),
      ),
      child: buildAvatarMediaImageSourceStreamBuilder(editMyAccountBloc),
      // child: FediCircularProgressIndicator(),
    );
  }

  StreamBuilder<MediaImageSource> buildAvatarMediaImageSourceStreamBuilder(
      IEditMyAccountBloc editMyAccountBloc) {
    return StreamBuilder<MediaImageSource>(
      stream: editMyAccountBloc.avatarField.imageSourceStream,
      builder: (context, snapshot) {
        var source = snapshot.data;

        if (source == null) {
          return FediCircularProgressIndicator();
        }
        if (source.url != null) {
          var url = source.url;
          return CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => Container(
              width: editAccountProgressSize,
              height: editAccountProgressSize,
              child: FediCircularProgressIndicator(),
            ),
            imageBuilder: (context, imageProvider) {
              return buildAvatarImageContainer(imageProvider);
            },
            errorWidget: (context, url, error) => Icon(FediIcons.warning),
            height: editAccountAvatarSize,
            width: editAccountAvatarSize,
          );
        } else {
          return buildAvatarImageContainer(Image.file(source.file).image);
        }
      },
    );
  }

  Container buildAvatarImageContainer(ImageProvider imageProvider) {
    return Container(
      height: editAccountAvatarSize,
      width: editAccountAvatarSize,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(
              editAccountAvatarSize / 2 - editAccountAvatarCircleBorderWidth),
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
      child: buildHeaderImageSourceStreamBuilder(editMyAccountBloc),
      // child: FediCircularProgressIndicator(),
    );
  }

  StreamBuilder<MediaImageSource> buildHeaderImageSourceStreamBuilder(
      IEditMyAccountBloc editMyAccountBloc) {
    return StreamBuilder<MediaImageSource>(
        stream: editMyAccountBloc.headerField.imageSourceStream,
        builder: (context, snapshot) {
          var source = snapshot.data;

          if (source == null) {
            return FediCircularProgressIndicator();
          }
          if (source.url != null) {
            var url = source.url;
            return CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: Container(
                  width: editAccountProgressSize,
                  height: editAccountProgressSize,
                  child: FediCircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Icon(FediIcons.warning),
            );
          } else {
            return Image.file(
              source.file,
              fit: BoxFit.cover,
            );
          }
        });
  }

  Widget buildPleromaBackgroundFieldImage(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FediFormColumnLabel(
          S.of(context).app_account_my_edit_field_backgroundImage_label,
        ),
        FediSmallVerticalSpacer(),
        StreamBuilder<MediaImageSource>(
            stream: editMyAccountBloc.backgroundField.imageSourceStream,
            builder: (context, snapshot) {
              var source = snapshot.data;

              if (source != null) {
                return Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: FediBorderRadius.allBigBorderRadius,
                      child: Container(
                          width: double.infinity,
                          height: editAccountBackgroundHeight,
                          child: buildBackgroundImageFromImageSource(source)),
                    ),
                    Positioned(
                      bottom: FediSizes.bigPadding,
                      right: FediSizes.bigPadding,
                      child: buildEditPleromaBackgroundActionButton(
                          context, editMyAccountBloc),
                    ),
                    Positioned(
                      top: FediSizes.bigPadding,
                      right: FediSizes.bigPadding,
                      child: buildDeletePleromaBackgroundActionButton(
                          context, editMyAccountBloc),
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: FediPadding.allSmallPadding,
                  child: FediPrimaryFilledTextButton(
                    S
                        .of(context)
                        .app_account_my_edit_field_backgroundImage_action_add,
                    onPressed: () {
                      startChoosingFileToUploadBackground(
                          context, editMyAccountBloc);
                    },
                  ),
                );
              }
            }),
      ],
    );
  }

  Widget buildBackgroundImageFromImageSource(MediaImageSource imageSource) {
    if (imageSource?.url != null) {
      var url = imageSource.url;
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: Container(
            width: editAccountProgressSize,
            height: editAccountProgressSize,
            child: FediCircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Icon(FediIcons.warning),
      );
    } else if (imageSource?.file != null) {
      return Image.file(
        imageSource.file,
        fit: BoxFit.cover,
      );
    } else {
      throw "MediaImageSource imageSource is invalid $imageSource";
    }
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
    var label = S.of(context).app_account_my_edit_field_locked_label;
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
                          S
                              .of(context)
                              .app_account_my_edit_field_customField_action_addNew,
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
    var number = index + 1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FediFormPairEditTextRow(
            label: S
                .of(context)
                .app_account_my_edit_field_customField_label(number),
            nameHint:
                S.of(context).app_account_my_edit_field_customField_name_label,
            valueHint:
                S.of(context).app_account_my_edit_field_customField_value_label,
            nameStringFieldBloc: customField.keyField,
            valueStringFieldBloc: customField.valueField,
            ending: FediIconButton(
              icon: Icon(FediIcons.close),
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

  static final _numberFormat = NumberFormat("#.#");

  OverlaySupportEntry showMediaAttachmentFailedNotificationOverlay(
      BuildContext context, dynamic e) {
    String contentText;
    if (e is UploadMediaExceedFileSizeLimitException) {
      // todo: refactor
      contentText = S
          .of(context)
          .app_media_upload_failed_notification_exceedSize_content(
            _numberFormat.format(
              e.currentFileSizeInBytes / pow(1024, 2),
            ),
            _numberFormat.format(
              e.maximumFileSizeInBytes / pow(1024, 2),
            ),
          );
    } else {
      contentText = e.toString();
    }
    return showErrorFediNotificationOverlay(
      context: context,
      contentText: contentText,
      titleText: S
          .of(context)
          .app_media_upload_failed_notification_title,
    );
  }
}
