import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/localization/locale/supported_localization_locale_list.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi_app/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditPostStatusSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<PostStatusSettings>
    implements IEditPostStatusSettingsBloc {
  final IPostStatusSettingsBloc postStatusSettingsBloc;

  final List<UnifediApiVisibility> unifediVisibilityPossibleValues;
  @override
  // ignore: avoid-late-keyword
  late IStatusVisibilitySelectSingleFromListValueFormFieldBloc
      defaultVisibilityFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> markMediaAsNsfwOnAttachFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> dontUploadMediaDuringEditingFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late LocalizationLocaleSingleFromListValueFormFieldBloc
      defaultStatusLocaleFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        defaultVisibilityFormFieldBloc,
        markMediaAsNsfwOnAttachFormFieldBloc,
        dontUploadMediaDuringEditingFormFieldBloc,
        defaultStatusLocaleFormFieldBloc,
      ];

  EditPostStatusSettingsBloc({
    required this.postStatusSettingsBloc,
    required this.unifediVisibilityPossibleValues,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: postStatusSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    defaultVisibilityFormFieldBloc =
        StatusVisibilitySelectSingleFromListValueFormFieldBloc(
      originValue: currentSettings.defaultVisibilityAsUnifediApi,
      isEnabled: isEnabled,
      possibleValues: unifediVisibilityPossibleValues,
    );
    markMediaAsNsfwOnAttachFormFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.markMediaAsNsfwOnAttach,
      isEnabled: isEnabled,
    );
    dontUploadMediaDuringEditingFormFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.dontUploadMediaDuringEditing,
      isEnabled: isEnabled,
    );

    defaultStatusLocaleFormFieldBloc =
        LocalizationLocaleSingleFromListValueFormFieldBloc(
      originValue: currentSettings.defaultStatusLocale,
      isEnabled: isEnabled,
      possibleValues: supportedLocalizationLocaleList,
    );

    addDisposable(defaultVisibilityFormFieldBloc);
    addDisposable(markMediaAsNsfwOnAttachFormFieldBloc);
    addDisposable(dontUploadMediaDuringEditingFormFieldBloc);
    addDisposable(defaultStatusLocaleFormFieldBloc);

    onFormItemsChanged();
  }

  @override
  PostStatusSettings calculateCurrentFormFieldsSettings() => PostStatusSettings(
        defaultVisibilityString:
            defaultVisibilityFormFieldBloc.currentValue.stringValue,
        markMediaAsNsfwOnAttach:
            markMediaAsNsfwOnAttachFormFieldBloc.currentValue,
        dontUploadMediaDuringEditing:
            dontUploadMediaDuringEditingFormFieldBloc.currentValue,
        defaultStatusLocale: defaultStatusLocaleFormFieldBloc.currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(PostStatusSettings settings) async {
    defaultVisibilityFormFieldBloc
        .changeCurrentValue(settings.defaultVisibilityAsUnifediApi);
    markMediaAsNsfwOnAttachFormFieldBloc
        .changeCurrentValue(settings.markMediaAsNsfwOnAttach);
    dontUploadMediaDuringEditingFormFieldBloc
        .changeCurrentValue(settings.dontUploadMediaDuringEditing);
    defaultStatusLocaleFormFieldBloc
        .changeCurrentValue(settings.defaultStatusLocale);
  }
}
