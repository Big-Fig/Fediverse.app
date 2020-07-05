import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/local_preferences/timeline_settings_local_preferences_model.dart';
import 'package:fedi/app/timeline/settings/timelines_settings_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';

class TimelinesSettingsBloc extends DisposableOwner
    implements ITimelinesSettingsBloc {
  final ITimelineSettingsLocalPreferencesBloc localPreferencesBloc;

  TimelineSettingsLocalPreferences get preferences =>
      localPreferencesBloc.value;

  Stream<TimelineSettingsLocalPreferences> get preferencesStream =>
      localPreferencesBloc.stream;

  @override
  final IFormBoolFieldBloc onlyNoRepliesFieldBloc;
  @override
  final IFormBoolFieldBloc onlyWithMediaFieldBloc;
  @override
  final IFormBoolFieldBloc onlyNoNsfwSensitiveFieldBloc;

  TimelinesSettingsBloc({this.localPreferencesBloc})
      : onlyNoRepliesFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.onlyNoReplies ?? false),
        onlyWithMediaFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.onlyWithMedia ?? false),
        onlyNoNsfwSensitiveFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.onlyNoNsfwSensitive ?? false) {
    addDisposable(disposable: onlyNoRepliesFieldBloc);
    addDisposable(disposable: onlyWithMediaFieldBloc);
    addDisposable(disposable: onlyNoNsfwSensitiveFieldBloc);

    addDisposable(streamSubscription:
        onlyNoRepliesFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        onlyWithMediaFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        onlyNoNsfwSensitiveFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
  }

  void _onSomethingChanged() {
    var oldPreferences = localPreferencesBloc.value;
    var newPreferences = TimelineSettingsLocalPreferences(
      onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
      onlyNoNsfwSensitive: onlyNoNsfwSensitiveFieldBloc.currentValue,
      onlyNoReplies: onlyNoRepliesFieldBloc.currentValue,
    );
    if (newPreferences != oldPreferences) {
      localPreferencesBloc.setValue(newPreferences);
    }
  }
}
