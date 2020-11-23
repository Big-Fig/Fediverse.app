import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/duration/duration_value_form_field_row_widget.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditStatusSensitiveSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditStatusSensitiveSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const _EditStatusSensitiveSettingsAlwaysShowSpoilerFieldWidget(),
        const _EditStatusSensitiveSettingsAlwaysShowNsfwFieldWidget(),
        // const _EditStatusSensitiveSettingsNsfwDisplayDurationWidget(),
      ],
    );
  }
}

class _EditStatusSensitiveSettingsNsfwDisplayDurationWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsNsfwDisplayDurationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editStatusSensitiveSettingsBloc =
        IEditStatusSensitiveSettingsBloc.of(context);
    return DurationFormFieldRowWidget(
      label: S
          .of(context)
          .app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label,
      popupTitle: S
          .of(context)
          .app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label,
      field: editStatusSensitiveSettingsBloc.nsfwDisplayDelayDurationFieldBloc,
    );
  }
}

class _EditStatusSensitiveSettingsAlwaysShowNsfwFieldWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsAlwaysShowNsfwFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditStatusSensitiveSettingsBloc,
        IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.isAlwaysShowNsfwFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S
            .of(context)
            .app_status_sensitive_settings_field_isAlwaysShowNsfw_label,
      ),
    );
  }
}

class _EditStatusSensitiveSettingsAlwaysShowSpoilerFieldWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsAlwaysShowSpoilerFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditStatusSensitiveSettingsBloc,
        IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.isAlwaysShowSpoilerFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S
            .of(context)
            .app_status_sensitive_settings_field_isAlwaysShowSpoiler_label,
      ),
    );
  }
}
