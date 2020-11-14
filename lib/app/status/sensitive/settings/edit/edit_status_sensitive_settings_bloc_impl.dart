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
  final IStatusSensitiveSettingsBloc statusSensitiveSettingBloc;

  @override
  final IFormValueFieldBloc<Duration> nsfwDisplayDelayDurationFieldBloc;

  @override
  final IFormBoolFieldBloc isAlwaysShowSpoilerFieldBloc;

  @override
  final IFormBoolFieldBloc isAlwaysShowNsfwFieldBloc;

  EditStatusSensitiveSettingsBloc({
    @required this.statusSensitiveSettingBloc,
  })  : nsfwDisplayDelayDurationFieldBloc = FormValueFieldBloc(
          originValue: statusSensitiveSettingBloc.nsfwDisplayDelayDuration,
          validators: [],
          isEnabled: statusSensitiveSettingBloc.isInstance,
          isEnabledStream: statusSensitiveSettingBloc.isInstanceStream,
        ),
        isAlwaysShowSpoilerFieldBloc = FormBoolFieldBloc(
          originValue: statusSensitiveSettingBloc.isAlwaysShowSpoiler,
          isEnabled: statusSensitiveSettingBloc.isInstance,
          isEnabledStream: statusSensitiveSettingBloc.isInstanceStream,
        ),
        isAlwaysShowNsfwFieldBloc = FormBoolFieldBloc(
          originValue: statusSensitiveSettingBloc.isAlwaysShowNsfw,
          isEnabled: statusSensitiveSettingBloc.isInstance,
          isEnabledStream: statusSensitiveSettingBloc.isInstanceStream,
        ) {
    _subscribeForNsfwDisplayDelayDuration();
    _subscribeForIsAlwaysShowNsfw();
    _subscribeForIsAlwaysShowSpoiler();
  }

  void _subscribeForNsfwDisplayDelayDuration() {
    addDisposable(
      streamSubscription: statusSensitiveSettingBloc
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
          statusSensitiveSettingBloc.changeNsfwDisplayDelayDuration(value);
        },
      ),
    );
  }

  void _subscribeForIsAlwaysShowNsfw() {
    addDisposable(
      streamSubscription:
          statusSensitiveSettingBloc.isAlwaysShowNsfwStream.distinct().listen(
        (newValue) {
          isAlwaysShowNsfwFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: isAlwaysShowNsfwFieldBloc.currentValueStream.listen(
        (value) {
          statusSensitiveSettingBloc.changeIsAlwaysShowNsfw(value);
        },
      ),
    );
  }

  void _subscribeForIsAlwaysShowSpoiler() {
    addDisposable(
      streamSubscription: statusSensitiveSettingBloc.isAlwaysShowSpoilerStream
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
          statusSensitiveSettingBloc.changeIsAlwaysShowSpoiler(value);
        },
      ),
    );
  }
}
