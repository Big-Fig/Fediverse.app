import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditChatSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc {
  static IEditChatSettingsBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IEditChatSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get countConversationsInChatsUnreadBadgesFieldBloc;

  IFormBoolFieldBloc get replaceConversationsWithPleromaChatsFieldBloc;
}
