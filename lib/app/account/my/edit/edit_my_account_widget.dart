import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_model.dart';
import 'package:fedi/app/account/my/edit/header/edit_my_account_header_dialog.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/switch/fedi_switch.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_page.dart';
import 'package:flutter/material.dart';

const _avatarSize = 120.0;
const _avatarCircleBorderWidth = 4.0;
const _avatarAndBorderSize = _avatarSize + _avatarCircleBorderWidth;
const _avatarTopPadding = 50.0;
const _headerBackgroundHeight = 148.0;

class EditMyAccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var editMyAccountBloc = IEditMyAccountBloc.of(context, listen: true);
    return ListView(
      children: <Widget>[
        Container(
          height: _avatarTopPadding + _avatarSize + _avatarCircleBorderWidth * 2,
          child: Stack(
            children: [
              Container(
                height: _headerBackgroundHeight,
                child: buildHeaderField(context, editMyAccountBloc),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: _avatarTopPadding,
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
        SizedBox(
          height: 24,
        ),
        buildDisplayNameField(context, editMyAccountBloc),
        buildNoteField(context, editMyAccountBloc),
        buildLockedField(context, editMyAccountBloc),
        buildCustomFields(context, editMyAccountBloc),
        // Form
      ],
    );
  }

  Widget buildEditHeaderBackgroundActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleTransparentButton(
        FediIcons.camera,
        iconSize: 15.0,
        size: FediSizes.smallFilledButtonHeight,
        onPressed: () {
          startChoosingFileToUploadHeader(context, editMyAccountBloc);
        },
      );

  void startChoosingFileToUploadHeader(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    goToSingleFilePickerPage(context,
        fileSelectedCallback: (FilePickerFile filePickerFile) async {
      showEditMyAccountHeaderDialog(context, filePickerFile,
          (filePickerFile) async {
        Navigator.of(context).pop();
        await editMyAccountBloc.uploadHeaderImage(filePickerFile.file);
        if (filePickerFile.isNeedDeleteAfterUsage) {
          await filePickerFile.file.delete();
        }
      });
    }, startActiveTab: FilePickerTab.gallery);
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
    goToSingleFilePickerPage(context,
        fileSelectedCallback: (FilePickerFile filePickerFile) async {
      showEditMyAccountHeaderDialog(context, filePickerFile,
          (filePickerFile) async {
        Navigator.of(context).pop();
        await editMyAccountBloc.uploadAvatarImage(filePickerFile.file);
        if (filePickerFile.isNeedDeleteAfterUsage) {
          await filePickerFile.file.delete();
        }
      });
    }, startActiveTab: FilePickerTab.gallery);
  }

  Widget buildEditAvatarActionButton(
          BuildContext context, IEditMyAccountBloc editMyAccountBloc) =>
      FediIconInCircleTransparentButton(
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
        borderRadius: BorderRadius.circular(_avatarAndBorderSize  / 2),
        border: Border.all(
          width: _avatarCircleBorderWidth,
          color: FediColors.white,
          style: BorderStyle.solid,
        ),
      ),
      child: StreamBuilder<String>(
          stream: editMyAccountBloc.avatarImageUrlStream,
          initialData: editMyAccountBloc.avatarImageUrl,
          builder: (context, snapshot) {
            var url = snapshot.data;

            return CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: _avatarSize,
                  width: _avatarSize,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(_avatarSize / 2 - _avatarCircleBorderWidth),
                      child: Image(
                        image: imageProvider,
                      )),
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: _avatarSize,
              width: _avatarSize,
            );
          }),
    );
  }

  Widget buildHeaderField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return Stack(
      children: <Widget>[
        buildHeaderFieldImage(context, editMyAccountBloc),
        Positioned(
          bottom: 16.0,
          right: 16.0,
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
      child: StreamBuilder<String>(
          stream: editMyAccountBloc.headerImageUrlStream,
          initialData: editMyAccountBloc.headerImageUrl,
          builder: (context, snapshot) {
            var url = snapshot.data;
            return CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          }),
    );
  }

  Widget buildDisplayNameField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    var label = tr("app.account.my.edit.field.display_name.label");
    var textEditingController =
        editMyAccountBloc.displayNameField.textEditingController;
    return buildTextField(textEditingController, label);
  }

  Widget buildNoteField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    var label = tr("app.account.my.edit.field.note.label");
    var textEditingController =
        editMyAccountBloc.noteField.textEditingController;
    return buildTextField(textEditingController, label);
  }

  Padding buildTextField(
          TextEditingController textEditingController, String label) =>
      Padding(
        padding: EdgeInsets.all(10),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200, minHeight: 80),
          child: Padding(
            padding: EdgeInsets.all(10),
            // only( bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextField(
              controller: textEditingController,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(),
                ),
                labelText: label,
              ),
            ),
          ),
        ),
      );

  Widget buildLockedField(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    var label = tr("app.account.my.edit.field.locked.label");
    var field = editMyAccountBloc.lockedField;
    return buildBooleanField(label, field);
  }

  Padding buildBooleanField(String label, EditMyAccountBoolField field) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text(
            label,
          ),
          Spacer(),
          StreamBuilder<bool>(
              stream: field.currentValueStream,
              initialData: field.currentValue,
              builder: (context, snapshot) {
                var currentValue = snapshot.data;
                return FediSwitch(
                  value: currentValue,
                  onChanged: (value) {
                    field.onValueChanged(value);
                  },
                );
              }),
        ],
      ),
    );
  }

  Widget buildCustomFields(
      BuildContext context, IEditMyAccountBloc editMyAccountBloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(tr("app.account.my.edit.group.custom_field.label")),
        ),
        ...editMyAccountBloc.customFields.map((customField) =>
            buildField(context, editMyAccountBloc, customField))
      ],
    );
  }

  Padding buildField(BuildContext context, IEditMyAccountBloc editMyAccountBloc,
      EditMyAccountCustomField customField) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Flexible(
            child: buildCustomFieldTextField(
                customField.nameField.textEditingController,
                tr("app.account.my.edit.field.custom_field.label"
                    ".label")),
          ),
          Flexible(
            child: buildCustomFieldTextField(
                customField.valueField.textEditingController,
                ("app.account.my.edit.field.custom_field.value.label".tr())),
          ),
        ],
      ),
    );
  }

  Padding buildCustomFieldTextField(textEditingController, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textEditingController,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(),
          ),
          labelText: label,
        ),
      ),
    );
  }

  const EditMyAccountWidget();
}
