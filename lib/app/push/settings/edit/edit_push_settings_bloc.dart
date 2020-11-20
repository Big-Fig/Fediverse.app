import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPushSettingsBloc
    implements IEditInstanceSettingsBloc<PushSettings> {
  static IEditPushSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditPushSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get favouriteFieldBloc;

  IFormBoolFieldBloc get followFieldBloc;

  IFormBoolFieldBloc get mentionFieldBloc;

  IFormBoolFieldBloc get reblogFieldBloc;

  IFormBoolFieldBloc get pollFieldBloc;

  IFormBoolFieldBloc get pleromaChatMentionFieldBloc;

  IFormBoolFieldBloc get pleromaEmojiReactionFieldBloc;
}
