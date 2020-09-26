import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class TimelineSettingsFormBloc extends FormBloc
    implements ITimelineSettingsFormBloc {
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

  TimelineSettingsFormBloc({@required TimelineSettings originalSettings})
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
      excludeVisibilitiesStrings: oldPreferences.excludeVisibilitiesStrings,
      onlyInRemoteList: oldPreferences.onlyInRemoteList,
      withRemoteHashtag: oldPreferences.withRemoteHashtag,
      timelineSettingsReplyVisibilityFilterString:
          oldPreferences.timelineSettingsReplyVisibilityFilterString,
      onlyFromRemoteAccount: oldPreferences.onlyFromRemoteAccount,
      excludeReblogs: excludeReblogsFieldBloc.currentValue,
      onlyPinned: onlyPinnedFieldBloc.currentValue,
    );
    if (newPreferences != oldPreferences) {
      _timelineSettingsSubject.add(newPreferences);
    }
  }

  @override
  List<IFormItemBloc> get items => [
        onlyWithMediaFieldBloc,
        excludeNsfwSensitiveFieldBloc,
        excludeRepliesFieldBloc,
        onlyRemoteFieldBloc,
        onlyLocalFieldBloc,
        withMutedFieldBloc,
        excludeReblogsFieldBloc,
        onlyPinnedFieldBloc,
      ];

  @override
  void fill(TimelineSettings newSettings) {
    onlyWithMediaFieldBloc.changeCurrentValue(newSettings.onlyWithMedia);
    excludeNsfwSensitiveFieldBloc
        .changeCurrentValue(newSettings.excludeNsfwSensitive);
    excludeRepliesFieldBloc.changeCurrentValue(newSettings.excludeReplies);
    onlyRemoteFieldBloc.changeCurrentValue(newSettings.onlyRemote);
    onlyLocalFieldBloc.changeCurrentValue(newSettings.onlyLocal);
    withMutedFieldBloc.changeCurrentValue(newSettings.withMuted);
    excludeReblogsFieldBloc.changeCurrentValue(newSettings.excludeReblogs);
    onlyPinnedFieldBloc.changeCurrentValue(newSettings.onlyPinned);
  }
}
