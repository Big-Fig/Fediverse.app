import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:fedi/form/field/value/duration/form_duration_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditStatusSensitiveSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<StatusSensitiveSettings>
    implements IEditStatusSensitiveSettingsBloc {
  final IStatusSensitiveSettingsBloc statusSensitiveSettingsBloc;

  @override
  final IFormDurationFieldBloc nsfwDisplayDelayDurationFieldBloc;

  @override
  final IFormBoolFieldBloc isAlwaysShowSpoilerFieldBloc;

  @override
  final IFormBoolFieldBloc isAlwaysShowNsfwFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        nsfwDisplayDelayDurationFieldBloc,
        isAlwaysShowSpoilerFieldBloc,
        isAlwaysShowNsfwFieldBloc,
      ];

  EditStatusSensitiveSettingsBloc({
    @required this.statusSensitiveSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool enabled,
  })  : nsfwDisplayDelayDurationFieldBloc = FormDurationFieldBloc(
          originValue: statusSensitiveSettingsBloc.nsfwDisplayDelayDuration,
          minDuration: Duration(minutes: 1),
          maxDuration: Duration(days: 1),
        ),
        isAlwaysShowSpoilerFieldBloc = FormBoolFieldBloc(
          originValue: statusSensitiveSettingsBloc.isAlwaysShowSpoiler,
        ),
        isAlwaysShowNsfwFieldBloc = FormBoolFieldBloc(
          originValue: statusSensitiveSettingsBloc.isAlwaysShowNsfw,
        ),
        super(
          globalOrInstanceSettingsBloc: statusSensitiveSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          enabled: enabled,
        ) {
    addDisposable(disposable: nsfwDisplayDelayDurationFieldBloc);
    addDisposable(disposable: isAlwaysShowSpoilerFieldBloc);
    addDisposable(disposable: isAlwaysShowNsfwFieldBloc);
  }

  @override
  StatusSensitiveSettings calculateCurrentFormFieldsSettings() =>
      StatusSensitiveSettings(
        nsfwDisplayDelayDurationMicrosecondsTotal:
            nsfwDisplayDelayDurationFieldBloc.currentValue.inMicroseconds,
        isAlwaysShowSpoiler: isAlwaysShowSpoilerFieldBloc.currentValue,
        isAlwaysShowNsfw: isAlwaysShowNsfwFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(StatusSensitiveSettings settings) async {
    isAlwaysShowNsfwFieldBloc.changeCurrentValue(settings.isAlwaysShowNsfw);
    isAlwaysShowSpoilerFieldBloc
        .changeCurrentValue(settings.isAlwaysShowSpoiler);
    nsfwDisplayDelayDurationFieldBloc
        .changeCurrentValue(settings.nsfwDisplayDelayDuration);
  }
}
