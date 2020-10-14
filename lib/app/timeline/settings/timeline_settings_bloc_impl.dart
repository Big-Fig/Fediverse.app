import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';

class TimelineSettingsBloc extends DisposableOwner
    implements ITimelineSettingsBloc {
  final ITimelineSettingsLocalPreferencesBloc settingsLocalPreferencesBloc;

  TimelineSettings get settings => settingsLocalPreferencesBloc.value;

  Stream<TimelineSettings> get settingsStream =>
      settingsLocalPreferencesBloc.stream;

  @override
  final IFormBoolFieldBloc onlyWithMediaFieldBloc;
  @override
  final IFormBoolFieldBloc onlyNoRepliesFieldBloc;
  @override
  final IFormBoolFieldBloc onlyNoNsfwSensitiveFieldBloc;

  @override
  final IFormBoolFieldBloc onlyRemoteFieldBloc;

  @override
  final IFormBoolFieldBloc onlyLocalFieldBloc;

  @override
  final IFormBoolFieldBloc withMutedFieldBloc;

  TimelineSettingsBloc({this.settingsLocalPreferencesBloc})
      : onlyNoRepliesFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyNoReplies ?? false),
        onlyWithMediaFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyWithMedia ?? false),
        onlyNoNsfwSensitiveFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyNoNsfwSensitive ??
                    false),
        onlyRemoteFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyRemote ?? false),
        onlyLocalFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyLocal ?? false),
        withMutedFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.withMuted ?? false) {
    addDisposable(disposable: onlyNoRepliesFieldBloc);
    addDisposable(disposable: onlyWithMediaFieldBloc);
    addDisposable(disposable: onlyNoNsfwSensitiveFieldBloc);
    addDisposable(disposable: onlyRemoteFieldBloc);
    addDisposable(disposable: onlyLocalFieldBloc);
    addDisposable(disposable: withMutedFieldBloc);

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
    addDisposable(
        streamSubscription: onlyRemoteFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: onlyLocalFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        withMutedFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
  }

  void _onSomethingChanged() {
    var oldPreferences = settingsLocalPreferencesBloc.value;
    var newPreferences = TimelineSettings(
      onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
      onlyNoNsfwSensitive: onlyNoNsfwSensitiveFieldBloc.currentValue,
      onlyNoReplies: onlyNoRepliesFieldBloc.currentValue,
      onlyRemote: onlyRemoteFieldBloc.currentValue,
      onlyLocal: onlyLocalFieldBloc.currentValue,
      withMuted: withMutedFieldBloc.currentValue,
      id: oldPreferences.id,
      excludeVisibilitiesStrings: oldPreferences.excludeVisibilitiesStrings,
      remoteTypeString: oldPreferences.remoteTypeString,
      onlyInListWithRemoteId: oldPreferences.onlyInListWithRemoteId,
      withHashtag: oldPreferences.withHashtag,
      timelineReplyVisibilityFilterString:
          oldPreferences.timelineReplyVisibilityFilterString,
      onlyFromAccountWithRemoteId: oldPreferences.onlyInListWithRemoteId,
    );
    if (newPreferences != oldPreferences) {
      settingsLocalPreferencesBloc.setValue(newPreferences);
    }
  }
}
