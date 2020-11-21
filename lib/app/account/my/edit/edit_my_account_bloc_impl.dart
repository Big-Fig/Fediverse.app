import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc_impl.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc_impl.dart';
import 'package:fedi/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:fedi/form/group/pair/link_pair_form_group_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditMyAccountBloc extends FormBloc implements IEditMyAccountBloc {
  final IMyAccountBloc myAccountBloc;
  final IPleromaMyAccountService pleromaMyAccountService;

  @override
  final StringValueFormFieldBloc displayNameField;

  @override
  final StringValueFormFieldBloc noteField;

  @override
  final BoolValueFormFieldBloc lockedField;

  @override
  final IOneTypeFormGroupBloc<ILinkPairFormGroupBloc>
      customFieldsGroupBloc;

  @override
  final IImageFilePickerOrUrlFormFieldBloc avatarField;

  @override
  final IImageFilePickerOrUrlFormFieldBloc headerField;
  @override
  final IImageFilePickerOrUrlFormFieldBloc backgroundField;

  @override
  List<IFormItemBloc> get currentItems => [
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
  })  : displayNameField = StringValueFormFieldBloc(
          originValue: myAccountBloc.displayNameEmojiText.text,
          validators: [StringValueFormFieldNonEmptyValidationError.createValidator()],
          maxLength: null,
        ),
        noteField = StringValueFormFieldBloc(
          originValue: myAccountBloc.note,
          validators: [],
          maxLength: noteMaxLength,
        ),
        lockedField =
            BoolValueFormFieldBloc(originValue: myAccountBloc.account.locked),
        avatarField = ImageFilePickerOrUrlFormFieldBloc(
          originalUrl: myAccountBloc.account.avatar,
          maxFileSizeInBytes: avatarUploadSizeInBytes,
          isPossibleToDeleteOriginal: false,
        ),
        headerField = ImageFilePickerOrUrlFormFieldBloc(
          originalUrl: myAccountBloc.account.header,
          maxFileSizeInBytes: headerUploadSizeInBytes,
          isPossibleToDeleteOriginal: false,
        ),
        backgroundField = ImageFilePickerOrUrlFormFieldBloc(
          originalUrl: myAccountBloc.account.pleromaBackgroundImage,
          maxFileSizeInBytes: backgroundUploadSizeInBytes,
          isPossibleToDeleteOriginal: true,
        ),
        customFieldsGroupBloc =
            OneTypeFormGroupBloc<ILinkPairFormGroupBloc>(
          maximumFieldsCount: customFieldLimits?.maxFields ?? 20,
          newEmptyFieldCreator: () => LinkPairFormGroupBloc(
            value: null,
            name: null,
            nameMaxLength: customFieldLimits?.nameLength,
            valueMaxLength: customFieldLimits?.valueLength,
          ),
          originalItems: myAccountBloc.fields
              .map(
                (field) => LinkPairFormGroupBloc(
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

}
