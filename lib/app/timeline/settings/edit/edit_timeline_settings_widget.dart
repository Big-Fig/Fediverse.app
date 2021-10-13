import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_widget.dart';
import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_widget.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_row_widget.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_row_widget.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTimelineSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;
  final bool lockedSource;

  const EditTimelineSettingsWidget({
    required this.shrinkWrap,
    required this.lockedSource,
  });

  @override
  Widget build(BuildContext context) {
    var children = ProxyProvider<IEditTimelineSettingsBloc, TimelineType>(
      update: (context, value, previous) => value.timelineType,
      child: _EditTimelineSettingsChildrenWidget(
        lockedSource: lockedSource,
      ),
    );

    if (shrinkWrap) {
      return children;
    } else {
      return SingleChildScrollView(
        child: children,
      );
    }
  }
}

class _EditTimelineSettingsChildrenWidget extends StatelessWidget {
  final bool lockedSource;

  const _EditTimelineSettingsChildrenWidget({
    required this.lockedSource,
  });

  @override
  Widget build(BuildContext context) {
    var timelineType = Provider.of<TimelineType>(context);
    Widget children;
    switch (timelineType) {
      case TimelineType.home:
        children = const _EditTimelineSettingsChildrenHomeTypeWidget();
        break;
      case TimelineType.public:
        children = const _EditTimelineSettingsChildrenPublicTypeWidget();
        break;
      case TimelineType.customList:
        children = _EditTimelineSettingsChildrenCustomListTypeWidget(
          lockedSource: lockedSource,
        );
        break;

      case TimelineType.hashtag:
        children = _EditTimelineSettingsChildrenHashtagTypeWidget(
          lockedSource: lockedSource,
        );
        break;
      case TimelineType.account:
        children = _EditTimelineSettingsChildrenAccountTypeWidget(
          lockedSource: lockedSource,
        );
        break;

      default:
        throw 'Invalid timelineType $timelineType';
    }

    return children;
  }
}

class _EditTimelineSettingsChildrenHomeTypeWidget extends StatelessWidget {
  const _EditTimelineSettingsChildrenHomeTypeWidget();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const _EditTimelineSettingsFieldOnlyLocalWidget(),
          const _EditTimelineSettingsFieldOnlyRemoteWidget(),
          const _EditTimelineSettingsFieldWebsocketsUpdatesWidget(),
          const _EditTimelineSettingsFieldWithMutedWidget(),
          const _EditTimelineSettingsFieldOnlyLocalWidget(),
          const _EditTimelineSettingsFieldReplyVisibilityFilterWidget(),
          const _EditTimelineSettingsFieldExcludeVisibilitiesWidget(),
        ],
      );
}

class _EditTimelineSettingsChildrenPublicTypeWidget extends StatelessWidget {
  const _EditTimelineSettingsChildrenPublicTypeWidget();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const _EditTimelineSettingsFieldOnlyLocalWidget(),
          const _EditTimelineSettingsFieldOnlyRemoteWidget(),
          const _EditTimelineSettingsFieldOnlyFromInstanceWidget(),
          const _EditTimelineSettingsFieldWebsocketsUpdatesWidget(),
          const _EditTimelineSettingsFieldOnlyMediaWidget(),
          const _EditTimelineSettingsFieldWithMutedWidget(),
          const _EditTimelineSettingsFieldReplyVisibilityFilterWidget(),
          const _EditTimelineSettingsFieldExcludeVisibilitiesWidget(),
        ],
      );
}

class _EditTimelineSettingsChildrenHashtagTypeWidget extends StatelessWidget {
  final bool lockedSource;

  const _EditTimelineSettingsChildrenHashtagTypeWidget({
    required this.lockedSource,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const _EditTimelineSettingsFieldOnlyLocalWidget(),
          const _EditTimelineSettingsFieldOnlyRemoteWidget(),
          if (!lockedSource) const _EditTimelineSettingsFieldHashtagWidget(),
          const _EditTimelineSettingsFieldWebsocketsUpdatesWidget(),
          const _EditTimelineSettingsFieldOnlyMediaWidget(),
          const _EditTimelineSettingsFieldWithMutedWidget(),
          const _EditTimelineSettingsFieldExcludeVisibilitiesWidget(),
        ],
      );
}

class _EditTimelineSettingsChildrenCustomListTypeWidget
    extends StatelessWidget {
  final bool lockedSource;

  const _EditTimelineSettingsChildrenCustomListTypeWidget({
    required this.lockedSource,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const _EditTimelineSettingsFieldOnlyLocalWidget(),
          const _EditTimelineSettingsFieldOnlyRemoteWidget(),
          if (!lockedSource) const _EditTimelineSettingsFieldCustomListWidget(),
          const _EditTimelineSettingsFieldWebsocketsUpdatesWidget(),
          const _EditTimelineSettingsFieldOnlyMediaWidget(),
          const _EditTimelineSettingsFieldWithMutedWidget(),
          const _EditTimelineSettingsFieldExcludeVisibilitiesWidget(),
        ],
      );
}

