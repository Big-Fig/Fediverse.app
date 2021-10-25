import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/my/edit/edit_my_account_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc.dart';
import 'package:fedi_app/form/field/file_picker_or_url/image/image_file_picker_or_url_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:fedi_app/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi_app/form/group/one_type/one_type_form_group_bloc_impl.dart';
import 'package:fedi_app/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:fedi_app/form/group/pair/link_pair_form_group_bloc_impl.dart';
import 'package:fedi_app/unifedi/api/field/unifedi_api_field_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditMyAccountBloc extends FormBloc implements IEditMyAccountBloc {
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
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
    required this.currentUnifediApiAccessBloc,
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
          // ignore: cascade_invocations
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
          // ignore: cascade_invocations
          hideFollowsCountField.changeCurrentValue(false);
        }
      },
    ).disposeWith(this);
  }

  @override
  Future<void> submitChanges() async {
    await _updateData();
  }

  Future<void> _updateData() async {
    var avatarPickedFile = avatarField.isSomethingChanged
        ? avatarField.currentMediaDeviceFile
        : null;

    var headerPickedFile = headerField.isSomethingChanged
        ? headerField.currentMediaDeviceFile
        : null;
    var backgroundPickedFile = backgroundField.isSomethingChanged
        ? backgroundField.currentMediaDeviceFile
        : null;

    var fieldsAttributes = <UnifediApiField>[];

    for (final field in customFieldsGroupBloc.items) {
      fieldsAttributes.add(
        UnifediApiField(
          name: field.keyField.currentValue,
          value: field.valueField.currentValue,
          verifiedAt: null,
        ),
      );
    }

    var isPleromaInstance =
        currentUnifediApiAccessBloc.currentInstance!.isPleroma;

    var remoteMyAccount = await unifediApiMyAccountService.updateMyCredentials(
      editMyAccount: await _calculateUnifediApiEditMyAccount(
        isPleromaInstance: isPleromaInstance,
        fieldsAttributes: fieldsAttributes,
      ),
    );

    await myAccountBloc.updateMyAccountByMyUnifediApiAccount(remoteMyAccount);

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

  Future<UnifediApiEditMyAccount> _calculateUnifediApiEditMyAccount({
    required bool isPleromaInstance,
    required List<UnifediApiField> fieldsAttributes,
  }) async =>
      UnifediApiEditMyAccount(
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

        hideFavorites:
            isPleromaInstance ? hideFavouritesField.currentValue : null,

        hideFollowers:
            isPleromaInstance ? hideFollowersField.currentValue : null,

        hideFollowersCount:
            isPleromaInstance ? hideFollowersCountField.currentValue : null,

        hideFollows: isPleromaInstance ? hideFollowsField.currentValue : null,

        hideFollowsCount:
            isPleromaInstance ? hideFollowsCountField.currentValue : null,

        noRichText: isPleromaInstance ? noRichTextField.currentValue : null,

        showRole: isPleromaInstance ? showRoleField.currentValue : null,

        skipThreadContainment:
            isPleromaInstance ? skipThreadContainmentField.currentValue : null,
        backgroundImageLocalFilePath:
            await backgroundField.currentMediaDeviceFile?.calculateFilePath(),
        avatarLocalFilePath:
            await avatarField.currentMediaDeviceFile?.calculateFilePath(),
        headerLocalFilePath:
            await headerField.currentMediaDeviceFile?.calculateFilePath(),
        deleteAvatar: avatarField.isOriginalDeleted,
        deleteBackgroundImage: backgroundField.isOriginalDeleted,
        deleteHeader: headerField.isOriginalDeleted,

        // todo: check
        alsoKnownAs: null,

        defaultScope: null,

        settingsStore: null,

        sensitive: null,

        language: null,

        privacy: null,
      );

  static EditMyAccountBloc createFromContext(BuildContext context) {
    var info = ICurrentUnifediApiAccessBloc.of(context, listen: false)
        .currentInstance!
        .info;

    return EditMyAccountBloc(
      currentUnifediApiAccessBloc: ICurrentUnifediApiAccessBloc.of(
        context,
        listen: false,
      ),
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      unifediApiMyAccountService:
          Provider.of<IUnifediApiMyAccountService>(context, listen: false),
      customFieldLimits: info?.limits?.field?.toUnifediApiInstanceFieldLimits(),
      // todo: check
      noteMaxLength: null,
      avatarUploadSizeInBytes: info?.limits?.media?.avatarUploadLimit,
      headerUploadSizeInBytes: info?.limits?.media?.uploadLimit,
      backgroundUploadSizeInBytes: info?.limits?.media?.backgroundUploadLimit,
    );
  }
}
