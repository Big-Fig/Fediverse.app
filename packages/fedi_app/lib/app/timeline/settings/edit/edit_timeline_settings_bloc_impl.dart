import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi_app/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc_impl.dart';
import 'package:fedi_app/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc_impl.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_filter_support_extension.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/validation/value_form_field_non_null_validation.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditTimelineSettingsBloc
    extends EditInstanceSettingsBloc<TimelineSettings?>
    implements IEditTimelineSettingsBloc {
  final IUnifediApiInstance unifediApiInstance;
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
  final ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc
      replyVisibilityFilterFieldBloc;

  @override
  IStatusVisibilityMultiSelectFromListFormFieldBloc
      excludeVisibilitiesFieldBloc;

  @override
  final IBoolValueFormFieldBloc webSocketsUpdatesFieldBloc;

  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  @override
  final IStringValueFormFieldBloc onlyFromInstanceFieldBloc;

  @override
  final InstanceLocation instanceLocation;

  EditTimelineSettingsBloc({
    required ITimelineSettingsBloc settingsBloc,
    required this.timelineType,
    required this.unifediApiInstance,
    required this.isNullableValuesPossible,
    required this.instanceLocation,
    required bool isEnabled,
    required this.webSocketsSettingsBloc,
  })  : excludeRepliesFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeReplies ?? false,
          isEnabled: timelineType
              .isExcludeRepliesFilterSupportedOnInstance(unifediApiInstance),
        ),
        onlyWithMediaFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyWithMedia ?? false,
          isEnabled: timelineType
              .isOnlyWithMediaFilterSupportedOnInstance(unifediApiInstance),
        ),
        excludeNsfwSensitiveFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeNsfwSensitive ?? false,
          isEnabled:
              timelineType.isExcludeNsfwSensitiveFilterSupportedOnInstance(
            unifediApiInstance,
          ),
        ),
        onlyRemoteFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyRemote ?? false,
          isEnabled: timelineType
              .isOnlyRemoteFilterSupportedOnInstance(unifediApiInstance),
        ),
        onlyLocalFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyLocal ?? false,
          isEnabled: timelineType
              .isOnlyLocalFilterSupportedOnInstance(unifediApiInstance),
        ),
        onlyPinnedFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyPinned ?? false,
          isEnabled: timelineType
              .isOnlyPinnedFilterSupportedOnInstance(unifediApiInstance),
        ),
        excludeReblogsFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeReblogs ?? false,
          isEnabled: timelineType
              .isExcludeReblogsSupportedOnInstance(unifediApiInstance),
        ),
        withMutedFieldBloc = BoolValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.withMuted ?? false,
          isEnabled: timelineType
              .isWithMutedFilterSupportedOnInstance(unifediApiInstance),
        ),
        onlyFromAccountFieldBloc = TimelineSettingsOnlyFromAccountFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyFromRemoteAccount,
          isNullValuePossible:
              isNullableValuesPossible || timelineType != TimelineType.account,
          isEnabled: timelineType
              .isOnlyFromAccountWithRemoteIdFilterSupportedOnInstance(
            unifediApiInstance,
          ),
          validators: [
            if (timelineType == TimelineType.account)
              ValueFormFieldNonNullValidationError.createValidator(),
          ],
        ),
        onlyInCustomListFieldBloc =
            TimelineSettingsOnlyInCustomListFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyInRemoteList,
          isNullValuePossible: isNullableValuesPossible,
          isEnabled:
              timelineType.isOnlyInListWithRemoteIdFilterSupportedOnInstance(
            unifediApiInstance,
          ),
          validators: [
            if (timelineType == TimelineType.customList)
              ValueFormFieldNonNullValidationError.createValidator(),
          ],
        ),
        withRemoteHashtagFieldBloc = StringValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.withRemoteHashtag ?? '',
          // ignore: no-magic-number
          maxLength: 50,
          isEnabled: timelineType
              .isWithHashtagFilterSupportedOnInstance(unifediApiInstance),
          validators: [
            if (timelineType == TimelineType.hashtag)
              ValueFormFieldNonNullValidationError.createValidator(),
          ],
        ),
        replyVisibilityFilterFieldBloc =
            TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.replyVisibilityFilter,
          isEnabled: timelineType
              .isReplyVisibilityFilterSupportedOnInstance(unifediApiInstance),
          validators: [],
          isNullValuePossible: true,
        ),
        excludeVisibilitiesFieldBloc =
            StatusVisibilityMultiSelectFromListFormFieldBloc(
          originValue: settingsBloc.settingsData?.excludeVisibilities ?? [],
          isEnabled:
              timelineType.isExcludeVisibilitiesFilterSupportedOnInstance(
            unifediApiInstance,
          ),
          validators: [],
          isNullValuePossible: true,
        ),
        webSocketsUpdatesFieldBloc = BoolValueFormFieldBloc(
          originValue: (settingsBloc.settingsData?.webSocketsUpdates ?? true) &&
              webSocketsSettingsBloc.isEnabled,
          isEnabled: timelineType.isWebSocketsUpdatesFilterSupportedOnInstance(
                unifediApiInstance,
              ) &&
              webSocketsSettingsBloc.isEnabled &&
              instanceLocation == InstanceLocation.local,
        ),
        onlyFromInstanceFieldBloc = StringValueFormFieldBloc(
          originValue: settingsBloc.settingsData?.onlyFromInstance ?? '',
          // ignore: no-magic-number
          maxLength: 50,
          isEnabled: timelineType
              .isOnlyFromInstanceFilterSupportedOnInstance(unifediApiInstance),
          validators: [],
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: settingsBloc,
          isAllItemsInitialized: true,
        ) {
    addDisposable(excludeRepliesFieldBloc);
    addDisposable(onlyWithMediaFieldBloc);
    addDisposable(excludeNsfwSensitiveFieldBloc);
    addDisposable(onlyRemoteFieldBloc);
    addDisposable(onlyLocalFieldBloc);
    addDisposable(excludeReblogsFieldBloc);
    addDisposable(withMutedFieldBloc);

    addDisposable(onlyFromAccountFieldBloc);
    addDisposable(withRemoteHashtagFieldBloc);
    addDisposable(onlyInCustomListFieldBloc);
    addDisposable(replyVisibilityFilterFieldBloc);
    addDisposable(excludeVisibilitiesFieldBloc);
    addDisposable(onlyFromInstanceFieldBloc);
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
        onlyFromInstanceFieldBloc,
      ];

  @override
  TimelineSettings calculateCurrentFormFieldsSettings() {
    var oldPreferences = settingsBloc.settingsData;

    var onlyFromInstanceExist =
        onlyFromInstanceFieldBloc.currentValue.isNotEmpty;

    var oldOnlyRemote = oldPreferences?.onlyRemote;
    var oldOnlyLocal = oldPreferences?.onlyLocal;

    var newOnlyRemote = onlyRemoteFieldBloc.currentValue;
    var newOnlyLocal = onlyLocalFieldBloc.currentValue;

    if (newOnlyLocal == true && oldOnlyLocal == false) {
      onlyFromInstanceExist = false;
      onlyFromInstanceFieldBloc.textEditingController.text = '';
      newOnlyRemote = false;
      onlyRemoteFieldBloc.changeCurrentValue(newOnlyRemote);
    }
    if (newOnlyRemote != true) {
      if (onlyFromInstanceExist) {
        newOnlyRemote = true;
        onlyRemoteFieldBloc.changeCurrentValue(newOnlyRemote);
      }
    }

    if (newOnlyRemote == true && oldOnlyRemote == false) {
      newOnlyLocal = false;
      onlyLocalFieldBloc.changeCurrentValue(newOnlyLocal);
    }

    return TimelineSettings(
      onlyWithMedia: onlyWithMediaFieldBloc.currentValue,
      excludeNsfwSensitive: excludeNsfwSensitiveFieldBloc.currentValue,
      excludeReplies: excludeRepliesFieldBloc.currentValue,
      onlyRemote: newOnlyRemote,
      onlyLocal: newOnlyLocal,
      withMuted: withMutedFieldBloc.currentValue,
      excludeVisibilitiesStrings: excludeVisibilitiesFieldBloc.currentValue
          .map((e) => e.stringValue)
          .toList(),
      onlyInRemoteList:
          onlyInCustomListFieldBloc.currentValue?.toUnifediApiList(),
      withRemoteHashtag: withRemoteHashtagFieldBloc.currentValue,
      replyVisibilityFilterString:
          replyVisibilityFilterFieldBloc.currentValue?.stringValue,
      onlyFromRemoteAccount:
          onlyFromAccountFieldBloc.currentValue?.toUnifediApiAccount(),
      excludeReblogs: excludeReblogsFieldBloc.currentValue,
      onlyPinned: onlyPinnedFieldBloc.currentValue,
      webSocketsUpdates: webSocketsUpdatesFieldBloc.currentValue,
      onlyFromInstance: onlyFromInstanceFieldBloc.currentValue,
    );
  }

  @override
  Future<void> fillSettingsToFormFields(TimelineSettings? settings) async {
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
    withRemoteHashtagFieldBloc
        .changeCurrentValue(settings.withRemoteHashtag ?? '');
    onlyInCustomListFieldBloc.changeCurrentValue(settings.onlyInRemoteList);
    replyVisibilityFilterFieldBloc
        .changeCurrentValue(settings.replyVisibilityFilter);
    excludeVisibilitiesFieldBloc
        .changeCurrentValue(settings.excludeVisibilities ?? []);
  }
}
