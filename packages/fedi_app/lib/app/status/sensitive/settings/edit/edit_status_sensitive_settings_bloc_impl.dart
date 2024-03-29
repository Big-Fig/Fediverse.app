import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi_app/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/duration/duration_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditStatusSensitiveSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<StatusSensitiveSettings>
    implements IEditStatusSensitiveSettingsBloc {
  final IStatusSensitiveSettingsBloc statusSensitiveSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late IDurationValueFormFieldBloc nsfwDisplayDelayDurationFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc isAlwaysShowSpoilerFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc isAlwaysShowNsfwFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc isNeedReplaceBlurWithFillFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        nsfwDisplayDelayDurationFieldBloc,
        isAlwaysShowSpoilerFieldBloc,
        isAlwaysShowNsfwFieldBloc,
        isNeedReplaceBlurWithFillFieldBloc,
      ];

  EditStatusSensitiveSettingsBloc({
    required this.statusSensitiveSettingsBloc,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: statusSensitiveSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    nsfwDisplayDelayDurationFieldBloc = DurationValueFormFieldBloc(
      originValue: currentSettings.nsfwDisplayDelayDuration,
      minDuration: const Duration(minutes: 1),
      maxDuration: const Duration(days: 1),
      isNullValuePossible: true,
      isEnabled: isEnabled,
    );
    isAlwaysShowSpoilerFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.isAlwaysShowSpoiler,
      isEnabled: isEnabled,
    );
    isAlwaysShowNsfwFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.isAlwaysShowNsfw,
      isEnabled: isEnabled,
    );
    isNeedReplaceBlurWithFillFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.isNeedReplaceBlurWithFill,
      isEnabled: isEnabled,
    );

    addDisposable(nsfwDisplayDelayDurationFieldBloc);
    addDisposable(isAlwaysShowSpoilerFieldBloc);
    addDisposable(isAlwaysShowNsfwFieldBloc);
    addDisposable(isNeedReplaceBlurWithFillFieldBloc);

    onFormItemsChanged();
  }

  @override
  StatusSensitiveSettings calculateCurrentFormFieldsSettings() =>
      StatusSensitiveSettings(
        nsfwDisplayDelayDurationMicrosecondsTotal:
            nsfwDisplayDelayDurationFieldBloc.currentValue?.inMicroseconds,
        isAlwaysShowSpoiler: isAlwaysShowSpoilerFieldBloc.currentValue!,
        isAlwaysShowNsfw: isAlwaysShowNsfwFieldBloc.currentValue!,
        isNeedReplaceBlurWithFill:
            isNeedReplaceBlurWithFillFieldBloc.currentValue == true,
      );

  @override
  Future<void> fillSettingsToFormFields(
    StatusSensitiveSettings settings,
  ) async {
    isAlwaysShowNsfwFieldBloc.changeCurrentValue(settings.isAlwaysShowNsfw);
    isAlwaysShowSpoilerFieldBloc
        .changeCurrentValue(settings.isAlwaysShowSpoiler);
    nsfwDisplayDelayDurationFieldBloc
        .changeCurrentValue(settings.nsfwDisplayDelayDuration);
    isNeedReplaceBlurWithFillFieldBloc
        .changeCurrentValue(settings.isNeedReplaceBlurWithFill);
  }
}
