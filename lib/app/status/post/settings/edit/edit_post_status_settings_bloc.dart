import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPostStatusSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<PostStatusSettings> {
  static IEditPostStatusSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditPostStatusSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get markMediaAsNsfwOnAttachFormFieldBloc;

  IValueFormFieldBloc<PleromaVisibility> get defaultVisibilityFormFieldBloc;
}
