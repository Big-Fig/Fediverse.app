import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/list/form_list_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_non_null_value_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
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

  @override
  final IFormValueFieldBloc<PleromaAccount> onlyFromRemoteAccountFieldBloc;

  @override
  final IFormStringFieldBloc withRemoteHashtagFieldBloc;

  @override
  final IFormValueFieldBloc<PleromaList> onlyInRemoteListFieldBloc;

  @override
  final IFormValueFieldBloc<PleromaReplyVisibilityFilter>
      replyVisibilityFilterFieldBloc;

  @override
  FormListValueFieldBloc<PleromaVisibility> excludeVisibilitiesFieldBloc;

  @override
  final IFormBoolFieldBloc webSocketsUpdatesFieldBloc;

  TimelineType type;

  TimelineSettingsFormBloc({
    @required TimelineSettings originalSettings,
    @required this.type,
  })  : _timelineSettingsSubject = BehaviorSubject.seeded(originalSettings),
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
            originValue: originalSettings?.withMuted ?? false),
        onlyFromRemoteAccountFieldBloc = FormValueFieldBloc(
            originValue: originalSettings?.onlyFromRemoteAccount,
            validators: [
              (currentValue) {
                if (type != TimelineType.account || currentValue != null) {
                  return null;
                } else {
                  return FormNonNullValueFieldValidationError();
                }
              }
            ]),
        withRemoteHashtagFieldBloc = FormStringFieldBloc(
            originValue: originalSettings?.withRemoteHashtag,
            maxLength: 50,
            validators: [
              (currentValue) {
                if (type != TimelineType.hashtag ||
                    currentValue?.isNotEmpty == true) {
                  return null;
                } else {
                  return FormNonNullValueFieldValidationError();
                }
              },
            ]),
        onlyInRemoteListFieldBloc = FormValueFieldBloc(
            originValue: originalSettings?.onlyInRemoteList,
            validators: [
              (currentValue) {
                if (type != TimelineType.customList || currentValue != null) {
                  return null;
                } else {
                  return FormNonNullValueFieldValidationError();
                }
              }
            ]),
        replyVisibilityFilterFieldBloc = FormValueFieldBloc(
            originValue: originalSettings?.replyVisibilityFilter,
            validators: []),
        excludeVisibilitiesFieldBloc = FormListValueFieldBloc(
            originValue: originalSettings?.excludeVisibilities, validators: []),
        webSocketsUpdatesFieldBloc = FormBoolFieldBloc(
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
    var newPreferences = TimelineSettings(
      onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
      excludeNsfwSensitive: excludeNsfwSensitiveFieldBloc.currentValue,
      excludeReplies: excludeRepliesFieldBloc.currentValue,
      onlyRemote: onlyRemoteFieldBloc.currentValue,
      onlyLocal: onlyLocalFieldBloc.currentValue,
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
      webSocketsUpdates: webSocketsUpdatesFieldBloc.currentValue
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
          return FormNonNullValueFieldValidationError();
        }
      }
    ]);
    onlyInRemoteListFieldBloc.updateValidators([
      (currentValue) {
        if (type != TimelineType.customList || currentValue != null) {
          return null;
        } else {
          return FormNonNullValueFieldValidationError();
        }
      }
    ]);
    onlyFromRemoteAccountFieldBloc.updateValidators([
      (currentValue) {
        if (type != TimelineType.account || currentValue != null) {
          return null;
        } else {
          return FormNonNullValueFieldValidationError();
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
