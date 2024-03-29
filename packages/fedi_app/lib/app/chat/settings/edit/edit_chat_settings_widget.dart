import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditChatSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditChatSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditChatSettingsReplaceConversationsWithUnifediChatsFieldWidget(),
          _EditChatSettingsCountConversationsInChatsUnreadBadgesFieldWidget(),
        ],
      );
}

class _EditChatSettingsCountConversationsInChatsUnreadBadgesFieldWidget
    extends StatelessWidget {
  const _EditChatSettingsCountConversationsInChatsUnreadBadgesFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditChatSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.countConversationsInChatsUnreadBadgesFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_chat_settings_field_countConversationsInChatsUnreadBadges_label,
        ),
      );
}

class _EditChatSettingsReplaceConversationsWithUnifediChatsFieldWidget
    extends StatelessWidget {
  const _EditChatSettingsReplaceConversationsWithUnifediChatsFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditChatSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.replaceConversationsWithUnifediChatsFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_chat_settings_field_replaceConversationsWithUnifediChats_label,
        ),
      );
}
