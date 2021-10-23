import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/duration/duration_value_form_field_row_widget.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditStatusSensitiveSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditStatusSensitiveSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditStatusSensitiveSettingsAlwaysShowSpoilerFieldWidget(),
          _EditStatusSensitiveSettingsAlwaysShowNsfwFieldWidget(),
          _EditStatusSensitiveSettingsNsfwDisplayDurationWidget(),
          _EditStatusSensitiveSettingsReplaceBlurWithFillFieldWidget(),
        ],
      );
}

class _EditStatusSensitiveSettingsNsfwDisplayDurationWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsNsfwDisplayDurationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditStatusSensitiveSettingsBloc, IDurationValueFormFieldBloc>(
        update: (context, value, _) => value.nsfwDisplayDelayDurationFieldBloc,
        child: DurationValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_nsfwDisplayDelayDuration_label,
        ),
      );
}

class _EditStatusSensitiveSettingsAlwaysShowNsfwFieldWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsAlwaysShowNsfwFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditStatusSensitiveSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.isAlwaysShowNsfwFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_isAlwaysShowNsfw_label,
        ),
      );
}

class _EditStatusSensitiveSettingsAlwaysShowSpoilerFieldWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsAlwaysShowSpoilerFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditStatusSensitiveSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.isAlwaysShowSpoilerFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_isAlwaysShowSpoiler_label,
        ),
      );
}

class _EditStatusSensitiveSettingsReplaceBlurWithFillFieldWidget
    extends StatelessWidget {
  const _EditStatusSensitiveSettingsReplaceBlurWithFillFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditStatusSensitiveSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.isNeedReplaceBlurWithFillFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_status_sensitive_settings_field_isNeedReplaceBlurWithFill_label,
        ),
      );
}
