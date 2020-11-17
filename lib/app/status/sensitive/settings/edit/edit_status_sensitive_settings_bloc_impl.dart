import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/edit/edit_status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditStatusSensitiveSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditStatusSensitiveSettingsBloc {
  final IStatusSensitiveSettingsBloc statusSensitiveSettingsBloc;

  @override
  final IFormValueFieldBloc<Duration> nsfwDisplayDelayDurationFieldBloc;

  @override
  final IFormBoolFieldBloc isAlwaysShowSpoilerFieldBloc;

  @override
  final IFormBoolFieldBloc isAlwaysShowNsfwFieldBloc;

  EditStatusSensitiveSettingsBloc({
    @required this.statusSensitiveSettingsBloc,
  })  : nsfwDisplayDelayDurationFieldBloc = FormValueFieldBloc(
          originValue: statusSensitiveSettingsBloc.nsfwDisplayDelayDuration,
          validators: [],
          isEnabled: statusSensitiveSettingsBloc.isInstanceOrForceGlobal,
          isEnabledStream: statusSensitiveSettingsBloc.isInstanceOrForceGlobalStream,
        ),
        isAlwaysShowSpoilerFieldBloc = FormBoolFieldBloc(
          originValue: statusSensitiveSettingsBloc.isAlwaysShowSpoiler,
          isEnabled: statusSensitiveSettingsBloc.isInstanceOrForceGlobal,
          isEnabledStream: statusSensitiveSettingsBloc.isInstanceOrForceGlobalStream,
        ),
        isAlwaysShowNsfwFieldBloc = FormBoolFieldBloc(
          originValue: statusSensitiveSettingsBloc.isAlwaysShowNsfw,
          isEnabled: statusSensitiveSettingsBloc.isInstanceOrForceGlobal,
          isEnabledStream: statusSensitiveSettingsBloc.isInstanceOrForceGlobalStream,
        ), super(statusSensitiveSettingsBloc) {
    _subscribeForNsfwDisplayDelayDuration();
    _subscribeForIsAlwaysShowNsfw();
    _subscribeForIsAlwaysShowSpoiler();
  }

  void _subscribeForNsfwDisplayDelayDuration() {
    addDisposable(
      streamSubscription: statusSensitiveSettingsBloc
          .nsfwDisplayDelayDurationStream
          .distinct()
          .listen(
        (newValue) {
          nsfwDisplayDelayDurationFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          nsfwDisplayDelayDurationFieldBloc.currentValueStream.listen(
        (value) {
          statusSensitiveSettingsBloc.changeNsfwDisplayDelayDuration(value);
        },
      ),
    );
  }

  void _subscribeForIsAlwaysShowNsfw() {
    addDisposable(
      streamSubscription:
          statusSensitiveSettingsBloc.isAlwaysShowNsfwStream.distinct().listen(
        (newValue) {
          isAlwaysShowNsfwFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: isAlwaysShowNsfwFieldBloc.currentValueStream.listen(
        (value) {
          statusSensitiveSettingsBloc.changeIsAlwaysShowNsfw(value);
        },
      ),
    );
  }

  void _subscribeForIsAlwaysShowSpoiler() {
    addDisposable(
      streamSubscription: statusSensitiveSettingsBloc.isAlwaysShowSpoilerStream
          .distinct()
          .listen(
        (newValue) {
          isAlwaysShowSpoilerFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          isAlwaysShowSpoilerFieldBloc.currentValueStream.listen(
        (value) {
          statusSensitiveSettingsBloc.changeIsAlwaysShowSpoiler(value);
        },
      ),
    );
  }
}
