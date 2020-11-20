import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPostStatusSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<PostStatusSettings> {
  static IEditPostStatusSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditPostStatusSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get markMediaAsNsfwOnAttachFormFieldBloc;

  IFormValueFieldBloc<PleromaVisibility> get defaultVisibilityFormFieldBloc;
}
