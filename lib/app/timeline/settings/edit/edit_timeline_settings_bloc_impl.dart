import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_filter_support_extension.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/list/list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/validation/value_form_field_non_null_validation.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';

class EditTimelineSettingsBloc
    extends EditInstanceSettingsBloc<TimelineSettings>
    implements IEditTimelineSettingsBloc {
  final AuthInstance authInstance;
  @override
  final TimelineType timelineType;
  @override
  final bool isNullableValuesPossible;

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
  final ITimelineSettingsOnlyFromAccountFormFieldBloc onlyFromAccountFieldBloc;

  @override
  final IStringValueFormFieldBloc withRemoteHashtagFieldBloc;

  @override
  final ITimelineSettingsOnlyInCustomListFormFieldBloc
      onlyInCustomListFieldBloc;

  @override
  final IValueFormFieldBloc<PleromaReplyVisibilityFilter>
      replyVisibilityFilterFieldBloc;

  @override
  ListValueFormFieldBloc<PleromaVisibility> excludeVisibilitiesFieldBloc;

  @override
  final IBoolValueFormFieldBloc webSocketsUpdatesFieldBloc;

  @override
  final ITimelineSettingsBloc settingsBloc;

  EditTimelineSettingsBloc({
    @required this.settingsBloc,
    @required this.timelineType,
    @required this.authInstance,
    @required this.isNullableValuesPossible,
    @required bool isEnabled,
  })  : excludeRepliesFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeReplies ?? false,
          isEnabled: timelineType
              .isExcludeRepliesFilterSupportedOnInstance(authInstance),
        ),
        onlyWithMediaFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyWithMedia ?? false,
          isEnabled: timelineType
              .isOnlyWithMediaFilterSupportedOnInstance(authInstance),
        ),
        excludeNsfwSensitiveFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeNsfwSensitive ?? false,
          isEnabled: timelineType
              .isExcludeNsfwSensitiveFilterSupportedOnInstance(authInstance),
        ),
        onlyRemoteFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyRemote ?? false,
          isEnabled:
              timelineType.isOnlyRemoteFilterSupportedOnInstance(authInstance),
        ),
        onlyLocalFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyLocal ?? false,
          isEnabled:
              timelineType.isOnlyLocalFilterSupportedOnInstance(authInstance),
        ),
        onlyPinnedFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyPinned ?? false,
          isEnabled:
              timelineType.isOnlyPinnedFilterSupportedOnInstance(authInstance),
        ),
        excludeReblogsFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeReblogs ?? false,
          isEnabled:
              timelineType.isExcludeReblogsSupportedOnInstance(authInstance),
        ),
        withMutedFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.withMuted ?? false,
          isEnabled:
              timelineType.isWithMutedFilterSupportedOnInstance(authInstance),
        ),
        onlyFromAccountFieldBloc = TimelineSettingsOnlyFromAccountFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyFromRemoteAccount,
          isEnabled: timelineType
              .isOnlyFromAccountWithRemoteIdFilterSupportedOnInstance(
                  authInstance),
          validators: [
            if (timelineType == TimelineType.account)
              ValueFormFieldNonNullValidationError.createValidator(),
          ],
        ),
        onlyInCustomListFieldBloc =
            TimelineSettingsOnlyInCustomListFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyInRemoteList,
          isEnabled: timelineType
              .isOnlyInListWithRemoteIdFilterSupportedOnInstance(authInstance),
          validators: [
            if (timelineType == TimelineType.customList)
              ValueFormFieldNonNullValidationError.createValidator(),
          ],
        ),
        withRemoteHashtagFieldBloc = StringValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.withRemoteHashtag,
          maxLength: 50,
          isEnabled:
              timelineType.isWithHashtagFilterSupportedOnInstance(authInstance),
          validators: [
            if (timelineType == TimelineType.hashtag)
              ValueFormFieldNonNullValidationError.createValidator(),
          ],
        ),
        replyVisibilityFilterFieldBloc = ValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.replyVisibilityFilter,
          isEnabled: timelineType
              .isReplyVisibilityFilterSupportedOnInstance(authInstance),
          validators: [],
          isNullValuePossible: true,
        ),
        excludeVisibilitiesFieldBloc = ListValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeVisibilities,
          isEnabled: timelineType
              .isExcludeVisibilitiesFilterSupportedOnInstance(authInstance),
          validators: [],
          isNullValuePossible: true,
        ),
        webSocketsUpdatesFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.webSocketsUpdates ?? true,
          isEnabled: timelineType
              .isWebSocketsUpdatesFilterSupportedOnInstance(authInstance),
        ),
        super(
          isEnabled,
          settingsBloc,
          true,
        ) {
    addDisposable(disposable: excludeRepliesFieldBloc);
    addDisposable(disposable: onlyWithMediaFieldBloc);
    addDisposable(disposable: excludeNsfwSensitiveFieldBloc);
    addDisposable(disposable: onlyRemoteFieldBloc);
    addDisposable(disposable: onlyLocalFieldBloc);
    addDisposable(disposable: excludeReblogsFieldBloc);
    addDisposable(disposable: withMutedFieldBloc);

    addDisposable(disposable: onlyFromAccountFieldBloc);
    addDisposable(disposable: withRemoteHashtagFieldBloc);
    addDisposable(disposable: onlyInCustomListFieldBloc);
    addDisposable(disposable: replyVisibilityFilterFieldBloc);
    addDisposable(disposable: excludeVisibilitiesFieldBloc);
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
        onlyFromAccountFieldBloc,
        withRemoteHashtagFieldBloc,
        onlyInCustomListFieldBloc,
        replyVisibilityFilterFieldBloc,
        excludeVisibilitiesFieldBloc,
      ];

  @override
  TimelineSettings calculateCurrentFormFieldsSettings() => TimelineSettings(
      onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
      excludeNsfwSensitive: excludeNsfwSensitiveFieldBloc.currentValue,
      excludeReplies: excludeRepliesFieldBloc.currentValue,
      onlyRemote: onlyRemoteFieldBloc.currentValue,
      onlyLocal: onlyLocalFieldBloc.currentValue,
      withMuted: withMutedFieldBloc.currentValue,
      excludeVisibilitiesStrings: excludeVisibilitiesFieldBloc.currentValue
          ?.map((visibility) => visibility.toJsonValue())
          ?.toList(),
      onlyInRemoteList: onlyInCustomListFieldBloc.currentValue,
      withRemoteHashtag: withRemoteHashtagFieldBloc.currentValue,
      replyVisibilityFilterString:
          replyVisibilityFilterFieldBloc.currentValue?.toJsonValue(),
      onlyFromRemoteAccount: onlyFromAccountFieldBloc.currentValue,
      excludeReblogs: excludeReblogsFieldBloc.currentValue,
      onlyPinned: onlyPinnedFieldBloc.currentValue,
      webSocketsUpdates: webSocketsUpdatesFieldBloc.currentValue);

  @override
  Future fillSettingsToFormFields(TimelineSettings settings) async {
    if (settings == null) {
      return;
    }
    onlyWithMediaFieldBloc.changeCurrentValue(settings.onlyWithMedia);
    excludeNsfwSensitiveFieldBloc
        .changeCurrentValue(settings.excludeNsfwSensitive);
    excludeRepliesFieldBloc.changeCurrentValue(settings.excludeReplies);
    onlyRemoteFieldBloc.changeCurrentValue(settings.onlyRemote);
    onlyLocalFieldBloc.changeCurrentValue(settings.onlyLocal);
    withMutedFieldBloc.changeCurrentValue(settings.withMuted);
    excludeReblogsFieldBloc.changeCurrentValue(settings.excludeReblogs);
    onlyPinnedFieldBloc.changeCurrentValue(settings.onlyPinned);

    onlyFromAccountFieldBloc.changeCurrentValue(settings.onlyFromRemoteAccount);
    onlyFromAccountFieldBloc.changeCurrentValue(settings.onlyFromRemoteAccount);
    withRemoteHashtagFieldBloc.changeCurrentValue(settings.withRemoteHashtag);
    onlyInCustomListFieldBloc.changeCurrentValue(settings.onlyInRemoteList);
    replyVisibilityFilterFieldBloc
        .changeCurrentValue(settings.replyVisibilityFilter);
    excludeVisibilitiesFieldBloc
        .changeCurrentValue(settings.excludeVisibilities);
  }
}
