import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/duration/duration_value_form_field_row_widget.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditStatusSensitiveSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditStatusSensitiveSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editStatusSensitiveSettingsBloc =
        IEditStatusSensitiveSettingsBloc.of(context);
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_isAlwaysShowSpoiler_label,
          field: editStatusSensitiveSettingsBloc.isAlwaysShowSpoilerFieldBloc,
        ),
        BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_isAlwaysShowNsfw_label,
          field: editStatusSensitiveSettingsBloc.isAlwaysShowNsfwFieldBloc,
        ),
        DurationFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label,
          popupTitle: S
              .of(context)
              .app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label,
          field:
              editStatusSensitiveSettingsBloc.nsfwDisplayDelayDurationFieldBloc,
        ),
      ],
    );
  }
}
