import 'package:easy_dispose/easy_dispose.dart';
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
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../../../unifedi/api/field/unifedi_api_field_extension.dart';

class EditMyAccountBloc extends FormBloc implements IEditMyAccountBloc {
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IMyAccountBloc myAccountBloc;
  final IUnifediApiMyAccountService unifediApiMyAccountService;

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
    required this.unifediApiMyAccountService,
    required int? noteMaxLength,
    required int? avatarUploadSizeInBytes,
    required int? headerUploadSizeInBytes,
    required int? backgroundUploadSizeInBytes,
    required UnifediApiInstanceFieldLimits? customFieldLimits,
  })  : displayNameField = StringValueFormFieldBloc(
          originValue: myAccountBloc.displayNameEmojiText?.text ?? '',
          validators: [
            StringValueFormFieldNonEmptyValidationError.createValidator(),
          ],
          maxLength: null,
        ),
        noteField = StringValueFormFieldBloc(
          originValue: myAccountBloc.noteUnescaped ?? '',
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
          originalUrl: myAccountBloc.account.backgroundImage,
          maxFileSizeInBytes: backgroundUploadSizeInBytes,
          isPossibleToDeleteOriginal: true,
        ),
        customFieldsGroupBloc = OneTypeFormGroupBloc<ILinkPairFormGroupBloc>(
          // ignore: no-magic-number
          maximumFieldsCount: customFieldLimits?.maxFields ?? 20,
          newEmptyFieldCreator: () => LinkPairFormGroupBloc(
            value: '',
            name: '',
            nameMaxLength: customFieldLimits?.nameLength,
            valueMaxLength: customFieldLimits?.valueLength,
          ),
          originalItems: myAccountBloc.fields
              .map(
                (field) => LinkPairFormGroupBloc(
                  name: field.name ?? '',
                  value: field.valueAsRawUrl ?? '',
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
          originValue: myAccountBloc.myAccount?.hideFavorites ?? true,
        ),
        hideFollowersCountField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.hideFollowersCount ?? false,
        ),
        hideFollowersField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.hideFollowers ?? false,
        ),
        hideFollowsCountField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.hideFollowsCount ?? false,
        ),
        hideFollowsField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.hideFollows ?? false,
        ),
        noRichTextField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.noRichText ?? false,
        ),
        showRoleField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.showRole ?? false,
        ),
        allowFollowingMoveField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.allowFollowingMove ?? true,
        ),
        skipThreadContainmentField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.skipThreadContainment ?? false,
        ),
        acceptsChatMessagesField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.acceptsChatMessages ?? true,
        ),
        botField = BoolValueFormFieldBloc(
          originValue: myAccountBloc.myAccount?.bot ?? false,
        ),
        super(isAllItemsInitialized: true) {
    displayNameField.disposeWith(this);
    noteField.disposeWith(this);
    lockedField.disposeWith(this);
    avatarField.disposeWith(this);
    headerField.disposeWith(this);
    lockedField.disposeWith(this);
    customFieldsGroupBloc.disposeWith(this);

    discoverableField.disposeWith(this);
    hideFollowersField.disposeWith(this);
    hideFollowersCountField.disposeWith(this);
    hideFollowsField.disposeWith(this);
    hideFollowsCountField.disposeWith(this);

    noRichTextField.disposeWith(this);
    showRoleField.disposeWith(this);
    allowFollowingMoveField.disposeWith(this);
    skipThreadContainmentField.disposeWith(this);
    acceptsChatMessagesField.disposeWith(this);
    botField.disposeWith(this);

    hideFollowersField.currentValueStream.listen(
      (hideFollowers) {
        if (hideFollowers == true) {
          hideFollowersCountField.changeIsEnabled(true);
        } else {
          hideFollowersCountField.changeIsEnabled(false);
          hideFollowersCountField.changeCurrentValue(false);
        }
      },
    ).disposeWith(this);

    hideFollowsField.currentValueStream.listen(
      (hideFollows) {
        if (hideFollows == true) {
          hideFollowsCountField.changeIsEnabled(true);
        } else {
          hideFollowsCountField.changeIsEnabled(false);
          hideFollowsCountField.changeCurrentValue(false);
        }
      },
    ).disposeWith(this);
  }

  @override
  Future submitChanges() async {
    await _updateFiles();

    await _updateData();
  }

  Future _updateData() async {
    var fieldsAttributes = <int, UnifediApiField>{};

    customFieldsGroupBloc.items.asMap().entries.forEach(
      (entry) {
        var index = entry.key;
        var field = entry.value;
        fieldsAttributes[index] = UnifediApiField(
          name: field.keyField.currentValue,
          value: field.valueField.currentValue,
          verifiedAt: null,
        );
      },
    );

    var isPleromaInstance = currentAuthInstanceBloc.currentInstance!.isPleroma;

    var remoteMyAccount = await unifediApiMyAccountService.updateMyCredentials(
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
      backgroundImage: await backgroundField.currentMediaDeviceFile?.loadFile(),
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
      // todo: check
      alsoKnownAs: null,
      defaultScope: null,
      settingsStore: null,
      sensitive: null,
      avatar: null,
      language: null,
      privacy: null,
      deleteAvatar: null,
      header: null,
      deleteBackgroundImage: null,
      deleteHeader: null,
    );

    await myAccountBloc.updateMyAccountByMyUnifediApiAccount(remoteMyAccount);
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
      var request = UnifediApiMyAccountFilesRequest(
        avatar: await avatarPickedFile?.loadFile(),
        header: await headerPickedFile?.loadFile(),
        backgroundImage: await backgroundPickedFile?.loadFile(),
      );

      await _sendUnifediApiMyAccountFilesRequest(request);

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

  UnifediApiMyAccountEdit _calculateUnifediApiMyAccountEdit() {}

  Future _sendUnifediApiMyAccountFilesRequest(
    UnifediApiMyAccountFilesRequest unifediApiMyAccountFilesRequest,
  ) async {
    var remoteMyAccount = await unifediApiMyAccountService
        .updateFiles(unifediApiMyAccountFilesRequest);

    await myAccountBloc.updateMyAccountByMyUnifediApiAccount(remoteMyAccount);
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
      unifediApiMyAccountService:
          Provider.of<IUnifediApiMyAccountService>(context, listen: false),
      customFieldLimits: info?.limits?.field,
      // todo: check
      noteMaxLength: null,
      avatarUploadSizeInBytes: info?.limits?.media?.avatarUploadLimit,
      headerUploadSizeInBytes: info?.limits?.media?.uploadLimit,
      backgroundUploadSizeInBytes: info?.limits?.media?.backgroundUploadLimit,
    );
  }
}
