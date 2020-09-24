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
  final IFormBoolFieldBloc excludeRepliesFieldBloc;
  @override
  final IFormBoolFieldBloc excludeNsfwSensitiveFieldBloc;

  @override
  final IFormBoolFieldBloc onlyRemoteFieldBloc;

  @override
  final IFormBoolFieldBloc onlyLocalFieldBloc;
  @override
  final IFormBoolFieldBloc onlyPinnedFieldBloc;

  @override
  final IFormBoolFieldBloc withMutedFieldBloc;

  @override
  final IFormBoolFieldBloc excludeReblogsFieldBloc;

  TimelineSettingsBloc({this.settingsLocalPreferencesBloc})
      : excludeRepliesFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.excludeReplies ?? false),
        onlyWithMediaFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyWithMedia ?? false),
        excludeNsfwSensitiveFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.excludeNsfwSensitive ??
                    false),
        onlyRemoteFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyRemote ?? false),
        onlyLocalFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyLocal ?? false),
        onlyPinnedFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.onlyPinned ?? false),
        excludeReblogsFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.excludeReblogs ?? false),
        withMutedFieldBloc = FormBoolFieldBloc(
            originValue:
                settingsLocalPreferencesBloc.value?.withMuted ?? false) {
    addDisposable(disposable: excludeRepliesFieldBloc);
    addDisposable(disposable: onlyWithMediaFieldBloc);
    addDisposable(disposable: excludeNsfwSensitiveFieldBloc);
    addDisposable(disposable: onlyRemoteFieldBloc);
    addDisposable(disposable: onlyLocalFieldBloc);
    addDisposable(disposable: excludeReblogsFieldBloc);
    addDisposable(disposable: withMutedFieldBloc);

    addDisposable(streamSubscription:
        excludeRepliesFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        onlyWithMediaFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        excludeNsfwSensitiveFieldBloc.currentValueStream.listen((_) {
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
        excludeReblogsFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(
        streamSubscription: withMutedFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
  }

  void _onSomethingChanged() {
    var oldPreferences = settingsLocalPreferencesBloc.value;
    var newPreferences = TimelineSettings(
      onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
      excludeNsfwSensitive: excludeNsfwSensitiveFieldBloc.currentValue,
      excludeReplies: excludeRepliesFieldBloc.currentValue,
      onlyRemote: onlyRemoteFieldBloc.currentValue,
      onlyLocal: onlyLocalFieldBloc.currentValue,
      withMuted: withMutedFieldBloc.currentValue,
      id: oldPreferences.id,
      excludeVisibilitiesStrings: oldPreferences.excludeVisibilitiesStrings,
      typeString: oldPreferences.typeString,
      onlyInListWithRemoteId: oldPreferences.onlyInListWithRemoteId,
      withHashtag: oldPreferences.withHashtag,
      timelineReplyVisibilityFilterString:
          oldPreferences.timelineReplyVisibilityFilterString,
      onlyFromAccountWithRemoteId: oldPreferences.onlyInListWithRemoteId,
      excludeReblogs: excludeReblogsFieldBloc.currentValue,
      onlyPinned: onlyPinnedFieldBloc.currentValue,
    );
    if (newPreferences != oldPreferences) {
      settingsLocalPreferencesBloc.setValue(newPreferences);
    }
  }

  @override
  ITimelineSettings get timelineSettings => settingsLocalPreferencesBloc.value;
}
