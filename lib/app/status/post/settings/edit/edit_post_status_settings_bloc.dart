import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPostStatusSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<PostStatusSettings> {
  static IEditPostStatusSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditPostStatusSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get markMediaAsNsfwOnAttachFormFieldBloc;
  IBoolValueFormFieldBloc get dontUploadMediaDuringEditingFormFieldBloc;

  IStatusVisibilitySelectSingleFromListValueFormFieldBloc
      get defaultVisibilityFormFieldBloc;

  ILocalizationLocaleSingleFromListValueFormFieldBloc
      get defaultStatusLocaleFormFieldBloc;
}
