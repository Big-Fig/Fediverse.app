import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditTimelineSettingsBloc
    extends IEditInstanceSettingsBloc<TimelineSettings?> {
  static IEditTimelineSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditTimelineSettingsBloc>(context, listen: listen);

  TimelineType? get timelineType;

  bool get isNullableValuesPossible;

  IBoolValueFormFieldBloc get excludeRepliesFieldBloc;

  IBoolValueFormFieldBloc get onlyWithMediaFieldBloc;

  IBoolValueFormFieldBloc get excludeNsfwSensitiveFieldBloc;

  IBoolValueFormFieldBloc get onlyRemoteFieldBloc;

  IBoolValueFormFieldBloc get onlyLocalFieldBloc;

  IBoolValueFormFieldBloc get onlyPinnedFieldBloc;

  IBoolValueFormFieldBloc get withMutedFieldBloc;

  IBoolValueFormFieldBloc get excludeReblogsFieldBloc;

  ITimelineSettingsOnlyFromAccountFormFieldBloc get onlyFromAccountFieldBloc;

  IStringValueFormFieldBloc get withRemoteHashtagFieldBloc;

  ITimelineSettingsOnlyInCustomListFormFieldBloc get onlyInCustomListFieldBloc;

  ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc
      get replyVisibilityFilterFieldBloc;

  IStatusVisibilityMultiSelectFromListFormFieldBloc
      get excludeVisibilitiesFieldBloc;

  IBoolValueFormFieldBloc get webSocketsUpdatesFieldBloc;

  IStringValueFormFieldBloc get onlyFromInstanceFieldBloc;
}
