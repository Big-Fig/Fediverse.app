import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/localization/locale/supported_localization_locale_list.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class EditPostStatusSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<PostStatusSettings>
    implements IEditPostStatusSettingsBloc {
  final IPostStatusSettingsBloc postStatusSettingsBloc;

  @override
  IStatusVisibilitySingleFromListValueFormFieldBloc
      defaultVisibilityFormFieldBloc;

  @override
  IBoolValueFormFieldBloc markMediaAsNsfwOnAttachFormFieldBloc;

  @override
  LocalizationLocaleSingleFromListValueFormFieldBloc
      defaultStatusLocaleFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        defaultVisibilityFormFieldBloc,
        markMediaAsNsfwOnAttachFormFieldBloc,
        defaultStatusLocaleFormFieldBloc,
      ];

  EditPostStatusSettingsBloc({
    @required this.postStatusSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool isEnabled,
    @required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: postStatusSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    defaultVisibilityFormFieldBloc =
        StatusVisibilitySingleFromListValueFormFieldBloc(
      originValue: currentSettings.defaultVisibilityPleroma,
      isEnabled: isEnabled,
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

    addDisposable(disposable: defaultVisibilityFormFieldBloc);
    addDisposable(disposable: markMediaAsNsfwOnAttachFormFieldBloc);
    addDisposable(disposable: defaultStatusLocaleFormFieldBloc);

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
        .changeCurrentValue(settings.defaultVisibilityPleroma);
    markMediaAsNsfwOnAttachFormFieldBloc
        .changeCurrentValue(settings.markMediaAsNsfwOnAttach);
    defaultStatusLocaleFormFieldBloc
        .changeCurrentValue(settings.defaultStatusLocale);
  }
}
