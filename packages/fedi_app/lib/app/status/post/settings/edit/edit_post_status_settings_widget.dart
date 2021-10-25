import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditPostStatusSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditPostStatusSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditPostStatusSettingsDefaultVisibilityFieldWidget(),
          _EditPostStatusSettingsMarkMediaAsNsfwOnAttachWidget(),
          _EditPostStatusSettingsDontUploadMediaDuringEditingWidget(),
          _EditPostStatusSettingsDefaultStatusLocaleFieldWidget(),
        ],
      );
}

class _EditPostStatusSettingsMarkMediaAsNsfwOnAttachWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsMarkMediaAsNsfwOnAttachWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPostStatusSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.markMediaAsNsfwOnAttachFormFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_post_settings_field_markMediaAsNsfwOnAttach_label,
        ),
      );
}

class _EditPostStatusSettingsDontUploadMediaDuringEditingWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsDontUploadMediaDuringEditingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPostStatusSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.dontUploadMediaDuringEditingFormFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_post_settings_field_dontUploadMediaDuringEditing_label,
        ),
      );
}

class _EditPostStatusSettingsDefaultStatusLocaleFieldWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsDefaultStatusLocaleFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditPostStatusSettingsBloc,
          ILocalizationLocaleSingleFromListValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.defaultStatusLocaleFormFieldBloc,
        child: const LocalizationLocaleSingleFromListValueFormFieldRowWidget(),
      );
}

class _EditPostStatusSettingsDefaultVisibilityFieldWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsDefaultVisibilityFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditPostStatusSettingsBloc,
          IStatusVisibilitySelectSingleFromListValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.defaultVisibilityFormFieldBloc,
        child:
            const StatusVisibilitySelectSingleFromListValueFormFieldRowWidget(),
      );
}
