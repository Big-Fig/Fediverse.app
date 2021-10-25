import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:fedi_app/app/settings/instance/edit/edit_instance_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPushSettingsBloc
    implements IEditInstanceSettingsBloc<PushSettings?> {
  static IEditPushSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditPushSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get favouriteFieldBloc;

  IBoolValueFormFieldBloc get followFieldBloc;

  IBoolValueFormFieldBloc get mentionFieldBloc;

  IBoolValueFormFieldBloc get reblogFieldBloc;

  IBoolValueFormFieldBloc get pollFieldBloc;

  IBoolValueFormFieldBloc get chatMentionFieldBloc;

  IBoolValueFormFieldBloc get emojiReactionFieldBloc;
}
