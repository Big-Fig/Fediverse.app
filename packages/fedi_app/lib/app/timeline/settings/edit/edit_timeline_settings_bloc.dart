import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi_app/app/status/visibility/form/multi_from_list/status_visibility_multi_select_from_list_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditTimelineSettingsBloc
    extends IEditInstanceSettingsBloc<TimelineSettings?>
    implements IDisposable {
  static IEditTimelineSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditTimelineSettingsBloc>(context, listen: listen);

  TimelineType get timelineType;

  bool get isNullableValuesPossible;

  InstanceLocation get instanceLocation;

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
