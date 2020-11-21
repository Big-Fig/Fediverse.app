import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/list/list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_non_null_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("timeline_settings_form_bloc_impl.dart");

class TimelineSettingsFormBloc extends FormBloc
    implements ITimelineSettingsFormBloc {
  final BehaviorSubject<TimelineSettings> _timelineSettingsSubject;

  @override
  TimelineSettings get timelineSettings => _timelineSettingsSubject.value;

  @override
  Stream<TimelineSettings> get timelineSettingsStream =>
      _timelineSettingsSubject.stream;

  @override
  final IBoolValueFormFieldBloc onlyWithMediaFieldBloc;
  @override
  final IBoolValueFormFieldBloc excludeRepliesFieldBloc;
  @override
  final IBoolValueFormFieldBloc excludeNsfwSensitiveFieldBloc;

  @override
  final IBoolValueFormFieldBloc onlyRemoteFieldBloc;

  @override
  final IBoolValueFormFieldBloc onlyLocalFieldBloc;
  @override
  final IBoolValueFormFieldBloc onlyPinnedFieldBloc;

  @override
  final IBoolValueFormFieldBloc withMutedFieldBloc;

  @override
  final IBoolValueFormFieldBloc excludeReblogsFieldBloc;

  @override
  final IValueFormFieldBloc<PleromaAccount> onlyFromRemoteAccountFieldBloc;

  @override
  final IStringValueFormFieldBloc withRemoteHashtagFieldBloc;

  @override
  final IValueFormFieldBloc<PleromaList> onlyInRemoteListFieldBloc;

  @override
  final IValueFormFieldBloc<PleromaReplyVisibilityFilter>
      replyVisibilityFilterFieldBloc;

  @override
  ListValueFormFieldBloc<PleromaVisibility> excludeVisibilitiesFieldBloc;

  @override
  final IBoolValueFormFieldBloc webSocketsUpdatesFieldBloc;

  TimelineType type;

  TimelineSettingsFormBloc({
    @required TimelineSettings originalSettings,
    @required this.type,
  })  : _timelineSettingsSubject = BehaviorSubject.seeded(originalSettings),
        excludeRepliesFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.excludeReplies ?? false),
        onlyWithMediaFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.onlyWithMedia ?? false),
        excludeNsfwSensitiveFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.excludeNsfwSensitive ?? false),
        onlyRemoteFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.onlyRemote ?? false),
        onlyLocalFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.onlyLocal ?? false),
        onlyPinnedFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.onlyPinned ?? false),
        excludeReblogsFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.excludeReblogs ?? false),
        withMutedFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.withMuted ?? false),
        onlyFromRemoteAccountFieldBloc = ValueFormFieldBloc(
            originValue: originalSettings?.onlyFromRemoteAccount,
            validators: [
              (currentValue) {
                if (type != TimelineType.account || currentValue != null) {
                  return null;
                } else {
                  return StringValueFormFieldNonNullValidationError();
                }
              }
            ]),
        withRemoteHashtagFieldBloc = StringValueFormFieldBloc(
            originValue: originalSettings?.withRemoteHashtag,
            maxLength: 50,
            validators: [
              (currentValue) {
                if (type != TimelineType.hashtag ||
                    currentValue?.isNotEmpty == true) {
                  return null;
                } else {
                  return StringValueFormFieldNonNullValidationError();
                }
              },
            ]),
        onlyInRemoteListFieldBloc = ValueFormFieldBloc(
            originValue: originalSettings?.onlyInRemoteList,
            validators: [
              (currentValue) {
                if (type != TimelineType.customList || currentValue != null) {
                  return null;
                } else {
                  return StringValueFormFieldNonNullValidationError();
                }
              }
            ]),
        replyVisibilityFilterFieldBloc = ValueFormFieldBloc(
            originValue: originalSettings?.replyVisibilityFilter,
            validators: []),
        excludeVisibilitiesFieldBloc = ListValueFormFieldBloc(
            originValue: originalSettings?.excludeVisibilities, validators: []),
        webSocketsUpdatesFieldBloc = BoolValueFormFieldBloc(
            originValue: originalSettings?.webSocketsUpdates ?? true) {
    addDisposable(subject: _timelineSettingsSubject);

    addDisposable(disposable: excludeRepliesFieldBloc);
    addDisposable(disposable: onlyWithMediaFieldBloc);
    addDisposable(disposable: excludeNsfwSensitiveFieldBloc);
    addDisposable(disposable: onlyRemoteFieldBloc);
    addDisposable(disposable: onlyLocalFieldBloc);
    addDisposable(disposable: excludeReblogsFieldBloc);
    addDisposable(disposable: withMutedFieldBloc);

    addDisposable(disposable: onlyFromRemoteAccountFieldBloc);
    addDisposable(disposable: withRemoteHashtagFieldBloc);
    addDisposable(disposable: onlyInRemoteListFieldBloc);
    addDisposable(disposable: replyVisibilityFilterFieldBloc);
    addDisposable(disposable: excludeVisibilitiesFieldBloc);

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

    addDisposable(streamSubscription:
        onlyFromRemoteAccountFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        withRemoteHashtagFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        onlyInRemoteListFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        replyVisibilityFilterFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
    addDisposable(streamSubscription:
        excludeVisibilitiesFieldBloc.currentValueStream.listen((_) {
      _onSomethingChanged();
    }));
  }

  void _onSomethingChanged() {
    var oldPreferences = timelineSettings;


    var oldOnlyRemote = oldPreferences.onlyRemote;
    var oldOnlyLocal = oldPreferences.onlyLocal;
    
    var newOnlyRemote = onlyRemoteFieldBloc.currentValue;
    var newOnlyLocal = onlyLocalFieldBloc.currentValue;
    
    if(newOnlyRemote == true && oldOnlyRemote == false) {
      newOnlyLocal = false;
      onlyLocalFieldBloc.changeCurrentValue(newOnlyLocal);
    }

    if(newOnlyLocal == true && oldOnlyLocal == false) {
      newOnlyRemote = false;
      onlyRemoteFieldBloc.changeCurrentValue(newOnlyRemote);
    }

    
    var newPreferences = TimelineSettings(
        onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
        excludeNsfwSensitive: excludeNsfwSensitiveFieldBloc.currentValue,
        excludeReplies: excludeRepliesFieldBloc.currentValue,
        onlyRemote: newOnlyRemote,
        onlyLocal: newOnlyLocal,
        withMuted: withMutedFieldBloc.currentValue,
        excludeVisibilitiesStrings: excludeVisibilitiesFieldBloc.currentValue
            ?.map((visibility) => visibility.toJsonValue())
            ?.toList(),
        onlyInRemoteList: onlyInRemoteListFieldBloc.currentValue,
        withRemoteHashtag: withRemoteHashtagFieldBloc.currentValue,
        replyVisibilityFilterString:
            replyVisibilityFilterFieldBloc.currentValue?.toJsonValue(),
        onlyFromRemoteAccount: onlyFromRemoteAccountFieldBloc.currentValue,
        excludeReblogs: excludeReblogsFieldBloc.currentValue,
        onlyPinned: onlyPinnedFieldBloc.currentValue,
        webSocketsUpdates: webSocketsUpdatesFieldBloc.currentValue);
    var changed = newPreferences != oldPreferences;
    _logger.finest(() => "_onSomethingChanged $changed");
    if (changed) {
      _timelineSettingsSubject.add(newPreferences);
    }
  }

  @override
  List<IFormItemBloc> get currentItems => [
        onlyWithMediaFieldBloc,
        excludeNsfwSensitiveFieldBloc,
        excludeRepliesFieldBloc,
        onlyRemoteFieldBloc,
        onlyLocalFieldBloc,
        withMutedFieldBloc,
        excludeReblogsFieldBloc,
        onlyPinnedFieldBloc,
        onlyFromRemoteAccountFieldBloc,
        withRemoteHashtagFieldBloc,
        onlyInRemoteListFieldBloc,
        replyVisibilityFilterFieldBloc,
        excludeVisibilitiesFieldBloc,
      ];

  @override
  void fill({
    @required TimelineType type,
    @required TimelineSettings newSettings,
  }) {
    this.type = type;

    // todo: refactor
    withRemoteHashtagFieldBloc.updateValidators([
      (currentValue) {
        if (type != TimelineType.hashtag || currentValue?.isNotEmpty == true) {
          return null;
        } else {
          return StringValueFormFieldNonNullValidationError();
        }
      }
    ]);
    onlyInRemoteListFieldBloc.updateValidators([
      (currentValue) {
        if (type != TimelineType.customList || currentValue != null) {
          return null;
        } else {
          return StringValueFormFieldNonNullValidationError();
        }
      }
    ]);
    onlyFromRemoteAccountFieldBloc.updateValidators([
      (currentValue) {
        if (type != TimelineType.account || currentValue != null) {
          return null;
        } else {
          return StringValueFormFieldNonNullValidationError();
        }
      }
    ]);

    onlyWithMediaFieldBloc.changeCurrentValue(newSettings.onlyWithMedia);
    excludeNsfwSensitiveFieldBloc
        .changeCurrentValue(newSettings.excludeNsfwSensitive);
    excludeRepliesFieldBloc.changeCurrentValue(newSettings.excludeReplies);
    onlyRemoteFieldBloc.changeCurrentValue(newSettings.onlyRemote);
    onlyLocalFieldBloc.changeCurrentValue(newSettings.onlyLocal);
    withMutedFieldBloc.changeCurrentValue(newSettings.withMuted);
    excludeReblogsFieldBloc.changeCurrentValue(newSettings.excludeReblogs);
    onlyPinnedFieldBloc.changeCurrentValue(newSettings.onlyPinned);

    onlyFromRemoteAccountFieldBloc
        .changeCurrentValue(newSettings.onlyFromRemoteAccount);
    onlyFromRemoteAccountFieldBloc
        .changeCurrentValue(newSettings.onlyFromRemoteAccount);
    withRemoteHashtagFieldBloc
        .changeCurrentValue(newSettings.withRemoteHashtag);
    onlyInRemoteListFieldBloc.changeCurrentValue(newSettings.onlyInRemoteList);
    replyVisibilityFilterFieldBloc
        .changeCurrentValue(newSettings.replyVisibilityFilter);
    excludeVisibilitiesFieldBloc
        .changeCurrentValue(newSettings.excludeVisibilities);
  }
}
