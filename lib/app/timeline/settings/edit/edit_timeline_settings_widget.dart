import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_row_widget.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTimelineSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditTimelineSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editSettingsBloc = IEditTimelineSettingsBloc.of(context);

    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);

    var authInstance = currentAuthInstanceBloc.currentInstance;

    List<Widget> children;

    var timelineType = editSettingsBloc.timelineType;
    switch (timelineType) {
      case TimelineType.home:
        children = [
          buildWithMutedField(context, editSettingsBloc, authInstance),
          buildOnlyMediaField(context, editSettingsBloc, authInstance),
          buildOnlyLocalField(context, editSettingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, editSettingsBloc, authInstance),
          // buildReplyVisibilityFilterField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.public:
        children = [
          buildWithMutedField(context, editSettingsBloc, authInstance),
          buildOnlyMediaField(context, editSettingsBloc, authInstance),
          buildOnlyLocalField(context, editSettingsBloc, authInstance),
          buildOnlyRemoteField(context, editSettingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, editSettingsBloc, authInstance),
          // buildReplyVisibilityFilterField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.customList:
        children = [
          buildCustomListField(context, editSettingsBloc, authInstance),
          buildWithMutedField(context, editSettingsBloc, authInstance),
          buildOnlyMediaField(context, editSettingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, editSettingsBloc, authInstance),
        ];
        break;

      case TimelineType.hashtag:
        children = [
          buildHashtagField(context, editSettingsBloc, authInstance),
          buildWithMutedField(context, editSettingsBloc, authInstance),
          buildOnlyMediaField(context, editSettingsBloc, authInstance),
          buildOnlyLocalField(context, editSettingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, editSettingsBloc, authInstance),
        ];
        break;
      case TimelineType.account:
        children = [
          buildAccountField(context, editSettingsBloc, authInstance),
          buildOnlyMediaField(context, editSettingsBloc, authInstance),
          buildOnlyPinnedField(context, editSettingsBloc, authInstance),
          buildExcludeReblogsField(context, editSettingsBloc, authInstance),
          buildExcludeRepliesField(context, editSettingsBloc, authInstance),
          buildWebSocketsUpdatesField(context, editSettingsBloc, authInstance),
          buildHashtagField(context, editSettingsBloc, authInstance),
        ];
        break;

      default:
        throw "Invalid timelineType $timelineType";
    }

    return ListView(
      shrinkWrap: shrinkWrap,
      children: children,
    );
  }

  Widget buildWithMutedField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_withMuted_label,
      fieldBloc: settingsBloc.withMutedFieldBloc,
    );
  }

  Widget buildOnlyMediaField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyWithMedia_label,
      fieldBloc: settingsBloc.onlyWithMediaFieldBloc,
    );
  }

  Widget buildOnlyLocalField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyLocal_label,
      fieldBloc: settingsBloc.onlyLocalFieldBloc,
    );
  }

  Widget buildOnlyRemoteField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyRemote_label,
      fieldBloc: settingsBloc.onlyRemoteFieldBloc,
    );
  }

  Widget buildOnlyPinnedField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_onlyPinned_label,
      fieldBloc: settingsBloc.onlyPinnedFieldBloc,
    );
  }

  Widget buildExcludeReblogsField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_excludeReblogs_label,
      fieldBloc: settingsBloc.excludeReblogsFieldBloc,
    );
  }

  Widget buildExcludeRepliesField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_excludeReplies_label,
      fieldBloc: settingsBloc.excludeRepliesFieldBloc,
    );
  }

  Widget buildWebSocketsUpdatesField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_enableWebSockets_label,
      fieldBloc: settingsBloc.webSocketsUpdatesFieldBloc,
      description: S
          .of(context)
          .app_timeline_settings_field_enableWebSockets_description,
    );
  }

  Widget buildExcludeNsfwField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return buildBoolField(
      context: context,
      label: S.of(context).app_timeline_settings_field_excludeNsfw_label,
      fieldBloc: settingsBloc.excludeNsfwSensitiveFieldBloc,
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
    IEditTimelineSettingsBloc editSettingsBloc,
    AuthInstance authInstance,
  ) =>
      ProxyProvider<IEditTimelineSettingsBloc,
          ITimelineSettingsOnlyInCustomListFormFieldBloc>(
        update: (context, value, previous) => value.onlyInCustomListFieldBloc,
        child: TimelineSettingsOnlyInCustomListFormFieldRowWidget(
          description: null,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );

  Widget buildAccountField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return ProxyProvider<IEditTimelineSettingsBloc,
        ITimelineSettingsOnlyFromAccountFormFieldBloc>(
      update: (context, value, previous) => value.onlyFromAccountFieldBloc,
      child: TimelineSettingsOnlyFromAccountFormFieldRowWidget(
        description: null,
        descriptionOnDisabled:
            S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
      ),
    );
  }

  Widget buildHashtagField(
    BuildContext context,
    IEditTimelineSettingsBloc settingsBloc,
    AuthInstance authInstance,
  ) {
    return StringFormFieldRowWidget(
      label: S.of(context).app_timeline_settings_withRemoteHashtag_field_label,
      autocorrect: false,
      hint: S.of(context).app_timeline_settings_withRemoteHashtag_field_hint,
      formStringFieldBloc: settingsBloc.withRemoteHashtagFieldBloc,
      onSubmitted: null,
      textInputAction: TextInputAction.done,
    );
  }

  Widget buildBoolField({
    @required BuildContext context,
    @required String label,
    String description,
    @required IBoolValueFormFieldBloc fieldBloc,
  }) {
    return Provider<IBoolValueFormFieldBloc>.value(
      value: fieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: label,
        description: description,
        descriptionOnDisabled:
            S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
      ),
    );
  }
}