class _EditTimelineSettingsChildrenAccountTypeWidget extends StatelessWidget {
  final bool lockedSource;

  const _EditTimelineSettingsChildrenAccountTypeWidget({
    required this.lockedSource,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (!lockedSource) const _EditTimelineSettingsFieldAccountWidget(),
          const _EditTimelineSettingsFieldWebsocketsUpdatesWidget(),
          const _EditTimelineSettingsFieldOnlyMediaWidget(),
          const _EditTimelineSettingsFieldHashtagWidget(),
          const _EditTimelineSettingsFieldExcludeReblogsWidget(),
          const _EditTimelineSettingsFieldExcludeRepliesWidget(),
          const _EditTimelineSettingsFieldOnlyPinnedWidget(),
          const _EditTimelineSettingsFieldExcludeVisibilitiesWidget(),
        ],
      );
}

class _EditTimelineSettingsFieldWithMutedWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldWithMutedWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.withMutedFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_withMuted_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldOnlyMediaWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldOnlyMediaWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.onlyWithMediaFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_onlyWithMedia_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldOnlyLocalWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldOnlyLocalWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.onlyLocalFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_onlyLocal_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldOnlyRemoteWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldOnlyRemoteWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.onlyRemoteFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_onlyRemote_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldOnlyPinnedWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldOnlyPinnedWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.onlyPinnedFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_onlyPinned_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldExcludeReblogsWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldExcludeReblogsWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.excludeReblogsFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_excludeReblogs_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldExcludeRepliesWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldExcludeRepliesWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.excludeRepliesFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_timeline_settings_field_excludeReplies_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldWebsocketsUpdatesWidget
    extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldWebsocketsUpdatesWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) {
    var editTimelineSettingsBloc = IEditTimelineSettingsBloc.of(context);

    var isLocal =
        editTimelineSettingsBloc.instanceLocation == InstanceLocation.local;

    if (isLocal) {
      return ProxyProvider<IEditTimelineSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.webSocketsUpdatesFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_timeline_settings_field_enableWebSockets_label,
          description: S
              .of(context)
              .app_timeline_settings_field_enableWebSockets_description,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_timeline_settings_field_enableWebSockets_description_instance_disabled,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _EditTimelineSettingsFieldReplyVisibilityFilterWidget
    extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldReplyVisibilityFilterWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditTimelineSettingsBloc,
          ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.replyVisibilityFilterFieldBloc,
        child:
            TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldWidget(
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldExcludeVisibilitiesWidget
    extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldExcludeVisibilitiesWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditTimelineSettingsBloc,
          IStatusVisibilityMultiSelectFromListFormFieldBloc>(
        update: (context, value, previous) =>
            value.excludeVisibilitiesFieldBloc,
        child: StatusVisibilityMultiSelectFromListFormFieldWidget(
          label: S
              .of(context)
              .app_timeline_settings_field_excludeVisibilites_label,
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldAccountWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldAccountWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditTimelineSettingsBloc,
          ITimelineSettingsOnlyFromAccountFormFieldBloc>(
        update: (context, value, previous) => value.onlyFromAccountFieldBloc,
        child: TimelineSettingsOnlyFromAccountFormFieldRowWidget(
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditTimelineSettingsFieldHashtagWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldHashtagWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IStringValueFormFieldBloc>(
        update: (context, value, previous) => value.withRemoteHashtagFieldBloc,
        child: StringValueFormFieldRowWidget(
          label:
              S.of(context).app_timeline_settings_withRemoteHashtag_field_label,
          autocorrect: false,
          hint:
              S.of(context).app_timeline_settings_withRemoteHashtag_field_hint,
          onSubmitted: null,
          textInputAction: TextInputAction.done,
        ),
      );
}

class _EditTimelineSettingsFieldOnlyFromInstanceWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldOnlyFromInstanceWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditTimelineSettingsBloc, IStringValueFormFieldBloc>(
        update: (context, value, previous) => value.onlyFromInstanceFieldBloc,
        child: StringValueFormFieldRowWidget(
          label:
              S.of(context).app_timeline_settings_onlyFromInstance_field_label,
          autocorrect: false,
          hint: S.of(context).app_timeline_settings_onlyFromInstance_field_hint,
          onSubmitted: null,
          textInputAction: TextInputAction.done,
        ),
      );
}

class _EditTimelineSettingsFieldCustomListWidget extends StatelessWidget {
  final String? descriptionOnDisabled;

  const _EditTimelineSettingsFieldCustomListWidget({
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<IEditTimelineSettingsBloc,
          ITimelineSettingsOnlyInCustomListFormFieldBloc>(
        update: (context, value, previous) => value.onlyInCustomListFieldBloc,
        child: TimelineSettingsOnlyInCustomListFormFieldRowWidget(
          description: null,
          descriptionOnDisabled: descriptionOnDisabled ??
              S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}
