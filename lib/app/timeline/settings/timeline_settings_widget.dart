import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_filter_support_extension.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_only_from_remote_account_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_only_in_remote_list_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_reply_visibility_form_field_row_widget.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineSettingsWidget extends StatelessWidget {
  final TimelineType type;
  final bool isNullablePossible;

  TimelineSettingsWidget({
    @required this.type,
    @required this.isNullablePossible,
  });

  @override
  Widget build(BuildContext context) {
    var settingsBloc = ITimelineSettingsFormBloc.of(context, listen: true);

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
          buildReplyVisibilityFilterField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.public:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
          buildOnlyRemoteField(context, settingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, settingsBloc, authInstance),
          buildReplyVisibilityFilterField(context, settingsBloc, authInstance),
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
      children: children,
    );
  }

  FormBoolFieldFormRowWidget buildWithMutedField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      label: tr("app.timeline.settings.field.with_muted.label"),
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
      label: tr("app.timeline.settings.field.only_with_media.label"),
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
      label: tr("app.timeline.settings.field.only_local.label"),
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
      label: tr("app.timeline.settings.field.only_remote.label"),
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
      label: tr("app.timeline.settings.field.only_pinned.label"),
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
      label: tr("app.timeline.settings.field.exclude_reblogs.label"),
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
      label: tr("app.timeline.settings.field.exclude_replies.label"),
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
      label: tr("app.timeline.settings.field.web_sockets_updates.label"),
      fieldBloc: settingsBloc.webSocketsUpdatesFieldBloc,
      isSupported: type.isWebSocketsUpdatesFilterSupportedOnInstance(context),
      errorDesc:
          tr("app.timeline.settings.field.web_sockets_updates.disabled.desc"),
    );
  }

  FormBoolFieldFormRowWidget buildExcludeNsfwField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      label: tr("app.timeline.settings.field.exclude_nsfw.label"),
      fieldBloc: settingsBloc.excludeNsfwSensitiveFieldBloc,
      isSupported:
          type.isExcludeNsfwSensitiveFilterSupportedOnInstance(authInstance),
    );
  }

  Widget buildReplyVisibilityFilterField(
    BuildContext context,
    ITimelineSettingsFormBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    // TODO: not supported in local repository yet
    return SizedBox.shrink();
    var isSupported =
        type.isReplyVisibilityFilterSupportedOnInstance(authInstance);

    return TimelineSettingsReplyVisibilityFormFieldRowWidget(
      formValueFieldBloc: settingsBloc.replyVisibilityFilterFieldBloc,
      enabled: isSupported,
      desc: isSupported
          ? null
          : "app.timeline.settings.field.not_supported.desc".tr(),
    );
  }

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
          : "app.timeline.settings.field.not_supported.desc".tr(),
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
          : "app.timeline.settings.field.not_supported.desc".tr(),
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
      label: "app.timeline.settings.with_remote_hashtag.field.label".tr(),
      autocorrect: false,
      hint: "app.timeline.settings.with_remote_hashtag.field.hint".tr(),
      formStringFieldBloc: settingsBloc.withRemoteHashtagFieldBloc,
      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }

  FormBoolFieldFormRowWidget buildBoolField({
    @required String label,
    @required IFormBoolFieldBloc fieldBloc,
    @required bool isSupported,
    String errorDesc,
  }) {
    return FormBoolFieldFormRowWidget(
      label: label,
      field: fieldBloc,
      enabled: isSupported,
      desc: isSupported
          ? null
          : errorDesc ?? "app.timeline.settings.field.not_supported.desc".tr(),
    );
  }
}
