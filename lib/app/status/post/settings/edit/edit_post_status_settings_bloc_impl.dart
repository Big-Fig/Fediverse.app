import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/localization/locale/supported_localization_locale_list.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';

class EditPostStatusSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<PostStatusSettings>
    implements IEditPostStatusSettingsBloc {
  final IPostStatusSettingsBloc postStatusSettingsBloc;

  final List<PleromaApiVisibility> pleromaVisibilityPossibleValues;
  @override
  // ignore: avoid-late-keyword
  late IStatusVisibilitySelectSingleFromListValueFormFieldBloc
      defaultVisibilityFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> markMediaAsNsfwOnAttachFormFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late LocalizationLocaleSingleFromListValueFormFieldBloc
      defaultStatusLocaleFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        defaultVisibilityFormFieldBloc,
        markMediaAsNsfwOnAttachFormFieldBloc,
        defaultStatusLocaleFormFieldBloc,
      ];

  EditPostStatusSettingsBloc({
    required this.postStatusSettingsBloc,
    required this.pleromaVisibilityPossibleValues,
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
      originValue: currentSettings.defaultVisibilityAsPleromaApi,
      isEnabled: isEnabled,
      possibleValues: pleromaVisibilityPossibleValues,
    );
    markMediaAsNsfwOnAttachFormFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.markMediaAsNsfwOnAttach,
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
    addDisposable(defaultStatusLocaleFormFieldBloc);

    onFormItemsChanged();
  }

  @override
  PostStatusSettings calculateCurrentFormFieldsSettings() => PostStatusSettings(
        defaultVisibilityString:
            defaultVisibilityFormFieldBloc.currentValue.toJsonValue(),
        markMediaAsNsfwOnAttach:
            markMediaAsNsfwOnAttachFormFieldBloc.currentValue,
        defaultStatusLocale: defaultStatusLocaleFormFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(PostStatusSettings settings) async {
    defaultVisibilityFormFieldBloc
        .changeCurrentValue(settings.defaultVisibilityAsPleromaApi);
    markMediaAsNsfwOnAttachFormFieldBloc
        .changeCurrentValue(settings.markMediaAsNsfwOnAttach);
    defaultStatusLocaleFormFieldBloc
        .changeCurrentValue(settings.defaultStatusLocale);
  }
}
