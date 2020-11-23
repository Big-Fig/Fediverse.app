import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/list/list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditTimelineSettingsBloc
    extends IEditInstanceSettingsBloc<TimelineSettings> {
  static IEditTimelineSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditTimelineSettingsBloc>(context, listen: listen);

  TimelineType get timelineType;

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

  IValueFormFieldBloc<PleromaReplyVisibilityFilter>
      get replyVisibilityFilterFieldBloc;

  ListValueFormFieldBloc<PleromaVisibility> get excludeVisibilitiesFieldBloc;

  IBoolValueFormFieldBloc get webSocketsUpdatesFieldBloc;
}
