import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_filter_support_extension.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_only_from_remote_account_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_only_in_remote_list_form_field_row_widget.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineSettingsWidget extends StatelessWidget {
  final TimelineType type;
  final bool isNullablePossible;
  final bool shrinkWrap;

  TimelineSettingsWidget({
    @required this.type,
    @required this.isNullablePossible,
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var settingsBloc = ITimelineSettingsFormBloc.of(context, listen: false);

    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var authInstance = currentAuthInstanceBloc.currentInstance;

    List<Widget> children;

    switch (type) {
      case TimelineType.home:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, settingsBloc, authInstance),
          // buildReplyVisibilityFilterField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.public:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
          buildOnlyRemoteField(context, settingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, settingsBloc, authInstance),
          // buildReplyVisibilityFilterField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.customList:
        children = [
          buildCustomListField(context, settingsBloc, authInstance),
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, settingsBloc, authInstance),
        ];
        break;

      case TimelineType.hashtag:
        children = [
          buildHashtagField(context, settingsBloc, authInstance),
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.account:
        children = [
          buildAccountField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyPinnedField(context, settingsBloc, authInstance),
          buildExcludeReblogsField(context, settingsBloc, authInstance),
          buildExcludeRepliesField(context, settingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, settingsBloc, authInstance),
          buildHashtagField(context, settingsBloc, authInstance),
        ];
        break;

      default:
        throw "Invalid timelineType $type";
    }

    return ListView(
      shrinkWrap: shrinkWrap,
      children: children,
    );
  }

  FormBoolFieldFormRowWidget buildWithMutedField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_withMuted_label,
      fieldBloc: settingsBloc.withMutedFieldBloc,
      isSupported: type.isWithMutedFilterSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildOnlyMediaField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyWithMedia_label,
      fieldBloc: settingsBloc.onlyWithMediaFieldBloc,
      isSupported: type.isOnlyWithMediaFilterSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildOnlyLocalField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyLocal_label,
      fieldBloc: settingsBloc.onlyLocalFieldBloc,
      isSupported: type.isOnlyLocalFilterSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildOnlyRemoteField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyRemote_label,
      fieldBloc: settingsBloc.onlyRemoteFieldBloc,
      isSupported: type.isOnlyRemoteFilterSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildOnlyPinnedField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyPinned_label,
      fieldBloc: settingsBloc.onlyPinnedFieldBloc,
      isSupported: type.isOnlyPinnedFilterSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildExcludeReblogsField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_excludeReblogs_label,
      fieldBloc: settingsBloc.excludeReblogsFieldBloc,
      isSupported: type.isExcludeReblogsSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildExcludeRepliesField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_excludeReplies_label,
      fieldBloc: settingsBloc.excludeRepliesFieldBloc,
      isSupported: type.isExcludeRepliesFilterSupportedOnInstance(authInstance),
    );
  }

  FormBoolFieldFormRowWidget buildWebSocketsUpdatesField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label:
          S.of(context).app_timeline_settings_field_enableWebSockets_label,
      fieldBloc: settingsBloc.webSocketsUpdatesFieldBloc,
      isSupported: type.isWebSocketsUpdatesFilterSupportedOnInstance(context),
      errorDesc: S
          .of(context)
          .app_timeline_settings_field_enableWebSockets_description,
    );
  }

  FormBoolFieldFormRowWidget buildExcludeNsfwField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_excludeNsfw_label,
      fieldBloc: settingsBloc.excludeNsfwSensitiveFieldBloc,
      isSupported:
          type.isExcludeNsfwSensitiveFilterSupportedOnInstance(authInstance),
    );
  }

  // Widget buildReplyVisibilityFilterField(
  //   BuildContext context,
  //   ITimelineSettingsFormBloc settingsBloc,
  //   AuthInstance authInstance,
  // ) {
  //   // TODO: not supported in local repository yet
  //   return SizedBox.shrink();
  //   var isSupported =
  //       type.isReplyVisibilityFilterSupportedOnInstance(authInstance);
  //
  //   return TimelineSettingsReplyVisibilityFormFieldRowWidget(
  //     formValueFieldBloc: settingsBloc.replyVisibilityFilterFieldBloc,
  //     enabled: isSupported,
  //     desc: isSupported
  //         ? null
  //         : "app.timeline.settings.field.not_supported.desc".tr(),
  //   );
  // }

  Widget buildCustomListField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    var isSupported =
        type.isOnlyInListWithRemoteIdFilterSupportedOnInstance(authInstance);

    return TimelineSettingsOnlyInRemoteListFormFieldRowWidget(
      formValueFieldBloc: settingsBloc.onlyInRemoteListFieldBloc,
      enabled: isSupported,
      desc: isSupported
          ? null
          : S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
      nullable: isNullablePossible,
    );
  }

  Widget buildAccountField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    var isSupported = type
        .isOnlyFromAccountWithRemoteIdFilterSupportedOnInstance(authInstance);

    return TimelineSettingsOnlyFromRemoteAccountFormFieldRowWidget(
      formValueFieldBloc: settingsBloc.onlyFromRemoteAccountFieldBloc,
      enabled: isSupported,
      desc: isSupported
          ? null
          : S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
      nullable: isNullablePossible,
    );
  }

  Widget buildHashtagField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    var isSupported = type.isWithHashtagFilterSupportedOnInstance(authInstance);

    return FormStringFieldFormRowWidget(
      enabled: isSupported,
      label: S.of(context).app_timeline_settings_withRemoteHashtag_field_label,
      autocorrect: false,
      hint: S.of(context).app_timeline_settings_withRemoteHashtag_field_hint,
      formStringFieldBloc: settingsBloc.withRemoteHashtagFieldBloc,
      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }

  FormBoolFieldFormRowWidget buildBoolField({
    @required BuildContext context,
    @required String label,
    @required IFormBoolFieldBloc fieldBloc,
    @required bool isSupported,
    String errorDesc,
  }) {
    return FormBoolFieldFormRowWidget(
      label: label,
      field: fieldBloc,
      enabled: isSupported,
      description: isSupported
          ? null
          : S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
    );
  }
}
