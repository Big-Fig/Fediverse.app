import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditChatSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<ChatSettings> {
  static IEditChatSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditChatSettingsBloc>(context, listen: listen);

  IBoolValueFormFieldBloc get countConversationsInChatsUnreadBadgesFieldBloc;

  IBoolValueFormFieldBloc get replaceConversationsWithUnifediChatsFieldBloc;
}
