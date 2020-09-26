import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_filter_support_extension.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineSettingsWidget extends StatelessWidget {
  final TimelineType type;

  TimelineSettingsWidget({@required this.type});

  @override
  Widget build(BuildContext context) {
    var settingsBloc = ITimelineSettingsFormBloc.of(context, listen: true);

    var currentAuthInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    var authInstance = currentAuthInstanceBloc.currentInstance;

    List<Widget> children;

    switch (type) {
      case TimelineType.public:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
          buildOnlyRemoteField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.customList:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.home:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.hashtag:
        children = [
          buildWithMutedField(context, settingsBloc, authInstance),
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyLocalField(context, settingsBloc, authInstance),
        ];
        break;
      case TimelineType.account:
        children = [
          buildOnlyMediaField(context, settingsBloc, authInstance),
          buildOnlyPinnedField(context, settingsBloc, authInstance),
          buildExcludeReblogsField(context, settingsBloc, authInstance),
          buildExcludeRepliesField(context, settingsBloc, authInstance),
          // todo: tagged arg support?
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

  FormBoolFieldFormRowWidget buildBoolField({
    @required String label,
    @required IFormBoolFieldBloc fieldBloc,
    @required bool isSupported,
  }) {
    return FormBoolFieldFormRowWidget(
      label: label,
      field: fieldBloc,
      enabled: isSupported,
      desc: isSupported
          ? null
          : "app.timeline.settings.field.not_supported.desc".tr(),
    );
  }
}
