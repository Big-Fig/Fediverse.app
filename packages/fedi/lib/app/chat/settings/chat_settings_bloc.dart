import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<ChatSettings> {
  static IChatSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IChatSettingsBloc>(context, listen: listen);

  bool get replaceConversationsWithUnifediChats;

  Stream<bool> get replaceConversationsWithUnifediChatsStream;

  Future<void> changeReplaceConversationsWithUnifediChats({
    required bool replaceConversationsWithChats,
  });

  bool get countConversationsInChatsUnreadBadges;

  Stream<bool> get countConversationsInChatsUnreadBadgesStream;

  Future<void> changeCountConversationsInChatsUnreadBadges({
    required bool appendConversationUnreadToUnreadBadge,
  });
}
