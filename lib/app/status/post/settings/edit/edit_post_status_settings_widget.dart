import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditPostStatusSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditPostStatusSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const _EditPostStatusSettingsDefaultVisibilityFieldWidget(),
        const _EditPostStatusSettingsMarkMediaAsNsfwOnAttachWidget(),
        const _EditPostStatusSettingsDefaultStatusLocaleFieldWidget(),
      ],
    );
  }
}

class _EditPostStatusSettingsMarkMediaAsNsfwOnAttachWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsMarkMediaAsNsfwOnAttachWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditPostStatusSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) =>
          value.markMediaAsNsfwOnAttachFormFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S
            .of(context)
            .app_status_post_settings_field_markMediaAsNsfwOnAttach_label,
      ),
    );
  }
}


class _EditPostStatusSettingsDefaultStatusLocaleFieldWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsDefaultStatusLocaleFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditPostStatusSettingsBloc,
        ILocalizationLocaleSingleFromListValueFormFieldBloc>(
      update: (context, value, previous) =>
      value.defaultStatusLocaleFormFieldBloc,
      child: const LocalizationLocaleSingleFromListValueFormFieldRowWidget(),
    );
  }
}


class _EditPostStatusSettingsDefaultVisibilityFieldWidget
    extends StatelessWidget {
  const _EditPostStatusSettingsDefaultVisibilityFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditPostStatusSettingsBloc,
        IStatusVisibilitySingleFromListValueFormFieldBloc>(
      update: (context, value, previous) =>
          value.defaultVisibilityFormFieldBloc,
      child: const StatusVisibilitySingleFromListValueFormFieldRowWidget(),
    );
  }
}
