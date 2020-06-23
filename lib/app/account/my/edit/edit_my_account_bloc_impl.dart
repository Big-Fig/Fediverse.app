import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_field_bloc.dart';
import 'package:fedi/ui/form/form_field_group_bloc.dart';
import 'package:fedi/ui/form/form_field_group_bloc_impl.dart';
import 'package:fedi/ui/form/form_image_file_picker_or_url_field_bloc.dart';
import 'package:fedi/ui/form/form_image_file_picker_or_url_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_link_pair_field_bloc.dart';
import 'package:fedi/ui/form/form_link_pair_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_string_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

// todo: default server config is 4, should be fetched from server
var _maximumPossibleCustomFieldsCount = 4;

class EditMyAccountBloc extends FormBloc implements IEditMyAccountBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaMyAccountService pleromaMyAccountService;
  final int maximumPossibleCustomFieldsCount;

  @override
  final FormStringFieldBloc displayNameField;

  @override
  final FormStringFieldBloc noteField;

  @override
  final FormBoolFieldBloc lockedField;

  @override
  final IFormFieldGroupBloc<IFormLinkPairFieldBloc> customFieldsGroupBloc;

  @override
  final IFormImageFilePickerOrUrlFieldBloc avatarField;

  @override
  final IFormImageFilePickerOrUrlFieldBloc headerField;

  @override
  List<IFormFieldBloc> get allFields => [
        avatarField,
        headerField,
        displayNameField,
        noteField,
        lockedField,
        customFieldsGroupBloc
      ];

  EditMyAccountBloc({
    @required this.myAccountBloc,
    @required this.pleromaMyAccountService,
    @required this.maximumPossibleCustomFieldsCount,
  })  : displayNameField = FormStringFieldBloc(
            originValue: myAccountBloc.displayNameEmojiText.text),
        noteField = FormStringFieldBloc(originValue: myAccountBloc.note),
        lockedField =
            FormBoolFieldBloc(originValue: myAccountBloc.account.locked),
        avatarField = FormImageFilePickerOrUrlFieldBloc(
            originalUrl: myAccountBloc.account.avatar),
        headerField = FormImageFilePickerOrUrlFieldBloc(
            originalUrl: myAccountBloc.account.header),
        customFieldsGroupBloc = FormFieldGroupBloc<IFormLinkPairFieldBloc>(
          maximumFieldsCount: _maximumPossibleCustomFieldsCount,
          newFieldCreator: () => FormLinkPairFieldBloc(value: null, name: null),
          originalFields: myAccountBloc.fields
              .map(
                (field) => FormLinkPairFieldBloc(
                  name: field.name,
                  value: field.valueAsRawUrl,
                ),
              )
              .toList(),
        ) {
    addDisposable(disposable: displayNameField);
    addDisposable(disposable: noteField);
    addDisposable(disposable: lockedField);
    addDisposable(disposable: avatarField);
    addDisposable(disposable: headerField);
    addDisposable(disposable: customFieldsGroupBloc);
  }

  @override
  Future submitChanges() async {
    var avatarPickedFile =
        avatarField.isChanged ? avatarField.currentFilePickerFile : null;

    var headerPickedFile =
        headerField.isChanged ? headerField.currentFilePickerFile : null;
    if (avatarPickedFile != null || headerPickedFile != null) {
      var request = PleromaMyAccountFilesRequest(
        avatar: avatarPickedFile?.file,
        header: headerPickedFile?.file,
      );

      await _updateFiles(request);

      if (avatarPickedFile?.isNeedDeleteAfterUsage == true) {
        await avatarPickedFile.file.delete();
      }
      if (headerPickedFile?.isNeedDeleteAfterUsage == true) {
        await headerPickedFile.file.delete();
      }
    }

    Map<int, PleromaField> fieldsAttributes = {};

    customFieldsGroupBloc.fields.asMap().entries.forEach((entry) {
      var index = entry.key;
      var field = entry.value;
      fieldsAttributes[index] = PleromaField(
          name: field.keyField.currentValue,
          value: field.valueField.currentValue);
    });
    var remoteMyAccount =
        await pleromaMyAccountService.updateCredentials(PleromaMyAccountEdit(
      displayName: displayNameField.currentValue,
      note: noteField.currentValue,
      fieldsAttributes: fieldsAttributes,
      locked: lockedField.currentValue,
    ));

    await myAccountBloc.updateMyAccountByRemote(remoteMyAccount);
  }

  Future<bool> _updateFiles(
      PleromaMyAccountFilesRequest pleromaMyAccountFilesRequest) async {
    var remoteMyAccount =
        await pleromaMyAccountService.updateFiles(pleromaMyAccountFilesRequest);

    if (remoteMyAccount != null) {
      await myAccountBloc.updateMyAccountByRemote(remoteMyAccount);
      return true;
    } else {
      return false;
    }
  }

  static EditMyAccountBloc createFromContext(BuildContext context) =>
      EditMyAccountBloc(
          myAccountBloc: IMyAccountBloc.of(context, listen: false),
          pleromaMyAccountService:
              IPleromaMyAccountService.of(context, listen: false),
          maximumPossibleCustomFieldsCount: _maximumPossibleCustomFieldsCount);
}
