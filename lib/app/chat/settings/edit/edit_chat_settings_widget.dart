import 'package:fedi/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi/app/form/field/value/bool/form_bool_field_form_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditChatSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditChatSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editChatSettingsBloc = IEditChatSettingsBloc.of(context);
    return StreamBuilder<bool>(
        stream: editChatSettingsBloc.enabledStream,
        initialData: editChatSettingsBloc.enabled,
        builder: (context, snapshot) {
          var enabled = snapshot.data;
          return Column(
            mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
            children: [
              FormBoolFieldFormRowWidget(
                label: S
                    .of(context)
                    .app_chat_settings_field_replaceConversationsWithPleromaChats_label,
                field: editChatSettingsBloc
                    .replaceConversationsWithPleromaChatsFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S
                    .of(context)
                    .app_chat_settings_field_countConversationsInChatsUnreadBadges_label,
                field: editChatSettingsBloc
                    .countConversationsInChatsUnreadBadgesFieldBloc,
                enabled: enabled,
              ),
            ],
          );
        });
  }
}
