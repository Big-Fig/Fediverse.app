import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/ui/form/field/file/image/form_image_file_picker_or_url_field_bloc.dart';
import 'package:fedi/ui/form/field/file/image/form_image_file_picker_or_url_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc_impl.dart';
import 'package:fedi/ui/form/group/pair/form_link_pair_field_group_bloc.dart';
import 'package:fedi/ui/form/group/pair/form_link_pair_field_group_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditMyAccountBloc extends FormBloc implements IEditMyAccountBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaMyAccountService pleromaMyAccountService;

  @override
  final FormStringFieldBloc displayNameField;

  @override
  final FormStringFieldBloc noteField;

  @override
  final FormBoolFieldBloc lockedField;

  @override
  final IFormOneTypeGroupBloc<IFormLinkPairFieldGroupBloc>
      customFieldsGroupBloc;

  @override
  final IFormImageFilePickerOrUrlFieldBloc avatarField;

  @override
  final IFormImageFilePickerOrUrlFieldBloc headerField;
  @override
  final IFormImageFilePickerOrUrlFieldBloc backgroundField;

  @override
  List<IFormItemBloc> get items => [
        avatarField,
        headerField,
        backgroundField,
        displayNameField,
        noteField,
        lockedField,
        customFieldsGroupBloc
      ];

  EditMyAccountBloc({
    @required this.myAccountBloc,
    @required this.pleromaMyAccountService,
    @required int noteMaxLength,
    @required int avatarUploadSizeInBytes,
    @required int headerUploadSizeInBytes,
    @required int backgroundUploadSizeInBytes,
    @required PleromaInstancePleromaPartMetadataFieldLimits customFieldLimits,
  })  : displayNameField = FormStringFieldBloc(
          originValue: myAccountBloc.displayNameEmojiText.text,
          validators: [FormNonEmptyStringFieldValidationError.createValidator()],
          maxLength: null,
        ),
        noteField = FormStringFieldBloc(
          originValue: myAccountBloc.note,
          validators: [],
          maxLength: noteMaxLength,
        ),
        lockedField =
            FormBoolFieldBloc(originValue: myAccountBloc.account.locked),
        avatarField = FormImageFilePickerOrUrlFieldBloc(
          originalUrl: myAccountBloc.account.avatar,
          maxFileSizeInBytes: avatarUploadSizeInBytes,
          isPossibleToDeleteOriginal: false,
        ),
        headerField = FormImageFilePickerOrUrlFieldBloc(
          originalUrl: myAccountBloc.account.header,
          maxFileSizeInBytes: headerUploadSizeInBytes,
          isPossibleToDeleteOriginal: false,
        ),
        backgroundField = FormImageFilePickerOrUrlFieldBloc(
          originalUrl: myAccountBloc.account.pleromaBackgroundImage,
          maxFileSizeInBytes: backgroundUploadSizeInBytes,
          isPossibleToDeleteOriginal: true,
        ),
        customFieldsGroupBloc =
            FormOneTypeGroupBloc<IFormLinkPairFieldGroupBloc>(
          maximumFieldsCount: customFieldLimits?.maxFields ?? 20,
          newEmptyFieldCreator: () => FormLinkPairFieldGroupBloc(
            value: null,
            name: null,
            nameMaxLength: customFieldLimits?.nameLength,
            valueMaxLength: customFieldLimits?.valueLength,
          ),
          originalItems: myAccountBloc.fields
              .map(
                (field) => FormLinkPairFieldGroupBloc(
                  name: field.name,
                  value: field.valueAsRawUrl,
                  nameMaxLength: customFieldLimits?.nameLength,
                  valueMaxLength: customFieldLimits?.valueLength,
                ),
              )
              .toList(),
          minimumFieldsCount: null,
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
    var avatarPickedFile = avatarField.isSomethingChanged
        ? avatarField.currentMediaDeviceFile
        : null;

    var headerPickedFile = headerField.isSomethingChanged
        ? headerField.currentMediaDeviceFile
        : null;
    var backgroundPickedFile = backgroundField.isSomethingChanged
        ? backgroundField.currentMediaDeviceFile
        : null;
    if (avatarPickedFile != null ||
        headerPickedFile != null ||
        backgroundPickedFile != null) {
      var request = PleromaMyAccountFilesRequest(
        avatar: await avatarPickedFile?.loadFile(),
        header: await headerPickedFile?.loadFile(),
        pleromaBackgroundImage: await backgroundPickedFile?.loadFile(),
      );

      await _updateFiles(request);

      if (avatarPickedFile?.isNeedDeleteAfterUsage == true) {
        await avatarPickedFile.delete();
      }
      if (headerPickedFile?.isNeedDeleteAfterUsage == true) {
        await headerPickedFile.delete();
      }
      if (backgroundPickedFile?.isNeedDeleteAfterUsage == true) {
        await backgroundPickedFile.delete();
      }
    }

    Map<int, PleromaField> fieldsAttributes = {};

    customFieldsGroupBloc.items.asMap().entries.forEach((entry) {
      var index = entry.key;
      var field = entry.value;
      fieldsAttributes[index] = PleromaField(
          name: field.keyField.currentValue,
          value: field.valueField.currentValue);
    });

    var backgroundImageOriginalDeleted = backgroundField.isOriginalDeleted;
    String pleromaBackgroundImage;
    if (backgroundImageOriginalDeleted) {
      // API logic
      // We should set pleromaBackgroundImage to empty string to delete it
      pleromaBackgroundImage = "";
    }
    var remoteMyAccount = await pleromaMyAccountService.updateCredentials(
        PleromaMyAccountEdit(
            displayName: displayNameField.currentValue,
            note: noteField.currentValue,
            fieldsAttributes: fieldsAttributes,
            locked: lockedField.currentValue,
            pleromaBackgroundImage: pleromaBackgroundImage));

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

  static EditMyAccountBloc createFromContext(BuildContext context) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance
        .info;
    return EditMyAccountBloc(
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      pleromaMyAccountService:
          IPleromaMyAccountService.of(context, listen: false),
      customFieldLimits: info?.pleroma?.metadata?.fieldsLimits,
      noteMaxLength: info?.descriptionLimit,
      avatarUploadSizeInBytes: info?.avatarUploadLimit,
      headerUploadSizeInBytes: info?.bannerUploadLimit,
      backgroundUploadSizeInBytes: info?.backgroundUploadLimit,
    );
  }

  @override
  void clear() {
    displayNameField.clear();
    noteField.clear();
    lockedField.clear();
    customFieldsGroupBloc.clear();
    avatarField.clear();
    headerField.clear();
  }
}
