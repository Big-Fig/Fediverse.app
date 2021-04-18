import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:fedi/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc_impl.dart';
import 'package:fedi/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:fedi/form/group/pair/link_pair_form_group_bloc_impl.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:flutter/widgets.dart';

class EditMyAccountBloc extends FormBloc implements IEditMyAccountBloc {
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IMyAccountBloc myAccountBloc;
  final IPleromaMyAccountService pleromaMyAccountService;

  @override
  final StringValueFormFieldBloc displayNameField;

  @override
  final StringValueFormFieldBloc noteField;

  @override
  final IOneTypeFormGroupBloc<ILinkPairFormGroupBloc> customFieldsGroupBloc;

  @override
  final IImageFilePickerOrUrlFormFieldBloc avatarField;

  @override
  final IImageFilePickerOrUrlFormFieldBloc headerField;
  @override
  final IImageFilePickerOrUrlFormFieldBloc backgroundField;

  @override
  final BoolValueFormFieldBloc lockedField;
  @override
  final BoolValueFormFieldBloc discoverableField;
  @override
  final BoolValueFormFieldBloc hideFollowersField;
  @override
  final BoolValueFormFieldBloc hideFavouritesField;
  @override
  final BoolValueFormFieldBloc hideFollowersCountField;
  @override
  final BoolValueFormFieldBloc hideFollowsField;
  @override
  final BoolValueFormFieldBloc hideFollowsCountField;
  @override
  final BoolValueFormFieldBloc noRichTextField;
  @override
  final BoolValueFormFieldBloc showRoleField;
  @override
  final BoolValueFormFieldBloc skipThreadContainmentField;
  @override
  final BoolValueFormFieldBloc allowFollowingMoveField;
  @override
  final BoolValueFormFieldBloc acceptsChatMessagesField;
  @override
  final BoolValueFormFieldBloc botField;

  @override
  List<IFormItemBloc> get currentItems => [
        avatarField,
        headerField,
        backgroundField,
        displayNameField,
        noteField,
        customFieldsGroupBloc,
        lockedField,
        discoverableField,
        hideFavouritesField,
        hideFollowersField,
        hideFollowersCountField,
        hideFollowsField,
        hideFollowsCountField,
        noRichTextField,
        showRoleField,
        allowFollowingMoveField,
        skipThreadContainmentField,
        acceptsChatMessagesField,
        botField,
      ];

