import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class TimelineSettingsBloc extends DisposableOwner
    implements ITimelineSettingsBloc {
  final BehaviorSubject<TimelineSettings> _timelineSettingsSubject;

  @override
  TimelineSettings get timelineSettings => _timelineSettingsSubject.value;

  @override
  Stream<TimelineSettings> get timelineSettingsStream =>
      _timelineSettingsSubject.stream;

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

  TimelineSettingsBloc({@required TimelineSettings originalSettings})
      : _timelineSettingsSubject = BehaviorSubject.seeded(originalSettings),
        excludeRepliesFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.excludeReplies ?? false),
        onlyWithMediaFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.onlyWithMedia ?? false),
        excludeNsfwSensitiveFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.excludeNsfwSensitive ?? false),
        onlyRemoteFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.onlyRemote ?? false),
        onlyLocalFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.onlyLocal ?? false),
        onlyPinnedFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.onlyPinned ?? false),
        excludeReblogsFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.excludeReblogs ?? false),
        withMutedFieldBloc = FormBoolFieldBloc(
            originValue: originalSettings?.withMuted ?? false) {
    addDisposable(subject: _timelineSettingsSubject);

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
    var oldPreferences = timelineSettings;
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
      _timelineSettingsSubject.add(newPreferences);
    }
  }
}
