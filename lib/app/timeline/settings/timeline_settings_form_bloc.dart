import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/list/form_list_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsFormBloc extends IFormBloc {
  static ITimelineSettingsFormBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ITimelineSettingsFormBloc>(context, listen: listen);

  TimelineSettings get timelineSettings;

  Stream<TimelineSettings> get timelineSettingsStream;

  IFormBoolFieldBloc get excludeRepliesFieldBloc;

  IFormBoolFieldBloc get onlyWithMediaFieldBloc;

  IFormBoolFieldBloc get excludeNsfwSensitiveFieldBloc;

  IFormBoolFieldBloc get onlyRemoteFieldBloc;

  IFormBoolFieldBloc get onlyLocalFieldBloc;

  IFormBoolFieldBloc get onlyPinnedFieldBloc;

  IFormBoolFieldBloc get withMutedFieldBloc;

  IFormBoolFieldBloc get excludeReblogsFieldBloc;

  IFormValueFieldBloc<PleromaAccount> get onlyFromRemoteAccountFieldBloc;

  IFormStringFieldBloc get withRemoteHashtagFieldBloc;

  IFormValueFieldBloc<PleromaList> get onlyInRemoteListFieldBloc;

  IFormValueFieldBloc<PleromaReplyVisibilityFilter>
      get replyVisibilityFilterFieldBloc;

  FormListValueFieldBloc<PleromaVisibility> get excludeVisibilitiesFieldBloc;

  void fill({
    @required TimelineType type,
    @required TimelineSettings newSettings,
  });
}