  // ignore: long-method
  EditMyAccountBloc({
    required this.myAccountBloc,
    required this.currentAuthInstanceBloc,
    required this.pleromaMyAccountService,
    required int? noteMaxLength,
    required int? avatarUploadSizeInBytes,
    required int? headerUploadSizeInBytes,
    required int? backgroundUploadSizeInBytes,
    required PleromaInstancePleromaPartMetadataFieldLimits? customFieldLimits,
  })   : displayNameField = StringValueFormFieldBloc(
          originValue: myAccountBloc.displayNameEmojiText!.text,
          validators: [
            StringValueFormFieldNonEmptyValidationError.createValidator(),
          ],
          maxLength: null,
        ),
        noteField = StringValueFormFieldBloc(
          originValue: myAccountBloc.noteUnescaped,
          validators: [],
          maxLength: noteMaxLength,
        ),
        lockedField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.account.locked,
        ),
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
        customFieldsGroupBloc = OneTypeFormGroupBloc<ILinkPairFormGroupBloc>(
          // ignore: no-magic-number
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
        ),
        discoverableField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.discoverable ?? false,
        ),
        hideFavouritesField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.pleroma?.hideFavorites ?? true,
        ),
        hideFollowersCountField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.pleroma?.hideFollowersCount ?? false,
        ),
        hideFollowersField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.pleroma?.hideFollowers ?? false,
        ),
        hideFollowsCountField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.pleroma?.hideFollowsCount ?? false,
        ),
        hideFollowsField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.pleroma?.hideFollows ?? false,
        ),
        noRichTextField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.source?.pleroma?.noRichText ?? false,
        ),
        showRoleField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.source?.pleroma?.showRole ?? false,
        ),
        allowFollowingMoveField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.pleroma?.allowFollowingMove ?? true,
        ),
        skipThreadContainmentField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.pleroma?.skipThreadContainment ?? false,
        ),
        acceptsChatMessagesField = BoolValueFormFieldBloc(
          originValue:
              myAccountBloc.myAccount?.pleroma?.acceptsChatMessages ?? true,
        ),
        botField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.bot ?? false,
        ),
        super(isAllItemsInitialized: true) {
    addDisposable(disposable: displayNameField);
    addDisposable(disposable: noteField);
    addDisposable(disposable: lockedField);
    addDisposable(disposable: avatarField);
    addDisposable(disposable: headerField);
    addDisposable(disposable: lockedField);
    addDisposable(disposable: customFieldsGroupBloc);

    addDisposable(disposable: discoverableField);
    addDisposable(disposable: hideFollowersField);
    addDisposable(disposable: hideFollowersCountField);
    addDisposable(disposable: hideFollowsField);
    addDisposable(disposable: hideFollowsCountField);
    addDisposable(disposable: noRichTextField);
    addDisposable(disposable: showRoleField);
    addDisposable(disposable: allowFollowingMoveField);
    addDisposable(disposable: skipThreadContainmentField);
    addDisposable(disposable: acceptsChatMessagesField);
    addDisposable(disposable: botField);

    addDisposable(
      streamSubscription: hideFollowersField.currentValueStream.listen(
        (hideFollowers) {
          if (hideFollowers == true) {
            hideFollowersCountField.changeIsEnabled(true);
          } else {
            hideFollowersCountField.changeIsEnabled(false);
            hideFollowersCountField.changeCurrentValue(false);
          }
        },
      ),
    );

    addDisposable(
      streamSubscription: hideFollowsField.currentValueStream.listen(
        (hideFollows) {
          if (hideFollows == true) {
            hideFollowsCountField.changeIsEnabled(true);
          } else {
            hideFollowsCountField.changeIsEnabled(false);
            hideFollowsCountField.changeCurrentValue(false);
          }
        },
      ),
    );
  }

  @override
  Future submitChanges() async {
    await _updateFiles();

    await _updateData();
  }

  Future _updateData() async {
    var remoteMyAccount = await pleromaMyAccountService.updateCredentials(
      _calculatePleromaMyAccountEdit(),
    );

    await myAccountBloc.updateMyAccountByMyPleromaAccount(remoteMyAccount);
  }

  Future _updateFiles() async {
    var avatarPickedFile = avatarField.isSomethingChanged
        ? avatarField.currentMediaDeviceFile
        : null;

    var headerPickedFile = headerField.isSomethingChanged
        ? headerField.currentMediaDeviceFile
        : null;
    var backgroundPickedFile = backgroundField.isSomethingChanged
        ? backgroundField.currentMediaDeviceFile
        : null;
    var isAnyFileExist = avatarPickedFile != null ||
        headerPickedFile != null ||
        backgroundPickedFile != null;
    if (isAnyFileExist) {
      var request = PleromaMyAccountFilesRequest(
        avatar: await avatarPickedFile?.loadFile(),
        header: await headerPickedFile?.loadFile(),
        pleromaBackgroundImage: await backgroundPickedFile?.loadFile(),
      );

      await _sendPleromaMyAccountFilesRequest(request);

      if (avatarPickedFile?.isNeedDeleteAfterUsage == true) {
        await avatarPickedFile!.delete();
      }
      if (headerPickedFile?.isNeedDeleteAfterUsage == true) {
        await headerPickedFile!.delete();
      }
      if (backgroundPickedFile?.isNeedDeleteAfterUsage == true) {
        await backgroundPickedFile!.delete();
      }
    }
  }

  PleromaMyAccountEdit _calculatePleromaMyAccountEdit() {
    Map<int, PleromaField> fieldsAttributes = {};

    customFieldsGroupBloc.items.asMap().entries.forEach(
      (entry) {
        var index = entry.key;
        var field = entry.value;
        fieldsAttributes[index] = PleromaField(
          name: field.keyField.currentValue,
          value: field.valueField.currentValue,
          verifiedAt: null,
        );
      },
    );

    var backgroundImageOriginalDeleted = backgroundField.isOriginalDeleted!;
    String? pleromaBackgroundImage;
    if (backgroundImageOriginalDeleted) {
      // API logic
      // We should set pleromaBackgroundImage to empty string to delete it
      pleromaBackgroundImage = "";
    }

    var isPleromaInstance = currentAuthInstanceBloc.currentInstance!.isPleroma;

    return PleromaMyAccountEdit(
      displayName: displayNameField.currentValue,
      note: noteField.currentValue,
      fieldsAttributes: fieldsAttributes,
      locked: lockedField.currentValue,
      discoverable: discoverableField.currentValue,
      bot: botField.currentValue,
      acceptsChatMessages:
          isPleromaInstance ? acceptsChatMessagesField.currentValue : null,
      allowFollowingMove:
          isPleromaInstance ? allowFollowingMoveField.currentValue : null,
      pleromaBackgroundImage: pleromaBackgroundImage,
      hideFavorites:
          isPleromaInstance ? hideFavouritesField.currentValue : null,
      hideFollowers: isPleromaInstance ? hideFollowersField.currentValue : null,
      hideFollowersCount:
          isPleromaInstance ? hideFollowersCountField.currentValue : null,
      hideFollows: isPleromaInstance ? hideFollowsField.currentValue : null,
      hideFollowsCount:
          isPleromaInstance ? hideFollowsCountField.currentValue : null,
      noRichText: isPleromaInstance ? noRichTextField.currentValue : null,
      showRole: isPleromaInstance ? showRoleField.currentValue : null,
      skipThreadContainment:
          isPleromaInstance ? skipThreadContainmentField.currentValue : null,
    );
  }

  Future _sendPleromaMyAccountFilesRequest(
    PleromaMyAccountFilesRequest pleromaMyAccountFilesRequest,
  ) async {
    var remoteMyAccount =
        await pleromaMyAccountService.updateFiles(pleromaMyAccountFilesRequest);

    await myAccountBloc.updateMyAccountByMyPleromaAccount(remoteMyAccount);
  }

  static EditMyAccountBloc createFromContext(BuildContext context) {
    var info = ICurrentAuthInstanceBloc.of(context, listen: false)
        .currentInstance!
        .info;
    return EditMyAccountBloc(
      currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
        context,
        listen: false,
      ),
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
