import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/list/list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsFormBloc extends IFormBloc {
  static ITimelineSettingsFormBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelineSettingsFormBloc>(context, listen: listen);

  TimelineSettings get timelineSettings;

  Stream<TimelineSettings> get timelineSettingsStream;

  IBoolValueFormFieldBloc get excludeRepliesFieldBloc;

  IBoolValueFormFieldBloc get onlyWithMediaFieldBloc;

  IBoolValueFormFieldBloc get excludeNsfwSensitiveFieldBloc;

  IBoolValueFormFieldBloc get onlyRemoteFieldBloc;

  IBoolValueFormFieldBloc get onlyLocalFieldBloc;

  IBoolValueFormFieldBloc get onlyPinnedFieldBloc;

  IBoolValueFormFieldBloc get withMutedFieldBloc;

  IBoolValueFormFieldBloc get excludeReblogsFieldBloc;

  IValueFormFieldBloc<PleromaAccount> get onlyFromRemoteAccountFieldBloc;

  IStringValueFormFieldBloc get withRemoteHashtagFieldBloc;

  IValueFormFieldBloc<PleromaList> get onlyInRemoteListFieldBloc;

  IValueFormFieldBloc<PleromaReplyVisibilityFilter>
      get replyVisibilityFilterFieldBloc;

  ListValueFormFieldBloc<PleromaVisibility> get excludeVisibilitiesFieldBloc;

  IBoolValueFormFieldBloc get webSocketsUpdatesFieldBloc;

  void fill({
    @required TimelineType type,
    @required TimelineSettings newSettings,
  });
}
